!!!! База данных для использования всех предикторов должна содержать следующие переменные.

 $ Resp    : num   - Дыхание, мкмоль СО2/м2*сек - целевая переменная

 $ Biotype : Factor w/ 2 levels Тип растительности (vegetation): Сосняки ("1"), луга ("2")
 $ Biotop  : Factor w/ 10 levels Сосняки: черничный ("Sch"), орляковый ("SP"), разнотравный ("SDG"), злаковый ("SZ"), самозарастания ("SSG"),мертвопокровный ("SDC"), кисличный ("SA"); луга: суходольный разнотравный ("M1"), пойменный разнотравный ("M2"),  пойменный лабазниковый ("M3")
 $ Tsoil   : num  Температура почвы, С
 $ Hum     : num  объемная влажность почвы
 $ Tair    : num  Температура воздуха, С
 $ NDVI    : num  0 - 1
 $ SPEI1   : num  
 $ SPEI12  : num  
 $ FPAR    : num  
 $ LAI     : num  
 $ Soiltype: Factor w/ 10 levels Albic Luvisols (Loamic), Albic Retisols (Clayic), Albic Retisols (Differentic), Albic Retisols (Siltic), Eutric Fluvisols (Siltic), Eutric Retisols (Densic), Gleyic Phaeozems (Clayic), Haplic Luvisols (Densic), Pretic Luvisols (Siltic), Skeletic Combisols (Densic, Turbic)


Файлы с моделями: RFtot.rds, RFPtot.rds (сосняки), RFMtot.rds (луга).


!!!!!Модели с временными предикторами:

$ Resp    : num   - Дыхание, мкмоль СО2/м2*сек - целевая переменная

 $ Tsoil   : num  Температура почвы, С
 $ Tair    : num  Температура воздуха, С
 $ NDVI    : num  0 - 1
 $ SPEI1   : num  
 $ SPEI12  : num  
 $ FPAR    : num  
 $ LAI     : num  

Файлы с моделями: RFtrtime.rds, RFPtrtime.rds (сосняки), RFMtrtime.rds (луга).


!!!!!Модели с пространственными предикторами

$ Resp    : num   - Дыхание, мкмоль СО2/м2*сек - целевая переменная

  $ Biotop  : Factor w/ 10 levels Сосняки: черничный ("Sch"), орляковый ("SP"), разнотравный ("SDG"), злаковый ("SZ"), самозарастания ("SSG"),мертвопокровный ("SDC"), кисличный ("SA"); луга: суходольный разнотравный ("M1"), пойменный разнотравный ("M2"),  пойменный лабазниковый ("M3")
  $ Hum     : num  объемная влажность почвы
  $ Soiltype: Factor w/ 10 levels Albic Luvisols (Loamic), Albic Retisols (Clayic), Albic Retisols (Differentic), Albic Retisols (Siltic), Eutric Fluvisols (Siltic), Eutric Retisols (Densic), Gleyic Phaeozems (Clayic), Haplic Luvisols (Densic), Pretic Luvisols (Siltic), Skeletic Combisols (Densic, Turbic)

Файлы с моделями: RFtrspace.rds, RFPtrspace.rds (сосняки), RFMtrspace.rds (луга).

!!!!!Модели, основанные на температуре почвы и воздуха и влажности почвы

$ Resp    : num   - Дыхание, мкмоль СО2/м2*сек - целевая переменная
 
 $ Tsoil   : num  Температура почвы, С
 $ Hum     : num  объемная влажность почвы
 $ Tair    : num  Температура воздуха, С
 

Файлы с моделями: RFtot5.rds, RFPtot5.rds (сосняки), RFMtot5.rds (луга).