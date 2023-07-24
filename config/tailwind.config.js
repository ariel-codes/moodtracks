const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
    content: ['./public/*.html', './app/helpers/**/*.rb', './app/javascript/**/*.js', './app/views/**/*.{erb,haml,html,slim}'],
    theme: {
        extend: {
            colors: {
                brand: {
                    '50': '#f4fcf1',
                    '100': '#e3fade',
                    '200': '#c8f3bf',
                    '300': '#a6eb99',
                    '400': '#68d553',
                    '500': '#41bb2c',
                    '600': '#329a1f',
                    '700': '#29791c',
                    '800': '#25601b',
                    '900': '#1f4f18',
                    '950': '#0c2b08',
                }
            }, fontFamily: {
                sans: ['Inter var', ...defaultTheme.fontFamily.sans],
            },
        },
    },
    plugins: [require('@tailwindcss/forms'), require('@tailwindcss/aspect-ratio'), require('@tailwindcss/typography'), require('@tailwindcss/container-queries'),]
}
