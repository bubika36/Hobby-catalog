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

const setHeaderExpanded = (isExpanded) => {
  siteHeader.classList.toggle("is-collapsed", !isExpanded);
  headerToggle.setAttribute("aria-expanded", String(isExpanded));
  headerToggle.setAttribute("aria-label", isExpanded ? "Fejléc összecsukása" : "Fejléc kibontása");
};

headerToggle.addEventListener("click", () => {
  setHeaderExpanded(headerToggle.getAttribute("aria-expanded") !== "true");
});

// The header can only be collapsed on small screens, so leaving them expands it again.
mobileHeaderQuery.addEventListener("change", () => {
  if (!mobileHeaderQuery.matches) setHeaderExpanded(true);
});

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
   Shared by the subpages: all-clubs.html (all-clubs.js)
   and club.html (club.js)
   ============================================================ */

// Every subpage has its own HTML file and a script with the same name.
const ALL_CLUBS_PAGE = "all-clubs.html";
const CLUB_PAGE = "club.html";

// Categories come from the backend (GET /api/categories -> [{ id, name, parentId }]).
// They start empty; the subpages call loadCategories() and render once it has finished.
const CATEGORIES_API = "/api/categories";

let categories = [];
let categoryById = new Map();
let parentCategories = [];
let subCategories = [];

const loadCategories = async () => {
  const response = await fetch(CATEGORIES_API);
  if (!response.ok) throw new Error(`Failed to load categories (HTTP ${response.status})`);
  categories = await response.json();
  categoryById = new Map(categories.map((category) => [category.id, category]));
  parentCategories = categories.filter((category) => category.parentId === null);
  subCategories = categories.filter((category) => category.parentId !== null);
};

const getChildren = (parentId) => categories.filter((category) => category.parentId === parentId);

// The category itself plus every category below it (e.g. Harcművészet -> Judo, ..., Box).
// Main categories have parentId null, so getSubtreeIds(null) contains every category.
const getSubtreeIds = (categoryId) => [
  categoryId,
  ...getChildren(categoryId).flatMap((child) => getSubtreeIds(child.id)),
];

// Top-down list of the category's parents, e.g. Box -> [Mozgás, Harcművészet, Küzdősport].
const getAncestors = (category) => {
  const parent = categoryById.get(category.parentId);
  return parent ? [...getAncestors(parent), parent] : [];
};

const getRootId = (category) => (getAncestors(category)[0] ?? category).id;

// Clubs come from the backend too (GET /api/clubs -> [{ id, name, ..., categoryIds, price }]).
const CLUBS_API = "/api/clubs";

let allClubs = [];
let clubById = new Map();

const loadClubs = async () => {
  const response = await fetch(CLUBS_API);
  if (!response.ok) throw new Error(`Failed to load clubs (HTTP ${response.status})`);
  allClubs = await response.json();
  clubById = new Map(allClubs.map((club) => [club.id, club]));
};

// The subpages need both, so they load them together.
const loadCatalog = () => Promise.all([loadCategories(), loadClubs()]);

// A club can have several categories (e.g. Labdajátékok, Csapatsport and Kosárlabda).
// This picks the most specific one: the deepest, and on a tie the later one.
const getMostSpecificCategory = (categoryIds) =>
  categoryIds
    .map((id) => categoryById.get(id))
    .filter(Boolean)
    .reduce(
      (best, category) => (!best || getAncestors(category).length >= getAncestors(best).length ? category : best),
      null,
    );

const createElement = (tag, className, text) => {
  const element = document.createElement(tag);
  if (className) element.className = className;
  if (text !== undefined) element.textContent = text;
  return element;
};

// A club's logo for the list cards and the club page. It removes itself if it fails to load,
// so the box behind it (grey box, first letter) shows instead.
const createClubLogoImage = (url, loading = "eager") => {
  const image = createElement("img");
  image.alt = "";
  image.loading = loading;
  image.referrerPolicy = "no-referrer"; // some club sites block images linked from other sites
  image.src = url; // set last, so the two settings above apply to this request
  image.addEventListener("error", () => image.remove());
  return image;
};
