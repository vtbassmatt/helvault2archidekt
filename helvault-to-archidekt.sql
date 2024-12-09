--Helvault backup -> Archidekt CSV import
--Import using "Helvault" settings but remove blanks and fix up
-- last column to be Foil:
--  Collector Number | Language | Card Name | Quantity | Scryfall Id | Set Code | Foil/Variant
SELECT
  ZCOLLECTORNUMBER,
  CASE ZPARSEDLANGUAGE
   WHEN 'ph' THEN 'en'
   WHEN 'ja' THEN 'jp'
   ELSE ZPARSEDLANGUAGE
   END AS LANGUAGE,
	ZFACENAME,
  COUNT() AS COUNT,
  ZSCRYFALLID,
  ZPARSEDSETCODE,
  CASE ZPARSEDEXTRAS
   WHEN 'foil' THEN 'Foil'
   WHEN 'etchedFoil' THEN 'Foil'
   ELSE 'Normal'
   END AS VARIANT
FROM ZPERSISTEDMTGCARD
GROUP BY ZSCRYFALLID, VARIANT
ORDER BY ZFACENAME
