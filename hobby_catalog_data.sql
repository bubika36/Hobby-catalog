-- ============================================================
-- HOBBY CATALOG - 2. táblák feltöltése mintaadatokkal
-- Előtte futtasd: hobby_catalog_create.sql
-- ============================================================

USE hobby_catalog;

-- ============================================================
-- USERS
-- ============================================================

INSERT INTO users
(userId, firstName, lastName, userName, email, password, role, status)
VALUES
(1, 'Bence', 'Nagy', 'bence_nagy', 'bence.nagy@example.com', 'Test1234!', 'USER', 1),
(2, 'Anna', 'Kovács', 'anna_kovacs', 'anna.kovacs@example.com', 'Test1234!', 'USER', 1),
(3, 'Dávid', 'Szabó', 'david_szabo', 'david.szabo@example.com', 'Test1234!', 'USER', 1),
(4, 'Eszter', 'Tóth', 'eszter_toth', 'eszter.toth@example.com', 'Test1234!', 'USER', 1),
(5, 'Máté', 'Horváth', 'mate_horvath', 'mate.horvath@example.com', 'Test1234!', 'USER', 1),
(6, 'Lilla', 'Varga', 'lilla_varga', 'lilla.varga@example.com', 'Test1234!', 'USER', 1),
(7, 'Ádám', 'Kiss', 'adam_kiss', 'adam.kiss@example.com', 'Test1234!', 'USER', 1),
(8, 'Zsófia', 'Molnár', 'zsofia_molnar', 'zsofia.molnar@example.com', 'Test1234!', 'USER', 1),
(9, 'Péter', 'Németh', 'peter_nemet', 'peter.nemet@example.com', 'Test1234!', 'USER', 1),
(10, 'Réka', 'Farkas', 'reka_farkas', 'reka.farkas@example.com', 'Test1234!', 'USER', 1),
(11, 'Gábor', 'Balogh', 'gabor_balogh', 'gabor.balogh@example.com', 'Test1234!', 'ADMIN', 1),
(12, 'Nóra', 'Lakatos', 'nora_lakatos', 'nora.lakatos@example.com', 'Test1234!', 'USER', 1),
(13, 'Márk', 'Papp', 'mark_papp', 'mark.papp@example.com', 'Test1234!', 'USER', 1),
(14, 'Julianna', 'Simon', 'julianna_simon', 'julianna.simon@example.com', 'Test1234!', 'USER', 0),
(15, 'Tamás', 'Bíró', 'tamas_biro', 'tamas.biro@example.com', 'Test1234!', 'MODERATOR', 1);


-- ============================================================
-- CLUBS
-- ============================================================
-- Valós klubok Székesfehérvár 50 km-es körzetéből (2026. novemberi
-- állapot, a klubok saját weboldalairól). A rating és reviewCount
-- a lenti REVIEWS mintaadatokból számolt érték (nem Google-értékelés).

INSERT INTO clubs
(clubId, name, description, email, phone, websiteURL, logoURL,
 rating, reviewCount, address, zipCode, city)
VALUES
(1,
 'Roy Gym',
 'Modern konditerem Székesfehérváron profi gépparkkal, csoportos órákkal és személyi edzéssel.',
 'roygym2024@gmail.com',
 '+36-30-491-9340',
 'https://roygym.hu',
 'https://roygym.hu/og/og-default.jpg',
 4.8, 3,
 'Budai út 154.',
 8000,
 'Székesfehérvár'),

(2,
 'Hajnalfény Jóga Stúdió',
 'Jóga stúdió hatha jóga, 3D dinamikus jóga, gerinctréning, meditáció és középiskolásoknak szóló gimis jóga órákkal.',
 'zsuzsi@hajnalfenyjoga.hu',
 '+36-20-522-1936',
 'https://hajnalfenyjoga.hu',
 'https://hajnalfenyjoga.hu/wp-content/uploads/2017/09/1_HajnalfenyJoga_Logo_Yellow_72dpi_RGB.jpg',
 4.8, 2,
 'Sarló utca 4. 1/10.',
 8000,
 'Székesfehérvár'),

(3,
 'Caliente TáncStúdió S.E.',
 'Táncstúdió és sportegyesület társastánc, latin és modern tánc oktatással, kezdő felnőtt társastánc tanfolyamokkal.',
 'info@caliente.hu',
 '+36-30-116-0313',
 'https://caliente.hu',
 'https://caliente.hu/wp-content/uploads/2016/11/ujlogo.png',
 4.5, 2,
 'Farkasvermi út 2.',
 8000,
 'Székesfehérvár'),

(4,
 'Kiskút Tenisz Klub',
 'Teniszklub hat salakpályával (három világított, három télen lefedett), online pályafoglalással és saját étteremmel.',
 'kiskuttenisz.hella@gmail.com',
 '+36-30-947-3402',
 'https://fehervartenisz.hu',
 'https://fehervartenisz.hu/wp-content/uploads/2020/02/kiskut-teniszklub-szekesfehervar.jpg',
 4.8, 2,
 'Kiskút útja 3.',
 8000,
 'Székesfehérvár'),

(5,
 'Alba Regia Atlétikai Klub',
 'Székesfehérvár atlétikai klubja a Bregyó-közi atlétikai központban, utánpótlás és felnőtt versenyzőkkel, futó és gyalogló szakággal.',
 'arak@arakatletika.hu',
 '+36-22-501-373',
 'https://www.arakatletika.hu',
 'https://www.arakatletika.hu/img/logo.png',
 4.8, 2,
 'Bregyó köz 1.',
 8000,
 'Székesfehérvár'),

(6,
 'Fehérvári Sakk Egyesület',
 'Nonprofit sakkegyesület kezdő és haladó csoportokkal, szerdai és pénteki foglalkozásokkal, helyi és FIDE-versenyekkel.',
 'f.sesakk@gmail.com',
 '+36-30-257-3106',
 'https://www.fehervarisakk.hu',
 'https://www.fehervarisakk.hu/images/fse_logo.jpg',
 4.8, 2,
 'Királykút lakónegyed 20.',
 8000,
 'Székesfehérvár'),

(7,
 'Delfin Sportegyesület',
 'Úszóegyesület kezdő, középhaladó és haladó úszótanfolyamokkal és kondicionáló úszással a Csitáry G. Emil Uszodában.',
 'delfinsportegyesulet@t-online.hu',
 '+36-30-939-3138',
 'https://www.delfin-sportegyesulet-uszas.hu',
 'https://cdn.prod.website-files.com/62be106bc8b4042c72ca7413/62dfa17945e33dfc90ca2885_delfin-logo.png',
 4.8, 2,
 'Bártfai utca 6.',
 8000,
 'Székesfehérvár'),

(8,
 'Aranyménes Lovarda',
 'Lovarda és lovas oktatási központ Pákozdon gyerekeknek és felnőtteknek: futószáras, kezdő és haladó csoportos órák, nyári táborok.',
 'info@aranymenes.hu',
 '+36-20-353-4561',
 'https://www.aranymenes.hu',
 'https://bdb61f6d78.clvaw-cdnwnd.com/517dad5b83d29b9bae4bc91a2dffd027/200002543-95a0995a0a/Aranym%C3%A9nes_feh%C3%A9r_l%C3%B3.jpeg?ph=bdb61f6d78',
 4.8, 2,
 'Pákozdmajor 0203/26 hrsz.',
 8095,
 'Pákozd'),

(9,
 'Alba Fehérvár',
 'Székesfehérvár elsőosztályú férfi kosárlabdaklubja utánpótlás csapatokkal.',
 'titkarsag@albafehervar.hu',
 '+36-22-314-442',
 'https://www.albakosar.hu',
 'https://www.albakosar.hu/_user/logo/type_2/1382430524.jpg',
 4.5, 2,
 'Gáz utca 19.',
 8000,
 'Székesfehérvár'),

(10,
 'Videoton FC Fehérvár',
 'Székesfehérvár labdarúgóklubja férfi, női és utánpótlás csapatokkal.',
 'sajto@vidi.hu',
 '+36-22-379-493',
 'https://vidi.hu',
 'https://vidi.hu/assets/img/logo-videoton.svg',
 5.0, 2,
 'Csíkvári út 10.',
 8000,
 'Székesfehérvár'),

(11,
 'DKKA SE',
 'Dunamenti Központi Kézilabda Akadémia Sportegyesület: női kézilabda több utánpótlás korosztállyal (U14, U16, U18).',
 'info@dkkase.hu',
 '+36-30-625-1027',
 'https://dkkase.hu',
 'https://dkkase.hu/themes/crt/dkkase-logo.svg',
 4.3, 2,
 'Eszperantó út 2-4.',
 2400,
 'Dunaújváros'),

(12,
 'Csitáry G. Emil Uszoda és Strand',
 'Városi uszoda 8 pályás versenymedencével és tanmedencével, úszóoktatással, nyáron stranddá bővülve.',
 'sport@varosgondnoksag.hu',
 '+36-22-327-655',
 'https://www.csitaryuszoda.hu',
 'http://www.csitaryuszoda.hu/_upload/news_pic/4_365.jpg',
 4.8, 2,
 'Mészöly Géza utca',
 8000,
 'Székesfehérvár'),

(13,
 'Érdi Kerékpáros és Triatlon Sportegyesület',
 'Az Érdi Kerékpáros és Triatlon Sportegyesületet egy sportszerető baráti társaság alapította meg, akik már több éve együtt és eredményesen versenyeznek. Az egyesület alapítása azért fogalmazódott meg bennünk, mert örömmel láttuk, hogy városunk fiatal lakossága körében egyre népszerűbb szabadidősport...',
 'erdiktse@gmail.com',
 '+36-30-932-6478',
 'https://gyeresportolni.hu/egyesulet/reszletek/Erdi_Kerekparos_es_Triatlon_Sportegyesulet_2',
 'https://gyeresportolni.hu/images/uploads/kepek/thumbs/3154.jpg',
 0.0, 0,
 'Csaba utca 56.',
 2030,
 'Érd'),

(14,
 'Budaörs Triatlon',
 'A Budaörsi Triatlon Klub 2003 óta működik Vanek Gábor vezetésével, aki az alapítás óta vezeti és koordinálja a csapat felkészülését és versenyzését. Jelenleg már a különböző korosztályokban kb. 70 versenyzőnk van. Úszóedzőnk Dr. Pozsgay Gábor, kerékpáros edzőnk Pocsföldi Ottó, futóedzőnk Zemen...',
 'budaors.triatlon@gmail.com',
 '+36-20-941-4542',
 'https://gyeresportolni.hu/egyesulet/reszletek/Budaors_Triatlon_2',
 'https://gyeresportolni.hu/images/uploads/logok/thumbs/xaSY0JTWiCMUTzS7sRA7SNOFpRKY5TaK.jpg',
 0.0, 0,
 'Gesztenye utca 11.',
 2040,
 'Budaörs'),

(15,
 'Footour Sport Club',
 'Futó egyesület Tata városban.',
 'info@footour.hu',
 '+36-20-455-8625',
 'https://gyeresportolni.hu/egyesulet/reszletek/Footour_Sport_Club_2',
 'https://gyeresportolni.hu/images/uploads/logok/thumbs/Ow4N6Q4hDQxlBfdrUEDPOhlVsVKCmVIr.png',
 0.0, 0,
 'Bajcsy-Zsilinszky u. 46. I/3.',
 2890,
 'Tata'),

(16,
 'Szingo Cycling Team',
 'Bár csak 2014-ben indult utánpótlásunk, már két és fél év után is látványos eredményeket értünk el velük, versenyzőink között van Magyar Bajnok és országos bajnokságon elért második helyezett, számos Magyar Kupa futam győzelemmel rendelkezünk és a felnőtt válogatottnak is neveltünk már versenyzőt....',
 'info@szingo.hu',
 '+36-20-203-4054',
 'https://gyeresportolni.hu/egyesulet/reszletek/Szingo_Cycling_Team_2',
 'https://gyeresportolni.hu/images/uploads/logok/thumbs/ZtwQemjnzAf5kmWIPuZThO17MYPo7mpw.jpg',
 0.0, 0,
 'Berényi út 31.',
 8000,
 'Székesfehérvár'),

(17,
 'Bakony Bike Kerékpáros Egyesület',
 'Kezdetben a túrázással foglakozó kerékpáros egyesület, később az amatőr versenysportág egyik prominens egyesületévé nőtte ki magát. Jelenleg rendelkezünk három szakosztállyal: 1. Országúti versenyzők, 2. Országúti teljesítménytúrázók 3. MTB versenyzők Alakulásakor Várpalota város egyesülete volt, de...',
 'bakonybike1@gmail.com',
 '+36-30-238-7431',
 'https://gyeresportolni.hu/egyesulet/reszletek/Bakony_Bike_Kerekparos_Egyesulet_2',
 'https://gyeresportolni.hu/images/uploads/logok/thumbs/D9fImNx3Fjjttmqw0j3DvIX2U0fRsA-F.png',
 0.0, 0,
 'Újmandulás utca 4.',
 8105,
 'Pétfürdő'),

(18,
 'HungaroFondo',
 'Kerékpározni jó. Sőt... nekünk a legjobb dolog a világon. Számunkra a kerékpározás szenvedély és életforma. Közösségben tekerni pedig egyenesen élmény. Ez az érzés ma sokakat áthat Magyarországon, és szerencsére, egyre többeket. Baráti társaságunkban sok dolog közös, de különösen a kerékpározás és...',
 'info@hungarofondo.hu',
 '+36-70-938-8015',
 'https://gyeresportolni.hu/egyesulet/reszletek/HungaroFondo_2',
 'https://gyeresportolni.hu/images/uploads/logok/thumbs/w6Xr6YWJ6SlD0mG_3tbWXKU-FbaaXOhh.jpg',
 0.0, 0,
 'Deák Ferenc u. 46.',
 2091,
 'Etyek'),

(19,
 'Veszprémi Kerékpáros Egyesület',
 'A Veszprémi Kerékpáros Egyesületet 2005-ben hoztuk létre azzal az elsődleges gondolattal, hogy a veszprémi és környékbeli bicajosokkal összefogva, közös túrákat, edzéseket és mindennapi szabadidős gurulásokat szervezzünk. Évek óta egyre többen járunk a környékről különböző montis és országúti...',
 'vke.l.horvath@gmail.com',
 '+36-20-928-9173',
 'https://gyeresportolni.hu/egyesulet/reszletek/Veszpremi_Kerekparos_Egyesulet_2',
 'https://gyeresportolni.hu/images/uploads/kepek/thumbs/8266566ce08311f1c3eeab8bb1ef8243.jpg',
 0.0, 0,
 'Lövőház u.17.',
 8200,
 'Veszprém'),

(20,
 'VVSI Evezős Utánpótlásért Alapítvány',
 'A VVSI ötven éve egyet jelent a Velencei-tavi evezéssel. Utánpótlás, felnőtt és szabadidős sportolók edzenek nálunk',
 'rowing@vvsi.hu',
 '+36-30-115-1170',
 'https://gyeresportolni.hu/egyesulet/reszletek/vvsi-evezos-utanotlasert-alapitvany',
 'https://gyeresportolni.hu/images/uploads/logok/thumbs/Q7XAqsxqo_gsGoMQXYDGAXEPlNAIQPmA.jpg',
 0.0, 0,
 'Tópart u.17.',
 2484,
 'Gárdony'),

(21,
 'PATRIOT Yacht Club Vitorlás,- Kajak-Kenu Vízi-túra és Vízimentő Sportegyesület',
 'A Patriot S.E. Siófokon működő vitorlás és kajak-kenu sportegyesület. Egyesületünk 2001-ben alakult, elsősorban, mint kedvtelési és túrázási célú vitorlás egyesület. Eszközparkunk kezdetben 2-3 vitorlás kishajóból állt. Tagjaink inkább a vitorlázást kedvelő baráti körből kerültek ki. A működésünk...',
 'yacht-sail@yacht-sail.hu',
 '+36-30-929-9413',
 'https://gyeresportolni.hu/egyesulet/reszletek/PATRIOT_Yacht_Club_Vitorlas__Kajak_Kenu_Vizi_tura_es_Vizimento_Sportegyesulet_2',
 'https://gyeresportolni.hu/images/uploads/logok/thumbs/oyiC-h4Dm5MEOs5g8J9rUqk-51BU2MmS.jpg',
 0.0, 0,
 'Aradi Vértanúk u. 65.',
 8600,
 'Siófok'),

(22,
 'Siófoki Kajak Kenu Sportegyesület',
 'Célunk: Siófok város és kistérsége sportéletének részeként - a gyermek és ifjúsági sport, valamint az utánpótlás-nevelés támogatása, - a fogyatékosok sportjának támogatása, - az egészséges életmód és a szabadidősport feltételei megteremtésének és fejlesztésének elősegítése, - az utánpótlás-nevelés...',
 'kajakkenusiofok@gmail.com',
 '+36-70-314-4013',
 'https://gyeresportolni.hu/egyesulet/reszletek/Siofoki_Kajak_Kenu_Sportegyesulet_2',
 'https://gyeresportolni.hu/images/uploads/logok/thumbs/PUKIb_BhNTetjdgvyNOT6kXLeIAt2iQp.jpg',
 0.0, 0,
 'Kele utca hrsz 5867/5.',
 8600,
 'Siófok'),

(23,
 'Dömsödi Kajak- Kenu Sportegyesület',
 'A Dömsödi Kajak- Kenu Sportegyesület korcsoportos lebontásban tanítja a gyermeket. A vízbiztonság miatt is kiemelt fontosságú az úszásoktatás. Közreműködésünkkel, eddig 57 gyermek tett sikeres úszóvizsgát. A sikeres úszóvizsgát követően a kajak kenu alap elsajátítása következik, úgymint hajóban...',
 'info@dkkse.hu',
 '+36-70-263-0636',
 'https://gyeresportolni.hu/egyesulet/reszletek/Domsodi_Kajak__Kenu_Sportegyesulet',
 'https://gyeresportolni.hu/images/uploads/logok/thumbs/VcI5nZCArDNaVQmYCJcjW0sG8xOiBGdr.png',
 0.0, 0,
 'Középső-Dunapart 1.',
 2344,
 'Dömsöd'),

(24,
 'Kis-Duna Sportegyesület',
 'Egyesületünk egy hosszú évek óta működő kajak versenyszakosztály, mely Szigethalom Dunaszigeten található, különösen szép környezetben, egész évben evezhető, nagy vízfelülettel. Fő profilunk utánpótlás korú gyermekek felkészítése a Magyar Kajak-Kenu Szövetség által kiírt és megszervezett...',
 'info@kdse.hu',
 '+36-30-513-8958',
 'https://gyeresportolni.hu/egyesulet/reszletek/Kis_Duna_Sportegyesulet_2',
 'https://gyeresportolni.hu/images/uploads/logok/thumbs/f2Q7exCmj4aAOvxw5OW4VVn2i1Dg8QNP.JPG',
 0.0, 0,
 'Kossuth Lajos u. 10.',
 2315,
 'Szigethalom'),

(25,
 'Tihanyi Hajós Egylet',
 'Sup és szörf egyesület Tihany városban.',
 'gyula.bano@thesail.hu',
 '+36-20-330-7714',
 'https://www.thesail.hu/',
 'https://www.thesail.hu/wp-content/uploads/2018/02/TheSail_logo_70.png',
 0.0, 0,
 'Kenderföld u. 19.',
 8237,
 'Tihany'),

(26,
 'Komárom-Esztergom Megyei Horgász Egyesületek Szöv.',
 'A Komárom-Esztergom Vármegyei Horgászegyesületek Szövetsége (KEMHESZ) a megye horgászati ügyes-bajos dolgait szervezi és képviseli, célja a fenntartható',
 'iroda@kemhesz.hu',
 '+36-34-310-453',
 'https://kemhesz.hu/',
 'https://kemhesz.hu/wp-content/uploads/2025/10/logo.png',
 0.0, 0,
 'Bánhidai ltp. 108.',
 2800,
 'Tatabánya'),

(27,
 'Fehér Patkó Lovasudvar',
 'Lovasoktatás gyerekeknek és felnőtteknek egyaránt, kezdő szinttől versenyzésig. Bértartási, illetve lóbérlési lehetőség.',
 'feherpatkolovasudvar@gmail.com',
 '+36-20-435-6349',
 'https://gyeresportolni.hu/egyesulet/reszletek/feher-patko-lovasudvar',
 'https://gyeresportolni.hu/images/uploads/logok/thumbs/suuqDlwyJ6MAcDsUg7QyVTDJClJJvXJL.jpg',
 0.0, 0,
 'Kiskút útja 1.',
 8000,
 'Székesfehérvár'),

(28,
 'Kunos Lovarda',
 'Színvonalas lovasoktatással, képzett oktatókkal várjuk a lovagolni vágyókat kezdőtől a profi szintig. A téli hideg se riasszon vissza senkit! Fedeles pályán folyik az oktatás, lovaglás. A kísérőknek melegedő, büfé szolgálja a kényelmet.',
 'info@kunos.hu',
 '+36-20-589-7650',
 'https://gyeresportolni.hu/egyesulet/reszletek/kunos-lovarda',
 'https://gyeresportolni.hu/images/uploads/logok/thumbs/bAIJZYz3zNlTVF4NY3ibqBcZVj4dTtC9.jpg',
 0.0, 0,
 'Kisteleki tanya',
 8000,
 'Székesfehérvár'),

(29,
 'Úrhidai Lovas Egyesület',
 'Lovas egyesület Úrhida városban.',
 'eeedddit@gmail.com',
 '+36-20-295-2940',
 'https://gyeresportolni.hu/egyesulet/reszletek/urhidai-lovas-egyesulet',
 'https://gyeresportolni.hu/images/uploads/logok/thumbs/aCztXr89_osutYTAl8KMfaA9b9J1rxeG.jpg',
 0.0, 0,
 'Pirosalma u. 12.',
 8142,
 'Úrhida'),

(30,
 'Nyerítő Lovasudvar',
 'A Nyerítő Lovasudvar a falu központjában, és egyben a természetvédelmi terület és az Ingókövek szomszédságában található, bámulatos kilátással a Velencei-tóra és a hegységre.',
 'virag.kriszti@freemail.hu',
 '+36-30-904-5881',
 'https://gyeresportolni.hu/egyesulet/reszletek/Nyerito_Lovasudvar_2',
 'https://gyeresportolni.hu/images/uploads/kepek/thumbs/2993.jpg',
 0.0, 0,
 'Fő u. 39.',
 8096,
 'Sukoró'),

(31,
 'Spinfitt Fitness',
 'Spinracing 2100 Ft/alk. Személyi edzés (Csicsó Judit TRX -Trainer), fitnesz edzőtermünkben gerinctorna, felfüggesztéses edzésre is lehetőség van.',
 'info@spinfitt.hu',
 '+36-20-491-7375',
 'https://spinfitt.hu/',
 'https://spinfitt.hu/assets/images/logo/logo3.png',
 0.0, 0,
 'Gyümölcs utca 38. földsz',
 8000,
 'Székesfehérvár'),

(32,
 'Fitfount',
 'személyi edzés Székesfehérvár, fogyás-garancia, erőnövelés-garancia, vérnyomáscsökkentés és egészségjavítás diplomás professzionális személyi edzőkkel',
 'info@fitfount.hu',
 '+36-30-301-4444',
 'https://www.fitfount.hu/',
 'https://4255f134c4.clvaw-cdnwnd.com/e4229c6c44f7aa3e1cfaab61d9d6417f/200000318-1523c1523d/ffalap2.ico?ph=4255f134c4',
 0.0, 0,
 'Vörösmarty tér 5.',
 8000,
 'Székesfehérvár'),

(33,
 'RockStar SE, Rock Star GYM edzőterem',
 'Fitness egyesület Siófok városban.',
 'info@rockstargym.hu',
 '+36-20-321-7891',
 'https://rockstargym.hu/',
 -- the club's own logo is white (invisible on the white logo box), so a dark copy is served from web/images/logos
 '/images/logos/rockstar-gym.svg',
 0.0, 0,
 'Bajcsy-Zsilinszky utca 212. 5-ös e',
 8600,
 'Siófok'),

(34,
 'Shakti Jógastúdió és Mozgásközpont',
 'Jógastúdió és mozgásközpont Székesfehérvár belvárosában, hatha jóga és mozgásórák.',
 'shaktijogastudio@gmail.com',
 '+36-20-956-8764',
 'https://www.shaktijogastudio.hu',
 '',
 0.0, 0,
 'Liszt Ferenc u. 11.',
 8000,
 'Székesfehérvár'),

(35,
 'TMS Pilates Székesfehérvár',
 'Válaszd a gyönyörű, új stúdiónkat Székesfehérváron! Csatlakozz közösségünkhöz és élvezd a Pilates nyújtotta testi-lelki egyensúlyt! Tudnod kell, hogy bárki is',
 'tmspilatesfehervar@gmail.com',
 '+36-30-437-4474',
 'https://www.tmspilates.hu/fehervar/',
 'https://www.tmspilates.hu/wp-content/uploads/2021/11/TMS_Pilates_logo_fekete.png',
 0.0, 0,
 'Király sor 60.',
 8000,
 'Székesfehérvár'),

(36,
 'Flow Pilates Mozgásstúdió',
 'Csoportos reformer pilates edzések exkluzív környezetben, kezdőknek és haladóknak, Székesfehérváron a Campus lakóparkban.',
 'szilvia@flowpilates.hu',
 '+36-30-276-0013',
 'https://www.flowpilates.hu/',
 'https://www.flowpilates.hu/wp-content/uploads/2026/07/Flow-logo_color.png',
 0.0, 0,
 'Huszár u. 3.',
 8000,
 'Székesfehérvár'),

(37,
 'Pilates Alba Stúdió',
 'Pilates egyesület Székesfehérvár városban.',
 'info@pilatesalba.hu',
 '+36-30-531-6868',
 'https://pilatesalba.hu/',
 'https://pilatesalba.hu/wp-content/uploads/2023/02/cropped-pilates-logo-vagott-scaled-1.jpg',
 0.0, 0,
 'Színház u. 2.',
 8000,
 'Székesfehérvár'),

(38,
 'Laguna KTSE',
 'A LAGUNA Táncklubot 1995. márciusában alapítottuk Székesfehérváron. Célunk volt, hogy minél szélesebb körben megismertessük a standard és a latin-amerikai táncokat, és lehetőséget biztosítsunk e táncok elsajátítására minden korosztály számára. Továbbá edzési és versenyzési lehetőséget kívántunk...',
 'lagunaktse@freemail.hu',
 '+36-20-972-5593',
 'https://gyeresportolni.hu/egyesulet/reszletek/Laguna_KTSE_2',
 'https://gyeresportolni.hu/images/uploads/logok/thumbs/0z7XWjM0ybVF2xsqO9ykq2GIsa54GY7n.png',
 0.0, 0,
 'Kaszap István u. 6.',
 8000,
 'Székesfehérvár'),

(39,
 'Kecskédi Néptánc Csoport',
 'A Kecskédi Művészeti és Néptánc Együttes 1963-ban alakult. Fennállásának ideje alatt hagyományaikat, szokásvilágukat, kulturális értékeiket gyűjtötte, ápolta, eltette és örökítette át generációkról generációkra. A Kecskédi Együttes jelenleg 5 generációt átfogó tánccsoportból áll:...',
 'legatcsaba@gmail.com',
 '+36-30-717-2501',
 'https://gyeresportolni.hu/egyesulet/reszletek/kecskedi-neptanc-csoport',
 'https://gyeresportolni.hu/images/uploads/logok/thumbs/uUeS7nQDos80u9ARKKhAkWnhERntIYdR.png',
 0.0, 0,
 'Fő u. 1.',
 2852,
 'Kecskéd'),

(40,
 'B-Cool Dance Team Sportegyesület',
 'Lányok, fiúk figyelem!!!! B-Cool Dance Team SE immáron 4. éve működik. Országos és Nemzetközi táncversenyeken veszünk részt, ahol számos sikereket tudhatnak sportolóink maguk mögött. Kicsik és nagyok egyaránt táncolnak nálunk, akik nem csak egy stílust, hanem többet is tanulhatnak. :)...',
 'bcooldance@outlook.com',
 '+36-20-499-7869',
 'https://gyeresportolni.hu/egyesulet/reszletek/B_Cool_Dance_Team_Sportegyesulet_2',
 'https://gyeresportolni.hu/images/uploads/logok/thumbs/kbpfn-G41vRvVO9z1_gM6epXdvwY0pyt.jpg',
 0.0, 0,
 'Duna utca 28.',
 2440,
 'Százhalombatta'),

(41,
 'Bonita Sporttánc Egyesület',
 'Tánc egyesület Veszprém városban.',
 'gabybonitatanc@gmail.com',
 '+36-20-223-7441',
 'https://gyeresportolni.hu/egyesulet/reszletek/Bonita_Sporttanc_Egyesulet_2',
 'https://gyeresportolni.hu/images/uploads/logok/thumbs/qkkjcCyZjXd0TfAk9LgnEEFcC28P81d1.jpg',
 0.0, 0,
 'Hoffer Ármin sétány 2.',
 8200,
 'Veszprém'),

(42,
 'Sportolj Velünk Sportegyesület',
 'Sportolj Velünk Sportegyesület, Veszprém',
 'sportoljvelunkse@gmail.com',
 '+36-30-638-7055',
 'https://sportoljvelunk.veszpremben.hu/',
 'https://sportoljvelunk.veszpremben.hu/wp-content/uploads/2018/01/SVSE_logo_250px-200x41.png',
 0.0, 0,
 'Varga utca 4/F',
 8200,
 'Veszprém'),

(43,
 'Veszprémi Egyetemi és Diák Atlétikai Club',
 'Atlétikai egyesület Veszprém városban.',
 'vedac@vedac.hu',
 '+36-88-422-868',
 'https://vedac.hu/',
 'https://vedac.hu/sites/site/static/img/header-logo.png',
 0.0, 0,
 'Wartha Vince u. 3.',
 8200,
 'Veszprém'),

(44,
 'Sprint Futóklub',
 'Atlétikai egyesület Tatabánya városban.',
 'sprintfutoklub@gmail.com',
 '+36-30-265-1199',
 'https://gyeresportolni.hu/egyesulet/reszletek/Sprint_Futoklub_2',
 'https://gyeresportolni.hu/images/uploads/logok/thumbs/etp0sanBmu4h8Nrsr0sm018aVJlWRorD.png',
 0.0, 0,
 'Gál István ltp. 511.',
 2800,
 'Tatabánya'),

(45,
 'Tatai Tömegsport és Tájfutó Honvéd Sportegyesület',
 'Atlétikai egyesület Tata városban.',
 'ttt.tata.2004@gmail.com',
 '+36-30-575-4324',
 'https://ttt-tata.hu/',
 'https://ttt-tata.hu/wp-content/uploads/2022/07/TTT-Logo.png',
 0.0, 0,
 'Május 1 út 53/B',
 2890,
 'Tata'),

(46,
 'Japán Harcművészeti Egyesület',
 '6 és 60 év közötti fiúkat és lányokat. Előfeltétel a jelentkezéshez felmérés, regisztráció. Edzések időpontjai gyermekeknek hétfő és péntek, 16:30-17:30, haladó vegyes csoport tagjainak hétfő, szerda, péntek, 17:30-19:00. Tagdíj 5000 Ft/fő',
 'teferencistvan@gmail.com',
 '+36-20-397-8135',
 'https://gyeresportolni.hu/egyesulet/reszletek/Japan_Harcmuveszeti_Egyesulet_2',
 'https://gyeresportolni.hu/images/uploads/logok/thumbs/7qhazGCPe6cPC25oc0O3TtRayC2pEaQm.JPG',
 0.0, 0,
 'Kelemen Béla út 18.',
 8000,
 'Székesfehérvár'),

(47,
 'Raion Dojo Oroszlány',
 'Veled még jobb lesz a csapatunk.',
 'oroszlanyikarate@gmail.com',
 '+36-70-328-6989',
 'https://gyeresportolni.hu/egyesulet/reszletek/Raion_Dojo_Oroszlany',
 'https://gyeresportolni.hu/images/uploads/logok/thumbs/yvTB3vxNh6SkPzgabMsBGyWKr1GNyKN3.png',
 0.0, 0,
 'Bánki Donát u. 8. 2/3.',
 2840,
 'Oroszlány'),

(48,
 'Dinamik Harcművészeti Közhasznú Sportegyesület',
 'Célkitűzéseink: - A mozgás, ezen belül is a harcművészet megismertetése és megszerettetése minél több emberrel; - Pozitív gondolkodásra és önfegyelemre, önállóságra nevelés; - Mai világunkra oly jellemző stressz kezelése, azzal való bánásmód elsajátítása; - Az egyre jobban feledésbe merülő alapvető...',
 'info@dhkse.hu',
 '+36-20-955-8124',
 'https://gyeresportolni.hu/egyesulet/reszletek/Dinamik_Harcmuveszeti_Kozhasznu_Sportegyesulet_2',
 'https://gyeresportolni.hu/images/uploads/logok/thumbs/M_YuWraglxleOggKZYtUJihnnTgHv83g.jpg',
 0.0, 0,
 'Kölcsey Ferenc utca 23.',
 2060,
 'Bicske'),

(49,
 'Budoka - Siófok és Környéke Sport és Szabadidő Egyesület',
 'Harcművészeti egyesület Siófok városban.',
 'kaloczij@gmail.com',
 '+36-30-387-6444',
 'https://gyeresportolni.hu/egyesulet/reszletek/Budoka___Siofok_es_Kornyeke_Sport_es_Szabadido_Egyesulet_2',
 'https://gyeresportolni.hu/images/uploads/logok/thumbs/8I0y1ALgtoBZeXezOinkX4gG4FermuZX.jpg',
 0.0, 0,
 'Wesselényi M. u. 100.',
 8600,
 'Siófok'),

(50,
 'Mad Max Kempo Dojo',
 'Harcművészeti egyesület Bicske városban.',
 'postalada@madmaxdojo.hu',
 '+36-30-457-0367',
 'https://gyeresportolni.hu/egyesulet/reszletek/Mad_Max_Kempo_Dojo_2',
 'https://gyeresportolni.hu/images/uploads/logok/thumbs/uQTi_rTps8vg4jYpUe8lklwcpEysrINO.jpg',
 0.0, 0,
 'Május 1 út 38.',
 2060,
 'Bicske'),

(51,
 'Veszprémi Tollaslabda Egyesület',
 'A tollaslabda játékot életkortól és nemtől függetlenül mindenki űzheti. Csatlakozz hozzánk, ismerkedj meg a szabályokkal és játssz!',
 'veszprem.tollas@gmail.com',
 '+36-20-326-3202',
 'https://gyeresportolni.hu/egyesulet/reszletek/Veszpremi_Tollaslabda_Egyesulet_2',
 'https://gyeresportolni.hu/images/uploads/logok/thumbs/k0obwkmIsrgpK6YWPS00-5FD1838swCD.jpg',
 0.0, 0,
 'Wartha Vince utca 3.',
 8200,
 'Veszprém'),

(52,
 'EVSE Tollaslabda Szakosztály',
 'Tollaslabda egyesület Érd városban.',
 'erditollas@gmail.com',
 '+36-30-590-9291',
 'https://gyeresportolni.hu/egyesulet/reszletek/EVSE_Tollaslabda_Szakosztaly_2',
 '',
 0.0, 0,
 'Fácán köz 1.',
 2030,
 'Érd'),

(53,
 'Alba Bianca Tennis Club',
 '1994-ben alapítottam meg az Alba Bianca Tennis Clubot. A club tevékenységét egy 6 salakos teniszpályán végzi melyet bérel. A téli szakaszban 1 db sátorban dolgozik, melyet szintén bérel. A club 40 fős, kisgyermekekből álló. Tenisziskolával rendelkezik. Egész évben tenisztanfolyamokat tart, nyáron...',
 'albabiancatenisz@gmail.com',
 '+36-20-942-0932',
 'https://gyeresportolni.hu/egyesulet/reszletek/Alba_Binca_Tennis_Club_2',
 '',
 0.0, 0,
 'Püspökkertváros 13.',
 8000,
 'Székesfehérvár'),

(54,
 'Agárdi Tenisz Club',
 'Ha kikapcsolódásra vágysz, ha sportolni szeretnél, ha a játék öröme vonz, akkor gyere hozzánk teniszezni.',
 'info@agarditc.hu',
 '+36-20-281-6556',
 'https://gyeresportolni.hu/egyesulet/reszletek/Agardi_Tenisz_Club_2',
 'https://gyeresportolni.hu/images/uploads/logok/thumbs/Iu8BdmbH42AFkT16TE9rQFEGRGc8aeLD.jpg',
 0.0, 0,
 'Meggyfasor 1.',
 2481,
 'Velence'),

(55,
 'Balatonalmádi Tenisz Klub',
 'Tenisz egyesület Balatonalmádi városban.',
 'almaditenisz@gmail.com',
 '+36-20-483-8780',
 'https://gyeresportolni.hu/egyesulet/reszletek/Balatonalmadi_Tenisz_Klub_2',
 'https://gyeresportolni.hu/images/uploads/kepek/thumbs/ab7fcadd54cf29c6158e00ca1074a41f.jpg',
 0.0, 0,
 'Rákóczi u. 16.',
 8220,
 'Balatonalmádi'),

(56,
 'Siófoki Tenisz Klub',
 'Magas színvonalú és nemzetközi szintű versenykövetelményeknek is eleget tevő pályáinkat olyan szolgáltatásokkal bővítettük ki, amelyek még nagyobb élménnyé tehetik a sportolást a tenisz szerelmesei számára itt, Siófokon. A zöld környezetben, magas fák és virágok között eltöltött edzés után igénybe...',
 'info@skctennis.hu',
 '+36-30-491-4634',
 'https://gyeresportolni.hu/egyesulet/reszletek/Siofoki_Tenisz_Klub_2',
 '',
 0.0, 0,
 'Déli út 2.',
 8600,
 'Siófok'),

(57,
 'Siófoki Asztalitenisz Klub',
 'Asztalitenisz egyesület Siófok városban.',
 'asztalitenisz@siofoki-asztalitenisz.hu',
 '+36-30-632-1641',
 'https://gyeresportolni.hu/egyesulet/reszletek/Siofoki_Asztalitenisz_Klub_2',
 '',
 0.0, 0,
 'Újpiac tér 6.',
 8600,
 'Siófok'),

(58,
 'Dunaújvárosi Egyetem Diák Sportegyesület',
 'Asztalitenisz egyesület Dunaújváros városban.',
 'varga.richard@dstv.hu',
 '+36-25-551-130',
 'http://www.duedse.hu/index.php?p=pingpong',
 'http://www.duedse.hu/images/duedse_logo.jpg',
 0.0, 0,
 'Táncsics M. u. 1/a',
 2400,
 'Dunaújváros'),

(59,
 'Dunaújvárosi Asztalitenisz Sportegyesület',
 'dunaújvárosi Móricz Iskolában minden héten kedden, szerdán és pénteken du. 16 órától az utánpótlás, 17.30-tól pedig a felnőttek püfölik a labdát most már akár 10 asztalon is. Hétvégén különböző versenyeken és az alábbi bajnokságokban küzdünk. Első csapatunk a DASE I. az NB II. Dél-Nyugati...',
 'dunadase@gmail.com',
 '+36-30-217-2476',
 'https://gyeresportolni.hu/egyesulet/reszletek/dunaujvarosi-asztalitenisz-sportegyesulet',
 'https://gyeresportolni.hu/images/uploads/logok/thumbs/oSOofzeDCPh6IQ-0n-7dEHA1EC08w_Aw.png',
 0.0, 0,
 'Vasmű út 29. I. 1.',
 2400,
 'Dunaújváros'),

(60,
 'Budaörsi Sport Club Asztalitenisz Szakosztály',
 'A Budaörsi Sport Club Asztalitenisz Szakosztályában jelenleg több, mint százan sportolunk. Csapataink: Női Extra Liga Férfi NB1 Férfi NB2 Felnőtt csapatainkon kívül egyre több gyerek sportol nálunk. Fő feladatunk és célunk sportágunk népszerűsítése Budaörsön, és a Város valamint egyesületünk...',
 'szvitan.krisztina@budaorsisc.hu',
 '+36-20-317-5541',
 'https://gyeresportolni.hu/egyesulet/reszletek/Budaorsi_Sport_Club_Asztalitenisz_Szakosztaly_2',
 'https://gyeresportolni.hu/images/uploads/logok/thumbs/YXOkRvS2c5EDKTLEM_nlho9W9_nmUptl.jpg',
 0.0, 0,
 'Hársfa u. 6.',
 2040,
 'Budaörs'),

(61,
 'Dunaharaszti Asztalitenisz Szakosztály',
 'A szakosztály I. csapata a Pest Megye I. osztályban, a II. csapat a Pest Megye I/B osztályban játszik 2012. év óta. 2014 szeptemberétől újra megindult az utánpótlás felkészítése Váradi György szakosztályvezető, Takács László vezetőedző vezetésével. A csoportok a Hunyadi és a II. Rákóczi Általános...',
 'asztalitenisz@dmtk-sport.hu',
 '+36-30-825-4271',
 'https://gyeresportolni.hu/egyesulet/reszletek/Dunaharaszti_Asztalitenisz_Szakosztaly_2',
 'https://gyeresportolni.hu/images/uploads/logok/thumbs/_EMZQPJvSHRj6mlvxjP9AVtCGy6z2Qqf.jpg',
 0.0, 0,
 'Rákóczi út 28.',
 2330,
 'Dunaharaszti'),

(62,
 'Ifj. Ocskay Gábor Jégkorong Akadémia',
 'Az Ifj. Ocskay Gábor Jégkorong Akadémia hivatalos honlapja.',
 'tekihoki@jegkorongakademia.hu',
 '+36-70-336-3596',
 'https://www.jegkorongakademia.hu/',
 'https://www.jegkorongakademia.hu/assets/images/logo.png',
 0.0, 0,
 'Raktár utca 1.',
 8000,
 'Székesfehérvár'),

(63,
 'ANGELS Női Jégkorong Sportegyesület',
 'Jégkorong egyesület Dunaújváros városban.',
 'informacio@angyalok.hu',
 '+36-20-586-3605',
 'https://gyeresportolni.hu/egyesulet/reszletek/ANGELS_Noi_Jegkorong_Sportegyesulet_2',
 'https://gyeresportolni.hu/images/uploads/logok/thumbs/v9lRYl85Q2CkfK31xOsthS6xOIl8Jwfz.jpg',
 0.0, 0,
 'Váci Mihály út 4.3/4.',
 2400,
 'Dunaújváros'),

(64,
 'Szigeti Bikák Sport Egyesület utánpótlás csapata',
 'Jégkorong egyesület Szigetszentmiklós városban.',
 'bela.droppa@gmail.com',
 '+36-20-958-8394',
 'https://gyeresportolni.hu/egyesulet/reszletek/Szigeti_Bikak_Sport_Egyesulet_utanpotlas_csapata_2',
 'https://gyeresportolni.hu/images/uploads/logok/thumbs/85JJswB6VRLutkI21K41NhHjyb81JvUt.jpg',
 0.0, 0,
 'Csépi út 15/a',
 2310,
 'Szigetszentmiklós'),

(65,
 'Veszprémi Egyetemi SC',
 'A Veszprémi Egyetemi Sport Club (VESC) weboldala.',
 'info@vesc.hu',
 '+36-88-624-017',
 'https://vesc.hu/',
 'https://vesc.hu/images/logo.png',
 0.0, 0,
 'Egyetem utca 10.',
 8200,
 'Veszprém'),

(66,
 'TTC Gerevich Aladár Vívószakosztály',
 'Törökbálinton és környékén élő fiatalok számára közelebb hozni a vívás oktatását, lehetőséget kínálva legeredményesebb olimpiai sportágunk megismerésére. Hosszútávon szeretnénk egy regionális központot kialakítani, ahol a gyerekek oktatása mellett, beindítanánk szabadidős sportolási lehetőségként...',
 'ttc.vivas@gmail.com',
 '+36-30-951-2446',
 'https://gyeresportolni.hu/egyesulet/reszletek/TTC_Gerevich_Aladar_Vivoszakosztaly_2',
 'https://gyeresportolni.hu/images/uploads/logok/thumbs/k3M2WC0mxcVauCP0BPLfaSlRe3DW0DV2.jpg',
 0.0, 0,
 'Óvoda utca 6.',
 2045,
 'Törökbálint'),

(67,
 'Százhalombatta Város Ifjúsági SE',
 'Judo egyesület Százhalombatta városban.',
 'sarisz@windowslive.com',
 '+36-20-523-9486',
 'https://szazhalombattajudo.freewb.hu/',
 '',
 0.0, 0,
 'Ifjúság útja 7.',
 2440,
 'Százhalombatta'),

(68,
 'Veszprém Judo',
 'Judo egyesület Veszprém városban.',
 'info@veszpremjudo.hu',
 '+36-20-243-5754',
 'https://gyeresportolni.hu/egyesulet/reszletek/Veszprem_Judo_2',
 'https://gyeresportolni.hu/images/uploads/kepek/thumbs/c1824a2a4872dc22e894b70392cd24f9.jpg',
 0.0, 0,
 'Malomkő utca 5.',
 8200,
 'Veszprém'),

(69,
 'Benta Judo',
 'Judo egyesület Érd városban.',
 'krauszjanos@bentajudo.hu',
 '+36-20-965-2242',
 'https://gyeresportolni.hu/egyesulet/reszletek/Benta_Judo_2',
 '',
 0.0, 0,
 'Titkár u. 14.',
 2030,
 'Érd'),

(70,
 'Ronin Judo Közhasznú Alapítvány Balatonfüred',
 'Judo egyesület Balatonfüred városban.',
 'judoalapitvany@gmail.com',
 '+36-70-611-9756',
 'https://gyeresportolni.hu/egyesulet/reszletek/Ronin_Judo_Kozhasznu_Alapitvany_Balatonfured__2',
 'https://gyeresportolni.hu/images/uploads/kepek/thumbs/78a5dd854326721583389c8e3926fd5e.jpg',
 0.0, 0,
 'Kossuth u 3.',
 8230,
 'Balatonfüred'),

(71,
 'Alba Control Karate Egyesület',
 'Tradicionális Shotokan Karate-Do Székesfehérváron gyerekeknek és felnőtteknek egyaránt! Egy erőszakmentes mozgásművészet, amely megtanít az önismeretre; segít az önbizalom megerősödésében; kialakítja a test- és lélek harmóniáját; fejleszti az egészséges személyiséget; felkészít a hatékony...',
 'janosszarvas123@gmail.com',
 '+36-70-776-3604',
 'https://gyeresportolni.hu/egyesulet/reszletek/Alba_Control_Karate_Egyesulet_2',
 'https://gyeresportolni.hu/images/uploads/logok/thumbs/P_aRbFhj7VO3Da_r-6kz-WfpEhK01IVm.jpg',
 0.0, 0,
 'Deák F. u. 37. 9/1.',
 8000,
 'Székesfehérvár'),

(72,
 'Dunaharaszti Goju-Ryu Karate Sportegyesület',
 'A Dunaharaszti Goju-Ryu Karate Sportegyesület 2001. őszén kezdte el tevékenységét, a II. Rákóczi Ferenc Általános Iskolában. Kezdetben a Magyarországi Goju-Ryu Karate-Do Szövetség klubjaként működtünk, majd 2006-ban lettünk hivatalosan is bejegyzett társadalmi szervezet. Szervezetünk alapvetően a...',
 'valkaimarta@dhgoju.hu',
 '+36-30-242-5489',
 'https://gyeresportolni.hu/egyesulet/reszletek/Dunahararaszti_Goju_Ryu_Karate_Sportegyesulet_2',
 'https://gyeresportolni.hu/images/uploads/logok/thumbs/sHU_sADpasRJST4A39v40XiYnbJ0JwaO.JPG',
 0.0, 0,
 'Rónai György utca 112.',
 2330,
 'Dunaharaszti'),

(73,
 'Kisdunamenti Ashihara Karate és Szabadidős Sport Egyesület',
 'Egyesületünk minőségi, modern küzdősport oktatással foglalkozik. Komplex képzés: ütések, rúgások, védekezések, fogások, kitérése, földrevitelek, önvédelem gyermekeknek és felnőtteknek egyaránt.',
 'csurkamaria@gmail.com',
 '+36-70-942-3550',
 'https://gyeresportolni.hu/egyesulet/reszletek/Kisdunamenti_Ashihara_Karate_es_Szabadidos_Sport_Egyesulet_2',
 'https://gyeresportolni.hu/images/uploads/logok/thumbs/9j9DtRvi4ykbSTky3V4QweawOQ2VqCk6.jpg',
 0.0, 0,
 'Arany János u. 38.',
 2330,
 'Dunaharaszti'),

(74,
 'Tököli Birkózó Sportegyesület',
 'Küzdősport egyesület Tököl városban.',
 'ivancsicsgeza@gmail.com',
 '+36-20-489-8195',
 'https://gyeresportolni.hu/egyesulet/reszletek/Tokoli_Birkozo_Sportegyesulet_2',
 'https://gyeresportolni.hu/images/uploads/logok/thumbs/Vba-3opOqzbDipzfzkxJXeVrZt6Ylkbc.png',
 0.0, 0,
 'Aradi u. 56.',
 2316,
 'Tököl'),

(75,
 'Budaörsi Integrált Küzdősport Központ',
 'Központunkban mindenki megtalálhatja a neki megfelelő edzést. Korcsoportos bontásban foglalkozunk óvodásokkal, iskolásokkal és felnőttekkel. Célunk, hogy a jiu jitsun keresztül fejlesszük a tagjaink önbizalmát és életminőségét. A Budaörsi Integrált Küzdősport Központ vezető edzője Szekeres Ákos....',
 'szekeres.akos.zoltan@gmail.com',
 '+36-70-344-7434',
 'https://gyeresportolni.hu/egyesulet/reszletek/Budorsi_Integralt_Kuzdosport_Kozpont_2',
 'https://gyeresportolni.hu/images/uploads/logok/thumbs/woZGW7juZgdjH0i_Vc24gTZ3ZIBxqoBq.png',
 0.0, 0,
 'Károly király u. 145.',
 2040,
 'Budaörs'),

(76,
 'Dunaharaszti Munkás Testedző Kör',
 'Rólunk - A Dunaharaszti MTK rövid története',
 'iroda@dmtk.hu',
 '+36-30-364-4229',
 'https://dmtk.hu/',
 'https://dmtk.hu/templates/rt_reiko/custom/images/logo/DMTK-logo_1.png',
 0.0, 0,
 'Fő út 152.',
 2330,
 'Dunaharaszti'),

(77,
 'Dorogi Nehézatlétikai Club',
 'Küzdősport egyesület Dorog városban.',
 'dorogibirkozas@gmail.hu',
 '+36-70-332-2905',
 'https://gyeresportolni.hu/egyesulet/reszletek/Dorogi_Nehezatletikai_Club_2',
 'https://gyeresportolni.hu/images/uploads/logok/thumbs/c9fbhxOq9Dc9sH8RkbdMxwB1gaOgcv5l.jpg',
 0.0, 0,
 'Bécsi út 34.',
 2510,
 'Dorog'),

(78,
 'Budaörsi Box Club',
 'Ökölvívó egyesület Budaörs városban.',
 'budaorsiboxclub@gmail.com',
 '+36-70-882-7483',
 'https://gyeresportolni.hu/egyesulet/reszletek/Budaorsi_Box_Club_2',
 'https://gyeresportolni.hu/images/uploads/logok/thumbs/joeR2MOJNjUtSnKnuUtdO6e9As956D0u.jpg',
 0.0, 0,
 'Építők útja 2-4.C ép',
 2040,
 'Budaörs'),

(79,
 'Budaörsi Kick-Box SE',
 'Kick-box egyesület Budaörs városban.',
 'katonabarnabas@gmail.com',
 '+36-30-411-4608',
 'https://gyeresportolni.hu/egyesulet/reszletek/Budaorsi_Kick_Box_SE_2',
 'https://gyeresportolni.hu/images/uploads/logok/thumbs/DspOqigaGKgyFEEjbU-eZvCbtcX02eAG.jpg',
 0.0, 0,
 'Lévai u. 33.',
 2040,
 'Budaörs'),

(80,
 'Trampolin Sportegyesület/Lizards Floorball Team',
 '2007 novemberében megalakult floorball szakosztályunk... A floorball csapat tudása olyan szintre emelkedett, hogy a gyerekek, a szülők és természetesen az edzők közös elhatározásával benevezünk a 2009/2010-es a korosztályos országos bajnokságba ... ... a kemény és kitartó edzésmunkának köszönhetően...',
 'kojasi@trampolin.hu',
 '+36-70-459-4338',
 'https://gyeresportolni.hu/egyesulet/reszletek/Trampolin_SportegyesuletLizards_Floorball_Team_2',
 'https://gyeresportolni.hu/images/uploads/kepek/thumbs/d1a37c62eb0f661a84215b1aa080f211.jpg',
 0.0, 0,
 'Nyerges utca Fsz. 4.',
 8200,
 'Veszprém'),

(81,
 'Dunai Krokodilok SE',
 'Floorball egyesület Érd városban.',
 'floorball@krokodilok.hu',
 '+36-30-317-0298',
 'https://gyeresportolni.hu/egyesulet/reszletek/Dunai_Krokodilok_SE_2',
 'https://gyeresportolni.hu/images/uploads/logok/thumbs/-ZjK-UtxLwpfAMTNtIfesax3VSZzYps0.png',
 0.0, 0,
 'Szarkaláb u. 18.',
 2030,
 'Érd'),

(82,
 'Szigeti Rókák Sportegyesület',
 'Vállalt célunk hogy fiatalok és minden más korosztálynak bemutatni a mozgás fontosságát. Floorball és a Hockey sportokon keresztül. Szeretnénk lehetőséget adni olyan embereknek is akik valamilyen testi vagy szellemi korlátokkal rendelkeznek.',
 'sandorcsaba63@gmail.com',
 '+36-30-366-8358',
 'https://gyeresportolni.hu/egyesulet/reszletek/Szigeti_Rokak_Sportegyesulet_2',
 'https://gyeresportolni.hu/images/uploads/logok/thumbs/5NaRU6awA-AB-SAQwKNsHrZFYytmAb6y.JPG',
 0.0, 0,
 'Vagány u. 16.',
 2310,
 'Szigetszentmiklós'),

(83,
 'Dunafém-Maroshegy SE',
 'Székesfehérvár egyik patinás egyesületeként 1951. óta a székesfehérvári Ikarus gyár támogatásával vettünk részt a város sportéletében. Mint általában az egyesületek életében a rendszerváltozás minket is komolyan érintett. A gazdasági nehézségeket egyedül a labdarúgó szakosztály élte túl....',
 'mesics.janos@freemail.hu',
 '+36-20-380-4795',
 'https://gyeresportolni.hu/egyesulet/reszletek/Dunafem_Maroshegy_SE_2',
 'https://gyeresportolni.hu/images/uploads/logok/thumbs/1P_BEsYGKkd33uguhnuKMd23QjkqjPIE.jpg',
 0.0, 0,
 'Csíkvári u. 10.',
 8000,
 'Székesfehérvár'),

(84,
 'Főnix Gold Fc.',
 'Kedves Érdeklődő, egyesületünknél már 5 éves kortól várunk minden labdarúgást szerető gyermeket. A honlapunkon az "edzések" menüpontra kattintva megtudhatod a korosztályok edzésidőpontjait és szükség esetén az edzők nevét és elérhetőségét. Beiratkozás előtt kötetlenül vegyél részt nálunk néhány...',
 'info@fonixgoldfc.hu',
 '+36-30-304-2277',
 'https://gyeresportolni.hu/egyesulet/reszletek/Fonix_Gold_Fc_2',
 'https://gyeresportolni.hu/images/uploads/logok/thumbs/sMoOcn3avbQIht5l7JAI4Gwk4T1HB0lY.jpg',
 0.0, 0,
 'Gombócleső u',
 8000,
 'Székesfehérvár'),

(85,
 'Fehérvárcsurgói Sportegyesület',
 'A változatos éveket követően a Fehérvárcsurgói Sportegyesület labdarúgócsapata 2009-ben megnyerte az FMLSZ Megyei III. osztályú bajnokságának közép csoportját és jelenleg a megyei II. osztályban szerepel. Folyamatosan dolgozunk a felnőtt keret és az utánpótlás bázis erősítésén, a megfelelő...',
 'fehervarcsurgose@gmail.com',
 '+36-30-947-0848',
 'https://gyeresportolni.hu/egyesulet/reszletek/Fehervarcsurgoi_Sportegyesulet_2',
 'https://gyeresportolni.hu/images/uploads/logok/thumbs/LfO66k22TzCREk8SIkruILU8RR2aAZE1.png',
 0.0, 0,
 'Dózsa György utca 35.',
 8052,
 'Fehérvárcsurgó'),

(86,
 'Várpalotai Bányász Sportkör Labdarúgó Szakosztály',
 'Labdarúgó egyesület Várpalota városban.',
 'vbsklsz@gmail.com',
 '+36-20-967-2330',
 'https://gyeresportolni.hu/egyesulet/reszletek/varpalotai-banyasz-sportkor-labdarugo-szakosztaly',
 'https://gyeresportolni.hu/images/uploads/logok/thumbs/8avOuPbdKFjMbap5pYPtHmWQqXQmBqKu.jpg',
 0.0, 0,
 'Fehérvári út 9.',
 8100,
 'Várpalota'),

(87,
 'Dávid Kornél Kosárlabda Akadémia',
 'Kosárlabda egyesület Székesfehérvár városban.',
 'sandor.farkas56@gmail.com',
 '+36-20-993-6090',
 'https://gyeresportolni.hu/egyesulet/reszletek/David_Kornel_Kosarlabda_Akademia_2',
 'https://gyeresportolni.hu/images/uploads/logok/thumbs/BlLGc4S6utgg5E-nUytjWKtDQPMSwx7c.png',
 0.0, 0,
 'Gáz u. 19.',
 8000,
 'Székesfehérvár'),

(88,
 'Oroszlányi Sportegylet',
 'Az OSE Lions az ország egyik meghatározó kosárlabda egyesülete, amely Oroszlányban működik, és jelenleg több, mint 300 gyermek kosárlabdaképzését és versenyeztetését biztosítja. Az ovikosártól a legkülönbözőbb gyermek korosztályokig, a felnőtt NBI/B-s csapattal bezárólag országos bajnokságokban,...',
 'oseiroda@gmail.com',
 '+36-70-941-1502',
 'https://gyeresportolni.hu/egyesulet/reszletek/Oroszlanyi_Sportegylet_2',
 'https://gyeresportolni.hu/images/uploads/logok/thumbs/hBVhKvsdpP54P4vspjmxGHHa-5bXcoZf.jpg',
 0.0, 0,
 'Fő tér 2.',
 2840,
 'Oroszlány'),

(89,
 'Battai Villámok',
 'Százhalombattai Kosárlabda Sportegyesület Battai Villámok utánpótlás csapata',
 'battai.villamok@villamok.hu',
 '+36-20-466-5611',
 'https://gyeresportolni.hu/egyesulet/reszletek/Battai_Villamok_2',
 'https://gyeresportolni.hu/images/uploads/logok/thumbs/k-lZZTw3KhiRKMpWsYYv_an7BiswLq_e.jpg',
 0.0, 0,
 'Hága László u. 7.',
 2440,
 'Százhalombatta'),

(90,
 'Veszprémi Utánpótlás Kosárlabda Egyesület',
 'Kedves kosárlabdázni vágyó Fiatal Úr! Amennyiben szeretnéd közelebbről megismerni a kosárlabda sport szépségét, szeretnél tagja lenni egy sikeres utánpótlás csapatnak, bajnokságban, versenyeken részt venni, vagy csak szeretnél egyszerűen mozogni jelentkezz bátran! Nincs más dolgod, mint az alábbi...',
 'info@veszpremiuke.hu',
 '+36-20-226-2214',
 'https://gyeresportolni.hu/egyesulet/reszletek/Veszpremi_Utanpotlas_Kosarlabda_Egyesulet_2',
 'https://gyeresportolni.hu/images/uploads/logok/thumbs/_op_lI9PDlMNsiLt1d7_7FteP1r9guYa.jpg',
 0.0, 0,
 'Füredi u. 12.',
 8200,
 'Veszprém'),

(91,
 'Alba Fehérvár KC',
 'Kézilabda egyesület Székesfehérvár városban.',
 'titkarsag@kofemsc.hu',
 '+36-22-427-401',
 'https://www.albakezi.hu/',
 'https://www.albakezi.hu/_user/logo/type_2/1382430524.jpg',
 0.0, 0,
 'Verseci u. 1-15.',
 8000,
 'Székesfehérvár'),

(92,
 'Gárdony-Pázmánd NKK',
 'Kézilabda egyesület Pázmánd városban.',
 'gabor.domak.eva@gmail.com',
 '+36-30-389-8043',
 'https://pazmandnkse.hu/',
 '',
 0.0, 0,
 'Vadász utca 14.',
 2476,
 'Pázmánd'),

(93,
 'Éles József Kézilabda Iskola',
 'Az Éles Kézisuli megalapításával egy olyan álmom valósult meg melynek célja, hogy az utánpótlás-nevelésben kamatoztassam a kézilabda sportágban szerzett tapasztalataimat, lehetőséget biztosítva a Veszprém és környéke fiataljainak a testmozgásra, illetve arra, hogy ha tehetségesek már kiskorban a...',
 'eleskezisuli@gmail.com',
 '+36-30-331-7133',
 'https://gyeresportolni.hu/egyesulet/reszletek/Eles_Jozsef_Kezilabda_Iskola_2',
 'https://gyeresportolni.hu/images/uploads/logok/thumbs/wrUroP_C963SbGYlxi9EnEpwZCHZOX7j.jpg',
 0.0, 0,
 'Kisberényi út 63.',
 8220,
 'Balatonalmádi'),

(94,
 'Veszprém Handball Team Zrt.',
 'Kézilabda egyesület Veszprém városban.',
 'office@handballveszprem.hu',
 '+36-88-688-504',
 'https://handballveszprem.hu/hu',
 'https://handballveszprem.hu/images/50LOGO.png',
 0.0, 0,
 'Külső-Kádártai út 5.',
 8200,
 'Veszprém'),

(95,
 'Delta Röplabda Sportegyesület',
 'Szeretettel várunk minden olyan Érd és környékén élő fiatal sportbarátot, aki szeret röplabdázni, és szívesen csatlakozna egy jó társasághoz! Az edzéseket Dömötör-Mátrai Beáta, korábbi magyar válogatott röplabdázó tartja.',
 'deltarse01@gmail.com',
 '+36-20-610-6610',
 'https://gyeresportolni.hu/egyesulet/reszletek/Delta_Roplabda_Sportegyesulet_2',
 'https://gyeresportolni.hu/images/uploads/logok/thumbs/KFVlSoWjfGxyNFPFxdEGn6IqRTtH90hF.jpg',
 0.0, 0,
 'Canko utca 27.',
 2030,
 'Érd'),

(96,
 'Szent Benedek - Balatonfüred Röplabda Akadémia',
 'A SZENT BENEDEK - BALATONFÜRED RÖPLABDA AKADÉMIA 2015-BEN ALAKULT. Azzal a szándékkal hoztuk létre a Röplabda Akadémiát, hogy a Nyugat-Magyarországon röplabdázó női utánpótlás korú játékosokat egy magas színvonalú utánpótlás nevelő klubba tudjuk integrálni amellett, hogy a felnőtt csapatunk...',
 'szbbra@gmail.com',
 '+36-20-245-4265',
 'https://gyeresportolni.hu/egyesulet/reszletek/Szent_Benedek___Balatonfured_Roplabda_Akademia_2',
 'https://gyeresportolni.hu/images/uploads/logok/thumbs/DKKFexzmmlhaoF1ZQwSpzT__JGcX5APD.jpg',
 0.0, 0,
 'Szent István tér 1.',
 8230,
 'Balatonfüred'),

(97,
 'Tatabánya Mustangs Ifjúsági Amerikai Futball Csapat',
 'Amerikai futball egyesület Tatabánya városban.',
 'tamas.molnar@tatabanyamustangs.hu',
 '+36-30-361-0602',
 'https://gyeresportolni.hu/egyesulet/reszletek/Tatabanya_Mustangs_Ifjusagi_Amerikai_Futball_Csapat_2',
 'https://gyeresportolni.hu/images/uploads/logok/thumbs/M83ZSXLvEWJxCCyPeoOfR5DAWQQN6ayy.jpg',
 0.0, 0,
 'Köztársaság u',
 2800,
 'Tatabánya'),

(98,
 'Dunaújváros Gorillaz',
 'Csapatunk 2007-ben alakult, 2009-ben megnyertük a Divízió II. küzdelmeit, 2012-ben pedig a Divízió I. kupáját hódítottuk el. 2013-ban újabb döntőt játszottunk, ezüstéremmel zárult a szezon. Folyamatosan képezzük a junior és felnőtt játékosokat, ha szeretnéd kipróbálni ezt a rendkívül izgalmas és...',
 'dunaujvaros.gorillaz@gmail.com',
 '+36-20-333-7388',
 'https://gyeresportolni.hu/egyesulet/reszletek/Dunaujvaros_Gorillaz_2',
 'https://gyeresportolni.hu/images/uploads/logok/thumbs/9cIg9RvnzmTz1tEWLtAInisMo2Cjpm0B.jpg',
 0.0, 0,
 'Temető utca 30.',
 2400,
 'Dunaújváros'),

(99,
 'Örökmozgó Sportegyesület',
 'Úszó egyesület Iváncsa városban.',
 'kardanita@citromail.hu',
 '+36-20-468-0405',
 'http://www.ivancsa.hu/gyors-linkek/sport/orokmozgo-sportegyesulet/',
 'http://www.ivancsa.hu/wp-content/uploads/2020/01/IVANCSA-LOGO-WEB.png',
 0.0, 0,
 'Fő utca 61/b',
 2454,
 'Iváncsa'),

(100,
 'SwimmingERD',
 'A sport, ezen belül is az úszás jelentősége egyre meghatározóbb a cseperedő gyerekek életében. Az úszás alapsportág, amit már egészen pici gyermekkortól 120 éves korig sérülésmentesen "űzhetünk". Bizonyítottan sokkal magasabb a rendszeresen úszó gyerekek monotónia tűrő képessége, önfegyelme,...',
 'erdiuszo@gmail.com',
 '+36-20-221-5502',
 'https://gyeresportolni.hu/egyesulet/reszletek/SwimmingERD_2',
 'https://gyeresportolni.hu/images/uploads/logok/thumbs/seUx3jHohtq7Hvpox2rHj7Q908UbcvS6.png',
 0.0, 0,
 'Budai út 7/A II. emelet 15.',
 2030,
 'Érd'),

(101,
 'Zubor Úszósuli - Első Tököli Úszóegylet',
 'Az Első Tököli Diák Úszóegylet 2011. januárjában alakult. Elnöke Zubor Attila, aki többek között ifjúsági Európa-bajnok, magyar bajnok, olimpiai 5. helyezett (4x100 m vegyesváltó, 2000), kétszeres világbajnoki 3., valamint Európa-bajnoki 2. és 3. helyezett élsportoló. Az egyesület céljai közé...',
 'tokoli.uszoegylet@gmail.com',
 '+36-20-953-0686',
 'https://gyeresportolni.hu/egyesulet/reszletek/Zubor_Uszosuli___Elso_Tokoli_Uszoegylet_2',
 'https://gyeresportolni.hu/images/uploads/logok/thumbs/t4b2Eu5TaA3YRFCJHQNt90GkdTgPRBea.jpg',
 0.0, 0,
 'Kisfaludy utca 12.',
 2316,
 'Tököl'),

(102,
 'Balaton Vízilabda Klub',
 'úszás, vízilabda oktatás 3 éves kortól info: Kerekes Csongor +36307575850',
 'kerekes.csongor@balatonvizilabda.hu',
 '+36-30-757-5850',
 'https://gyeresportolni.hu/egyesulet/reszletek/Balaton_Vizilabda_Klub_2',
 'https://gyeresportolni.hu/images/uploads/logok/thumbs/-qrN13jvWvG5msmawJKDOeb_CKO8pb6_.jpg',
 0.0, 0,
 'Sorház u. 1/4.',
 8184,
 'Balatonfűzfő'),

(103,
 'Tatabányai Vízmű Sportegyesület',
 'Céljaink: - a tatabányai vízilabda utánpótlásának és felnőtt csapatának megreformálása és fejlesztése - a hazai nevelésű játékosokkal felálló gárda újra méltó helyre kerüljön a város sportéletében és a magyar vízilabdában - utánpótlásunk versenyeztetése az országos bajnokságokban , amely...',
 'tvseiroda@gmail.com',
 '+36-20-285-6830',
 'https://gyeresportolni.hu/egyesulet/reszletek/Tatabanyai_Vizmu_Sportegyesulet_2',
 'https://gyeresportolni.hu/images/uploads/logok/thumbs/I5Qwls0ZxRtu2i4AcWGYZnp2i0JkR8ne.jpg',
 0.0, 0,
 'Cseri utca 30.',
 2800,
 'Tatabánya'),

(104,
 'Dunaújvárosi Főiskola Vízilabda Egyesület',
 'Vízilabda egyesület Dunaújváros városban.',
 'dfvemedia@gmail.com',
 '+36-30-277-8833',
 'https://dfve.eu/',
 -- the club's logo.svg is white (invisible on the white logo box), so this is the site icon from dfve.eu
 'https://dfve.eu/wp-content/uploads/2023/03/cropped-logo512-2.png',
 0.0, 0,
 'Táncsics Mihály út 1/A',
 2400,
 'Dunaújváros'),

(105,
 'Oxigén Úszó-és Sportsuli',
 'Úszó egyesület Pilisvörösvár városban.',
 'brucknerrita@gmail.com',
 '+36-30-636-4385',
 'https://www.oxigenuszosuli.hu/',
 'https://www.oxigenuszosuli.hu/assets/img/kezdolap/logo.png',
 0.0, 0,
 'Iskola utca 19.',
 2085,
 'Pilisvörösvár'),

(106,
 'Gulipánia alkotó műhely',
 'Alkotó műhely Veszprémben: kerámia szakkör és workshopok, festés, kötetlen alkotás felnőtteknek és gyerekeknek.',
 'orsirethy@gmail.com',
 '+36-20-544-1118',
 'https://www.gulipandesign.com',
 '',
 0.0, 0,
 'Brusznyai Árpád u. 18-20.',
 8200,
 'Veszprém'),

(107,
 'Vox Mirabilis Kamarakórus',
 'Székesfehérvári kamarakórus rendszeres próbákkal és koncertévaddal.',
 'voxmirabilis@gmail.com',
 '+36-22-326-297',
 'https://voxmirabilis.hu',
 '',
 0.0, 0,
 'Zsolt u. 30.',
 8000,
 'Székesfehérvár'),

(108,
 'AL-BA Cook Főzőiskola',
 'Főzőiskola 2018 óta: főzőtanfolyamok, gyerek főzőklub, csapatépítő és privát főzések.',
 'albacookfozoiskola@gmail.com',
 '+36-30-220-5547',
 'https://fozzvelunk.hu',
 '',
 0.0, 0,
 'Széchenyi u. 122.',
 8000,
 'Székesfehérvár'),

(109,
 'Érdi VSE',
 'Elsődleges célunk az utánpótlás újjá szervezése és felépítése, minden korosztályban.',
 'iroda.erdivse@gmail.com',
 '+36-20-295-6534',
 'https://gyeresportolni.hu/egyesulet/reszletek/Erdi_VSE_2',
 'https://gyeresportolni.hu/images/uploads/logok/thumbs/hokGzd-AvpuroxNoT2iWO7DidGzUsDxP.jpg',
 0.0, 0,
 'Ercsi út 34.',
 2030,
 'Érd'),

(110,
 'Rácalmás Sportegyesület',
 'Reméljük honlapunk jó eszköz arra, hogy a RÁCALMÁS SPORTEGYESÜLET-ről az érdeklődők mindent megtudjanak amire kíváncsiak.',
 'info@racalmas-se.hu',
 '+36-25-517-850',
 'https://racalmas-se.hu/?option=com_content&view=article&id=26&Itemid=138',
 'https://racalmas-se.hu/wp-content/uploads/2020/05/rse-logo.png',
 0.0, 0,
 'Szigetfő u. 11-13.',
 2459,
 'Rácalmás'),

(111,
 'Székesfehérvári Kertbarát Egyesület',
 'Kertbarát egyesület Székesfehérvár városban.',
 'oazisviragbolt@oazisvirag.hu',
 '+36-22-398-570',
 'https://oazisvirag.hu/kertbarat-egyesulet',
 'https://oazisvirag.hu/images/apple-touch-icon.png',
 0.0, 0,
 'Palotai út 133.',
 8000,
 'Székesfehérvár');


-- ============================================================
-- CATEGORIES
-- ============================================================
-- Fő kategóriák (parentId = NULL): Szabadtér (1), Mozgás (2),
-- Kreativitás (3), Közösség (4) - a weboldal kártyáinak megfelelően.
-- Alkategóriák: Székesfehérvár 50 km-es körében aktív hobbik.

INSERT INTO categories
(categoryId, name, parentId)
VALUES
-- Fő kategóriák
(1, 'Szabadtér', NULL),
(2, 'Mozgás', NULL),
(3, 'Kreativitás', NULL),
(4, 'Közösség', NULL),

-- Szabadtér
(5, 'Túrázás', 1),
(6, 'Futás', 1),
(7, 'Kerékpározás', 1),
(8, 'Mászás', 1),
(9, 'Kajak-kenu', 1),
(10, 'Evezés', 1),
(11, 'Vitorlázás', 1),
(12, 'SUP', 1),
(13, 'Horgászat', 1),
(14, 'Lovaglás', 1),

-- Mozgás
(15, 'Fitness', 2),
(16, 'Jóga', 2),
(17, 'Pilates', 2),
(18, 'Tánc', 2),
(19, 'Atlétika', 2),
(20, 'Harcművészet', 2),
(21, 'Labdajátékok', 2),
(22, 'Vízisport', 2),
(23, 'Tenisz', 2),
(24, 'Asztalitenisz', 2),
(25, 'Jégkorong', 2),
(26, 'Korcsolyázás', 2),
(27, 'Vívás', 2),

-- Mozgás > Harcművészet
(28, 'Judo', 20),
(29, 'Karate', 20),
(30, 'Küzdősport', 20),

-- Mozgás > Harcművészet > Küzdősport
(31, 'Box', 30),
(32, 'Kick-box', 30),

-- Mozgás > Labdajátékok
(33, 'Csapatsport', 21),
(34, 'Labdarúgás', 21),
(35, 'Kosárlabda', 21),
(36, 'Kézilabda', 21),
(37, 'Röplabda', 21),
(38, 'Amerikai futball', 21),

-- Mozgás > Vízisport
(39, 'Úszás', 22),
(40, 'Vízilabda', 22),

-- Kreativitás
(41, 'Festés és rajzolás', 3),
(42, 'Kerámia', 3),
(43, 'Fotózás', 3),
(44, 'Kézművesség', 3),
(45, 'Zene', 3),
(46, 'Ének és kórus', 3),
(47, 'Színjátszás', 3),
(48, 'Főzés', 3),

-- Közösség
(49, 'Sakk', 4),
(50, 'Társasjáték', 4),
(51, 'Könyvklub', 4),
(52, 'Nyelvi klub', 4),
(53, 'Kvízest', 4),
(54, 'Filmklub', 4),
(55, 'Önkéntesség', 4),
(56, 'Kertészkedés', 4),
(57, 'E-sport', 4);


-- ============================================================
-- CLUB CATEGORIES
-- ============================================================

INSERT INTO clubCategories
(categories_categoryId, clubs_clubId)
VALUES
(15, 1),
(16, 2),
(18, 3),
(23, 4),
(19, 5),
(6, 5),
(49, 6),
(22, 7),
(39, 7),
(14, 8),
(21, 9),
(33, 9),
(35, 9),
(21, 10),
(33, 10),
(34, 10),
(21, 11),
(33, 11),
(36, 11),
(22, 12),
(39, 12);


INSERT INTO clubCategories
(categories_categoryId, clubs_clubId)
VALUES
(6, 13),
(7, 13),
(6, 14),
(6, 15),
(7, 16),
(7, 17),
(7, 18),
(7, 19),
(9, 20),
(10, 20),
(9, 21),
(9, 22),
(9, 23),
(9, 24),
(12, 25),
(13, 26),
(14, 27),
(14, 28),
(14, 29),
(14, 30),
(15, 31),
(17, 31),
(15, 32),
(15, 33),
(16, 34),
(17, 35),
(17, 36),
(17, 37),
(18, 38),
(18, 39),
(18, 40),
(18, 41),
(19, 42),
(19, 43),
(19, 44),
(19, 45),
(20, 46),
(20, 47),
(20, 48),
(20, 49),
(20, 50),
(21, 51),
(21, 52),
(23, 53),
(23, 54),
(23, 55),
(23, 56),
(24, 57),
(24, 58),
(24, 59),
(24, 60),
(24, 61),
(25, 62),
(25, 63),
(25, 64),
(27, 65),
(27, 66),
(28, 67),
(20, 67),
(28, 68),
(20, 68),
(28, 69),
(20, 69),
(28, 70),
(20, 70),
(29, 71),
(20, 71),
(29, 72),
(20, 72),
(29, 73),
(20, 73),
(30, 74),
(20, 74),
(30, 75),
(20, 75),
(30, 76),
(20, 76),
(49, 76),
(30, 77),
(20, 77),
(31, 78),
(30, 78),
(20, 78),
(32, 79),
(30, 79),
(20, 79),
(33, 80),
(21, 80),
(33, 81),
(21, 81),
(33, 82),
(21, 82),
(34, 83),
(33, 83),
(21, 83),
(34, 84),
(33, 84),
(21, 84),
(34, 85),
(33, 85),
(21, 85),
(34, 86),
(33, 86),
(21, 86),
(35, 87),
(33, 87),
(21, 87),
(35, 88),
(33, 88),
(21, 88),
(35, 89),
(33, 89),
(21, 89),
(35, 90),
(33, 90),
(21, 90),
(36, 91),
(33, 91),
(21, 91),
(36, 92),
(33, 92),
(21, 92),
(36, 93),
(33, 93),
(21, 93),
(36, 94),
(33, 94),
(21, 94),
(37, 95),
(33, 95),
(21, 95),
(37, 96),
(33, 96),
(21, 96),
(38, 97),
(33, 97),
(21, 97),
(38, 98),
(33, 98),
(21, 98),
(39, 99),
(22, 99),
(39, 100),
(22, 100),
(39, 101),
(22, 101),
(40, 102),
(33, 102),
(22, 102),
(40, 103),
(33, 103),
(22, 103),
(40, 104),
(33, 104),
(22, 104),
(39, 105),
(22, 105),
(40, 105),
(33, 105),
(42, 106),
(41, 106),
(46, 107),
(48, 108),
(34, 109),
(33, 109),
(21, 109),
(49, 109),
(49, 110),
(56, 111);


-- ============================================================
-- PRICE
-- ============================================================
-- Valós, a klubok weboldalán közzétett árak (Ft). Az egység klubonként
-- eltérő, lásd a sorok melletti megjegyzést. NULL = nincs nyilvános ár.

INSERT INTO price
(priceId, adult, student, clubs_clubId)
VALUES
(1, 17000, 14000, 1),   -- havi bérlet / diák-nyugdíjas havi bérlet
(2, 4000, 2000, 2),     -- 90 perces hatha jóga / 60 perces gimis jóga (alkalmi)
(3, 1500, NULL, 3),     -- kezdő társastánc: 15 000 Ft / 10 alkalom
(4, 10795, NULL, 4),     -- csarnokpálya / óra, hétköznap 8-16 (8 500 Ft + 27% ÁFA)
(5, 14000, 12000, 5),   -- havi tagdíj: felnőtt (U18-tól) / U10-U16 korosztály (2026.07.01-től)
(6, 10000, NULL, 6),    -- éves tagsági és oktatási díj (testvéreknek 50%)
(7, 16000, 16000, 7),   -- úszótanfolyam havidíj, heti 1 alkalom (nincs külön diákár)
(8, 5400, NULL, 8),     -- 25 perces kezdő csoportos lovaglás
(9, 3000, NULL, 9),     -- állójegy 2026/27 (diák kedvezmény csak bérletre)
(10, 1000, 500, 10),   -- 3. kategóriás jegy 2026/27, teljes / diák-nyugdíjas
(11, 0, 0, 11),       -- 2026/27-ben ingyenes belépés a hazai meccsekre
(12, 1400, 850, 12);    -- 4 órás felnőtt / kedvezményes uszodajegy


INSERT INTO price
(priceId, adult, student, clubs_clubId)
VALUES
(13, NULL, NULL, 13),       -- nincs nyilvános ár
(14, NULL, NULL, 14),       -- nincs nyilvános ár
(15, NULL, NULL, 15),       -- nincs nyilvános ár
(16, NULL, NULL, 16),       -- nincs nyilvános ár
(17, NULL, NULL, 17),       -- nincs nyilvános ár
(18, NULL, NULL, 18),       -- nincs nyilvános ár
(19, NULL, NULL, 19),       -- nincs nyilvános ár
(20, NULL, NULL, 20),       -- nincs nyilvános ár
(21, NULL, NULL, 21),       -- nincs nyilvános ár
(22, NULL, NULL, 22),       -- nincs nyilvános ár
(23, NULL, NULL, 23),       -- nincs nyilvános ár
(24, NULL, NULL, 24),       -- nincs nyilvános ár
(25, NULL, NULL, 25),       -- nincs nyilvános ár
(26, NULL, NULL, 26),       -- nincs nyilvános ár
(27, NULL, NULL, 27),       -- nincs nyilvános ár
(28, NULL, NULL, 28),       -- nincs nyilvános ár
(29, NULL, NULL, 29),       -- nincs nyilvános ár
(30, NULL, NULL, 30),       -- nincs nyilvános ár
(31, 23000, NULL, 31),      -- havi bérlet (2026.02.01-től)
(32, NULL, NULL, 32),       -- nincs nyilvános ár
(33, 22000, NULL, 33),      -- havi korlátlan bérlet
(34, NULL, NULL, 34),       -- nincs nyilvános ár
(35, 7000, NULL, 35),       -- alkalmi jegy
(36, 7500, NULL, 36),       -- alkalmi csoportos reformer óra
(37, 1900, NULL, 37),       -- csoportos óra: 19 000 Ft / 10 alkalom
(38, NULL, NULL, 38),       -- nincs nyilvános ár
(39, NULL, NULL, 39),       -- nincs nyilvános ár
(40, NULL, NULL, 40),       -- nincs nyilvános ár
(41, NULL, NULL, 41),       -- nincs nyilvános ár
(42, NULL, NULL, 42),       -- nincs nyilvános ár
(43, 8000, 8000, 43),       -- egységes tagdíj
(44, NULL, NULL, 44),       -- nincs nyilvános ár
(45, NULL, NULL, 45),       -- nincs nyilvános ár
(46, NULL, NULL, 46),       -- nincs nyilvános ár
(47, NULL, NULL, 47),       -- nincs nyilvános ár
(48, NULL, NULL, 48),       -- nincs nyilvános ár
(49, NULL, NULL, 49),       -- nincs nyilvános ár
(50, NULL, NULL, 50),       -- nincs nyilvános ár
(51, NULL, NULL, 51),       -- nincs nyilvános ár
(52, NULL, NULL, 52),       -- nincs nyilvános ár
(53, NULL, NULL, 53),       -- nincs nyilvános ár
(54, NULL, NULL, 54),       -- nincs nyilvános ár
(55, NULL, NULL, 55),       -- nincs nyilvános ár
(56, NULL, NULL, 56),       -- nincs nyilvános ár
(57, NULL, NULL, 57),       -- nincs nyilvános ár
(58, NULL, NULL, 58),       -- nincs nyilvános ár
(59, NULL, NULL, 59),       -- nincs nyilvános ár
(60, NULL, NULL, 60),       -- nincs nyilvános ár
(61, NULL, NULL, 61),       -- nincs nyilvános ár
(62, NULL, NULL, 62),       -- nincs nyilvános ár
(63, NULL, NULL, 63),       -- nincs nyilvános ár
(64, NULL, NULL, 64),       -- nincs nyilvános ár
(65, NULL, NULL, 65),       -- nincs nyilvános ár
(66, NULL, NULL, 66),       -- nincs nyilvános ár
(67, NULL, NULL, 67),       -- nincs nyilvános ár
(68, NULL, NULL, 68),       -- nincs nyilvános ár
(69, NULL, NULL, 69),       -- nincs nyilvános ár
(70, NULL, NULL, 70),       -- nincs nyilvános ár
(71, NULL, NULL, 71),       -- nincs nyilvános ár
(72, NULL, NULL, 72),       -- nincs nyilvános ár
(73, NULL, NULL, 73),       -- nincs nyilvános ár
(74, NULL, NULL, 74),       -- nincs nyilvános ár
(75, NULL, NULL, 75),       -- nincs nyilvános ár
(76, NULL, NULL, 76),       -- nincs nyilvános ár
(77, NULL, NULL, 77),       -- nincs nyilvános ár
(78, NULL, NULL, 78),       -- nincs nyilvános ár
(79, NULL, NULL, 79),       -- nincs nyilvános ár
(80, NULL, NULL, 80),       -- nincs nyilvános ár
(81, NULL, NULL, 81),       -- nincs nyilvános ár
(82, NULL, NULL, 82),       -- nincs nyilvános ár
(83, NULL, NULL, 83),       -- nincs nyilvános ár
(84, NULL, NULL, 84),       -- nincs nyilvános ár
(85, NULL, NULL, 85),       -- nincs nyilvános ár
(86, NULL, NULL, 86),       -- nincs nyilvános ár
(87, NULL, NULL, 87),       -- nincs nyilvános ár
(88, NULL, NULL, 88),       -- nincs nyilvános ár
(89, NULL, NULL, 89),       -- nincs nyilvános ár
(90, NULL, NULL, 90),       -- nincs nyilvános ár
(91, 3100, 1900, 91),       -- normál mérkőzés jegy 2026/27, teljes / diák-nyugdíjas
(92, NULL, NULL, 92),       -- nincs nyilvános ár
(93, NULL, NULL, 93),       -- nincs nyilvános ár
(94, NULL, NULL, 94),       -- nincs nyilvános ár
(95, NULL, NULL, 95),       -- nincs nyilvános ár
(96, NULL, NULL, 96),       -- nincs nyilvános ár
(97, NULL, NULL, 97),       -- nincs nyilvános ár
(98, NULL, NULL, 98),       -- nincs nyilvános ár
(99, NULL, NULL, 99),       -- nincs nyilvános ár
(100, NULL, NULL, 100),     -- nincs nyilvános ár
(101, NULL, NULL, 101),     -- nincs nyilvános ár
(102, NULL, NULL, 102),     -- nincs nyilvános ár
(103, NULL, NULL, 103),     -- nincs nyilvános ár
(104, NULL, NULL, 104),     -- nincs nyilvános ár
(105, NULL, NULL, 105),     -- nincs nyilvános ár
(106, NULL, NULL, 106),     -- nincs nyilvános ár
(107, NULL, NULL, 107),     -- nincs nyilvános ár
(108, NULL, 5500, 108),     -- gyerek főzőklub / alkalom; felnőtt tanfolyam ára nem nyilvános
(109, NULL, NULL, 109),     -- nincs nyilvános ár
(110, NULL, NULL, 110),     -- nincs nyilvános ár
(111, 1000, NULL, 111);     -- éves tagdíj


-- ============================================================
-- REVIEWS
-- ============================================================

INSERT INTO reviews
(reviewId, rating, comment, createdAt, users_userId, clubs_clubId)
VALUES
(1, 5.0, 'Nagyon jó terem, tiszta és jól felszerelt.', '2026-01-10', 1, 1),
(2, 4.5, 'Jó gépek és segítőkész edzők.', '2026-01-18', 2, 1),
(3, 5.0, 'Nyugodt, kellemes stúdió, nagyon figyelmes oktató.', '2026-02-03', 3, 2),
(4, 4.5, 'Kezdőként is nagyon jó élmény volt, a gerinctréning sokat segített.', '2026-02-14', 4, 2),
(5, 4.0, 'Jó hangulatú tanfolyam, néha kicsit zsúfolt a terem.', '2026-02-20', 5, 3),
(6, 5.0, 'Párunkkal kezdőként is gyorsan belejöttünk, nagyszerű oktatók.', '2026-03-01', 6, 3),
(7, 5.0, 'A pályák nagyon jó állapotban vannak, az online foglalás kényelmes.', '2026-03-05', 7, 4),
(8, 4.5, 'Kedves személyzet, utána jól esik egy ebéd az étteremben.', '2026-03-12', 8, 4),
(9, 4.5, 'Profi edzők és jó atlétikai pálya.', '2026-03-20', 9, 5),
(10, 5.0, 'A gyerekem nagyon szeret ide járni, jó a közösség.', '2026-03-28', 10, 5),
(11, 5.0, 'Barátságos klub, kezdőkkel is türelmesek.', '2026-04-02', 11, 6),
(12, 4.5, 'Jó versenyek és színvonalas oktatás.', '2026-04-09', 12, 6),
(13, 4.5, 'Jó úszóoktatók, a gyerekek sokat fejlődtek.', '2026-04-15', 13, 7),
(14, 5.0, 'A gyerekek nagyon szeretik az edzéseket.', '2026-04-21', 14, 7),
(15, 5.0, 'Nyugodt, jól képzett lovak és türelmes oktatók.', '2026-05-01', 15, 8),
(16, 4.5, 'Szép környezet, a nyári tábor is nagyon jó volt.', '2026-05-08', 1, 8),
(17, 4.5, 'Jó hangulatú meccsek, lelkes szurkolók.', '2026-05-15', 2, 9),
(18, 4.5, 'Az utánpótlás edzések jól szervezettek.', '2026-05-21', 3, 9),
(19, 5.0, 'Nagyszerű stadion és szuper meccshangulat.', '2026-06-01', 4, 10),
(20, 5.0, 'Az akadémián profi képzést kap a fiam.', '2026-06-08', 5, 10),
(21, 4.5, 'Jó edzések és összetartó csapat.', '2026-06-15', 6, 11),
(22, 4.0, 'Az edzések jók, de Fehérvárról messze van.', '2026-06-20', 7, 11),
(23, 5.0, 'Tiszta uszoda, a tanmedence gyerekeknek ideális.', '2026-07-01', 8, 12),
(24, 4.5, 'Jó pályák, csak csúcsidőben zsúfolt.', '2026-07-08', 9, 12),
(25, 5.0, 'Minden alkalommal nagyon jól éreztem magam.', '2026-07-15', 10, 1);


-- ============================================================
-- MESSAGES
-- ============================================================

INSERT INTO messages
(messageId, categoryId, chatType, message, createdAt, users_userId, clubs_clubId)
VALUES
(1, 15, 'GENERAL', 'Sziasztok! Érdeklődni szeretnék a bérletekről.', '2026-01-05 10:15:00', 1, 1),
(2, 15, 'GENERAL', 'Szia Bence! A havi bérlet 17 000 Ft, diákoknak 14 000 Ft.', '2026-01-05 11:00:00', 11, 1),
(3, 16, 'GENERAL', 'Van lehetőség kezdőként jóga órán részt venni?', '2026-01-12 09:20:00', 2, 2),
(4, 16, 'GENERAL', 'Természetesen, a hatha jóga órák kezdőknek is ajánlottak.', '2026-01-12 10:05:00', 12, 2),
(5, 18, 'GENERAL', 'Pár nélkül is lehet jelentkezni a kezdő társastánc tanfolyamra?', '2026-02-01 16:30:00', 3, 3),
(6, 18, 'GENERAL', 'Igen, a tanfolyam 10 alkalmas, az első óra előtt kell fizetni.', '2026-02-01 17:10:00', 15, 3),
(7, 23, 'GENERAL', 'Lehet pályát előre foglalni?', '2026-02-10 13:15:00', 4, 4),
(8, 23, 'GENERAL', 'Igen, online vagy telefonon, alkalmi foglalás két héttel előre.', '2026-02-10 13:45:00', 12, 4),
(9, 19, 'GENERAL', 'Hány éves kortól lehet atlétika edzésre járni?', '2026-03-01 08:10:00', 5, 5),
(10, 19, 'GENERAL', 'Több korosztályban vannak utánpótlás csoportjaink, érdemes előtte egyeztetni.', '2026-03-01 08:30:00', 11, 5),
(11, 49, 'GENERAL', 'Mikor vannak a kezdő sakk foglalkozások?', '2026-03-10 15:20:00', 6, 6),
(12, 49, 'GENERAL', 'Szerdán és pénteken, külön kezdő és haladó csoportban.', '2026-03-10 16:00:00', 13, 6),
(13, 39, 'GENERAL', 'Van gyermek úszóoktatás is?', '2026-03-20 12:00:00', 7, 7),
(14, 39, 'GENERAL', 'Igen, délután 16 órától kezdő, középhaladó és haladó csoportokban.', '2026-03-20 12:35:00', 15, 7),
(15, 14, 'GENERAL', 'Teljesen kezdőként is lehet jelentkezni lovaglásra?', '2026-04-01 18:10:00', 8, 8),
(16, 14, 'GENERAL', 'Igen, futószáras egyéni órával vagy kezdő csoportos órával indulunk.', '2026-04-01 19:00:00', 11, 8),
(17, 35, 'GENERAL', 'Van kezdő utánpótlás kosárlabda csoport?', '2026-04-15 14:30:00', 9, 9),
(18, 35, 'GENERAL', 'Igen, több korosztályban vannak utánpótlás csapataink.', '2026-04-15 15:05:00', 15, 9),
(19, 34, 'GENERAL', 'Hol lehet jegyet venni a hazai meccsekre?', '2026-05-01 17:20:00', 10, 10),
(20, 34, 'GENERAL', 'Online a Jegymesteren vagy a stadion jegypénztárában.', '2026-05-01 18:00:00', 12, 10);


-- ============================================================
-- ELLENŐRZŐ LEKÉRDEZÉSEK
-- ============================================================

-- Felhasználók
SELECT * FROM users;

-- Klubok
SELECT * FROM clubs;

-- Kategóriák
SELECT * FROM categories;

-- Klubok kategóriákkal
SELECT
    c.name AS clubName,
    cat.name AS categoryName
FROM clubs c
JOIN clubCategories cc
    ON c.clubId = cc.clubs_clubId
JOIN categories cat
    ON cat.categoryId = cc.categories_categoryId
ORDER BY c.name;

-- Klubok és áraik
SELECT
    c.name AS clubName,
    p.adult,
    p.student
FROM clubs c
JOIN price p
    ON c.clubId = p.clubs_clubId
ORDER BY c.name;

-- Értékelések klubonként
SELECT
    c.name AS clubName,
    r.rating,
    r.comment,
    r.createdAt
FROM reviews r
JOIN clubs c
    ON c.clubId = r.clubs_clubId
ORDER BY c.name, r.createdAt;

-- Üzenetek klubonként
SELECT
    c.name AS clubName,
    u.userName,
    m.message,
    m.createdAt
FROM messages m
JOIN users u
    ON u.userId = m.users_userId
JOIN clubs c
    ON c.clubId = m.clubs_clubId
ORDER BY m.createdAt;
