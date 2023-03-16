UPDATE qgep.od_manhole SET function =
  CASE 
    WHEN function = 4536 THEN 204 
    WHEN function = 5346 THEN 1008
    WHEN function = 204 THEN 5344
    WHEN function = 5347 THEN 2742 
    ELSE function
  END