module Services.Common.Taggers
    exposing
        ( ErrorTagger
        , LogTagger
        )

{-|
    Common Services definitions.

@docs ErrorTagger, LogTagger
-}

import Utils.Error exposing (..)
import Utils.Log exposing (..)


{-|
    Used to convey an error to the Parent (usually the Service is the Child and the Server is the Parent).
-}
type alias ErrorTagger payload msg =
    ( ErrorType, payload ) -> msg


{-|
    Used to communicate to the Parent that the Child wants to Log a message with a specific `LogLevel`.
    Ultimately, the Server/App is the final destination and handler of Log Messages.
-}
type alias LogTagger payload msg =
    ( LogLevel, payload ) -> msg
