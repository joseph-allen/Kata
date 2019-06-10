### Load FactoMineR ###
library(FactoMineR)
library(factoextra)

### Read datadf ###
df <- read.csv("~/Code/taxi-project/Part3/data/normalised_data.csv")

### Get only relevant columns
df <- df[,c('Total_amount', 'Trip_distance', 'Fare_amount', 'Extra', 'MTA_tax', 'Tolls_amount', 'improvement_surcharge')]

####    Discretization of Total Amount
#  discretization: 4 levels are considered, from the quartiles
decoupe<-quantile (df$Total_amount,na.rm=TRUE)
decoupe[1]<-decoupe[1]-1e-10
df$Tamount_inclass<-cut(df$Total_amount,breaks=decoupe)
summary(df$Tamount_inclass)
df[is.na(df$Total_amount),]
levels(df$Tamount_inclass)<-c("Very_small_amount","small_amount",
                                "Moderate_amount","High_amount")

# In this case, discretization: 4 levels are considered, from the quartiles
decoupe<-quantile (df$Trip_distance ,na.rm=TRUE)
decoupe[1]<-decoupe[1]-1e-10
df$Trip_distance_inclass<-cut(df$Trip_distance,breaks=decoupe)
summary(df$Trip_distance_inclass)
df[is.na(df$Trip_distance),]
levels(df$Trip_distance_inclass)<-c("Very_small_dist","small_dist",
                                      "Moderate_dist","High_dist")

# In this case, discretization: 4 levels are considered, from the quartiles
decoupe<-quantile (df$Fare_amount ,na.rm=TRUE)
decoupe[1]<-decoupe[1]-1e-10
df$Fare_amount_inclass<-cut(df$Fare_amount,breaks=decoupe)
summary(df$Fare_amount_inclass)
df[is.na(df$Fare_amount),]
levels(df$Fare_amount_inclass)<-c("Very_small_fare","small_fare",
                                    "Moderate_fare","High_fare")

# Make factors
summary(as.factor(df$Extra))
df$Extra_fac<-as.factor(df$Extra)
levels(df$Extra_fac)<-c("extra_0","extra_0.5","extra_1")
summary(df$Extra_fac)

# MCA
################# MCA
MCA_df <- df[,c('Total_amount', 'Tamount_inclass','Trip_distance_inclass', 'Fare_amount_inclass', 'Extra_fac')]

#quanti.sup: vector of indexes of continuous supplementary variables
#quali.sup: vector of indexes of categorical supplementary variables
res.mca<-MCA(MCA_df,quanti.sup=1)

### I. Eigenvalues and dominant axes. How many axes we have to interpret? ###
summary(res.mca)
round(res.mca$eig,3)
barplot(res.mca$eig[,1],main="Bar Plot of eigenvalues",names.arg=paste("dim",1:nrow(res.mca$eig)))

# representaci�n de los individuos
plot.MCA(res.mca,choix=c("ind"),cex=0.8)
plot.MCA(res.mca,choix=c("ind"),invisible=c("var","quali.sup"),cex=0.8)

# FViz
fviz_mca_var(res.mca, col.var = "cos2",
                           gradient.cols = c("#00AFBB", "#E7B800", "#FC4E07"), 
                           repel = TRUE, # Avoid text overlapping
                           ggtheme = theme_minimal())

fviz_cos2(res.mca, choice = "var", axes = 1:2)

# Contributions of rows to dimension 1
fviz_contrib(res.mca, choice = "var", axes = 1, top = 15)

# Contributions of rows to dimension 2
fviz_contrib(res.mca, choice = "var", axes = 2, top = 15)

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

# plot ellipses
plotellipses(res.mca,keepvar=c(2), keepnames = FALSE, label = 'none')
plotellipses(res.mca,keepvar=c(3), keepnames = FALSE, label = 'none')
plotellipses(res.mca,keepvar=c(4), keepnames = FALSE, label = 'none')
plotellipses(res.mca,keepvar=c(5), keepnames = FALSE, label = 'none')

# plot correlation
fiz_mca_var(res.mca, choice = "mca.cor",
            repel = TRUE)