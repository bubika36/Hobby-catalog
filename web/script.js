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

// Hardcoded copy of the `categories` table in hobby_catalog_data.sql (categoryId, name, parentId).
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

// Placeholder clubs: 5 or 6 for every subcategory, with the same fields as the
// `clubs` and `price` tables so the club page can show every detail.
// TODO: replace with clubs from the API.

// Real Székesfehérvár addresses with their coordinates (looked up on OpenStreetMap),
// so the club page's map can show where a placeholder club is. Placeholder only:
// the `clubs` table stores no coordinates, real clubs' addresses will be geocoded.
const placeholderLocations = [
  { address: "Budai út 12.", coordinates: { lat: 47.189145, lng: 18.415003 } },
  { address: "Palotai út 1.", coordinates: { lat: 47.19063, lng: 18.406494 } },
  { address: "Berényi út 15.", coordinates: { lat: 47.200313, lng: 18.422545 } },
  { address: "Prohászka Ottokár út 30/A.", coordinates: { lat: 47.186, lng: 18.417002 } },
  { address: "Fő utca 8.", coordinates: { lat: 47.194754, lng: 18.408674 } },
  { address: "Rákóczi utca 25.", coordinates: { lat: 47.194349, lng: 18.415774 } },
  { address: "Móri út 16.", coordinates: { lat: 47.200043, lng: 18.408775 } },
  { address: "Csikvári út 10.", coordinates: { lat: 47.173651, lng: 18.414311 } },
  { address: "Seregélyesi út 96.", coordinates: { lat: 47.185046, lng: 18.461154 } },
  { address: "Pozsonyi út 47.", coordinates: { lat: 47.204835, lng: 18.448868 } },
];

const placeholderClubs = subCategories.flatMap((category) =>
  Array.from({ length: 5 + (category.id % 2) }, (_, index) => {
    const id = `${category.id}-${index + 1}`;
    const seed = category.id * 7 + index * 3;
    const adultPrice = 3000 + (seed % 9) * 1000;
    const place = placeholderLocations[seed % placeholderLocations.length];
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
      address: place.address,
      zipCode: 8000,
      city: "Székesfehérvár",
      coordinates: place.coordinates, // placeholder only, see placeholderLocations
      price: { adult: adultPrice, student: index % 3 === 2 ? null : adultPrice - 1000 },
    };
  }),
);

const clubById = new Map(placeholderClubs.map((club) => [club.id, club]));

const createElement = (tag, className, text) => {
  const element = document.createElement(tag);
  if (className) element.className = className;
  if (text !== undefined) element.textContent = text;
  return element;
};
