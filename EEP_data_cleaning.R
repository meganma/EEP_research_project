eep_data <- read.csv("eep_deidentified_data.csv")
head(eep_data)

#create new data frame (committee_data) with separate rows for each committee
committee_data <- data.frame()
committee_names <- c("Active Minds",
                     "Body Image Task Force",
                     "Bruin Consent Coalition",
                     "Bruinecessities",
                     "Health Nutrition and Fitness",
                     "SEARCH",
                     "SHEP",
                     "Sexperts",
                     "HerCampus",
                     "Total Wellness")

for(j in committee_names){
  ##return index of all rows where committee name is in event name
  index <- grepl(pattern = j, eep_data$What.event.did.you.attend.)
  #create a new df with all rows from committee j
  tempdf <- eep_data[index,]
  tempdf <- cbind(tempdf, "committee" = c(j))
  #add new df to committee_df
  committee_data <- rbind(committee_data, tempdf)
}




