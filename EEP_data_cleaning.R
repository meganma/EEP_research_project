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

#export committee_data
write.csv(committee_data, "committee_data.csv")

#rename committee_data columns
colnames(committee_data)[2] <- "Event Name"
colnames(committee_data)[3] <- "Gender"
colnames(committee_data)[5] <- "Race"
colnames(committee_data)[6] <- "Transfer Status"
colnames(committee_data)[4] <- "Sexual Orientation"
colnames(committee_data)

#making print the number of attendants at each committees' events
for(i in committee_names){
  #(i)
  #print(sum(committee_data[,14]==i))
  print(paste(i, "count: ",sum(committee_data[,14]==i)))
}

## cleaning race/ethnicity column
committee_data[committee_data$Race == "Asian, Middle Eastern",]$Race <- "Multiracial"
committee_data[committee_data$Race == "Asian, Middle Eastern, White",]$Race <- "Multiracial"
committee_data[committee_data$Race == "Asian, Middle Eastern, White",]$Race <- "Multiracial"
committee_data[committee_data$Race == "Asian, Native Hawaiian or Pacific Islander, White",]$Race <- "Multiracial"
committee_data[committee_data$Race == "Asian, White",]$Race <- "Multiracial"
committee_data[committee_data$Race == "biracial ",]$Race <- "Multiracial"
committee_data[committee_data$Race == "Hispanic or Latinx, White",]$Race <- "Multiracial"
committee_data[committee_data$Race == "Middle Eastern, White",]$Race <- "Multiracial"
committee_data[committee_data$Race == "Native American, White",]$Race <- "Multiracial"


#export committee_data
write.csv(committee_data, "committee_data_race.csv")

table(committee_data$Race)

