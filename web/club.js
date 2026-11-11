/* ============================================================
   Club subpage (club.html?id=<clubId>)
   Uses the shared categories, clubs and helpers from script.js.
   ============================================================ */

const SITE_TITLE = "Hobby Catalog";
const clubPage = document.querySelector("#club-page");

// The map's div is in club.html; showClubOnMap() puts the club's map in it.
// data-address = current club.
const clubMap = document.querySelector("#map");

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

// Leaflet map with OpenStreetMap tiles and a marker on the club. Only the placeholder
// clubs have coordinates for now; real clubs' addresses will need geocoding first.
// Without coordinates (or if Leaflet fails to load) #map stays empty and shows the CSS placeholder.
const showClubOnMap = (club) => {
  if (!club.coordinates || typeof L === "undefined") return;

  // No scroll-wheel zoom, so scrolling the page over the map still scrolls the page.
  const map = L.map(clubMap, { scrollWheelZoom: false }).setView(club.coordinates, 16);
  L.tileLayer("https://tile.openstreetmap.org/{z}/{x}/{y}.png", {
    maxZoom: 19,
    attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a>',
  }).addTo(map);
  L.marker(club.coordinates, { alt: club.name }).addTo(map);
};

// club.html holds the back link and the layout with the map card;
// this adds the club's header and the other detail cards around them.
const renderClubPage = (club) => {
  const layout = clubPage.querySelector(".club-detail-layout");

  if (!club) {
    const title = createElement("h2", "", "A klub nem található");
    title.id = "club-title";
    const heading = createElement("div", "section-heading");
    heading.append(title);
    layout.replaceWith(
      heading,
      createElement("p", "club-detail-text", "Lehet, hogy hibás a link, vagy a klub már nem szerepel a katalógusban."),
    );
    return;
  }

  const fullAddress = `${club.zipCode} ${club.city}, ${club.address}`;
  clubMap.dataset.address = fullAddress;

  clubPage.querySelector("[data-club-main-column]").append(
    createDetailCard("Bemutatkozás", createElement("p", "club-detail-text", club.description)),
    createDetailCard("Árak", createPrices(club.price)),
  );

  clubPage.querySelector("[data-club-side-column]").prepend(
    createDetailCard(
      "Elérhetőség",
      createDetailList([
        ["Cím", fullAddress],
        ["E-mail", createLink(`mailto:${club.email}`, club.email)],
        ["Telefon", createLink(`tel:${club.phone.replace(/[^\d+]/g, "")}`, club.phone)],
        ["Weboldal", createWebsiteLink(club.websiteURL)],
      ]),
    ),
  );

  layout.before(createClubHeader(club));
  showClubOnMap(club);
};

// The back link returns to the list the club was opened from; going back in the
// browser history keeps that list's filters and scroll position.
const setUpBackLink = () => {
  if (!document.referrer) return;
  const referrer = new URL(document.referrer);
  const openedFromList =
    referrer.origin === window.location.origin && referrer.pathname.endsWith(`/${ALL_CLUBS_PAGE}`);
  if (!openedFromList) return;

  const backLink = clubPage.querySelector(".club-page-back");
  backLink.href = referrer.href;
  backLink.addEventListener("click", (event) => {
    if (window.history.length > 1) {
      event.preventDefault();
      window.history.back();
    }
  });
};

// "club.html?id=5-1" -> "5-1". Unknown or missing ids show "not found".
const clubId = new URLSearchParams(window.location.search).get("id") ?? "";
const club = clubById.get(clubId);

setUpBackLink();
renderClubPage(club);
document.title = `${club ? club.name : "A klub nem található"} – ${SITE_TITLE}`;
