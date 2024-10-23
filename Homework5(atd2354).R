#Import necessary packages
library(ggplot2)
library(readxl)

###Question 1:### 

#Import the player stats from Las Vegas Aces, Connecticut Sun, and New York Liberty
data <- read_excel("HW5_SDS313.xls")

#Change variable names so that they follow common convention
colnames(data) <- c("player", 
                    "age", 
                    "games", 
                    "games_started", 
                    "minutes_played", 
                    "field_goals", 
                    "field_goal_attempts", 
                    "field_goal_percentage", 
                    "three_pointers", 
                    "three_pointer_attempts", 
                    "three_point_percentage", 
                    "two_pointers", 
                    "two_pointer_attempts", 
                    "two_point_percentage", 
                    "free_throws", 
                    "free_throw_attempts", 
                    "free_throw_percentage", 
                    "offensive_rebounds", 
                    "defensive_rebounds", 
                    "total_rebounds", 
                    "assists", 
                    "steals", 
                    "blocks", 
                    "turnovers", 
                    "personal_fouls", 
                    "points")

###Question 2:###
data_ggplot <- ggplot(data)

#Create a graph of the distribution of number of 3-pointers made by players
data_ggplot + geom_histogram(aes(x =three_pointers), binwidth = 10, col ="black",fill ="darkred") +
  labs(title = "Distribution of 3-Pointers Made by Players", 
       x = "Number of 3-Pointers Made",
       y = "Count of Players")

###Question 3:###

#Set seed for reproducibility
set.seed(40) 
# Randomly choose an index
random_index <- sample(nrow(data), 1)
# Get the randomly chosen player's data
random_player <- data[random_index, ] 

#Create a graph that shows the relationship between the minutes played and total number of rebounds.  
data_ggplot + geom_point(aes(x=total_rebounds, y=minutes_played)) + 
  geom_point(data = random_player, aes(x=total_rebounds, y=minutes_played), col = "red") +
  annotate("text",x=random_player$total_rebounds, y=random_player$minutes_played, label=random_player$player, 
           vjust = -1, color = "red", size = 4) +
  labs(title = "Relationship Between Total Number of Rebounds and Minutes Played",
       x = "Number of Rebounds",
       y = "Minutes Played")

