module Main exposing (main)

import Css.Normalize
import Html exposing (Html, div, text)
import Html.Template



-- VIEW


view : Html.Html msg
view =
    Html.div []
        [ Css.Normalize.css
        , Html.Template.view
        ]



-- MAIN


main : Html msg
main =
    view
