module.exports = {
  content: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.js'
  ],
  daisyui: {
    themes: [
      {
        mytheme: {
          "primary": "#6495ED",
          "secondary": "#FFCF25",
          "accent": "#85B6FF",
          "neutral": "#78716c",
          "base-100": "#FFFFFF",
          "info": "#f5f5f4",
          "success": "#85B6FF",
          "warning": "#facc15",
          "error": "#854d0e",
        },
      },
    ],
  },
  plugins: [require("daisyui")]
}
