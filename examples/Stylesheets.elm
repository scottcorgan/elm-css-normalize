port module Stylesheets exposing (..)

import Css.File exposing (..)
import Html exposing (div)
import Css.Normalize


port files : CssFileStructure -> Cmd msg


cssFiles : CssFileStructure
cssFiles =
    toFileStructure [ ( "normalize.css", compile [ Css.Normalize.css ] ) ]


main : Program Never () msg
main =
    Html.program
        { init = ( (), files cssFiles )
        , view = \_ -> (div [] [])
        , update = \_ _ -> ( (), Cmd.none )
        , subscriptions = \_ -> Sub.none
        }
