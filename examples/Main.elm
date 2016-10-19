module Main exposing (..)

import Html exposing (..)
import Html.Template
import Html.App
import Html.CssHelpers
import Css.File
import Css.Normalize


main : Program Never
main =
    Html.App.beginnerProgram
        { model = {}
        , update = (\_ _ -> {})
        , view = view
        }


compiledCss : String
compiledCss =
    Css.Normalize.css
        |> Css.File.compile
        |> .css


view : a -> Html.Html b
view model =
    div []
        [ Html.CssHelpers.style compiledCss
        , Html.Template.view
        ]
