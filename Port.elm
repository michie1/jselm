port module Port exposing (..)

import Html exposing (..)
import Html.Events exposing (onClick)

port toJS : String -> Cmd msg

port toElm : (String -> msg) -> Sub msg

main : Program Never Model Msg
main =
    program
        { init = init
        , update = update
        , view = view
        , subscriptions = subscriptions
        }

init : ( Model, Cmd Msg )
init =
    ( Model "default", Cmd.none )


type alias Model =
    { color : String
    }


type Msg
    = ToElm String
    | ToJS


update : Msg -> Model -> ( Model, Cmd Msg)
update msg model =
    case msg of
        ToElm color ->
            let
                bla = Debug.log "Elm: " color
            in
                ( { model | color = color }, Cmd.none )

        ToJS ->
            ( model, toJS "hoi" )


view : Model -> Html Msg
view model =
    div []
        [ div []
            [ text ("Color: " ++ model.color) ]
        , div []
            [ button [ onClick ToJS ] [ text "Change JS color to purple" ]
            ]
        ]

subscriptions : Model -> Sub Msg
subscriptions model =
    toElm ToElm
