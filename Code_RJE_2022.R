library(randomForest)
library(caret)

a<-read.csv(file='Ваши данные.csv', header=T, sep=";" )

#####################################################################
#####################################################################
##############      Подбор лесов    #################################
#####################################################################
#####################################################################


#Этот код демонстрирует, как создавались леса для данных из статьи

#Код для использования полученных лесов с вашими данными находится ниже


#Разделение базы на обучающую и тестовую выборки

 a1<-na.omit(a)
#
 tr.index = createDataPartition(y = a1$Resp, p = 0.8, list = FALSE)
#
 trainSet = a1[tr.index, ]
 testSet = a1[-tr.index, ]
 saveRDS(testSet, file="*.rds")
#
# ##########Построение леса со всеми предикторами
#
 RFtrain<-randomForest(Resp~Tsoil+Hum+Tair+Biotype+Biotop+NDVI+SPEI1+SPEI12+FPAR+LAI+Soiltype,
                       data=trainSet, importance = TRUE, ntree=500, na.action=na.omit, mtry=3)
#
# ##Временные переменные
 RFtrtime<-randomForest(Resp~Tsoil+Tair+NDVI+SPEI1+SPEI12+FPAR+LAI,
                        data=trainSet, importance = TRUE, ntree=500, na.action=na.omit, mtry=3)

#
# ##Пространственные переменные
 RFtrspace<-randomForest(Resp~Hum+Biotop+Soiltype,
                         data=trainSet, importance = TRUE, ntree=500, na.action=na.omit, mtry=3)

#
# ##Температуры и влажность
 RFtrain5<-randomForest(Resp~Tsoil+Tair+Hum,
                        data=trainSet, importance = TRUE, ntree=500, na.action=na.omit, mtry=3)
# RFtrain5
#
 saveRDS(RFtraintot, file="*.rds")
 saveRDS(RFtrtime, file="*.rds")
 saveRDS(RFtrspace, file="*.rds")
 saveRDS(RFtrain5, file="*.rds")
#
 #####################################################################
 #####################################################################
 ##############   Использование лесов    #############################
 #####################################################################
 #####################################################################
 
 testSet<- #ваши данные
 RFtrain<-readRDS(file = "*.rds") #загрузка модели
 Resp_rf<-predict(RFtrain, testSet) #использование модели для ваших данных
 Rftest<-cbind(testSet,Resp_rf)
 
 #########MSE и R2 для тестовой выборки
 MSEtest<-round(mean((Rftest$Resp-Rftest$Resp_rf)^2), digit = 2)
 r2test=as.numeric(round(summary(lm(Resp_rf~Resp, Rftest))[["adj.r.squared"]], digit=2))
 
 
 