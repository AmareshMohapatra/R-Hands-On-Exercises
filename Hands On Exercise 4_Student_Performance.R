#Q1 begins
#Get current working directory
getwd()

#Change the working directory to the the where datasets are present 
setwd("C:\Users\Amaresh-PC\Documents\Amma 2017\Data")

#Read the two datasets
d1=read.table("student-mat.csv",sep=";",header=TRUE)
d2=read.table("student-por.csv",sep=";",header=TRUE)

#Merge the two datasets
d3=merge(d1,d2,by=c("school","sex","age","address","famsize","Pstatus","Medu","Fedu","Mjob","Fjob","reason","nursery","internet"))

print(nrow(d3)) # 382 students

View(d1)
View(d3)
class(d3)

#Initialize the variables for mean grade for both males and females
female_mean_grade=0
male_mean_grade=0

for(i in 1:length(d3$G3.x))
{
  if(d3$sex[i]=="F")
  {  female_mean_grade = female_mean_grade + d3$G3.x[i] + d3$G3.y[i]
  }
  else
  {
    male_mean_grade = male_mean_grade + d3$G3.x[i] + d3$G3.y[i]
  }
}
male_mean_grade = male_mean_grade/length(d3$G3.x)
female_mean_grade = female_mean_grade/length(d3$G3.x)

male_mean_grade
female_mean_grade  


#Highest grades code

max_G1 = max(d3$G1.x + d3$G1.y)
max_G2 = max(d3$G2.x + d3$G2.y)
max_G3 = max(d3$G3.x + d3$G3.y)

for(j in 1:length(d3$G3.x))
{  
  if(d3$G1.x[j]+d3$G1.y[j] == max_G1)
  {Guardian_G1 = d3$guardian.x[j]
  Gender_G1 = d3$sex[j]
  }
}  
Guardian_G1
Gender_G1

for(j in 1:length(d3$G3.x))
{  
  if(d3$G2.x[j]+d3$G2.y[j] == max_G1)
  {Guardian_G2 = d3$guardian.x[j]
  Gender_G2 = d3$sex[j]
  }
}  
Guardian_G2
Gender_G2

for(j in 1:length(d3$G3.x))
{  
  if(d3$G3.x[j]+d3$G3.y[j] == max_G1)
  {Guardian_G3 = d3$guardian.x[j]
  Gender_G3 = d3$sex[j]
  }
}  
Guardian_G3
Gender_G3
#Q1 ends

#Q2 begins
d3$absences = d3$absences.x+d3$absences.y
    
d3$quartile <- with(d3, cut(absences, 
                 breaks=quantile(absences, probs=seq(0,1, by=0.25), na.rm=TRUE), 
                 include.lowest=TRUE))
quantile_data = quantile(d3$absences, seq(from = 0, to = 1, by = 0.2))


tapply(d3$absences, findInterval(d3$absences, quantile_data), mean)
#Q2 ends
