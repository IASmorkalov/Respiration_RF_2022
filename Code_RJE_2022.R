library(randomForest)
library(caret)

a<-read.csv(file='���� ������.csv', header=T, sep=";" )

#####################################################################
#####################################################################
##############      ������ �����    #################################
#####################################################################
#####################################################################


#���� ��� �������������, ��� ����������� ���� ��� ������ �� ������

#��� ��� ������������� ���������� ����� � ������ ������� ��������� ����


#���������� ���� �� ��������� � �������� �������

 a1<-na.omit(a)
#
 tr.index = createDataPartition(y = a1$Resp, p = 0.8, list = FALSE)
#
 trainSet = a1[tr.index, ]
 testSet = a1[-tr.index, ]
 saveRDS(testSet, file="*.rds")
#
# ##########���������� ���� �� ����� ������������
#
 RFtrain<-randomForest(Resp~Tsoil+Hum+Tair+Biotype+Biotop+NDVI+SPEI1+SPEI12+FPAR+LAI+Soiltype,
                       data=trainSet, importance = TRUE, ntree=500, na.action=na.omit, mtry=3)
#
# ##��������� ����������
 RFtrtime<-randomForest(Resp~Tsoil+Tair+NDVI+SPEI1+SPEI12+FPAR+LAI,
                        data=trainSet, importance = TRUE, ntree=500, na.action=na.omit, mtry=3)

#
# ##���������������� ����������
 RFtrspace<-randomForest(Resp~Hum+Biotop+Soiltype,
                         data=trainSet, importance = TRUE, ntree=500, na.action=na.omit, mtry=3)

#
# ##����������� � ���������
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
 ##############   ������������� �����    #############################
 #####################################################################
 #####################################################################
 
 testSet<- #���� ������
 RFtrain<-readRDS(file = "*.rds") #�������� ������
 Resp_rf<-predict(RFtrain, testSet) #������������� ������ ��� ����� ������
 Rftest<-cbind(testSet,Resp_rf)
 
 #########MSE � R2 ��� �������� �������
 MSEtest<-round(mean((Rftest$Resp-Rftest$Resp_rf)^2), digit = 2)
 r2test=as.numeric(round(summary(lm(Resp_rf~Resp, Rftest))[["adj.r.squared"]], digit=2))
 
 
 