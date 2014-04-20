setwd("d:/data-analysis/data-spec/dataclean/peer-assignment")

# read in all feature name
features = read.table("./Dataset/features.txt")
# head(features)
#to lower
features[,2]=tolower(features[,2])
#let's remove all '(,),-'
features[,2]=gsub("\\(|\\)|,|-","",features[,2])

head(features)

# activity name mapping
activity.mapping = read.table("./Dataset/activity_labels.txt")

mapping=function(index,mapped) {
  mapped[index,2]
}

#read in the train data
train.data = read.table("./Dataset/train/X_train.txt",row.names=NULL)
names(train.data)=features[,2]
train.activity.data = read.table("./Dataset/train/y_train.txt")
train.activity.data.1 = sapply(train.activity.data,mapping,mapped=activity.mapping)
names(train.activity.data)=c("activity")
train.subject.data = read.table("./Dataset/train/subject_train.txt")
names(train.subject.data)=c("subject")
train.data=cbind(train.subject.data,train.activity.data,train.data)


test.data = read.table("./Dataset/test/X_test.txt",row.names=NULL)
names(test.data)=features[,2]
test.activity.data = read.table("./Dataset/test/y_test.txt")
names(test.activity.data)=c("activity")
test.subject.data = read.table("./Dataset/test/subject_test.txt")
names(test.subject.data)=c("subject")
test.data=cbind(test.subject.data,test.activity.data,test.data)


full.data=rbind(train.data,test.data)


# get only the means

#get the mean and std measure filter
feature.filter = grep("mean|std",names(full.data))
# we need to have the subject and activity also
feature.filter=c(1,2,feature.filter)
data.mean.std = full.data[,feature.filter]


