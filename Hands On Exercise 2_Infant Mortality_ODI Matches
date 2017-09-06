#part 1
oecd_file <- read.csv(file="C:\Users\Amaresh-PC\Documents\Amma 2017\Data\DP_LIVE_08072017001946470.csv")
oecd_file_final <- head(oecd_file,-1)


#part 2

url = "https://en.wikipedia.org/wiki/India%E2%80%93Pakistan_cricket_rivalry"

cric_file=read_html(url)

#Parse the HTML file to get the table node and store it in a separate variable
table=html_nodes(cric_file,"table")

#Store the required table in a separate table variable
table_final<-html_table(table[2],fill=TRUE)

#Convert into a data frame for easy access
table.df <- as.data.frame(table_final)

#View the data frame
View(table.df)

ODI_wins = table.df$ODI[3]

cat("India won ",ODI_wins," ODIs against Pakistan")
