/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [],
  purge: [
    './components/**/*.{vue,js}',
    './layouts/**/*.vue',
    './pages/**/*.vue',
    './plugins/**/*.{js,ts}',
    './nuxt.config.{js,ts}',
  ],
  theme: {
    extend: {
      colors: {
        primary: {
          default: '#1C6758',
        },
        secondary: {
          default: '#3D8361',
        },
        tertiary: {
          default: '#D6CDA4',
        },
      },
    },
  },
  plugins: [],
}
