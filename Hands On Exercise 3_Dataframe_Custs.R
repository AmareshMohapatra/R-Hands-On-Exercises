#Create a normally distributed variable for the income with specified mean and SD
norm_income=rnorm(10,mean=250000,sd=75000)

norm_income

#Create a 'gender' vector with 10 females
gender=c(rep("F",10))

i=sample(1:10,10,replace=FALSE)

#Distribution of 60% males and 40% females done below
for(q in 1:10){
  if(gender[i[q]] == "F" &&  q <= 4)
  {
    
  }
  else
    gender[i[q]] = c("M")
}
gender

Custs <-data.frame(ID=1:10,INCOME <- norm_income, GENDER = gender)
View(Custs)
#End
