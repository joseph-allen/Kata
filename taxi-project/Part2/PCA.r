### Load FactoMineR ###
library(FactoMineR)

### Read database ###
df <- read.csv("~/Code/taxi-project/Part2/data/normalised_data.csv", )
df <- df[ , !names(df) %in% c('X')]

### Perform a Principal Component Analysis (PCA) from the descriptors #######
res.pca<-PCA(df [,c(0:27)]) 

### I. Eigenvalues and dominant axes. How many axes we have to interpret? ###
names(res.pca)
summary(res.pca)
round(res.pca$eig,3)
barplot(res.pca$eig[,1],main="Total_amount",names.arg=paste("dim",1:nrow(res.pca$eig)))
sum(res.pca$eig[,1])

### II.  Individuals point of view
### Are they any individuals "too contributive"       ##############
names(res.pca$ind)
round(cbind(res.pca$ind$coord[,1:3],res.pca$ind$cos2[,1:3],res.pca$ind$contrib[,1:3]),2)

### III. Interpreting the axes:  Variables point of view
### coordinates, quality of representation, contribution of the variables  ##############
### 
round(cbind(res.pca$var$coord[,1:3],res.pca$var$cos2[,1:3],res.pca$var$contrib[,1:3]),2)
round(cbind(res.pca$var$cos2[,1:4],res.pca$var$contrib[,1:4]),2)
# dimdes easies this description from the variables
dimdesc(res.pca)
###

### we can need more than 2 axes to have a good representation of the clouds
?plot.PCA
plot.PCA(res.pca,choix=c("ind"),cex=0.8)

##############################################################
### V. Synthesis through HCPC (Clustering the individuals) ###
##############################################################

### Before, hou have to perform a PCA with the number of axes ### 
### that you decided to take into account (indicated through ncp in PCA) ###
#res.pca<-PCA(base [,c(1,3:12,14)],ncp=2) 
res.pca <- PCA(df,quanti.sup=c(13),ncp=2)

### Perform a HCPC ###
res.hcpc<-HCPC(res.pca,nb.clust=2,proba=0.2)

### Interprete the results of clustering ###
names(res.hcpc)

### data.clust ### 
### The original data with a supplementary row containing the partition ###
res.hcpc$data.clust
colnames(res.hcpc$data.clust)
summary(res.hcpc$data.clust$clust)

# High Value PCA 
# Fare Amount - 7
# MTA tax - 9
# improvement surcharge - 12
# Total Amount - 13
# Trip_time_seconds - 17
# RateCodeNF - 21
# RateCodeStandard - 22
# Trip_type_Dispatch - 26
# Trip_type_street_hail - 27

# All strong variables
res.pca <- PCA(df,quanti.sup=c(7,9,12,13,17,21,22,26,27),ncp=2)

# For non-Fare variables
res.pca <- PCA(df,quanti.sup=c(7,17,21,22,26,27),ncp=2)

### Perform a HCPC ###
res.hcpc<-HCPC(res.pca,nb.clust=5,proba=0.3)

# Show data alongside clustering
res.hcpc$data.clust

# Number in each cluster
summary(res.hcpc$data.clust$clust)

clustered_df <- res.hcpc$data.clust

# Understanding the Clusters
# simplyfying the df
clustered_df <- clustered_df[,c('Fare_amount', 'trip_time_seconds', 'RateCodeID_NF', 'RateCodeID_Standard', 'Trip_type_Dispatch', 'Trip_type_street_hail', 'clust')]

# split into seperate clusters on clust
clustered_df_1 <- clustered_df[clustered_df[, "clust"] == 1,]
clustered_df_2 <- clustered_df[clustered_df[, "clust"] == 2,]
clustered_df_3 <- clustered_df[clustered_df[, "clust"] == 3,]
clustered_df_4 <- clustered_df[clustered_df[, "clust"] == 4,]
clustered_df_5 <- clustered_df[clustered_df[, "clust"] == 5,]

# plots
# boxplot(clustered_df_1$Trip_type_street_hail, clustered_df_2$Trip_type_street_hail, clustered_df_3$Trip_type_street_hail, clustered_df_4$Trip_type_street_hail,clustered_df_5$Trip_type_street_hail)
# by the 5 cluster summarys i have come up with some plainer english labels for our clusters
# 1 - Outliers
# 2 - Cheap Street hail, Negotiated Fares.
# 3 - Average trips
# 4 - Expensive Street hail, Negotiated Fares.
# 5 - Expensive trips, These trips are the longest, and most expensive