# elm-css-normalize

A port of normalize.css for elm-css.


## Usage

Import the `Css.Normalize` module in your Stylesheets.elm file (or where you are building your elm-css) and include `Css.Normalize.css` in your list of CSS. See the examples folder for two uses; as inline styles and as .css file.


## Development/Testing

Build a CSS file by running:

`elm-css examples/Stylesheets.elm`

Build an example HTML file with inline CSS by running:

`elm make examples/Main.elm`

Or using the reactor:

`elm reactor` then navigate to examples/Main.elm

