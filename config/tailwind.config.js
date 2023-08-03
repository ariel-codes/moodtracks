// const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
    content: [
        './app/views/**/*.rb',
        './app/components/**/*.rb',
        './public/*.html',
        './app/helpers/**/*.rb',
        './app/javascript/**/*.js',
    ],
    theme: {
        extend: {
            colors: {
                brand: {
                    50: "#f3fff0",
                    100: "#D7F4D2",
                    200: "#AFEAA4",
                    300: "#86DF77",
                    400: "#5ED449",
                    500: "#41BB2C",
                    600: "#349523",
                    700: "#276F1A",
                    800: "#1A4A11",
                    900: "#0D2509",
                    950: "#040d03"
                }
            }, fontFamily: {
                sans: ['Exo 2', 'sans-serif'],
                display: ['Audiowide', 'sans-serif'],
            },
        },
    },
    plugins: [
        require('@tailwindcss/forms'),
        require('@tailwindcss/aspect-ratio'),
        require('@tailwindcss/typography'),
        require('@tailwindcss/container-queries'),
    ],
}
