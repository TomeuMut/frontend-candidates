[![CircleCI](https://circleci.com/gh/nemolize/nuxt-todo/tree/master.svg?style=svg)](https://circleci.com/gh/nemolize/nuxt-todo/tree/master)
[![codecov](https://codecov.io/gh/nemolize/nuxt-todo/branch/master/graph/badge.svg)](https://codecov.io/gh/nemolize/nuxt-todo)


# Exercise 1

Create a todo list manager example like the one in

Mandatory:
- [x] Use Nuxt.js
- [x] Use Vuex
- [x] Persist data in LocalStorage
- [x] Add/Delete, and Toggle including confirm modal on delete
- [x] Use tailwind for styling
- [x] Use TypeScript
- [x] Responsive design

Optional:
- [x] Use Jest for testing (and create tests)
- [x] Use your own design and leave it as much beautiful as you can

##### Features
* Add/Delete, and Toggle including confirm modal on delete
* `Vuex` state management
* Persist data in `LocalStorage`

# Exercise 2

Create a weather app that shows the current weather in a city of your choice. You must need to include all this exercises:

### Daily Maximum and Minimum Temperatures:

- Exercise: Display a list of the forecasted maximum and minimum temperatures for each hour of the day in forecastday. The UI should show the time and temperatures in the format: Time: maxTemp / minTemp.

- Objective: Evaluate the ability to transform and extract specific data from the hour array.

### Hours with Specific Weather Conditions:

- Exercise: Filter all hours where the weather condition is "Clear" or "Sunny." Display the time and temperature for each.

- Objective: See if you can identify and filter elements within an array of objects with specific conditions.

### Daily Average Humidity:

- Exercise: Calculate and display the average humidity for the day based on the available hours in forecastday.

- Objective: Assess the ability to perform average calculations with reduce or similar methods.

### Hours with High Wind Speed:

- Exercise: Display the hours where the wind speed (in wind_mph) exceeds a specific value, for example, 7 mph. The UI should show the time, wind direction, and speed.

- Objective: Observe how you handle condition detection and extract information from nested objects.

### Highest UV Index of the Day:

- Exercise: Find the highest UV index recorded during the day and the hour it occurs. Display the time and UV index in the interface.

- Objective: Test your ability to find maximum values within an array and extract related information.

### Morning and Afternoon Temperatures:

- Exercise: Create a list with temperatures during the morning (12:00 am - 6:00 am) and afternoon (12:00 pm - 6:00 pm). Display the average temperature for each period.

- Objective: Evaluate your ability to segment data into different time intervals and calculate averages.

### Visibility Ranges:

- Exercise: Group hours into three visibility ranges: low (<5 km), medium (5-10 km), and high (>10 km). Display in the UI how many hours fall into each visibility range.
- Objective: Assess how you handle grouping data into categories.

Mandatory:
- [x] Use Nuxt.js
- [x] Use tailwind for styling
- [x] Use TypeScript
- [x] Responsive design

Optional:
- [x] Use Jest for testing (and create tests)
- [x] Use your own design and leave it as much beautiful as you can
- 
Demo:
https://frontend-exercise.remoteo.io/

Sources:
- https://api.weatherapi.com/v1/forecast.json?key=bac548c0946b45a9afd213913240411&q=London&days=1&aqi=no&alerts=no
    
## Clone

```bash
git@github.com:offUgo/frontend-candidates.git && cd frontend-candidates
```

## Build

```bash
# install dependencies
$ yarn install

# serve with hot reload at localhost:3000
$ yarn run dev

# generate static project
$ yarn run generate
```

