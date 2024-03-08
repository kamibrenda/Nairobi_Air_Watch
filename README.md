# Nairobi_Air_Watch
The project will focus on air quality data from Nairobi, Lagos, and Dar es Salaam and thereafter build a time seriesmodel to predict PM 2.5 readings throughout the day. 
The data set contains PM (particulate matter), temperature, and humidity readings taken with low-cost sensors. These sensors measure the concentration of PM in the air.



**CODES**
#To section the data to the intervals neeeeded to make the predictions for which we get the mean 
df["P2"].resample("1H").mean().head() 
![image](https://github.com/kamibrenda/Nairobi_Air_Watch/assets/42267047/dd3568da-3fed-44fa-a908-105fd75a04f3)

#To fill in missing values with the last value
df["P2"].resample("1H").mean().fillna(method="ffill").head()
![image](https://github.com/kamibrenda/Nairobi_Air_Watch/assets/42267047/0cee9bf5-c66b-4a27-9a6f-0139915a791c)

