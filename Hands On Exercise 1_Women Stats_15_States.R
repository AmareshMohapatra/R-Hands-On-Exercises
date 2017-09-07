getwd()

setwd("C:/Users/Amaresh-PC/Documents/Amma 2017/Data")

install.packages("data.table")
install.packages("datasets")
View(women)
height_avg = mean(women$height)
weight_avg = mean(women$weight)
women_dframe<-subset(women,height > height_avg & weight < weight_avg)
women_dframe

library("xml2")
library("rvest")

#Save URL in a variable
url = "http://www.worldatlas.com/articles/the-biggest-cities-in-india.html"

#Read the HTML data from the URL
city_file = read_html(url)

#Read the HTML node corresponding to all the tables in 'table' variable
table = html_nodes(city_file,"table")

#Get the required table in a separate variable
city_final <- html_table(table[1],fill=TRUE)

#View the table
View(city_final)
