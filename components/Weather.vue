<template>
  <div class="c-weather">
    <h1>Weather Data Exercises</h1>
    <button class="c-btn" @click="fetchWeather">Load Weather Data</button>
    <div v-if="weather" class="c-weather__grid">
      <div class="c-weather__item">
        <div class="c-weather__item--title">
          1. Daily Maximum and minimum Temperatures
        </div>
        <div v-for="hour in tempHours" :key="hour.id" class="text-base">
          <div>
            {{ hour.time }} / {{ hour.temp_c }}ºC /

            {{ hour.feelslike_c }}ºC
          </div>
        </div>
      </div>
      <div class="c-weather__item">
        <div class="c-weather__item--title">
          2. Hours With Specific Weather conditions
        </div>
        <div v-for="hour in tempHours" :key="hour.id">
          <div
            v-if="
              hour.condition.text.trim() === 'Clear' ||
              hour.condition.text.trim() === 'Sunny'
            "
          >
            {{ hour.time }} / {{ hour.temp_c }}ºC /
            {{ hour.condition.text }}
          </div>
        </div>
      </div>
      <div class="c-weather__item">
        <div class="c-weather__item--title">3. Daily Average Humidity</div>
        <div class="">Average Humidity {{ getDailyHumidity(tempHours) }}%</div>
      </div>
      <div class="c-weather__item">
        <div class="c-weather__item--title">4. Hours with High Wind Speed</div>
        <div v-for="wind in getHighWindSpeed(tempHours)" :key="wind.id">
          <div v-if="wind.wind_mph > 7">
            {{ wind.time }} / {{ wind.wind_mph }} mph / Wind Direction:
            {{ wind.wind_dir }}
          </div>
        </div>
      </div>
      <div class="c-weather__item">
        <div class="c-weather__item--title">5. Highest UV Index of the Day</div>
        <div class="">{{ getHighUv(tempHours) }}</div>
      </div>
      <div class="c-weather__item">
        <div class="c-weather__item--title">
          6. Morning and Afternoon Temperatures
        </div>
        <div class="">
          Average Morning Temp: {{ getMorningTemp(tempHours) }}ºC
        </div>
        <div class="">
          Average Afternoon Temp: {{ getAfternoonTemp(tempHours) }}ºC
        </div>
      </div>
      <div class="c-weather__item">
        <div class="c-weather__item--title">
          7. Morning and Afternoon Temperatures
        </div>
        <div class="">
          {{ getLowVisibility(tempHours) }}
        </div>
        <div class="">{{ getMediumVisibility(tempHours) }}</div>
        <div class="">{{ getHighVisibility(tempHours) }}</div>
      </div>
    </div>
    <div v-else class="py-2">Please click the button for load info</div>
  </div>
</template>
<script lang="ts">
interface WeatherItems {
  time: Date
  temp_c: number
  feelslike_c: number
  humidity: number
  uv: number
  vis_km: number
}
interface WeatherObject {
  forecast: {
    forecastday: Array<{
      hour: WeatherItems[]
    }>
  }
}
export default {
  data() {
    return {
      weather: null as WeatherObject | null,
      tempHours: [] as WeatherItems[],
    }
  },
  methods: {
    async fetchWeather() {
      try {
        const response = await fetch(
          `https://api.weatherapi.com/v1/forecast.json?key=bac548c0946b45a9afd213913240411&q=London&days=1&aqi=no&alerts=no`
        )
        this.weather = await response.json()
        this.tempHours = this.weather.forecast.forecastday[0].hour
      } catch (error) {
        console.error(
          'No ha funcionado como se esperaba, vuelve a internarlo este es el error:',
          error
        )
      }
    },
    getDailyHumidity(hours: WeatherItems[]): number {
      let average: number = 0
      hours.forEach((element) => {
        average += element.humidity / hours.length
      })
      average = parseFloat(average.toFixed(2))
      return average
    },
    getHighWindSpeed(hours: WeatherItems[]): WeatherItems[] {
      const windHours: WeatherItems[] = []
      hours.forEach((element) => {
        windHours.push(element)
      })
      return windHours
    },
    getHighUv(hours: WeatherItems[]): string {
      let highUv: WeatherItems = { uv: 0 } as WeatherItems
      hours.forEach((element) => {
        if (element.uv > highUv.uv) {
          highUv = element
        }
      })
      return 'Highest UV Index: ' + highUv.uv + ' at ' + highUv.time
    },
    getMorningTemp(hours: WeatherItems[]): number {
      let date: Date
      let hour: number
      let i: number = 0
      let average: number = 0
      hours.forEach((element) => {
        date = new Date(element.time)
        hour = date.getHours()
        if (hour >= 0 && hour < 6) {
          average += element.temp_c
          i++
        }
      })
      average = average / i
      return parseFloat(average.toFixed(2))
    },
    getAfternoonTemp(hours: WeatherItems[]): number {
      let date: Date
      let hour: number
      let i: number = 0
      let average: number = 0
      hours.forEach((element) => {
        date = new Date(element.time)
        hour = date.getHours()
        if (hour >= 12 && hour < 18) {
          average += element.temp_c
          i++
        }
      })
      average = average / i
      return parseFloat(average.toFixed(2))
    },
    getLowVisibility(hours: WeatherItems[]): string {
      let i = 0
      hours.forEach((element) => {
        if (element.vis_km < 5) {
          i++
        }
      })
      return 'Low Visibility (<5 km): ' + i + ' hours'
    },
    getMediumVisibility(hours: WeatherItems[]): string {
      let i = 0
      hours.forEach((element) => {
        if (element.vis_km > 5 && element.vis_km < 11) {
          i++
        }
      })
      return 'Medium  Visibility  (5-10 km): ' + i + ' hours'
    },
    getHighVisibility(hours: WeatherItems[]): string {
      let i = 0
      hours.forEach((element) => {
        if (element.vis_km > 10) {
          i++
        }
      })
      return 'High  Visibility  (>10 km): ' + i + ' hours'
    },
  },
}
</script>
