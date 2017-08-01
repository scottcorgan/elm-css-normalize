module Css.Normalize exposing (css, snippets)

{-| This library is mostly a direct port of [normalize.css](https://github.com/necolas/normalize.css) v7.0.0.
Compile it with your elm-css code to have easier cross-browser styling experience.


# Normalizing CSS Stylesheet

@docs css


# Css Snippets

@docs snippets

-}

import Css
import Css.Elements


{-| A [Stylesheet](https://github.com/rtfeldman/elm-css) to rest values to make them more consistent across most browsers. You can
include this stylesheet in your elm-css compilation file.

    port module Stylesheets exposing (..)

    import Css.File exposing (CssCompilerProgram, CssFileStructure)
    import MyCss

    port files : CssFileStructure -> Cmd msg

    fileStructure : CssFileStructure
    fileStructure =
        Css.File.toFileStructure
            [ ( "dist/styles.css"
              , Css.File.compile
                    [ Css.Normalize.css
                    , MyCss.css
                    ]
              )
            ]

    main : CssCompilerProgram
    main =
        Css.File.compiler files fileStructure

-}
css : Css.Stylesheet
css =
    Css.stylesheet snippets


{-| The snippets used to generate the normalizing stylesheet. Use this if you want to append
these to your own style sheet. This is useful if you prefer to use inline styles over
generator a stylesheet with the [elm-css preprocessor](https://www.npmjs.com/package/elm-css)

    module MyModule exposing (..)

    import Css exposing (..)
    import Css.Elements exposing (..)
    import Css.Namespace exposing (namespace)
    import Css.Normalize

    css : Css.Stylesheet
    css =
        (Css.stylesheet << namespace "my-styles") <|
            List.append
                Css.Normalize.snippets
                [ everything
                    [ boxSizing borderBox ]
                ]

-}
snippets : List Css.Snippet
snippets =
    -- 1. Correct the line height in all browsers.
    -- 2. Prevent adjustments of font size after orientation changes in IE on Windows Phone and in iOS.
    [ Css.Elements.html
        [ Css.lineHeight (Css.num 1.15) -- 1
        , Css.property "-ms-text-size-adjust" "100%" -- 2
        , Css.property "-webkit-text-size-adjust" "100%" -- 2
        ]

    --Remove the margin in all browsers (opinionated).
    , Css.Elements.body
        [ Css.margin Css.zero ]

    --Add the correct display in IE 9-.
    , Css.each
        [ Css.Elements.article
        , Css.Elements.typeSelector "aside"
        , Css.Elements.footer
        , Css.Elements.header
        , Css.Elements.nav
        , Css.Elements.section
        ]
        [ Css.display Css.block ]

    -- Correct the font size and margin on `h1` elements within `section` and `article` contexts in Chrome, Firefox, and Safari.
    , Css.Elements.h1
        [ Css.fontSize (Css.em 2)
        , Css.margin2 (Css.em 0.67) Css.zero
        ]

    --Add the correct display in IE 9-.
    -- 1. Add the correct display in IE.
    , Css.each
        [ Css.Elements.typeSelector "figcaption"
        , Css.Elements.typeSelector "figure"
        , Css.Elements.main_ -- 1
        ]
        [ Css.display Css.block ]

    --Add the correct margin in IE 8.
    , Css.Elements.typeSelector "figure"
        [ Css.margin2 (Css.em 1) (Css.px 40) ]

    -- 1. Add the correct box sizing in Firefox.
    -- 2. Show the overflow in Edge and IE.
    , Css.Elements.hr
        [ Css.boxSizing Css.contentBox -- 1
        , Css.height Css.zero -- 1
        , Css.overflow Css.visible -- 2
        ]

    -- 1. Correct the inheritance and scaling of font size in all browsers.
    -- 2. Correct the odd `em` font sizing in all browsers.
    , Css.Elements.pre
        [ Css.fontFamilies [ "monospace", "monospace" ] -- 1
        , Css.fontSize (Css.em 1) -- 2
        ]

    -- 1. Remove the gray background on active links in IE 10.
    -- 2. Remove gaps in links underline in iOS 8+ and Safari 8+.
    , Css.Elements.a
        [ Css.backgroundColor Css.transparent -- 1
        , Css.property "-webkit-text-decoration-skip" "objects" -- 2
        ]

    -- 1. Remove the bottom border in Chrome 57- and Firefox 39-.
    -- 2. Add the correct text decoration in Chrome, Edge, IE, Opera, and Safari.
    , Css.Elements.typeSelector "abbr[title]"
        [ Css.property "border-bottom" "none" -- 1
        , Css.textDecoration Css.underline -- 2
        , Css.textDecoration2 Css.underline Css.dotted -- 2
        ]

    -- Prevent the duplicate application of `bolder` by the next rule in Safari 6.
    , Css.each
        [ Css.Elements.typeSelector "b"
        , Css.Elements.strong
        ]
        [ Css.fontWeight Css.inherit ]

    -- Add the correct font weight in Chrome, Edge, and Safari.
    , Css.each
        [ Css.Elements.typeSelector "b"
        , Css.Elements.strong
        ]
        [ Css.fontWeight Css.bolder ]

    -- 1. Correct the inheritance and scaling of font size in all browsers.
    -- 2. Correct the odd `em` font sizing in all browsers.
    , Css.each
        [ Css.Elements.code
        , Css.Elements.typeSelector "kbd"
        , Css.Elements.typeSelector "samp"
        ]
        [ Css.fontFamilies [ "monospace", "monospace" ] -- 1
        , Css.fontSize (Css.em 1) -- 2
        ]

    -- Add the correct font style in Android 4.3-.
    , Css.Elements.typeSelector "dfn"
        [ Css.fontStyle Css.italic ]

    -- Add the correct background and color in IE 9-.
    , Css.Elements.typeSelector "mark"
        [ Css.backgroundColor (Css.hex "ff0")
        , Css.color (Css.hex "000")
        ]

    -- Add the correct font size in all browsers.
    , Css.Elements.small
        [ Css.fontSize (Css.pct 80) ]

    -- Prevent `sub` and `sup` elements from affecting the line height in all browsers.
    , Css.each
        [ Css.Elements.typeSelector "sub"
        , Css.Elements.typeSelector "sup"
        ]
        [ Css.fontSize (Css.pct 75)
        , Css.lineHeight Css.zero
        , Css.position Css.relative
        , Css.verticalAlign Css.baseline
        ]
    , Css.Elements.typeSelector "sub"
        [ Css.bottom (Css.em -0.25) ]
    , Css.Elements.typeSelector "sup"
        [ Css.top (Css.em -0.5) ]

    -- Add the correct display in IE 9-.
    , Css.each
        [ Css.Elements.audio
        , Css.Elements.video
        ]
        [ Css.display Css.inlineBlock ]

    -- Add the correct display in iOS 4-7.
    , Css.Elements.typeSelector "audio:not([controls])"
        [ Css.display Css.none
        , Css.height Css.zero
        ]

    -- Remove the border on images inside links in IE 10-.
    , Css.Elements.img
        [ Css.borderStyle Css.none ]

    -- Hide the overflow in IE.
    , Css.Elements.typeSelector "svg:not(:root)"
        [ Css.overflow Css.hidden ]

    -- 1. Change the font styles in all browsers (opinionated).
    -- 2. Remove the margin in Firefox and Safari.
    , Css.each
        [ Css.Elements.button
        , Css.Elements.input
        , Css.Elements.optgroup
        , Css.Elements.select
        , Css.Elements.textarea
        ]
        [ Css.fontFamily Css.sansSerif -- 1
        , Css.fontSize (Css.pct 100) -- 1
        , Css.lineHeight (Css.num 1.15) -- 1
        , Css.margin Css.zero -- 2
        ]

    -- Show the overflow in IE.
    -- 1. Show the overflow in Edge.
    , Css.each
        [ Css.Elements.button
        , Css.Elements.input -- 1
        ]
        [ Css.overflow Css.visible ]

    -- Remove the inheritance of text transform in Edge, Firefox, and IE.
    -- 1. Remove the inheritance of text transform in Firefox.
    , Css.each
        [ Css.Elements.button
        , Css.Elements.select -- 1
        ]
        [ Css.property "text-transform" "none" ]

    -- 1. Prevent a WebKit bug where (2) destroys native `audio` and `video` controls in Android 4.
    -- 2. Correct the inability to style clickable types in iOS and Safari.
    , Css.each
        [ Css.Elements.button
        , Css.Elements.typeSelector "html [type=\"button\"]" -- 1
        , Css.Elements.typeSelector "[type=\"reset\"]"
        , Css.Elements.typeSelector "[type=\"submit\"]"
        ]
        [ Css.property "-webkit-appearance" "button" -- 2
        ]

    -- Remove the inner border and padding in Firefox.
    , Css.each
        [ Css.Elements.typeSelector "button::-moz-focus-inner"
        , Css.Elements.typeSelector "[type=\"button\"]::-moz-focus-inner"
        , Css.Elements.typeSelector "[type=\"reset\"]::-moz-focus-inner"
        , Css.Elements.typeSelector "[type=\"submit\"]::-moz-focus-inner"
        ]
        [ Css.borderStyle Css.none
        , Css.padding Css.zero
        ]

    -- Restore the focus styles unset by the previous rule.
    , Css.each
        [ Css.Elements.typeSelector "button:-moz-focusring"
        , Css.Elements.typeSelector "[type=\"button\"]:-moz-focusring"
        , Css.Elements.typeSelector "[type=\"reset\"]:-moz-focusring"
        , Css.Elements.typeSelector "[type=\"submit\"]:-moz-focusring"
        ]
        [ Css.property "outline" "1px dotted ButtonText" ]

    -- Correct the padding in Firefox.
    , Css.Elements.fieldset
        [ Css.padding3 (Css.em 0.35) (Css.em 0.75) (Css.em 0.625) ]

    -- 1. Correct the text wrapping in Edge and IE.
    -- 2. Correct the color inheritance from `fieldset` elements in IE.
    -- 3. Remove the padding so developers are not caught out when they zero out `fieldset` elements in all browsers.
    , Css.Elements.legend
        [ Css.boxSizing Css.borderBox -- 1
        , Css.color Css.inherit -- 2
        , Css.display Css.table -- 1
        , Css.maxWidth (Css.pct 100) -- 1
        , Css.padding Css.zero -- 3
        , Css.property "white-space" "normal" -- 1
        ]

    -- 1. Add the correct display in IE 9-.
    -- 2. Add the correct vertical alignment in Chrome, Firefox, and Opera.
    , Css.Elements.progress
        [ Css.display Css.inlineBlock -- 1
        , Css.verticalAlign Css.baseline -- 2
        ]

    -- Remove the default vertical scrollbar in IE.
    , Css.Elements.textarea
        [ Css.overflow Css.auto ]

    -- 1. Add the correct box sizing in IE 10-.
    -- 2. Remove the padding in IE 10-.
    , Css.each
        [ Css.Elements.typeSelector "[type=\"checkbox\"]"
        , Css.Elements.typeSelector "[type=\"radio\"]"
        ]
        [ Css.boxSizing Css.borderBox -- 1
        , Css.padding Css.zero -- 2
        ]

    -- Correct the cursor style of increment and decrement buttons in Chrome.
    , Css.each
        [ Css.Elements.typeSelector "[type=\"number\"]::-webkit-inner-spin-button"
        , Css.Elements.typeSelector "[type=\"number\"]::-webkit-outer-spin-button"
        ]
        [ Css.height Css.auto ]

    -- 1. Correct the odd appearance in Chrome and Safari.
    -- 2. Correct the outline style in Safari.
    , Css.Elements.typeSelector "[type=\"search\"]"
        [ Css.property "-webkit-appearance" "textfield" -- 1
        , Css.outlineOffset (Css.px -2) -- 2
        ]

    -- Remove the inner padding and cancel buttons in Chrome and Safari on macOS.
    , Css.each
        [ Css.Elements.typeSelector "[type=\"search\"]::-webkit-search-cancel-button"
        , Css.Elements.typeSelector "[type=\"search\"]::-webkit-search-decoration"
        ]
        [ Css.property "-webkit-appearance" "none" ]

    -- 1. Correct the inability to style clickable types in iOS and Safari.
    -- 2. Change font properties to `inherit` in Safari.
    , Css.Elements.typeSelector "::-webkit-file-upload-button"
        [ Css.property "-webkit-appearance" "button" -- 1
        , Css.property "font" "inherit" -- 2
        ]

    -- Add the correct display in IE 9-.
    -- 1. Add the correct display in Edge, IE, and Firefox.
    , Css.each
        [ Css.Elements.typeSelector "details" -- 1
        , Css.Elements.typeSelector "menu"
        ]
        [ Css.display Css.block ]

    -- Add the correct display in all browsers.
    , Css.Elements.typeSelector "summary"
        [ Css.display Css.listItem ]

    -- Add the correct display in IE 9-.
    , Css.Elements.canvas
        [ Css.display Css.inlineBlock ]

    -- Add the correct display in IE.
    , Css.Elements.typeSelector "template"
        [ Css.display Css.none ]

    -- Add the correct display in IE 10-.
    , Css.Elements.typeSelector "[hidden]"
        [ Css.display Css.none ]
    ]
