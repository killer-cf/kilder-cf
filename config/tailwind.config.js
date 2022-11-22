const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.{js,jsx}',
    './app/views/**/*.{erb,haml,html,slim}'
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
        yellowtail: ['Yellowtail', 'cursive'],
        jamjure: ['Bai Jamjuree', 'sans-serif']
      },
      boxShadow: {
        'psn': '0 35px 60px -15px rgba(0, 0, 0, 0.3)',
      },
      colors: {
        'fpreto1': '#040406',
        'tpreto1': '#28282A',
        'fpreto2': '#030305',
        'tpreto2': '#32343a',
        'flaranja': '#c99760',
        'tlaranja': '#cd8239'
      },
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
  ]
}
