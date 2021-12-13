library(Hmisc)
df1 <- read.csv(file.choose(), header = TRUE, encoding="UTF-8", stringsAsFactors=FALSE) 
head(df1)
dim(df1)
View(df1)
nrow(df1)
names(df1)
df1_people <- df1$原告主体
describe(df1_people) 

# 一审、二审数量饼状图
library(dplyr)
df1_procedure <- df1$procedure 
df1_procedure_count <- df1$procedure %>% table()
df1_procedure_count
percentage1 <- df1_procedure_count %>% prop.table() %>% round(3)*100
txt1 <- paste0(names(df1_procedure_count), '\n', percentage1, '%')
pie(df1_procedure_count, labels = txt1)


# 一审、二审数量柱状图
df1_procedure_count %>% barplot()
# add colors and percentages
x_pos <- df1_procedure_count %>% barplot(axisname = F, main = 'Number of first trial and second trial', ylab = 'Frequency', col = c('pink', 'lightblue'))
text(x_pos, df1_procedure_count/2, labels = txt1, cex = 1)
