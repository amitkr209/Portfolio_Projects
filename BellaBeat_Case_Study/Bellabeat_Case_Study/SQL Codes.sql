-- check the number of unique Id in each table

SELECT DISTINCT Id
FROM `first - sandbox - 100001. Fitbit_data.dailyActivity_merged`

SELECT DISTINCT Id
FROM `first - sandbox - 100001. Fitbit_data.dailyCalories_merged`

SELECT DISTINCT Id
FROM `first - sandbox - 100001. Fitbit_data.dailyIntensities_merged`

SELECT DISTINCT Id
FROM `first - sandbox - 100001. Fitbit_data.dailySteps_merged`

SELECT DISTINCT Id
FROM `first - sandbox - 100001. Fitbit_data.sleepDay_merged`

SELECT DISTINCT Id
FROM `first - sandbox - 100001. weightLogInfo_merged`

Answer:
Result (distinct Id in each table):
33
33
33
33
24
8

-- For finding activity level and calories burnt

SELECT Id
 ,ActivityDate
 ,Calories
 ,TotalSteps
 ,TotalDistance
 ,TrackerDistance
 ,LoggedActivitiesDistance
 ,VeryActiveDistance
 ,ModeratelyActiveDistance
 ,LightActiveDistance
 ,SedentaryActiveDistance
 ,VeryActiveMinutes
 ,FairlyActiveMinutes
 ,LightlyActiveMinutes
 ,SedentaryMinutes
FROM `first - sandbox - 100001. Fitbit_data.dailyActivity_merged`
WHERE VeryActiveDistance + ModeratelyActiveDistance + LightActiveDistance <> 0
 AND VeryActiveMinutes + FairlyActiveMinutes + LightlyActiveMinutes <> 0
ORDER BY TotalSteps DESC;

-- For finding activity level and calories burnt

SELECT Id
	,ActivityDate
	,Calories
	,TotalSteps
	,TotalDistance
	,TrackerDistance
	,LoggedActivitiesDistance
	,(VeryActiveDistance + ModeratelyActiveDistance + LightActiveDistance) AS TotalActiveDistance
	,SedentaryActiveDistance
	,(VeryActiveMinutes + FairlyActiveMinutes + LightlyActiveMinutes) AS TotalActiveMinutes
	,SedentaryMinutes
FROM `first - sandbox - 100001. Fitbit_data.dailyActivity_merged`;

-- For finding relationship between activity level and sleep time

SELECT activity.Id
	,ActivityDate
	,Calories
	,TotalSleepRecords
	,TotalMinutesAsleep
	,TotalTimeInBed
	,TotalSteps
	,TotalDistance
	,TrackerDistance
	,LoggedActivitiesDistance
	,(VeryActiveDistance + ModeratelyActiveDistance) AS ActiveDistance
	,(LightActiveDistance + SedentaryActiveDistance) AS non_ActiveDistance
	,(VeryActiveMinutes + FairlyActiveMinutes) AS ActiveMinutes
	,(LightlyActiveMinutes + SedentaryMinutes) AS non_ActiveMinutes
FROM `first - sandbox - 100001. Fitbit_data.dailyActivity_merged` AS activity
INNER JOIN `first - sandbox - 100001. Fitbit_data.sleepDay_merged` AS sleep ON activity.Id = sleep.Id
	AND activity.ActivityDate = sleep.SleepDay;
  
  
-- For finding relationship between activiy and weight/BMI

SELECT activity.Id
	,Calories
	,BMI
	,TotalSteps
	,TotalDistance
	,TrackerDistance
	,LoggedActivitiesDistance
	,VeryActiveDistance
	,ModeratelyActiveDistance
	,LightActiveDistance
	,SedentaryActiveDistance
	,VeryActiveMinutes
	,FairlyActiveMinutes
	,LightlyActiveMinutes
	,SedentaryMinutes
FROM `first - sandbox - 100001. Fitbit_data.dailyActivity_merged` AS activity
INNER JOIN `first - sandbox - 100001. Fitbit_data.weightLogInfo_merged` AS weight ON activity.Id = weight.Id
	AND activity.ActivityDate = weight.DATE;

