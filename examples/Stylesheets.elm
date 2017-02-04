port module Stylesheets exposing (..)

import Css.File exposing (..)
import Html exposing (div)
import Css.Normalize


port files : CssFileStructure -> Cmd msg


cssFiles : CssFileStructure
cssFiles =
    toFileStructure [ ( "normalize.css", compile [ Css.Normalize.css ] ) ]


main : CssCompilerProgram
main =
    Css.File.compiler files cssFiles
