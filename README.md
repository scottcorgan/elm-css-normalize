# elm-css-normalize

A port of normalize.css for elm-css.


## Usage

Import the `Css.Normalize` module in your Stylesheets.elm file (or where you are building your elm-css) and include `Css.Normalize.css` in your list of CSS. See the examples folder for two uses; as inline styles and as .css file.


## Development/Testing

Build a CSS file by running:

`elm-css examples/Stylesheets.elm`

Build an example HTML file with inline CSS by running:

`elm package install scottcorgan/elm-html-template && elm make examples/Main.elm`

Or using the reactor:

`elm package install scottcorgan/elm-html-template && elm reactor` then navigate to examples/Main.elm

Note that github.com/scottcorgan/elm-html-template is required for development/testing and has to be manually added.

