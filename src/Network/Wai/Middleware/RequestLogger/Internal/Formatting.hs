{- |
  Log message formatting functions
-}
module Network.Wai.Middleware.RequestLogger.Internal.Formatting
  ( buildLogMessage
  ) where

import Data.ByteString (ByteString)
import Data.Monoid ((<>))
import Data.UUID.Types (UUID)
import qualified Data.UUID.Types as UUID
import System.Log.FastLogger (LogStr, fromLogStr, toLogStr)

{- |
  Adds the user's account token to the log message
-}
buildLogMessage :: UUID -> LogStr -> ByteString
buildLogMessage token logStr =
  fromLogStr (addToken token logStr <> "\n")

addToken :: UUID -> LogStr -> LogStr
addToken token logStr =
  toLogStr (UUID.toASCIIBytes token) <> " " <> logStr
