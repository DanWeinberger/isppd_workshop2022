ds1<-read.csv('./Data/PAHO all age cuts_SubChapters.csv')

##subset the data to select which age groups we want and to remove the subnational data

ds1<-ds1[grep('A',ds1$age_group, fixed=T),] #Filter to national level data

ds1<-ds1[grep('2-59m',ds1$age_group, fixed=T),] #select age group

unique(ds1$age_group)

## Select country
ds1 <- ds1[substr(ds1$age_group,1,2)=='ec',] #SELECT COUNTRY HERE

#Guyana: use this one instead:
#ds1<-read.csv('./time series data/quarterly_mortality_10_countries.csv')

ds1$date <- as.Date(ds1$monthdate, '%Y-%m-%d')

ds1 <- ds1[,c("age_group" ,"date", "J12_J18_prim","acm_noj_prim" )]
saveRDS(ds1, './Data/ec_2_59m.rds')
