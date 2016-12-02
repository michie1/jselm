import Html exposing (..)
import Html.Events exposing (onClick)

main : Program Flags Model Msg
main =
    programWithFlags 
        { init = init
        , update = update
        , view = view
        , subscriptions = subscriptions
        }

type alias Flags =
    { counter : Int
    }

init : Flags -> ( Model, Cmd Msg )
init flags =
    ( flags.counter, Cmd.none )


type alias Model = Int

model : Model
model = 
    0


type Msg 
    = Increment
    | Decrement


update : Msg -> Model -> ( Model, Cmd Msg)
update msg model =
    case msg of
        Increment ->
            ( model + 1, Cmd.none )

        Decrement ->
            ( model - 1, Cmd.none )


view : Model -> Html Msg
view model =
    div []
        [ button [ onClick Decrement ] [ text "-" ]
        , div [] [ text (toString model) ]
        , button [ onClick Increment ] [ text "+" ]
        ]

subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch []
