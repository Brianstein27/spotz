const defaultTheme = require("tailwindcss/defaultTheme");

module.exports = {
  content: [
    "./public/*.html",
    "./app/helpers/**/*.rb",
    "./app/javascript/**/*.js",
    "./app/views/**/*.{erb,haml,html,slim}",
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ["Inter var", ...defaultTheme.fontFamily.sans],
      },
      fontSize: {
        description: "12px",
        tag: "10px",
      },
      spacing: {
        bigcardheight: "288px",
        bigcardwidth: "340px",
      },
    },
  },
  plugins: [
    require("@tailwindcss/forms"),
    require("@tailwindcss/typography"),
    require("@tailwindcss/container-queries"),
    function ({ addVariant }) {
      addVariant('stars-rating', '& i:hover ~ i');
    },
    function ({ addVariant }) {
      addVariant('current-hover', '& i:hover');
    },
  ],
};
