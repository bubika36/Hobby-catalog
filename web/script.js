const chatButton = document.querySelector(".chat-bubble");
const chatPopup = document.querySelector("#chat-popup");
const chatCloseButton = document.querySelector(".chat-popup-close");

chatButton?.addEventListener("click", () => {
  if (chatPopup.open) {
    chatPopup.close();
  } else {
    chatPopup.show();
    chatButton.setAttribute("aria-expanded", "true");
  }
});

chatCloseButton?.addEventListener("click", () => chatPopup.close());

chatPopup?.addEventListener("close", () => {
  chatButton.setAttribute("aria-expanded", "false");
  chatButton.focus();
});

document.addEventListener("pointerdown", (event) => {
  if (
    chatPopup?.open &&
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
  if (!mobileHeaderQuery.matches && siteHeader && headerToggle) {
    siteHeader.classList.remove("is-collapsed");
    headerToggle.setAttribute("aria-expanded", "true");
    headerToggle.setAttribute("aria-label", "Fejléc összecsukása");
  }
};

headerToggle?.addEventListener("click", () => {
  const isExpanded = headerToggle.getAttribute("aria-expanded") === "true";
  headerToggle.setAttribute("aria-expanded", String(!isExpanded));
  headerToggle.setAttribute("aria-label", isExpanded ? "Fejléc kibontása" : "Fejléc összecsukása");
  siteHeader.classList.toggle("is-collapsed", isExpanded);
});

mobileHeaderQuery.addEventListener("change", syncHeaderForViewport);

const categoryFilters = [...document.querySelectorAll("[data-category-filter]")];

if (categoryFilters.length) {
  const clubCards = [...document.querySelectorAll("[data-club-listing] [data-category]")];
  const resultCount = document.querySelector("[data-results-count]");
  const resultsTitle = document.querySelector("[data-results-title]");
  const emptyState = document.querySelector("[data-empty-state]");
  const categoryNames = {
    all: "Minden klub",
    1: "Fitness",
    2: "Yoga",
    3: "Harcművészet",
    4: "Labdajátékok",
    5: "Vízisport",
    6: "Küzdősport",
    7: "Csapatsport",
    8: "Kerékpározás",
    9: "Tánc",
    10: "Szabadtéri sport",
    11: "Futás",
    12: "Mászás",
    13: "Tenisz",
    14: "Úszás",
  };
  const categoryParents = { 6: "3", 7: "4", 11: "10", 12: "10", 14: "5" };

  const belongsToCategory = (itemCategory, selectedCategory) => {
    let category = itemCategory;
    while (category) {
      if (category === selectedCategory) return true;
      category = categoryParents[category];
    }
    return false;
  };

  const applyCategory = (category) => {
    const activeCategory = Object.hasOwn(categoryNames, category) ? category : "all";
    let visibleCount = 0;

    clubCards.forEach((card) => {
      const isVisible = activeCategory === "all" || belongsToCategory(card.dataset.category, activeCategory);
      card.hidden = !isVisible;
      if (isVisible) visibleCount += 1;
    });

    categoryFilters.forEach((button) => {
      const isActive = button.dataset.categoryFilter === activeCategory;
      button.classList.toggle("is-active", isActive);
      button.setAttribute("aria-pressed", String(isActive));
    });

    resultCount.textContent = String(visibleCount);
    resultsTitle.textContent = activeCategory === "all" ? categoryNames.all : `${categoryNames[activeCategory]} klubok`;
    emptyState.hidden = visibleCount !== 0;
    const url = new URL(window.location.href);
    if (activeCategory === "all") {
      url.searchParams.delete("category");
    } else {
      url.searchParams.set("category", activeCategory);
    }
    window.history.replaceState({}, "", url);
  };

  categoryFilters.forEach((button) => {
    button.addEventListener("click", () => applyCategory(button.dataset.categoryFilter));
  });

  const initialCategory = new URLSearchParams(window.location.search).get("category") || "all";
  applyCategory(initialCategory);
}

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

