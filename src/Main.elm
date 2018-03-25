{-
   This modulue describes the overarching view reponsible
   for rendering the entire home page of the storefront
-}


module Main exposing (..)

import Html exposing (Html)
import Time exposing (Time, second)
import ImageGallery as ImG


main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }



-- MODEL


type alias Model =
    { username : String
    , password : String
    , time : Time
    }


init : ( Model, Cmd Msg )
init =
    ( Model "username" "password" 0.0, Cmd.none )



-- UPDATE


type Msg
    = Search
    | Tick Time
    | None


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Search ->
            ( model, Cmd.none )

        Tick time ->
            ( model, Cmd.none )

        None ->
            ( model, Cmd.none )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Time.every second Tick



-- VIEW


view : Model -> Html Msg
view model =
    Html.div
        []
        [ Html.nav
            []
            [ Html.div
                []
                [ Html.text "Home" ]
            , Html.div
                []
                [ Html.text "Baked Goods" ]
            , Html.div
                []
                [ Html.text "Cart" ]
            , Html.div
                []
                [ Html.text "About" ]
            , Html.div
                []
                [ Html.text "Login" ]
            ]
        , Html.section
            []
            []
        , Html.section
            []
            []
        ]
