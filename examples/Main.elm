module Main exposing (..)

import Css.File exposing (compile)
import Css.Normalize
import Html exposing (Html, div)
import Html.CssHelpers exposing (style)
import Html.Template exposing (view)


compiledCss : String
compiledCss =
    [ Css.Normalize.css ]
        |> Css.File.compile
        |> .css



-- VIEW


view : Html.Html msg
view =
    Html.div []
        [ Html.CssHelpers.style compiledCss
        , Html.Template.view
        ]



-- MAIN


main : Html msg
main =
    view
