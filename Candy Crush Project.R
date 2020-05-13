data <- read_csv("documents/candy_crush.csv")
head(data)
#count and display the number of unique players
print("Number of players:")
x <- c(data$player_id)
#subset of unique values, prints 'a' 'b'
unique(x)
#Number of unique values, prints 2
length(unique(x))
#Display the date range of the data
print("Period for which we have data:")
#Calculating level difficulty
difficulty <- data %>%
  group_by(level)%>%
  summarise(attempts = sum(num_attempts), wins = sum(num_success))%>%
  mutate(p_win = wins / attempts)
#Printing out the level difficulty
print("difficulty")
#Plotting the level difficulty profile
# Should our level designer worry about that a lot of 
# players will complete the episode in one attempt?
should_the_designer_worry = FALSE

ggplot(difficulty, aes(x = level, y = difficulty)) + geom_line()
#Adding points and a dashed lin
ggplot(difficulty, aes(x = level, y = difficulty))+ geom_line()  + geom_point() +
  geom_hline(yintercept = 0.1, linetype = 'dashed')
# Computing the standard error of p_win for each level
difficulty <- difficulty %>%
  mutate(error = sqrt(p_win * (1-p_win)/attempts))
# Adding standard error bars
ggplot(difficulty, aes(x = level, y = difficulty))+ geom_line()  + geom_point()+
  geom_hline(yintercept = 0.1, linetype = 'dashed')+
  geom_errorbar(aes(ymin = p_win - error, ymax = p_win + error))
# The probability of completing the episode without losing a single time
p <- prod(difficulty$p_win)

# Printing it out
p
data <- read_csv("documents/candy_crush.csv")
head(data)
#count and display the number of unique players
print("Number of players:")
x <- c(data$player_id)
#subset of unique values, prints 'a' 'b'
unique(x)
#Number of unique values, prints 2
length(unique(x))
#Display the date range of the data
print("Period for which we have data:")
#Calculating level difficulty
difficulty <- data %>%
  group_by(level)%>%
  summarise(attempts = sum(num_attempts), wins = sum(num_success))%>%
  mutate(p_win = wins / attempts)
#Printing out the level difficulty
print("difficulty")
#Plotting the level difficulty profile
ggplot(difficulty, aes(x = level, y = difficulty)) + geom_line()
#Adding points and a dashed lin
ggplot(difficulty, aes(x = level, y = difficulty))+ geom_line()  + geom_point() +
  geom_hline(yintercept = 0.1, linetype = 'dashed')
# Computing the standard error of p_win for each level
difficulty <- difficulty %>%
  mutate(error = sqrt(p_win * (1-p_win)/attempts))
# Adding standard error bars
ggplot(difficulty, aes(x = level, y = difficulty))+ geom_line()  + geom_point()+
  geom_hline(yintercept = 0.1, linetype = 'dashed')+
  geom_errorbar(aes(ymin = p_win - error, ymax = p_win + error))
# The probability of completing the episode without losing a single time
p <- prod(difficulty$p_win)

# Printing it out
p
# Should our level designer worry about that a lot of 
# players will complete the episode in one attempt?
should_the_designer_worry = FALSE
