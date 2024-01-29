--Pharmacy Analytics (Part 4) [CVS Health SQL Interview Question]

--CVS Health is trying to better understand its pharmacy sales, and how well different drugs are selling.

--Write a query to find the top 2 drugs sold, in terms of units sold, 
----for each manufacturer.
--List your results in alphabetical order by manufacturer.

create table pharmacy_sales
(
product_id int,
units_sold int,
total_sales decimal(18,2),
cogs decimal(18,2),
manufacturer varchar(100),
drug varchar(100)
)

insert into pharmacy_sales values(25,222331,2753546,2974975.36,'AbbVie','Lamivudine and Zidovudine')
insert into pharmacy_sales values(50,90484,2521023.73,2742445.9,'Eli Lilly','Dermasorb TA Complete Kit')
insert into pharmacy_sales values(41,189925,3499574.92,3692136.66,'AbbVie','Clarithromycin')
insert into pharmacy_sales values(63,93513,2104765,2462370.76,'Johnson & Johnson','Pepcid AC Acid Reducer')
insert into pharmacy_sales values(8,177270,2930134.52,3035522.06,'Johnson & Johnson','Nicorobin Clean and Clear')
insert into pharmacy_sales values(75,164674,1184664.57,1285326.93,'Eli Lilly','RED GINSENG FERMENTED ESSENCE BB')
insert into pharmacy_sales values(91,97765,1115255.32,1201044.27,'Roche','Hydrochlorothiazide')
insert into pharmacy_sales values(26,126866,1499768.09,1573992.41,'Eli Lilly','LBel')
insert into pharmacy_sales values(16,51707,1304837.86,1378790.53,'Roche','Topcare Tussin')
insert into pharmacy_sales values(80,61467,3740527.69,3804542.2,'Biogen','Losartan Potassium')
insert into pharmacy_sales values(148,104637,837620.18,931084.25,'Johnson & Johnson','Motrin')
insert into pharmacy_sales values(95,128494,723841.23,779520.88,'Biogen','Wal-Zan')
insert into pharmacy_sales values(56,86598,1755300.92,1806344.97,'Eli Lilly','Spot Repairing Serum')
insert into pharmacy_sales values(71,126265,2564743.39,2593528.67,'Bayer','ENALAPRIL MALEATE')
insert into pharmacy_sales values(35,87449,86938.27,99811.26,'Johnson & Johnson','Sanitary Wipes Plus')
insert into pharmacy_sales values(70,167190,1119479.36,1313174.69,'Johnson & Johnson','Zyrtec Ultra-Strength')
insert into pharmacy_sales values(15,118901,2717420.96,2707620.02,'Biogen','Clotrimazole')
insert into pharmacy_sales values(33,149895,949514.05,921206.75,'Bayer','Levofloxacin')
insert into pharmacy_sales values(179,125006,1825970,1769907.97,'Biogen','Lancome Paris Renergie Lift Volumetry')
insert into pharmacy_sales values(21,50550,697276.33,640063.57,'Pfizer','Venlafaxine Hydrochloride')
insert into pharmacy_sales values(125,101102,566696,508144.71,'AbbVie','Lidocaine Hydrochloride and Epinephri')
insert into pharmacy_sales values(76,87699,3257976.38,3389863.82,'Johnson & Johnson','EltaMD SPF 150 Sun Screen')
insert into pharmacy_sales values(136,144814,1084258,1006447.73,'Biogen','Burkhart')
insert into pharmacy_sales values(34,94698,600997.19,521182.16,'AstraZeneca','Surmontil')
insert into pharmacy_sales values(61,77023,500101.61,419174.97,'Biogen','Varicose Relief')
insert into pharmacy_sales values(9,37410,293452.54,208876.01,'Eli Lilly','Zyprexa')
insert into pharmacy_sales values(67,87756,1112253.82,1021908.39,'Biogen','Pramipexole Dihydrochloride')
insert into pharmacy_sales values(105,97736,537795,426539.59,'Pfizer','Diaper Rash Skin Protectant Crema Cer')
insert into pharmacy_sales values(107,160617,2538701.5,2414037.51,'Biogen','N - TIME SINUS')
insert into pharmacy_sales values(89,61832,1084996.13,940593.68,'Sanofi','Locoid')
insert into pharmacy_sales values(30,142661,1615518.35,1439533.27,'Sanofi','Oxaprozin')
insert into pharmacy_sales values(47,130448,461623.76,282038.76,'Eli Lilly','Night Time Cherry Syrup')
insert into pharmacy_sales values(146,71159,1778024,1598276.66,'AstraZeneca','PDI Sani-Hands for Kids')
insert into pharmacy_sales values(52,47310,1151498.6,956693.99,'AstraZeneca','Armour Thyroid')
insert into pharmacy_sales values(183,155058,1220029.58,1023275.76,'AbbVie','Lexapro')
insert into pharmacy_sales values(113,122655,1358711.57,1161623.36,'Novartis','Famotidine')
insert into pharmacy_sales values(29,217652,3106931.54,2898165.87,'AstraZeneca','MiraLAX')
insert into pharmacy_sales values(171,177686,632705.44,413382.39,'AstraZeneca','lansoprazole')
insert into pharmacy_sales values(2,284705,523311.9,302721.56,'Novartis','Imatinib')
insert into pharmacy_sales values(126,165665,586961.45,365016.1,'AbbVie','Hamamelis Virginiana Kit Refill')
insert into pharmacy_sales values(122,187110,681903.65,458208.23,'GlaxoSmithKline','eszopiclone')
insert into pharmacy_sales values(144,110672,841911.12,616632.58,'Bayer','Acyclovir Sodium')
insert into pharmacy_sales values(14,55657,933692.06,707891.52,'Bayer','Triple Complex Brain Tonic')
insert into pharmacy_sales values(97,128893,1114438.97,887895.38,'AbbVie','Sodium Iodide I 123')
insert into pharmacy_sales values(111,152231,2708053.52,2467067.02,'Eli Lilly','Divalproex Sodium')
insert into pharmacy_sales values(31,94969,1104640.13,848011.39,'Biogen','Orsythia')
insert into pharmacy_sales values(51,95572,2582349,2322161.57,'Pfizer','Methadone Hydrochloride')
insert into pharmacy_sales values(181,104441,1045454.54,772824.85,'Merck','FLU KIDS RELIEF')
insert into pharmacy_sales values(135,160565,2524229,2249571,'Bayer','Meloxicam')
insert into pharmacy_sales values(22,143516,3147031.19,2864248.62,'Sanofi','Synthroid')
insert into pharmacy_sales values(37,232228,507628.5,212607.07,'Johnson & Johnson','Hand wash')
insert into pharmacy_sales values(154,96249,1408872.02,1105672.68,'Eli Lilly','Potassium Chloride in Dextrose and So')
insert into pharmacy_sales values(59,215282,3059122.36,2755697.86,'Johnson & Johnson','Common Sagebrush')
insert into pharmacy_sales values(81,117947,1559816,1233306.52,'Merck','DHEA')
insert into pharmacy_sales values(3,192608,2851411.66,2522812.85,'Eli Lilly','Treflan')
insert into pharmacy_sales values(53,121093,1460189.98,1124982.66,'Biogen','Active-Medicated specimen collection')
insert into pharmacy_sales values(160,97520,1415772.18,1067854.28,'AbbVie','Olay Total Effects Pore Minimizing CC')
insert into pharmacy_sales values(46,189293,1528747.03,1172798.04,'Pfizer','Stay Awake')
insert into pharmacy_sales values(85,112969,2996318.23,2614556.03,'Bayer','Lovastatin')
insert into pharmacy_sales values(143,180697,1364046.09,961852.31,'Eli Lilly','Western Family Pain Relieving')
insert into pharmacy_sales values(83,106994,1803199.39,1397575.13,'Eli Lilly','IOPE RETIGEN MOISTURE FOUNDATION')
insert into pharmacy_sales values(165,121043,961716.2,553770.53,'Bayer','PROMETHAZINE HYDROCHLORIDE')
insert into pharmacy_sales values(42,116447,2429913,2002106.22,'Biogen','Gelato Topical Anesthetic')
insert into pharmacy_sales values(157,197527,2204939.12,1749148.23,'Biogen','Non Aspirin PM')
insert into pharmacy_sales values(11,135549,2792775.1,2327541.25,'Biogen','AVAPRO')
insert into pharmacy_sales values(49,95307,700562.13,221803.73,'Biogen','Brucella Remedy')
insert into pharmacy_sales values(115,102792,821214.25,321027.88,'Pfizer','Methylphenidate Hydrochloride')
insert into pharmacy_sales values(18,58580,1342015.48,838168.71,'AstraZeneca','Enalapril Maleate')
insert into pharmacy_sales values(119,214488,657085.12,152614.97,'Johnson & Johnson','Hand Sanitizer with Moisturizers')
insert into pharmacy_sales values(137,128175,822716.26,316753.86,'AbbVie','Warfarin Sodium')
insert into pharmacy_sales values(169,95653,1270441.66,757724.19,'Eli Lilly','Multi Symptom Cold')
insert into pharmacy_sales values(164,89816,1080726.88,565920.33,'Biogen','RED ORANGE SUN')
insert into pharmacy_sales values(117,191289,778332.7,256621.14,'Bayer','Diphenhydramine HCL')
insert into pharmacy_sales values(106,103889,1698544.77,1164637.24,'Roche','Crab')
insert into pharmacy_sales values(120,148170,1094440.19,560320.28,'Bayer','Gabapentin')
insert into pharmacy_sales values(10,123832,1518343,981993.64,'Novartis','Amoxicillin and Clavulanate Potassium')
insert into pharmacy_sales values(6,64028,1253627.93,715430.59,'Bayer','Riociguat')
insert into pharmacy_sales values(186,150221,3116140.22,2560951.38,'Novartis','ANASTROZOLE')
insert into pharmacy_sales values(139,38522,674397.16,92756.59,'Merck','METHOCARBAMOL')
insert into pharmacy_sales values(100,212506,3091720.63,2509926.79,'Pfizer','Ropinirole Hydrochloride')
insert into pharmacy_sales values(84,174098,2752163,2146503.01,'Pfizer','Tranexamic Acid')
insert into pharmacy_sales values(45,144352,708891.28,95912.97,'Roche','Dorzolamide HCl')
insert into pharmacy_sales values(112,92168,1194250.01,575583.41,'Novartis','Alimta')
insert into pharmacy_sales values(167,186778,904145,240493.13,'Biogen','Monistat Complete Care Instant Itch R')
insert into pharmacy_sales values(28,113370,1379945.1,712265.84,'AstraZeneca','Thyroid Assist')
insert into pharmacy_sales values(188,123956,1658835.03,991099.63,'Roche','Nivolumab')
insert into pharmacy_sales values(94,132362,2041758.41,1373721.7,'Biogen','UP and UP')
insert into pharmacy_sales values(98,110746,813188.82,140422.87,'Biogen','Medi-Chord')
insert into pharmacy_sales values(65,151901,967632.61,278350.32,'AbbVie','Moxifloxacin Hydrochloride')
insert into pharmacy_sales values(124,59167,1033654.77,344270,'Bayer','MooreBrand Ibuprofen')
insert into pharmacy_sales values(23,72264,1892705.42,1202177.41,'Roche','Cloves')
insert into pharmacy_sales values(149,171975,1727624.67,1024897.45,'Johnson & Johnson','SunZone Work Sunscreen SPF-60')
insert into pharmacy_sales values(64,69702,1425027.99,710573.44,'AbbVie','Allopurinol')
insert into pharmacy_sales values(118,131788,1336647.6,595485.21,'AbbVie','Chlorzoxazone')
insert into pharmacy_sales values(123,125721,1796908.48,1041602.54,'Novartis','Diltiazem Hydrochloride')
insert into pharmacy_sales values(88,175710,1443369.73,670011.51,'Bayer','Oxygen')
insert into pharmacy_sales values(24,289121,937901.5,163610.19,'AstraZeneca','BANANA BOAT SUNSCREEN')
insert into pharmacy_sales values(60,260823,2341257.97,1553229.42,'Eli Lilly','Metoclopramide')
insert into pharmacy_sales values(172,78481,985931,192743.12,'Bayer','Xarelto')
insert into pharmacy_sales values(161,175833,1201626.71,407210.29,'AbbVie','Citalopram')
insert into pharmacy_sales values(184,40007,875514.67,64948.76,'Biogen','Imraldi')
insert into pharmacy_sales values(127,139627,2912543.88,2095983.81,'AstraZeneca','Pravastatin Sodium')
insert into pharmacy_sales values(20,201740,2937100,2117864.7,'Eli Lilly','Levothyroxine Sodium')
insert into pharmacy_sales values(180,88653,2115658,1278017.17,'Pfizer','Ciprofloxacin')
insert into pharmacy_sales values(69,72195,1862729.02,1021659.26,'Biogen','Prednisone')
insert into pharmacy_sales values(72,159597,1752274.54,907074.49,'Johnson & Johnson','Flu-Cold')
insert into pharmacy_sales values(1,166050,1857681.77,999626.88,'Eli Lilly','Keflex')
insert into pharmacy_sales values(48,157217,2878612.16,2020543.63,'Sanofi','Persantine')
insert into pharmacy_sales values(27,153025,1793428.19,908662.72,'Eli Lilly','Cefaclor')
insert into pharmacy_sales values(99,104368,1146201.6,250683.09,'AbbVie','Hydralazine Hydrochloride')
insert into pharmacy_sales values(43,176445,1355861.1,412421.37,'Bayer','Citalopram Hydrobromide')
insert into pharmacy_sales values(176,71329,2529937.41,1584233.81,'Biogen','RHIZOPUS ARRHIZUS VAR ARRHIZUS')
insert into pharmacy_sales values(40,136973,2723073.91,1765245.63,'Pfizer','Selegiline Hydrochloride')
insert into pharmacy_sales values(131,48864,1540350.32,569738.58,'Biogen','ESIKA')
insert into pharmacy_sales values(116,76115,2510105,1505831.15,'Biogen','Namenda')
insert into pharmacy_sales values(93,175376,2218026.75,1206180.64,'Biogen','ProBLEN Estrogen and Progesterone')
insert into pharmacy_sales values(170,107101,1958490.97,914881.77,'AstraZeneca','Double Antibiotic')
insert into pharmacy_sales values(54,68593,1545347.97,482212.61,'Eli Lilly','Diclofenac Sodium')
insert into pharmacy_sales values(44,131514,3080474.64,2014858.59,'Biogen','Alprazolam')
insert into pharmacy_sales values(17,121564,1466145.44,387524.97,'AstraZeneca','SPRYCEL')
insert into pharmacy_sales values(86,147885,1808978.69,720231.01,'Pfizer','Divalproex Sodium Extended-Release')
insert into pharmacy_sales values(178,109829,2786292.44,1693474.52,'Roche','Motion Sickness II')
insert into pharmacy_sales values(87,110248,1485507.76,352858.53,'AbbVie','Night-Time Original')
insert into pharmacy_sales values(104,182090,3217507.49,2069390.45,'AbbVie','Stavudine')
insert into pharmacy_sales values(109,118696,1433109.5,263857.96,'Eli Lilly','Tizanidine Hydrochloride')
insert into pharmacy_sales values(150,201167,2468436,1298844.51,'Biogen','Nefazodone Hydrochloride')
insert into pharmacy_sales values(155,167357,2257132.08,1072766.97,'AstraZeneca','Zavesca')
insert into pharmacy_sales values(128,103246,2700252,1511930.53,'Biogen','QUETIAPINE FUMARATE')
insert into pharmacy_sales values(96,102627,1879590.38,669228.79,'AstraZeneca','Listerine Ultraclean Antiseptic')
insert into pharmacy_sales values(141,113510,2748508,1519635.54,'Eli Lilly','Kentucky Bluegrass (June), Standardiz')
insert into pharmacy_sales values(57,139567,2928590.94,1698018.23,'AbbVie','Valproic Acid')
insert into pharmacy_sales values(140,210120,2944223.22,1649161.98,'Roche','Lucentis')
insert into pharmacy_sales values(66,134990,1734572,436399.12,'Novartis','Antiseptic Hand Gel')
insert into pharmacy_sales values(77,66608,1406533.69,107902.51,'Johnson & Johnson','Budpak Petroleum Jelly')
insert into pharmacy_sales values(185,137096,2582356,1281909.78,'Pfizer','clobetasol propionate')
insert into pharmacy_sales values(138,154713,1743859.96,398395.47,'Eli Lilly','Treatment Set TS347116')
insert into pharmacy_sales values(142,122444,1428293.39,82371.13,'Roche','Herceptin')
insert into pharmacy_sales values(134,37293,3485649.76,2128714.17,'Eli Lilly','Eldepryl')
insert into pharmacy_sales values(159,109063,1780520.27,423335.39,'Eli Lilly','Levetiracetam')
insert into pharmacy_sales values(102,71484,1442991.59,82418.43,'AstraZeneca','Naproxen Sodium')
insert into pharmacy_sales values(5,231084,1825783.98,453989.65,'Biogen','DIPHENHYDRAMINE HYDROCHLORIDE')
insert into pharmacy_sales values(78,107503,2108286,694560.97,'Eli Lilly','Rimmel London')
insert into pharmacy_sales values(90,129019,2543749.63,1096231.45,'Biogen','KADCYLA')
insert into pharmacy_sales values(38,85086,3358913.43,1898929.25,'Eli Lilly','STEMPHYLIUM SOLANI')
insert into pharmacy_sales values(187,144880,2604075,1130014.83,'Eli Lilly','DIVALPROEX SODIUM')
insert into pharmacy_sales values(151,204188,3208125,1731552.31,'Johnson & Johnson','Niacin')
insert into pharmacy_sales values(168,118682,2292546.89,789582.98,'Biogen','Lamotrigine')
insert into pharmacy_sales values(147,164693,3023426,1485390.52,'Biogen','Nortriptyline Hydrochloride')
insert into pharmacy_sales values(174,99442,3303186.78,1754344.77,'Eli Lilly','Clobetasol Propionate')
insert into pharmacy_sales values(13,216001,2807831.05,1242490.08,'Johnson & Johnson','Gold Bond Ultimate Healing Concentrate')
insert into pharmacy_sales values(152,75583,3379737.8,1774390.9,'GlaxoSmithKline','Isoniazid')
insert into pharmacy_sales values(7,224342,2313335.25,588699.33,'Johnson & Johnson','Ibuprofen')
insert into pharmacy_sales values(110,155316,1893117.08,134244.15,'Johnson & Johnson','Remicade')
insert into pharmacy_sales values(153,178254,1995651.94,123085.04,'Biogen','Haloperidol')
insert into pharmacy_sales values(12,164685,2938804.92,1065324.19,'AstraZeneca','SKIN FOUNDATION MINERAL MAKEUP')
insert into pharmacy_sales values(79,140129,3560527.35,1582876.55,'AstraZeneca','Green Guard Stomach Relief')
insert into pharmacy_sales values(166,62913,4701990.22,2705112.11,'Bayer','Amitriptyline Hydrochloride')
insert into pharmacy_sales values(129,116649,2933877,934986.87,'Biogen','Cuvposa')
insert into pharmacy_sales values(36,128104,2896459.68,862377.49,'Eli Lilly','Pfizerpen')
insert into pharmacy_sales values(162,130946,3189843.38,1058358.52,'Eli Lilly','Morphine Sulfate')
insert into pharmacy_sales values(132,92089,2443119.04,225171.93,'Eli Lilly','OLUX-E')
insert into pharmacy_sales values(62,140625,3417877.93,1177021.82,'Pfizer','MUCOR PLUMBEUS')
insert into pharmacy_sales values(173,147808,2738142.96,493523.99,'AstraZeneca','Furosemide')
insert into pharmacy_sales values(73,117857,2517600.95,195721.74,'Biogen','Fumaderm')
insert into pharmacy_sales values(163,165666,2843262.48,509536.85,'Pfizer','TAMSULOSIN HYDROCHLORIDE')
insert into pharmacy_sales values(103,102027,3025655,675055.5,'Eli Lilly','Androgel')
insert into pharmacy_sales values(108,136804,3401782.44,992181.28,'Bayer','Sheep Sorrel Pollen')
insert into pharmacy_sales values(114,86112,2825302,412654.26,'Bayer','Claritin')
insert into pharmacy_sales values(55,161870,2835232.18,384241.13,'Johnson & Johnson','Childrens Ibuprofen')
insert into pharmacy_sales values(130,150704,3556698.88,1083810.04,'Johnson & Johnson','Medi-First Cold Relief')
insert into pharmacy_sales values(92,109858,3283823,679925.49,'Eli Lilly','Naratriptan')
insert into pharmacy_sales values(19,128656,3179533.5,410405.24,'Bayer','Ibuprofen PM')
insert into pharmacy_sales values(4,206134,3786377,796869.55,'Sanofi','Lovenox')
insert into pharmacy_sales values(121,140287,3329242.48,261606.11,'AbbVie','Glipizide')
insert into pharmacy_sales values(39,244224,3581454.82,417476.74,'Johnson & Johnson','JUNIPERUS ASHEI POLLEN')
insert into pharmacy_sales values(32,124071,3765829,156664.74,'Johnson & Johnson','XtraCare Foaming Facial Cleanser')
insert into pharmacy_sales values(158,79869,7925929.18,3825914.37,'Merck','Divalproex sodium')
insert into pharmacy_sales values(192,498342,9654492.33,3189863.82,'Eli Lilly','Cialis')
insert into pharmacy_sales values(177,123213,14759462.01,7083504.56,'Novartis','Xanax')
insert into pharmacy_sales values(191,274342,12654492.33,1437439.99,'Sanofi','Dupixent')
insert into pharmacy_sales values(190,240704,13759462.01,2137439.99,'Merck','Keytruda')
insert into pharmacy_sales values(189,99858,84759462.01,3243809.46,'AbbVie','Humira')

SELECT * FROM pharmacy_sales
ORDER BY manufacturer,units_sold DESC

------------------------------------------------------------------------------------------------------------------
--25	222331	2753546.00	2974975.36	AbbVie	Lamivudine and Zidovudine
--41	189925	3499574.92	3692136.66	AbbVie	Clarithromycin

--24	289121	937901.50	163610.19	AstraZeneca	BANANA BOAT SUNSCREEN
--29	217652	3106931.54	2898165.87	AstraZeneca	MiraLAX

--117	191289	778332.70	256621.14	Bayer	Diphenhydramine HCL
--43	176445	1355861.10	412421.37	Bayer	Citalopram Hydrobromide
------------------------------------------------------------------------------------------------------------------

SELECT 
MANUFACTURER,
UNITS_SOLD
---ROW_NUMBER() OVER(PARTITION BY MANUFACTURER ORDER BY UNITS_SOLD DESC) AS RK 
FROM PHARMACY_SALES 
GROUP BY manufacturer,UNITS_SOLD



;WITH CTE 
AS 
(
SELECT 
MANUFACTURER,
DRUG,
UNITS_SOLD,
ROW_NUMBER() OVER(PARTITION BY MANUFACTURER ORDER BY UNITS_SOLD DESC) AS RK 
FROM PHARMACY_SALES 
)
SELECT MANUFACTURER,DRUG,UNITS_SOLD FROM CTE 
WHERE RK <=2
ORDER BY MANUFACTURER



SELECT * FROM 
(
SELECT 
MANUFACTURER,
DRUG,
UNITS_SOLD,
ROW_NUMBER() OVER(PARTITION BY MANUFACTURER ORDER BY UNITS_SOLD DESC) AS RK 
FROM PHARMACY_SALES 
) AS T 
WHERE RK <=2





------------------------------------------------------------------------------------------------------------------
---------------WITH THE EXAMPLE OF DERIVED TABLE/INLINE VIEW IN ORACLE

SELECT 
MANUFACTURER,
DRUG,
UNITS_SOLD
FROM
(
SELECT 
MANUFACTURER,
DRUG,
UNITS_SOLD,
ROW_NUMBER() OVER(PARTITION BY MANUFACTURER ORDER BY UNITS_SOLD DESC) AS RK 
FROM PHARMACY_SALES 
) T 
WHERE RK <=2

------------------------------------------------------------------------------------------------------------------
