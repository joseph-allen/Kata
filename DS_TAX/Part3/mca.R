##########################################################################
#####											   #####
#####											   #####
#####     MCA                    #####
#####     in FactoMineR package 						   #####
#####											   #####
#####                                                                #####
##########################################################################
rm(list=ls())


### Load FactoMineR ###
library(FactoMineR)


### Read database ###
base<-read.csv("~/Code/taxi-project/Part3/data/normalised_data.csv")

dim(base)
colnames(base)
summary(base)
resultat<-boxplot(base$Total_amount)
resultat <- boxplot(base$Total_amount)      # Identifying outliers
names(resultat)
valaberrante<-resultat$out                    # These are the outlier values
which(base$Total_amount %in% valaberrante)
base<-base[-which(base$Total_amount %in% valaberrante),]
dim(base)

colnames(base)
### Remember, in PCA, the active variables were: #######
# ACTIVAS: Trip_distance ,Fare_amount, Extra, MTA_tax, Tip_amount,
# Tolls_amount, improvement_surcharge


####    Discretization of Total Amount
#  discretization: 4 levels are considered, from the quartiles
decoupe<-quantile (base$Total_amount,na.rm=TRUE)
decoupe[1]<-decoupe[1]-1e-10
base$Tamount_inclass<-cut(base$Total_amount,breaks=decoupe)
summary(base$Tamount_inclass)
base[is.na(base$Total_amount),]
levels(base$Tamount_inclass)<-c("Very_small_amount","small_amount",
                              "Moderate_amount","High_amount")

# In this case, discretization: 4 levels are considered, from the quartiles
decoupe<-quantile (base$Trip_distance ,na.rm=TRUE)
decoupe[1]<-decoupe[1]-1e-10
base$Trip_distance_inclass<-cut(base$Trip_distance,breaks=decoupe)
summary(base$Trip_distance_inclass)
base[is.na(base$Trip_distance),]
levels(base$Trip_distance_inclass)<-c("Very_small_dist","small_dist",
                              "Moderate_dist","High_dist")

# In this case, discretization: 4 levels are considered, from the quartiles
decoupe<-quantile (base$Fare_amount ,na.rm=TRUE)
decoupe[1]<-decoupe[1]-1e-10
base$Fare_amount_inclass<-cut(base$Fare_amount,breaks=decoupe)
summary(base$Fare_amount_inclass)
base[is.na(base$Fare_amount),]
levels(base$Fare_amount_inclass)<-c("Very_small_fare","small_fare",
                              "Moderate_fare","High_fare")


summary(as.factor(base$Extra))
base$Extra_fac<-as.factor(base$Extra)
levels(base$Extra_fac)<-c("extra_0","extra_0.5","extra_1")
summary(base$Extra_fac)
summary(as.factor(base$MTA_tax))   # inutilizable
summary(as.factor(base$Tolls_amount))   ## inutilizable
summary(as.factor(base$improvement_surcharge))   # inutilizable
summary(base$Trip_type)  # inutilizable


################# MCA
colnames(base)
colnames(base[,c(15,20:24)])
res.mca<-MCA(base[,c(15,20:24) ],quanti.sup=1,quali.sup=c(3))
colnames(base)


### I. Eigenvalues and dominant axes. How many axes we have to interpret? ###
names(res.mca)
summary(res.mca)
round(res.mca$eig,3)
barplot(res.mca$eig[,1],main="valores propios",names.arg=paste("dim",1:nrow(res.mca$eig)))
sum(res.mca$eig[,1])


### II.  Individuals point of view
### Are they any individuals "too contributive"       ##############

### III. Interpreting the axes:  Variables point of view
### coordinates, quality of representation, contribution of the variables  ##############
### 
round(cbind(res.pca$var$coord[,1:3],res.pca$var$cos2[,1:3],res.pca$var$contrib[,1:3]),2)
round(cbind(res.pca$var$cos2[,1:4],res.pca$var$contrib[,1:4]),2)
# dimdes easies this description from the variables
dimdesc(res.mca)
###
names(res.mca)
res.mca$var$coord
res.mca$quali.sup$coord

# representaci�n de los individuos
plot.MCA(res.mca,choix=c("ind"),cex=0.8)
plot.MCA(res.mca,choix=c("ind"),invisible=c("var","quali.sup"),cex=0.8)

# representaci�n de las categor�as
plot.MCA(res.mca,choix=c("ind"),invisible=c("ind"),axes=c(1,2))
lines(res.mca$var$coord[3:6,1],res.mca$var$coord[3:6,2],lwd=1,col="blue")
lines(res.mca$var$coord[7:10,1],res.mca$var$coord[7:10,2],lwd=1,col="blue")
lines(res.mca$var$coord[11:13,1],res.mca$var$coord[11:13,2],lwd=1,col="black")
lines(res.mca$quali.sup$coord[1:4,1],res.mca$quali.sup$coord[1:4,2],lwd=2,col="magenta")
names(res.mca)
res.mca$var
plot.MCA(res.mca,choix=c("ind"),invisible=c("ind"),axes=c(3,4))
plot.MCA(res.mca,choix=c("var"),axes=c(3,4))

