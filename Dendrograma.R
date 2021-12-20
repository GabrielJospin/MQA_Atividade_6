library(ggplot2)
library(factoextra)
library(FactoMineR)
library(cluster)

dados = read.csv("./Database/DataFrame.csv", na.strings=c("NaN"))
dados_processedos = dados[0:66,c("Investimento", "Pesquisa",
                                 "computadoresPorcasa")]
dados_processedos
grupo = hclust(dist(dados_processedos))
grupo = hclust(dist(dados_processedos), method = 'ward')
grupo = hclust(dist(dados_processedos), method = 'single')
plot(grupo)

rect.hclust(grupo, k = 2)
