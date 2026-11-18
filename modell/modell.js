const mysql = require("mysql2/promise")

const kapcsolat = mysql.createPool({
    host:"localhost",
    user:"root",
    password:"",
    database:"hobby_catalog"
})

module.exports = {
    // Only the categories that have at least one club, plus their parents.
    // The parents are needed too: the main categories (and e.g. Harcművészet)
    // have no clubs linked directly, only through their subcategories.
    allCategories: async () => {
        const [rows] = await kapcsolat.query(`
            WITH RECURSIVE usedCategories AS (
                SELECT c.categoryId, c.parentId
                FROM categories c
                WHERE EXISTS (
                    SELECT 1 FROM clubCategories cc
                    WHERE cc.categories_categoryId = c.categoryId
                )
                UNION
                SELECT parent.categoryId, parent.parentId
                FROM categories parent
                JOIN usedCategories child ON child.parentId = parent.categoryId
            )
            SELECT c.categoryId AS id, c.name, c.parentId
            FROM categories c
            WHERE c.categoryId IN (SELECT categoryId FROM usedCategories)
            ORDER BY c.categoryId;
            `)
        return rows
    },
    // One row per club that has at least one category, with its price and all of its categories.
    allClubs: async () => {
        const [rows] = await kapcsolat.query(`
            SELECT c.clubId AS id, c.name, c.description, c.email, c.phone,
                   c.websiteURL, c.logoURL, c.rating, c.reviewCount,
                   c.address, c.zipCode, c.city,
                   p.adult, p.student,
                   cc.categoryIds
            FROM clubs c
            JOIN (
                -- every category of a club in one column, e.g. "21,33,35"
                SELECT clubs_clubId, GROUP_CONCAT(categories_categoryId ORDER BY categories_categoryId) AS categoryIds
                FROM clubCategories
                GROUP BY clubs_clubId
            ) cc ON cc.clubs_clubId = c.clubId
            LEFT JOIN price p ON p.clubs_clubId = c.clubId
            ORDER BY c.clubId;
        `)
        // rating is DECIMAL, which mysql2 returns as a string.
        return rows.map(({ rating, adult, student, categoryIds, ...club }) => ({
            ...club,
            rating: Number(rating),
            categoryIds: categoryIds.split(",").map(Number),
            price: { adult, student },
        }))
    },
    // The address of one club, for the map (see geocoder.js).
    clubAddress: async (id) => {
        const [rows] = await kapcsolat.query(
            "SELECT address, zipCode, city FROM clubs WHERE clubId = ?;",
            [id]
        )
        return rows[0]
    }
}