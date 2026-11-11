const chatButton = document.querySelector(".chat-bubble");
const chatPopup = document.querySelector("#chat-popup");
const chatCloseButton = document.querySelector(".chat-popup-close");

chatButton.addEventListener("click", () => {
  if (chatPopup.open) {
    chatPopup.close();
  } else {
    chatPopup.show();
    chatButton.setAttribute("aria-expanded", "true");
  }
});

chatCloseButton.addEventListener("click", () => chatPopup.close());

chatPopup.addEventListener("close", () => {
  chatButton.setAttribute("aria-expanded", "false");
  chatButton.focus();
});

document.addEventListener("pointerdown", (event) => {
  if (
    chatPopup.open &&
    !chatPopup.contains(event.target) &&
    !chatButton.contains(event.target)
  ) {
    chatPopup.close();
  }
});

const siteHeader = document.querySelector(".site-header");
const headerToggle = document.querySelector(".header-toggle");
const mobileHeaderQuery = window.matchMedia(
  "(max-width: 760px), (orientation: landscape) and (min-width: 520px) and (max-width: 900px) and (max-height: 500px)",
);

const syncHeaderForViewport = () => {
  if (!mobileHeaderQuery.matches) {
    siteHeader.classList.remove("is-collapsed");
    headerToggle.setAttribute("aria-expanded", "true");
    headerToggle.setAttribute("aria-label", "Fejléc összecsukása");
  }
};

headerToggle.addEventListener("click", () => {
  const isExpanded = headerToggle.getAttribute("aria-expanded") === "true";
  headerToggle.setAttribute("aria-expanded", String(!isExpanded));
  headerToggle.setAttribute("aria-label", isExpanded ? "Fejléc kibontása" : "Fejléc összecsukása");
  siteHeader.classList.toggle("is-collapsed", isExpanded);
});

mobileHeaderQuery.addEventListener("change", syncHeaderForViewport);

const hero = document.querySelector(".hero");

if (hero) {
  const heroBackdrop = hero.querySelector(".hero-backdrop");
  const heroDescription = hero.querySelector("#hero-description");
  const heroTitleLines = [...hero.querySelectorAll("[data-hero-title-line]")];
  const heroDots = [...hero.querySelectorAll("[data-hero-slide]")];
  const heroCounter = hero.querySelector("[data-hero-current]");
  const heroStatus = hero.querySelector("[data-hero-status]");
  const slides = [
    {
      image: "https://images.unsplash.com/photo-1551632811-561732d1e306?auto=format&fit=crop&w=2400&q=85",
      title: ["A következő", "kedvenc hobbid", "itt kezdődik."],
      description: "Mozdulj ki a természetbe, próbálj ki valami újat, és találd meg a hozzád illő közösséget.",
      announcement: "természet és szabadtéri élmények",
    },
    {
      image: "https://images.unsplash.com/photo-1518611012118-696072aa579a?auto=format&fit=crop&w=2400&q=85",
      title: ["Találd meg", "a saját ritmusod", "mozgás közben."],
      description: "Töltődj fel mozgással, fedezz fel új sportokat, és találd meg azt, ami igazán neked való.",
      announcement: "mozgás és sport",
    },
    {
      image: "https://images.unsplash.com/photo-1513364776144-60967b0f800f?auto=format&fit=crop&w=2400&q=85",
      title: ["Engedd szabadon", "a kreativitásod", "és alkoss."],
      description: "Próbálj ki egy új technikát, alkoss a saját kezeddel, és inspirálódj hasonló érdeklődésű emberektől.",
      announcement: "kreatív hobbik és alkotás",
    },
  ];
  let activeSlide = 0;
  let transitionTimer;

  const showSlide = (requestedIndex) => {
    activeSlide = (requestedIndex + slides.length) % slides.length;
    const slide = slides[activeSlide];

    heroBackdrop.classList.add("is-fading");
    window.clearTimeout(transitionTimer);
    transitionTimer = window.setTimeout(() => {
      heroBackdrop.style.backgroundImage = `url("${slide.image}")`;
      heroTitleLines.forEach((line, index) => {
        line.textContent = slide.title[index];
      });
      heroDescription.textContent = slide.description;
      heroCounter.textContent = String(activeSlide + 1).padStart(2, "0");
      heroStatus.textContent = `${activeSlide + 1}. kép: ${slide.announcement}`;
      heroDots.forEach((dot, index) => {
        const isActive = index === activeSlide;
        dot.classList.toggle("is-active", isActive);
        if (isActive) {
          dot.setAttribute("aria-current", "true");
        } else {
          dot.removeAttribute("aria-current");
        }
      });
      heroBackdrop.classList.remove("is-fading");
    }, 140);
  };

  hero.querySelector("[data-hero-previous]").addEventListener("click", () => {
    showSlide(activeSlide - 1);
  });
  hero.querySelector("[data-hero-next]").addEventListener("click", () => {
    showSlide(activeSlide + 1);
  });
  heroDots.forEach((dot) => {
    dot.addEventListener("click", () => showSlide(Number(dot.dataset.heroSlide)));
  });
}

/* ============================================================
   "Összes klub" subpage (hash route: #osszes-klub)
   ============================================================ */

// Hardcoded copy of the `categories` table in hobby_catalog.sql (categoryId, name, parentId).
// TODO: replace with an API call once the backend exists.
const categories = [
  // Fő kategóriák
  { id: 1, name: "Szabadtér", parentId: null },
  { id: 2, name: "Mozgás", parentId: null },
  { id: 3, name: "Kreativitás", parentId: null },
  { id: 4, name: "Közösség", parentId: null },

  // Szabadtér
  { id: 5, name: "Túrázás", parentId: 1 },
  { id: 6, name: "Futás", parentId: 1 },
  { id: 7, name: "Kerékpározás", parentId: 1 },
  { id: 8, name: "Mászás", parentId: 1 },
  { id: 9, name: "Kajak-kenu", parentId: 1 },
  { id: 10, name: "Evezés", parentId: 1 },
  { id: 11, name: "Vitorlázás", parentId: 1 },
  { id: 12, name: "SUP", parentId: 1 },
  { id: 13, name: "Horgászat", parentId: 1 },
  { id: 14, name: "Lovaglás", parentId: 1 },

  // Mozgás
  { id: 15, name: "Fitness", parentId: 2 },
  { id: 16, name: "Jóga", parentId: 2 },
  { id: 17, name: "Pilates", parentId: 2 },
  { id: 18, name: "Tánc", parentId: 2 },
  { id: 19, name: "Atlétika", parentId: 2 },
  { id: 20, name: "Harcművészet", parentId: 2 },
  { id: 21, name: "Labdajátékok", parentId: 2 },
  { id: 22, name: "Vízisport", parentId: 2 },
  { id: 23, name: "Tenisz", parentId: 2 },
  { id: 24, name: "Asztalitenisz", parentId: 2 },
  { id: 25, name: "Jégkorong", parentId: 2 },
  { id: 26, name: "Korcsolyázás", parentId: 2 },
  { id: 27, name: "Vívás", parentId: 2 },

  // Mozgás > Harcművészet
  { id: 28, name: "Judo", parentId: 20 },
  { id: 29, name: "Karate", parentId: 20 },
  { id: 30, name: "Küzdősport", parentId: 20 },

  // Mozgás > Harcművészet > Küzdősport
  { id: 31, name: "Box", parentId: 30 },
  { id: 32, name: "Kick-box", parentId: 30 },

  // Mozgás > Labdajátékok
  { id: 33, name: "Csapatsport", parentId: 21 },
  { id: 34, name: "Labdarúgás", parentId: 21 },
  { id: 35, name: "Kosárlabda", parentId: 21 },
  { id: 36, name: "Kézilabda", parentId: 21 },
  { id: 37, name: "Röplabda", parentId: 21 },
  { id: 38, name: "Amerikai futball", parentId: 21 },

  // Mozgás > Vízisport
  { id: 39, name: "Úszás", parentId: 22 },
  { id: 40, name: "Vízilabda", parentId: 22 },

  // Kreativitás
  { id: 41, name: "Festés és rajzolás", parentId: 3 },
  { id: 42, name: "Kerámia", parentId: 3 },
  { id: 43, name: "Fotózás", parentId: 3 },
  { id: 44, name: "Kézművesség", parentId: 3 },
  { id: 45, name: "Zene", parentId: 3 },
  { id: 46, name: "Ének és kórus", parentId: 3 },
  { id: 47, name: "Színjátszás", parentId: 3 },
  { id: 48, name: "Főzés", parentId: 3 },

  // Közösség
  { id: 49, name: "Sakk", parentId: 4 },
  { id: 50, name: "Társasjáték", parentId: 4 },
  { id: 51, name: "Könyvklub", parentId: 4 },
  { id: 52, name: "Nyelvi klub", parentId: 4 },
  { id: 53, name: "Kvízest", parentId: 4 },
  { id: 54, name: "Filmklub", parentId: 4 },
  { id: 55, name: "Önkéntesség", parentId: 4 },
  { id: 56, name: "Kertészkedés", parentId: 4 },
  { id: 57, name: "E-sport", parentId: 4 },
];

const categoryById = new Map(categories.map((category) => [category.id, category]));
const parentCategories = categories.filter((category) => category.parentId === null);
const subCategories = categories.filter((category) => category.parentId !== null);

const getChildren = (parentId) => categories.filter((category) => category.parentId === parentId);

// The category itself plus every category below it (e.g. Harcművészet -> Judo, ..., Box).
const getSubtreeIds = (categoryId) => [
  categoryId,
  ...getChildren(categoryId).flatMap((child) => getSubtreeIds(child.id)),
];

// Top-down list of the category's parents, e.g. Box -> [Mozgás, Harcművészet, Küzdősport].
const getAncestors = (category) => {
  const ancestors = [];
  let current = categoryById.get(category.parentId);
  while (current) {
    ancestors.unshift(current);
    current = categoryById.get(current.parentId);
  }
  return ancestors;
};

const getRootId = (category) => (getAncestors(category)[0] ?? category).id;

// Placeholder clubs: 5 or 6 for every subcategory, with the same fields as the
// `clubs` and `price` tables so the club page can show every detail.
// TODO: replace with clubs from the API.
const placeholderStreets = ["Budai út", "Palotai út", "Berényi út", "Prohászka Ottokár út"];

const placeholderClubs = subCategories.flatMap((category) =>
  Array.from({ length: 5 + (category.id % 2) }, (_, index) => {
    const id = `${category.id}-${index + 1}`;
    const seed = category.id * 7 + index * 3;
    const adultPrice = 3000 + (seed % 9) * 1000;
    return {
      id,
      name: `${category.name} klub ${String(index + 1).padStart(2, "0")}`,
      categoryId: category.id,
      description:
        "Barátságos közösség kezdőknek és haladóknak egyaránt. Rendszeres foglalkozások, tapasztalt vezetők és jó hangulat várnak – gyere el egy próbaalkalomra!",
      email: `klub-${id}@example.com`,
      phone: `+36-30-000-${String(seed).padStart(4, "0")}`,
      websiteURL: `https://example.com/klub-${id}`,
      logoURL: "",
      rating: 4 + (seed % 11) / 10,
      reviewCount: seed % 25,
      address: `${placeholderStreets[seed % placeholderStreets.length]} ${(seed % 120) + 1}.`,
      zipCode: 8000,
      city: "Székesfehérvár",
      price: { adult: adultPrice, student: index % 3 === 2 ? null : adultPrice - 1000 },
    };
  }),
);

const clubById = new Map(placeholderClubs.map((club) => [club.id, club]));

const ALL_CLUBS_HASH = "#osszes-klub";
const CLUB_HASH = "#klub";
const DEFAULT_TITLE = document.title;
const allClubsPage = document.querySelector("#all-clubs-page");
const clubPage = document.querySelector("#club-page");
const landingSections = [...document.querySelectorAll("main > section")].filter(
  (section) => section !== allClubsPage && section !== clubPage,
);
let allClubsRendered = false;

const createElement = (tag, className, text) => {
  const element = document.createElement(tag);
  if (className) element.className = className;
  if (text !== undefined) element.textContent = text;
  return element;
};

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
  card.href = `${CLUB_HASH}/${club.id}`;

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
  if (allClubsRendered) return;
  allClubsRendered = true;

  const shell = createElement("div", "content-shell");

  const backLink = createElement("a", "text-link all-clubs-back", "← Vissza a kezdőlapra");
  backLink.href = "#home";

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

/* ============================================================
   Club subpage (hash route: #klub/<clubId>)
   ============================================================ */

// Created once and moved into every rendered club page, so the OpenStreetMap
// integration can keep a single map bound to #map. data-address = current club.
const clubMap = createElement("div", "club-map");
clubMap.id = "map";

// The club page's back link returns to the list the club was opened from;
// going back keeps that list's filters and scroll position.
const clubListReturn = { hash: ALL_CLUBS_HASH, scrollY: 0 };

const formatNumber = (value, fractionDigits = 0) =>
  Number(value).toLocaleString("hu-HU", {
    minimumFractionDigits: fractionDigits,
    maximumFractionDigits: fractionDigits,
  });

const formatPrice = (amount) => {
  if (amount === null || amount === undefined) return "Nincs megadva";
  return Number(amount) === 0 ? "Ingyenes" : `${formatNumber(amount)} Ft`;
};

const createLink = (href, text) => {
  const link = createElement("a", "", text);
  link.href = href;
  return link;
};

// Websites are uploaded by the clubs themselves, so only http(s) URLs become links.
const createWebsiteLink = (url) => {
  if (!/^https?:\/\//i.test(url)) return url;
  const link = createLink(url, url.replace(/^https?:\/\//i, "").replace(/\/$/, ""));
  link.target = "_blank";
  link.rel = "noopener noreferrer";
  return link;
};

const createDetailCard = (title, ...content) => {
  const card = createElement("section", "club-detail-card");
  card.append(createElement("h3", "", title), ...content);
  return card;
};

// <dl> from [label, text or element] pairs.
const createDetailList = (rows) => {
  const list = createElement("dl", "club-detail-list");
  rows.forEach(([label, value]) => {
    const row = createElement("div");
    const description = createElement("dd");
    description.append(value);
    row.append(createElement("dt", "", label), description);
    list.append(row);
  });
  return list;
};

const createPrices = (price) => {
  const { adult = null, student = null } = price ?? {};
  if (adult === null && student === null) {
    return createElement("p", "club-detail-text", "A klub nem adott meg nyilvános árat.");
  }
  const grid = createElement("div", "club-price-grid");
  [
    ["Felnőtt", adult],
    ["Diák", student],
  ].forEach(([label, amount]) => {
    const tile = createElement("div", "club-price");
    tile.append(createElement("span", "", label), createElement("strong", "", formatPrice(amount)));
    grid.append(tile);
  });
  return grid;
};

// Club logo over the club's first letter, which shows when there is no logo or it fails to load.
const createClubLogo = (club) => {
  const logo = createElement("div", "club-detail-logo", club.name.trim().charAt(0).toUpperCase());
  logo.setAttribute("aria-hidden", "true");
  if (club.logoURL) {
    const image = createElement("img");
    image.alt = "";
    image.src = club.logoURL;
    image.addEventListener("error", () => image.remove());
    logo.append(image);
  }
  return logo;
};

const createClubHeader = (club) => {
  const category = categoryById.get(club.categoryId);

  const title = createElement("h2", "", club.name);
  title.id = "club-title";

  const rating = createElement("p", "club-detail-rating");
  if (club.reviewCount) {
    const star = createElement("span", "club-detail-star", "★");
    star.setAttribute("aria-hidden", "true");
    rating.append(star, " ", createElement("strong", "", formatNumber(club.rating, 1)), ` · ${club.reviewCount} értékelés`);
  } else {
    rating.textContent = "Még nincs értékelés";
  }

  const copy = createElement("div");
  copy.append(
    createElement("p", "club-detail-path", [...getAncestors(category), category].map((item) => item.name).join(" › ")),
    title,
    rating,
  );

  const header = createElement("header", "club-detail-header");
  header.append(createClubLogo(club), copy);
  return header;
};

const renderClubPage = (club) => {
  const shell = createElement("div", "content-shell");

  const backLink = createElement("a", "text-link club-page-back", "← Vissza a klubokhoz");
  backLink.href = clubListReturn.hash;
  shell.append(backLink);

  if (!club) {
    const title = createElement("h2", "", "A klub nem található");
    title.id = "club-title";
    const heading = createElement("div", "section-heading");
    heading.append(title);
    shell.append(
      heading,
      createElement("p", "club-detail-text", "Lehet, hogy hibás a link, vagy a klub már nem szerepel a katalógusban."),
    );
    clubPage.replaceChildren(shell);
    return;
  }

  const fullAddress = `${club.zipCode} ${club.city}, ${club.address}`;
  clubMap.dataset.address = fullAddress;

  const mainColumn = createElement("div", "club-detail-column");
  mainColumn.append(
    createDetailCard("Bemutatkozás", createElement("p", "club-detail-text", club.description)),
    createDetailCard("Árak", createPrices(club.price)),
  );

  const sideColumn = createElement("div", "club-detail-column");
  sideColumn.append(
    createDetailCard(
      "Elérhetőség",
      createDetailList([
        ["Cím", fullAddress],
        ["E-mail", createLink(`mailto:${club.email}`, club.email)],
        ["Telefon", createLink(`tel:${club.phone.replace(/[^\d+]/g, "")}`, club.phone)],
        ["Weboldal", createWebsiteLink(club.websiteURL)],
      ]),
    ),
    createDetailCard("Térkép", clubMap),
  );

  const layout = createElement("div", "club-detail-layout");
  layout.append(mainColumn, sideColumn);

  shell.append(createClubHeader(club), layout);
  clubPage.replaceChildren(shell);
};

// "#osszes-klub" -> all clubs, "#osszes-klub/2" -> preselect main category 2 (Mozgás).
const parseAllClubsRoute = () => {
  const [base, id] = window.location.hash.split("/");
  if (base !== ALL_CLUBS_HASH) return null;
  const category = categoryById.get(Number(id));
  return { parentId: category && category.parentId === null ? category.id : null };
};

// "#klub/5-1" -> "5-1". Everything under #klub is the club page (unknown ids show "not found").
const parseClubRoute = () => {
  const [base, id = ""] = window.location.hash.split("/");
  return base === CLUB_HASH ? id : null;
};

let currentView = null;

const syncRoute = () => {
  const clubId = parseClubRoute();
  const allClubsRoute = parseAllClubsRoute();
  const view = clubId !== null ? "club" : allClubsRoute !== null ? "all-clubs" : "landing";
  const previousView = currentView;
  currentView = view;

  // Back from a club page to the list it was opened from: leave the list as it was.
  const isReturningToList =
    view === "all-clubs" &&
    previousView === "club" &&
    allClubsRendered &&
    window.location.hash === clubListReturn.hash;

  if (view === "club") {
    if (previousView === "all-clubs") {
      clubListReturn.scrollY = window.scrollY;
    }
    const club = clubById.get(clubId);
    renderClubPage(club);
    document.title = `${club ? club.name : "A klub nem található"} – ${DEFAULT_TITLE}`;
  } else if (view === "all-clubs") {
    clubListReturn.hash = window.location.hash;
    if (!isReturningToList) {
      allClubsFilter.parentId = allClubsRoute.parentId;
      allClubsFilter.categoryId = null;
      if (allClubsRendered) {
        updateAllClubsView();
      } else {
        renderAllClubsPage();
      }
    }
    document.title = `Összes klub – ${DEFAULT_TITLE}`;
  } else {
    document.title = DEFAULT_TITLE;
  }

  clubPage.hidden = view !== "club";
  allClubsPage.hidden = view !== "all-clubs";
  landingSections.forEach((section) => {
    section.hidden = view !== "landing";
  });

  if (view !== "landing") {
    window.scrollTo(0, isReturningToList ? clubListReturn.scrollY : 0);
  } else if (window.location.hash) {
    // The target was hidden when the browser tried to jump to it, so scroll manually.
    document.querySelector(window.location.hash)?.scrollIntoView();
  }
};

window.addEventListener("hashchange", syncRoute);
syncRoute();

