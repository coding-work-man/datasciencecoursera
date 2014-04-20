# First you need to set your working directory to the directory where run_analysis.R is located
# setwd("d:/data-analysis/data-spec/dataclean/peer-assignment")

dataclean = function(filname="tidydata.txt") {

	# Step 1: read in the train data and test data 
	train.data = read.table("./Dataset/train/X_train.txt",row.names=NULL)
	test.data = read.table("./Dataset/test/X_test.txt",row.names=NULL)
	#combine the train data and test data
	full.data=rbind(train.data,test.data)

	# Step 2 : Get the activity for each observation and mapping it to activity name

	# read in the train avtivity
	train.activity.data = read.table("./Dataset/train/y_train.txt")

	# activity name mapping
	activity.mapping = read.table("./Dataset/activity_labels.txt")

	mapping=function(index,mapped) {
	  mapped[index,2]
	}
	train.activity.data = sapply(train.activity.data,mapping,mapped=activity.mapping)

	# do the same for test activity
	test.activity.data = read.table("./Dataset/test/y_test.txt")
	test.activity.data = sapply(test.activity.data,mapping,mapped=activity.mapping)

	# combine the activity together
	activity.data = rbind(train.activity.data,test.activity.data)

	# Step 3: read in the subject for each observation , then combine the train and test subject data
	train.subject.data = read.table("./Dataset/train/subject_train.txt")
	test.subject.data = read.table("./Dataset/test/subject_test.txt")
	#combine the train and test subject
	subject.data = rbind(train.subject.data,test.subject.data)

	# Step 4: Get the full data set ready

	# Now we can combin the subject, activity and the observed data together
	full.data = cbind(subject.data,activity.data,full.data)


	# Step 5: Renames the colnames according to feature_info.txt

	# read in all feature name
	features = read.table("./Dataset/features.txt")

	#to lower, feature name was in column 2
	features[,2]=tolower(features[,2])
	#add colnames for subject and activity also
	colnames = c("subject","activity",features[,2])
	#add column name for our dataset
	names(full.data) = colnames

	# Step 6:Filter only the mean and std features

	#get the mean and std measure filter
	feature.filter = grep("mean\\(\\)|std\\(\\)",names(full.data))
	# we need to have the subject and activity also
	feature.filter=c(1,2,feature.filter)
	# dataset with only mean and std,column names
	tidy.data = full.data[,feature.filter]

	#remove all '(,),-', make the column names tidy
	colnames =gsub("\\(|\\)|,|-","",names(tidy.data))
	names(tidy.data)= colnames
	#export the tidy data
	write.table(tidy.data,file=filename,col.names=colnames,row.names=F)

}