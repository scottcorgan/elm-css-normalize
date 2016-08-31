module Css.Normalize exposing (css)

{-| This library is mostly a direct port of [normalize.css](https://github.com/necolas/normalize.css).
Compile it with your elm-css code to have easier cross-browser styling experience.

# Normalizing css
@docs css

-}


import Css exposing (..)
import Css.Elements exposing (..)
import Css.Namespace exposing (namespace)


{-| A [Stylesheet](https://github.com/rtfeldman/elm-css/blob/master/Tutorial.md) to rest values to make them more consistent across most browsers. You can
include this stylesheet in your elm-css compilation file.

    port module Stylesheets exposing (..)

    import String

    import Css exposing (..)
    import Css.File exposing (..)
    import Html exposing (div)
    import Html.App as Html

    import Css.Normalize
    import My.Styles

    port files : CssFileStructure -> Cmd msg


    styles : List Css.Stylesheet
    styles =
        [ Css.Normalize.css
        , My.Styles
        ]


    cssFiles : CssFileStructure
    cssFiles =
        toFileStructure [ ("dist/styles.css", compileMany styles) ]

    {- Helper function to compile many stylesheets -}
    compileMany : List Css.Stylesheet -> { warnings: List String, css: String }
    compileMany styles =
        let
            results =
                List.map Css.compile styles
        in
            { warnings = List.concatMap .warnings results
            , css = String.join "\n\n" (List.map .css results)
            }


    main : Program Never
    main =
        Html.program
            { init = ( (), files cssFiles )
            , view = \_ -> (div [] [])
            , update = \_ _ -> ( (), Cmd.none )
            , subscriptions = \_ -> Sub.none
            }
-}
css : Stylesheet
css =
    (Css.stylesheet << namespace "")
        [ html
            [ fontFamilies [ "sans-serif" ]
            , property "line-height" "1.15" -- lineHeight doesn't accept floats
            , property "-ms-text-size-adjust" "100%"
            , property "-webkit-text-size-adjust" "100%"
            ]
        , body [ margin zero ]
        , each [ article, (selector "aside") , footer, header, nav, section ]
            [ display block ]
        , h1
            [ fontSize (em 2)
            , margin2 (em 0.67) zero
            ]
        , selector "figcaption figure, main" [ display block ]
        , selector "figure" [ margin2 (em 1) (px 40) ]
        , hr
            [ boxSizing contentBox
            , height zero
            , overflow visible
            ]
        , pre
            [ fontFamilies [ "monospace", "monospace" ]
            , fontSize (em 1)
            ]
        , a
            [ backgroundColor transparent
            , property "-webkit-text-decoration-skip" "objects"
            , active
                [ property "outline-width" "0"
                ]
            , hover
                [ property "outline-width" "0"
                ]
            ]
        , selector "abbr[title]"
            [ property "border-bottom" "none" -- borderBottom doesn't accept none
            , textDecoration underline
            , textDecoration2 underline dotted
            ]
        , each [ selector "b", strong ] [ fontWeight inherit ]
        , each [ code, selector "kbd", selector "samp" ]
            [ fontFamilies [ "monospace", "monospace" ]
            , fontSize (em 1)
            ]
        , selector "dfn" [ fontStyle italic ]
        , selector "mark"
            [ backgroundColor (hex "ff0")
            , color (hex "000")
            ]
        , selector "small" [ fontSize (pct 80) ]
        , each [ selector "sub", selector "sup" ]
            [ fontSize (pct 75)
            , lineHeight zero
            , position relative
            , verticalAlign baseline
            ]
        , selector "sub" [ bottom (em -0.25) ]
        , selector "sup" [ top (em -0.5) ]
        , each [ audio, video ] [ display inlineBlock ]
        , selector "audio:not([controls])"
            [ display none
            , height zero
            ]
        , img [ borderStyle none ]
        , selector "svg:not(:root)" [ overflow hidden ]
        , each [ button, input, optgroup, select, selector "textarea" ]
            [ fontFamilies [ "sans-serif" ]
            , fontSize (pct 100)
            , property "line-height" "1.15" -- lineHeight doesn't allow floats
            , margin zero
            ]
        , each [ button, input ] [ overflow visible ]
        , each [ button, select ] [ property "text-transform" "none" ]
        , each
            [ button
            , selector "html [type=\"button\"]"
            , selector "[type=\"reset\"]"
            , selector "[type=\"submit\"]"
            ]
            [ property "-webkit-appearance" "button" ]
        , each
            [ selector "button::-moz-focus-inner"
            , selector "[type=\"button\"]::-moz-focus-inner"
            , selector "[type=\"reset\"]::-moz-focus-inner"
            , selector "[type=\"submit\"]::-moz-focus-inner"
            ]
            [ borderStyle none
            , padding zero
            ]
        , each
            [ selector "button::-moz-focusring"
            , selector "[type=\"button\"]::-moz-focusring"
            , selector "[type=\"reset\"]::-moz-focusring"
            , selector "[type=\"submit\"]::-moz-focusring"
            ]
            [ property "outline" "1px dotted ButtonText" ]
        , fieldset
            [ border3 (px 1) solid (hex "c0c0c0")
            , margin2 zero (px 2)
            , padding3 (em 0.35) (em 0.625) (em 0.75)
            ]
        , legend
            [ boxSizing borderBox
            , property "color" "inherit"
            , property "display" "table"
            , maxWidth (pct 100)
            , padding zero
            , property "white-space" "normal"
            ]
        , selector "progress"
            [ display inlineBlock
            , verticalAlign baseline
            ]
        , selector "textarea" [ overflow auto ]
        , each
            [ selector "[type=\"checkbox\"]"
            , selector "[type=\"radio\"]"
            ]
            [ boxSizing borderBox
            , padding zero
            ]
        , each
            [ selector "[type=\"number\"]::-webkit-inner-spin-button"
            , selector "[type=\"number\"]::-webkit-outer-spin-button"
            ]
            [ height auto ]
        , selector "[type=\"search\"]"
            [ property "-webkit-appearance" "textfield"
            , property "outline-offset" "-2px"
            ]
        , each
            [ selector "[type=\"search\"]::-webkit-search-cancel-button"
            , selector "[type=\"search\"]::-webkit-search-decoration"
            ]
            [ property "-webkit-appearance" "none" ]
        , selector "::-webkit-file-upload-button"
            [ property "-webkit-appearance" "button"
            , property "font" "inherit"
            ]
        , each [ selector "details", selector "menu" ] [ display block ]
        , selector "summary" [ property "display" "list-item" ]
        , canvas [ display inlineBlock ]
        , selector "template" [ display none ]
        , selector "[hidden]" [ display none ]
        ]
