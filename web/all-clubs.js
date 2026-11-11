/* ============================================================
   "Összes klub" subpage (all-clubs.html)
   Uses the shared categories, clubs and helpers from script.js.
   ============================================================ */

// all-clubs.html holds the page layout; this adds the filter buttons and the clubs.
const parentFilterRow = document.querySelector(".filter-row-main");
const subFilterRow = document.querySelector(".filter-row-sub");
const filterSummary = document.querySelector(".filter-summary");
const clubResults = document.querySelector(".club-results");

// "all-clubs.html" -> all clubs, "all-clubs.html?category=2" -> preselect main category 2 (Mozgás).
const preselectedCategory = categoryById.get(Number(new URLSearchParams(window.location.search).get("category")));

// Selected filters: parentId = upper row (main category), categoryId = lower row (subcategory).
const allClubsFilter = {
  parentId: preselectedCategory?.parentId === null ? preselectedCategory.id : null,
  categoryId: null,
};

// category = null is the "Összes" button.
const createFilterButton = (category, className) => {
  const button = createElement("button", `filter-button ${className}`, category?.name ?? "Összes");
  button.type = "button";
  button.dataset.categoryId = category?.id ?? "";
  return button;
};

const readCategoryId = (button) => (button.dataset.categoryId ? Number(button.dataset.categoryId) : null);

const setPressed = (button, isActive) => {
  button.classList.toggle("is-active", isActive);
  button.setAttribute("aria-pressed", String(isActive));
};

// Upper row: main categories, lower row: all subcategories.
const parentButtons = [null, ...parentCategories].map((category) => createFilterButton(category, "filter-button-main"));
const subButtons = subCategories.map((category) => createFilterButton(category, "filter-button-sub"));
parentFilterRow.append(...parentButtons);
subFilterRow.append(...subButtons);

// The whole card is a link to the club's subpage.
const createClubPlaceholder = (club, category) => {
  const card = createElement("a", "club-placeholder");
  card.href = `${CLUB_PAGE}?id=${encodeURIComponent(club.id)}`;

  const image = createElement("div", "club-placeholder-image");
  image.setAttribute("aria-hidden", "true");

  const line = createElement("span", "skeleton-line");
  line.setAttribute("aria-hidden", "true");

  const body = createElement("div", "club-placeholder-body");
  body.append(
    createElement("span", "club-placeholder-tag", category.name),
    createElement("h4", "", club.name),
    createElement("p", "", club.city),
    line,
  );

  card.append(image, body);
  return card;
};

const createClubGroup = (category, clubs) => {
  const group = createElement("section", "club-group");

  const header = createElement("div", "club-group-header");
  const titleWrap = createElement("div");
  titleWrap.append(
    createElement("p", "club-group-path", getAncestors(category).map((item) => item.name).join(" › ")),
    createElement("h3", "", category.name),
  );
  header.append(titleWrap, createElement("span", "club-group-count", `${clubs.length} klub`));

  const grid = createElement("div", "club-placeholder-grid");
  clubs.forEach((club) => grid.append(createClubPlaceholder(club, category)));

  group.append(header, grid);
  return group;
};

const updateAllClubsView = () => {
  const { parentId, categoryId } = allClubsFilter;

  parentButtons.forEach((button) => setPressed(button, readCategoryId(button) === parentId));

  // Lower row: only the selected main category's subcategories (all of them when none is selected).
  const visibleSubIds = new Set(getSubtreeIds(parentId));
  subButtons.forEach((button) => {
    const id = readCategoryId(button);
    button.hidden = !visibleSubIds.has(id);
    setPressed(button, id === categoryId);
  });

  const activeId = categoryId ?? parentId;
  const matchingIds = new Set(getSubtreeIds(activeId));
  const groups = subCategories
    .filter((category) => matchingIds.has(category.id))
    .map((category) => ({
      category,
      clubs: placeholderClubs.filter((club) => club.categoryId === category.id),
    }))
    .filter((group) => group.clubs.length);

  const clubCount = groups.reduce((sum, group) => sum + group.clubs.length, 0);
  const label = categoryById.get(activeId)?.name ?? "Minden kategória";
  filterSummary.textContent = `${label}: ${clubCount} klub, ${groups.length} kategóriában`;

  clubResults.replaceChildren(...groups.map(({ category, clubs }) => createClubGroup(category, clubs)));
};

parentFilterRow.addEventListener("click", (event) => {
  const button = event.target.closest(".filter-button");
  if (!button) return;
  const id = readCategoryId(button);
  allClubsFilter.parentId = id === allClubsFilter.parentId ? null : id;
  allClubsFilter.categoryId = null;
  updateAllClubsView();
});

subFilterRow.addEventListener("click", (event) => {
  const button = event.target.closest(".filter-button");
  if (!button) return;
  const id = readCategoryId(button);
  if (id === allClubsFilter.categoryId) {
    allClubsFilter.categoryId = null; // second click clears the subcategory, keeps the main one
  } else {
    allClubsFilter.categoryId = id;
    allClubsFilter.parentId = getRootId(categoryById.get(id));
  }
  updateAllClubsView();
});

updateAllClubsView();
