library(ggplot2)
library(factoextra)
library(FactoMineR)
library(cluster)

dados = read.csv("./Database/DataFrame.csv", na.strings=c("NaN"))
dados_processedos = dados[0:66,c("Investimento", "Pesquisa",
                              "computadoresPorcasa")]

x = fviz_nbclust(na.omit(dados_processedos), kmeans, method = "gap_stat")
plot(x)

K.cluster = 2

dist_mat <- dist(dados_processedos, method = 'euclidean')
hclust_avg <- hclust(dist_mat, method="average")
plot(hclust_avg)

cut_avg <- cutree(hclust_avg, k = K.cluster )
rect.hclust(hclust_avg , k = K.cluster, border = 2:6)
abline(h = 4, col = 'red')

kmeans.res <- kmeans(na.omit(dados_processedos),K.cluster , iter.max=10, nstart=1)
# fviz_cluster(kmeans, data = kmeans)
y = fviz_cluster(kmeans.res, data=dados_processedos)
plot(y)

print(kmeans.res)