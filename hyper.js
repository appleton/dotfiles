module.exports = {
  config: {
    // default font size in pixels for all tabs
    fontSize: 13,

    // font family with optional fallbacks
    fontFamily: 'Inconsolata-dz for powerline',

    // terminal cursor background color (hex)
    cursorColor: '#F81CE5',

    // color of the text
    foregroundColor: '#fff',

    // terminal background color
    backgroundColor: '#27292c',

    // border color (window, tabs)
    borderColor: '#555',

    // custom css to embed in the main window
    css: '',

    // custom css to embed in the terminal window
    termCSS: `
      .cursor-node {
        border: none !important;
        width: 1px !important;
        background-color: rgba(255, 255, 255, .6) !important;
      }

      x-screen {
        -webkit-font-smoothing: subpixel-antialiased !important;
      }

      x-screen > div {
        overflow: unset !important;
      }
    `,

    // custom padding (css format, i.e.: `top right bottom left`)
    padding: '12px 14px',

    // some color overrides. see http://bit.ly/29k1iU2 for
    // the full list
    colors: [
      '#000000',
      '#ff0000',
      '#33ff00',
      '#ffff00',
      '#0066ff',
      '#cc00ff',
      '#00ffff',
      '#d0d0d0',
      '#808080',
      '#ff0000',
      '#33ff00',
      '#ffff00',
      '#0066ff',
      '#cc00ff',
      '#00ffff',
      '#ffffff'
    ]
  },

  // a list of plugins to fetch and install from npm
  // format: [@org/]project[#version]
  // examples:
  //   `hyperpower`
  //   `@company/project`
  //   `project#1.0.1`
  plugins: ['hyperterm-snazzy', 'hyperterm-1password', 'hyperterm-title'],

  // in development, you can create a directory under
  // `~/.hyperterm_plugins/local/` and include it here
  // to load it and avoid it being `npm install`ed
  localPlugins: []
};
