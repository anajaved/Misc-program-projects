library ('ggplot2')
library("gridExtra")

setwd("~/Desktop")
df <- read.csv("Dataset1_AJ.csv", stringsAsFactors=FALSE)

#correcting errors
df[df=="Six"] <- 6
df[df=="Two"] <- 2
df$SocEmBAS[df$SocEmBAS=='Three']<-3
df[df=="Seven"] <- 7
df[df=="Four"] <- 4
df[df=="Eight"] <- 8
df[df=="Five"] <- 5
df[df=="-99.00" |df=="-99" |df=="-99.0" |df==-99 ] <- NaN
df[df==NA] <- NaN

options(digits=3)
df$MathBAS <- as.numeric(df$MathBAS)
df$Lang.LitBAS <- as.numeric(df$Lang.LitBAS)

df$SocEmBAS <- as.numeric(df$SocEmBAS)
df$SocEmMID <- as.numeric(df$SocEmMID)
df$SocEmOUT <- as.numeric(df$SocEmOUT)

#create table for only school A & ommited NA values 
schoolA<- subset(df, df$School=="A")
simplifiedA<- na.omit(schoolA)

summary(simplifiedA)
summary(df)
str(df)
str(simplifiedA$MathBAS)

#creating total average variables - Math/Lit/SocEm

simplifiedA$Math_avg <-rowMeans(simplifiedA[,9:11])
simplifiedA$Lang.Lit_avg <- rowMeans(simplifiedA[,12:14])
simplifiedA$SocEm_avg <- rowMeans(simplifiedA[,16:18])

#growth in Lit variable
simplifiedA$Lang.Lit_diff <- simplifiedA$Lang.LitOUT-simplifiedA$Lang.LitBAS

#statistics for Lit/Lang 
summary(simplifiedA$Lang.LitBAS)  
summary(simplifiedA$Lang.LitMID)
summary(simplifiedA$Lang.LitOUT)

#creating Lit/Lang histograms -> boxplots 
ggplot(aes(x=Lang.LitBAS, color=I("black"), fill=I("red")), data=simplifiedA) + 
  geom_histogram()  
ggplot(aes(x=Lang.LitMID, color=I("black"), fill=I("red")), data=simplifiedA) + 
  geom_histogram()  
ggplot(aes(x=Lang.LitOUT, color=I("black"), fill=I("red")), data=simplifiedA) + 
  geom_histogram() 

plot3 <- ggplot(aes(x="Outcome", y=Lang.LitOUT, color=I("black")), data=simplifiedA) + 
  geom_boxplot()+ scale_y_continuous(limits=c(-10,60)) +  theme(axis.title.x=element_blank())
plot1 <- ggplot(aes(x="Baseline", y=Lang.LitBAS, color=I("black")),  data=simplifiedA) + 
  geom_boxplot()+ scale_y_continuous(limits=c(-10,60)) +  theme(axis.title.x=element_blank())
plot2 <- ggplot(aes(x="Midyear", y=Lang.LitMID, color=I("black")),  data=simplifiedA) + 
  geom_boxplot()+ scale_y_continuous(limits=c(-10,60)) +  theme(axis.title.x=element_blank())

grid.arrange(plot1, plot2, plot3, nrow=1, top="School A: Yearily Lit/Lang Student Progress")

#growth of Lit/Lang scores over the year
ggplot(aes(x=Lang.Lit_diff), data=simplifiedA) + geom_histogram()

#breakdown of year's progress by subgroups (SPED, ELL, and Sex)
ggplot(aes(x=Lang.Lit_diff, fill=SPED, color=I("black")), data=simplifiedA) + geom_histogram()
ggplot(aes(x=Lang.Lit_diff, fill=ELL, color=I("black")), data=simplifiedA) + geom_histogram()
ggplot(aes(x=Lang.Lit_diff, fill=Sex, color=I("black")), data=simplifiedA) + geom_histogram()


# Math Progress over the year
m_plot3 <- ggplot(aes(x="Outcome", y=MathOUT, color=I("black")), data=simplifiedA) + geom_boxplot()+ scale_y_continuous(limits=c(-10,105)) +  theme(axis.title.x=element_blank())
m_plot1 <- ggplot(aes(x="Baseline", y=MathBAS, color=I("black")),  data=simplifiedA) + geom_boxplot()+ scale_y_continuous(limits=c(-10,105)) +  theme(axis.title.x=element_blank())
m_plot2 <- ggplot(aes(x="Midyear", y=MathMID, color=I("black")),  data=simplifiedA) + geom_boxplot()+ scale_y_continuous(limits=c(-10,105)) +  theme(axis.title.x=element_blank())

grid.arrange(m_plot1, m_plot2, m_plot3, nrow=1, top="School A: Yearily Math Student Progress")


# Socio/Emotional Progress over the year
s_plot3 <- ggplot(aes(x="Outcome", y=SocEmOUT, color=I("black")), data=simplifiedA) + geom_boxplot()+ scale_y_continuous(limits=c(0.5,5.5)) +  theme(axis.title.x=element_blank())
s_plot1 <- ggplot(aes(x="Baseline", y=SocEmBAS, color=I("black")),  data=simplifiedA) + geom_boxplot()+ scale_y_continuous(limits=c(0.5,5.5)) +  theme(axis.title.x=element_blank())
s_plot2 <- ggplot(aes(x="Midyear", y=SocEmMID, color=I("black")),  data=simplifiedA) + geom_boxplot()+ scale_y_continuous(limits=c(0.5,5.5)) +  theme(axis.title.x=element_blank())

grid.arrange(s_plot1, s_plot2, s_plot3, nrow=1, top="School A: Yearily Socio/Emotional Progress")

str(simplifiedA$SocEmMID)

#Growth facetwrap over Age, Gender, Classrooms

qplot(x=Lang.Lit_diff, data=simplifiedA, fill=I("#C70039"), color=I("black")) + 
  facet_wrap(~Grade) + xlim(-10, 45) + 
  labs(title = "Literature/Language Growth by Grades")

qplot(x=Lang.Lit_diff, data=simplifiedA, fill=I("#FFC300"), color=I("black")) + 
  facet_wrap(~Classroom)+ xlim(-10, 50) + 
  labs(title = "Literature/Language Growth by Classrooms")

qplot(x=Lang.Lit_diff, data=simplifiedA, fill=I("#3498DB"), color=I("black")) + 
  facet_wrap(~Sex)+ xlim(-10, 50) + 
  labs(title = "Literature/Language Growth by Gender")

#Part 3 of activity -- growth in Math variable
simplifiedA$Math_diff <- simplifiedA$MathOUT-simplifiedA$MathBAS
mean(simplifiedA$Math_diff)

t.test(simplifiedA$Math_diff ~ Sex, data=simplifiedA, mu=0)
qt(1-0.5*0.05, df=50)

cor.test(simplifiedA$MathBAS, simplifiedA$MathOUT, method="pearson")

ggplot(aes(x=MathBAS, y=MathOUT), data=simplifiedA) + geom_point() + geom_smooth(method = "lm", se = FALSE)
