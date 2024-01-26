--Helvault backup -> Archidekt CSV import
--Import using:
--  Quantity | Card Name | Set Code | Collector Number | Scryfall Id | Language | Foil/Variant
SELECT
  COUNT() AS COUNT,
	ZFACENAME,
  ZPARSEDSETCODE,
  ZCOLLECTORNUMBER,
  ZSCRYFALLID,
  CASE ZPARSEDLANGUAGE
   WHEN 'ph' THEN 'en'
   WHEN 'ja' THEN 'jp'
   ELSE ZPARSEDLANGUAGE
   END AS LANGUAGE,
  CASE ZPARSEDEXTRAS
   WHEN 'foil' THEN 'Foil'
   WHEN 'etchedFoil' THEN 'Foil'
   ELSE 'Normal'
   END AS VARIANT
FROM ZPERSISTEDMTGCARD
GROUP BY ZSCRYFALLID, VARIANT
ORDER BY ZFACENAME
