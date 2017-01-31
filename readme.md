# Set of Common definitions for Backend Services

> Common definitions for writing backend services for Panoramic's websocket-based server architecture.

## Install

### Elm

Since the Elm Package Manager doesn't allow for Native code and most everything we write at Panoramic Software has some native code in it,
you have to install this library directly from GitHub, e.g. via [elm-github-install](https://github.com/gdotdesign/elm-github-install) or some equivalent mechanism. It's just not worth the hassle of putting libraries into the Elm package manager until it allows native code.

## Taggers

Taggers is a term that was used in Elm's codebase (in Effects Managers) and sort of stuck for us. It's effectively a `Msg Constructor function`.

Imagine the following:

```elm
type Msg =
	Message1
	Message2 String
	Message3 String Int
```

Here `Message1` is a Msg, i.e. it's not a tagger/constructor, since it has NO parameters.

`Message2`, however, is a tagger since it has the following signature:

```elm
String -> Msg
```

`Message "abc"` is a Msg since the constructor has all of its parameters.


`Message3` is also a tagger since it has the following signature:

```elm
String -> Int -> Msg
```
`Message3 "abc"` is still a tagger but with the following signature:

```elm
Int -> Msg
```

`Message3 "abc" 13` is a Msg since the constructor has all of its parameters.

#### ErrorTagger

Used to convey an error to the Parent (usually the Service is the Child and the Server is the Parent).

```elm
type alias ErrorTagger payload msg =
    ( ErrorType, payload ) -> msg
```

* `ErrorType` - See [elm-utils](https://github.com/panosoft/elm-utils#error)
* `payload` - This payload is Service Dependent. The key here is that a single parameter constructs a Msg.


#### LogTagger

Used to communicate to the Parent that the Child wants to Log a message with a specific `LogLevel`. Ultimately, the Server/App is the final destination and handler of Log Messages.

```elm

type alias LogTagger payload msg =
    ( LogLevel, payload ) -> msg
```

* `ErrorType` - See [elm-utils](https://github.com/panosoft/elm-utils#log)
* `payload` - This payload is Service Dependent. The key here is that a single parameter constructs a Msg.
