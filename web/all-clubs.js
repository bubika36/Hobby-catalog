/* ============================================================
   "Összes klub" subpage (all-clubs.html)
   Uses the shared categories, clubs and helpers from script.js.
   ============================================================ */

const allClubsPage = document.querySelector("#all-clubs-page");

// Selected filters: parentId = upper row (main category), categoryId = lower row (subcategory).
const allClubsFilter = { parentId: null, categoryId: null };
let allClubsUi = null;

const createFilterButton = (category, className) => {
  const button = createElement("button", `filter-button ${className}`, category ? category.name : "Összes");
  button.type = "button";
  button.dataset.categoryId = category ? String(category.id) : "";
  return button;
};

const readCategoryId = (button) => (button.dataset.categoryId ? Number(button.dataset.categoryId) : null);

const setPressed = (button, isActive) => {
  button.classList.toggle("is-active", isActive);
  button.setAttribute("aria-pressed", String(isActive));
};

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
  const { parentButtons, subButtons, summary, results } = allClubsUi;
  const { parentId, categoryId } = allClubsFilter;

  parentButtons.forEach((button) => setPressed(button, readCategoryId(button) === parentId));

  // Lower row: every subcategory, or only the selected main category's subcategories.
  const visibleSubIds = parentId === null ? null : new Set(getSubtreeIds(parentId));
  subButtons.forEach((button) => {
    const id = readCategoryId(button);
    button.hidden = visibleSubIds !== null && !visibleSubIds.has(id);
    setPressed(button, id === categoryId);
  });

  const activeId = categoryId ?? parentId;
  const matchingIds = activeId === null ? null : new Set(getSubtreeIds(activeId));
  const groups = subCategories
    .filter((category) => matchingIds === null || matchingIds.has(category.id))
    .map((category) => ({
      category,
      clubs: placeholderClubs.filter((club) => club.categoryId === category.id),
    }))
    .filter((group) => group.clubs.length);

  const clubCount = groups.reduce((sum, group) => sum + group.clubs.length, 0);
  const label = activeId === null ? "Minden kategória" : categoryById.get(activeId).name;
  summary.textContent = `${label}: ${clubCount} klub, ${groups.length} kategóriában`;

  results.replaceChildren(...groups.map(({ category, clubs }) => createClubGroup(category, clubs)));
};

const renderAllClubsPage = () => {
  const shell = createElement("div", "content-shell");

  const backLink = createElement("a", "text-link all-clubs-back", "← Vissza a kezdőlapra");
  backLink.href = "index.html#home";

  const heading = createElement("div", "section-heading");
  const headingCopy = createElement("div");
  const title = createElement("h2", "", "Összes klub");
  title.id = "all-clubs-title";
  headingCopy.append(createElement("p", "section-kicker", "Böngéssz kategóriák szerint"), title);
  heading.append(headingCopy);

  // Upper row: main categories (parentId = null)
  const parentRow = createElement("div", "filter-row filter-row-main");
  parentRow.setAttribute("role", "group");
  parentRow.setAttribute("aria-label", "Fő kategóriák");
  const parentButtons = [null, ...parentCategories].map((category) =>
    createFilterButton(category, "filter-button-main"),
  );
  parentRow.append(...parentButtons);

  // Lower row: all subcategories
  const subRow = createElement("div", "filter-row filter-row-sub");
  subRow.setAttribute("role", "group");
  subRow.setAttribute("aria-label", "Alkategóriák");
  const subButtons = subCategories.map((category) => createFilterButton(category, "filter-button-sub"));
  subRow.append(...subButtons);

  const filters = createElement("div", "category-filters");
  filters.append(parentRow, subRow);

  const summary = createElement("p", "filter-summary");
  summary.setAttribute("aria-live", "polite");

  const results = createElement("div", "club-results");

  shell.append(backLink, heading, filters, summary, results);
  allClubsPage.append(shell);

  parentRow.addEventListener("click", (event) => {
    const button = event.target.closest(".filter-button");
    if (!button) return;
    const id = readCategoryId(button);
    allClubsFilter.parentId = id === allClubsFilter.parentId ? null : id;
    allClubsFilter.categoryId = null;
    updateAllClubsView();
  });

  subRow.addEventListener("click", (event) => {
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

  allClubsUi = { parentButtons, subButtons, summary, results };
  updateAllClubsView();
};

// "all-clubs.html" -> all clubs, "all-clubs.html?category=2" -> preselect main category 2 (Mozgás).
const preselectedCategory = categoryById.get(Number(new URLSearchParams(window.location.search).get("category")));
allClubsFilter.parentId =
  preselectedCategory && preselectedCategory.parentId === null ? preselectedCategory.id : null;

renderAllClubsPage();
