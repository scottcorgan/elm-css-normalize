# elm-css-normalize

A port of normalize.css for elm-css.


## Documentation

See the package documentation at: http://package.elm-lang.org/packages/scottcorgan/elm-css-normalize/latest/Css-Normalize


## Development

Build a CSS file by running:

`cd examples && elm-css Stylesheets.elm`

Build an example HTML file with inline CSS by running:

`cd examples && elm package install && elm make Main.elm`

Or using the reactor:

`cd examples && elm package install && elm reactor` then click Main.elm in the browser.


## Testing

Compare the generated CSS file with the [original file](https://github.com/necolas/normalize.css) by running from the root directory:

`./tests/run-tests.sh`
