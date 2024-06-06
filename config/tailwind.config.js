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
      colors: {
        customColorFood: "#b09ac8",
        customColorNature: "#bad878",
        customColorCulture: "#e4f1b0",
        customColorHangout: "#a5cebb",
        customColorNightlife: "#eabcbc",
        customColorActivity: "#9db7c5"
      }
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
