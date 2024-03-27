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

#To calculate the rolling average of data in a time series model
df["P2"].rolling(168).mean()

![image](https://github.com/kamibrenda/Nairobi_Air_Watch/assets/42267047/2e91038b-e582-46cc-8b78-993fb7cf946e)

In a plot:  
fig, ax = plt.subplots(figsize=(15, 6))
df["P2"].rolling(168).mean().plot(ax=ax, ylabel="PM2.5", title="Weekly rolling average"); 
---semi-colon to surpress the text

![image](https://github.com/kamibrenda/Nairobi_Air_Watch/assets/42267047/0c377118-da14-4e04-9728-568b0b9fa6fc)

**Feature Engineering in a time series model**
1. Create a lag by assigning a column with prev column values i.e using the readings from the previous hour to predict the present reading(t-1)
      Equation: Ytarget = β0 + β1 Yt-1(lag of 1)

#to create a column with a lag
df["P2.L1"] = df["P2"].shift(1)

![image](https://github.com/kamibrenda/Nairobi_Air_Watch/assets/42267047/058593cc-10bb-4f9e-8f8c-723ad6b30e03)

#Autocorrelation plot
fig, ax = plt.subplots(figsize=(6, 6))
ax.scatter(x=df["P2.L1"], y=df["P2"])
ax.plot([0, 120],[0, 120], linestyle="--", color="orange")
plt.xlabel("P2.L1")
plt.ylabel("P2")
plt.title("PM2.5 Autocorrelation")

![image](https://github.com/kamibrenda/Nairobi_Air_Watch/assets/42267047/6b58f095-7a34-4fbb-b7f6-500cb4e21d92)


**Train-Test Split for Time Series**
 P2 = target
 P2.L1 = feature

 Time only goes forward- Thus a cut off split is recommended to split the data to test and train
 a line is put in moment in time within the analysis 
      - before line training data
      - after line testing data

