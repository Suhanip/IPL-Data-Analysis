library(igraph)
batting_data = read.csv("~/ipl_batsman.csv")
w0=-2
w1=1
w2=2
w3=3
w4=10
w5=8
w6=16
batting_data['rank_score1']=w6*batting_data$X50 + w5*batting_data$X100 + w4*batting_data$X6s + w3*batting_data$X6s + w2*batting_data$Ave + w1*batting_data$SR
R1 = batting_data[order(batting_data$rank_score1,decreasing = T),]
R1
R1[1:10]
R1[1:10,]
bowling_data = read.csv("~/ipl_bowler.csv")
bowling_data['WKTS/MAT'] = bowling_data$Wkts/bowling_data$Mat
wb0=4     #8
wb1=8    #16
wb2=4     #8
wb3=5    #10
wb4=4     #8
bowling_data['rank_score2']= wb1*bowling_data$X5 + wb2*bowling_data$X4 + wb3*bowling_data$`WKTS/MAT`- wb4*bowling_data$Econ
bowling_data['rank_score2'] = bowling_data['rank_score2'] + 100
R2 = bowling_data[order(bowling_data$rank_score2,decreasing = T),]
R2
R2[1:10,]
name <- c('AD Russell','CH Gayle','DA Warner','HH Pandya','KL Rahul','AB de Villiers','MS Dhoni','RR Pant','Q de Kock'','CA Lynn')
name <- c('AD Russell','CH Gayle','DA Warner','HH Pandya','KL Rahul','AB de Villiers','MS Dhoni','RR Pant','Q de Kock','CA Lynn')
barplot(R1$rank_score1[1:10],names.arg=name,xlab="Players",ylab="Rank score",col="blue",main="Batsman",border="red")
name <- c(R2$Player[1:10])
barplot(R2$rank_score2[1:10],names.arg=name,xlab="Players",ylab="Rank score",col="blue",main="Bowler",border="red")
boxplot(R2$rank_score2[1:10],xlab="Players",ylab="Rank score",col="blue",main="Bowler",border="red")
boxplot(R1$rank_score1[1:10],xlab="Players",ylab="Rank score",col="blue",main="Batsman",border="red")
cov(R1$rank_score1[1:10],R1$Runs[1:10])
cov(R2$rank_score2[1:10],R2$Runs[1:10])
cov(R2$rank_score2[1:10],R2$Wkts[1:10])
cor(R1$rank_score1[1:10],R1$Runs[1:10])
cor(R2$rank_score2[1:10],R2$Wkts[1:10])
