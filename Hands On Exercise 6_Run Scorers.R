install.packages("rlist")

library(XML)
library(RCurl)

#Store the URL in a variable page_URL
page_url <- getURL("http://stats.espncricinfo.com/ci/content/records/284248.html")

#Read the HTML tables using redHTMLTable function
tab_html <- readHTMLTable(page_url)

#Take the data into a new variable 'table'
table <- tab_html[[1]]

#View the table
View(table)

#Top 5 run scorers across the years
table[with(table, order(Runs, Player)), ] #sort the data according to the number of runs scored
View(table)

Top_5<-c(as.character(table$Player[1:5]))
View(Top_5)

#Highest number of a times a player has become highest run scorer in a calendar year

#Contribution of a player's country

#First initialize the country's contribution as 0
PAK=0
AUS=0
IND=0
SL=0
ENG=0
WI=0
SA=0

#Loop in the data frame 'table' 
for(i in 1:nrow(table))
{
  if(grepl("PAK",table$Player[i])){
    PAK=PAK+1
}else if(grepl("AUS",table$Player[i])){
    AUS=AUS+1
}else if(grepl("IND",table$Player[i])){
    IND=IND+1
}else if(grepl("SL",table$Player[i])){
  SL=SL+1
}else if(grepl("WI",table$Player[i])){
  WI=WI+1
}else if(grepl("ENG",table$Player[i])){
  ENG=ENG+1
}else if(grepl("SA",table$Player[i])){
  SA=SA+1
}else{
  NULL}
}    
    
#Country contibution 
PAK_ratio = 100*PAK/nrow(table)
AUS_ratio = 100*AUS/nrow(table)
IND_ratio = 100*IND/nrow(table)
SL_ratio = 100*SL/nrow(table)
WI_ratio = 100*WI/nrow(table)
ENG_ratio = 100*ENG/nrow(table)
SA_ratio = 100*SA/nrow(table)

#Make a vector for countries
Country <- c('PAK','AUS','IND','SL','WI','ENG','SA')

#Make a vector for percentages
percentage <- c(PAK_ratio,AUS_ratio,IND_ratio,SL_ratio,WI_ratio,ENG_ratio,SA_ratio)

#Make a data frame in order to view each country's contribution  
contribution <- data.frame(Country,percentage)
View(contribution)
