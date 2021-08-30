library('rvest')

url <- 'http://bvmf.bmfbovespa.com.br/pt-br/mercados/acoes/empresas/ExecutaAcaoConsultaInfoEmp.asp?CodCVM=9512&ViewDoc=1&AnoDoc=2021&VersaoDoc=1&NumSeqDoc=103086#a'

site <- read_html(url)

info_Balanco_HTML <- html_nodes(site, 'table')

info_Balanco <- html_text(info_Balanco_HTML)

head(info_Balanco,20)

head(info_Balanco_HTML)

lista_tabela <- site %>%
  html_nodes("table") %>%
  .[3:5] %>%
  html_table(fill = TRUE)

head(lista_tabela[[1]], 10)
head(lista_tabela[[2]], 10)
head(lista_tabela[[3]], 10)


BP <- lista_tabela[[1]]
DR <- lista_tabela[[2]]
DFC <- lista_tabela[[3]]


library(tidyverse)
library(ggplot2)

plot(BP)

