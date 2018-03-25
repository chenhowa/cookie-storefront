{-
   This modulue describes the overarching view reponsible
   for rendering the entire home page of the storefront
-}


module ImageGallery exposing (..)

import Html exposing (Html)
import Html.Attributes as Att
import Time exposing (Time, second)


main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }



-- MODEL


type alias Model =
    { time : Time
    , imageUrl : String
    }


placeholderImage : String
placeholderImage =
    "https://www.logobarproducts.com/media/catalog/product/cache/4/image/9df78eab33525d08d6e5fb8d27136e95/c/u/custom-pik-square-foam-coasters-logo-designer.jpg"


init : ( Model, Cmd Msg )
init =
    ( Model 0.0 placeholderImage, Cmd.none )



-- UPDATE


type Msg
    = Tick Time


interval : Float
interval =
    10000


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Tick newTime ->
            if (newTime - model.time > interval) then
                ( { model | time = newTime }, Cmd.none )
            else
                ( model, Cmd.none )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Time.every second Tick



-- VIEW


view : Model -> Html Msg
view model =
    Html.section
        []
        [ Html.p [] [ Html.text (toString model.time) ]
        , Html.div
            []
            [ Html.img
                [ Att.src model.imageUrl ]
                []
            ]
        ]
