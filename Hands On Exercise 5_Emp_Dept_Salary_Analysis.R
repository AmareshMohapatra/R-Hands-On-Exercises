library(data.table)
library(qdap)

getwd()

setwd("C:\Users\Amaresh-PC\Documents\Amma 2017\Data")

Emp <- read.csv('Emp.csv')
Dept <- read.csv('Dept.csv')

final <- merge(Emp, Dept, by = "DEPTNO")
View(final)

#Use aggregate() function to find the mean salary for each location
average_data <- aggregate(final[,'SAL'],list(Location = final$LOC), FUN = mean)

#Change the column name to 'Average salary'
colnames(average_data) <- c("Location", "Average salary")

#View the average salary by location
View(average_data)

#Use the lookup function which works similarly to Vlookup of Excel
#Add the manager name in a new column 'manager_name'
final$manager_name <- lookup(final$MGR, final[,2:3])

#List out the number of reportees for each manager
employee_count <- aggregate(final[,"manager_name"], list(final$manager_name), FUN = length)

#Change the column name to 'reporting_employees'
colnames(employee_count) <- c("manager_names", "reporting_employees")

#View the manager with the maximum number of reportees
employee_count[which.max(employee_count$reporting_employees),]

for(i in 1:nrow(final)) 
{
  if (final[i,4] == 'ANALYST'){                   #15% increment
    final[i,7] <- (final[i,7]*1.15)           
  }else if (final[i,4] == 'CLERK'){               #12.5% increment
         final[i,7] <- (final[i,7]*1.125)
  }else if (final[i,4] == 'MANAGER'){             #10.2% increment
         final[i,7] <- (final[i,7]*1.102)
  }else if (final[i,4] == 'PRESIDENT'){           #5.7% increment
         final[i,7] <- (final[i,7]*1.057)
  }else if(final[i,4] == 'SALESMAN'){
         final[i,7] <- (final[i,7]*1.133)
  }else{
    NULL
  }  
}
