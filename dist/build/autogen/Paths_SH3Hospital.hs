module Paths_SH3Hospital (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch


version :: Version
version = Version {versionBranch = [0,1,0,0], versionTags = []}
bindir, libdir, datadir, libexecdir :: FilePath

bindir     = "/home/franza/.cabal/bin"
libdir     = "/home/franza/.cabal/lib/SH3Hospital-0.1.0.0/ghc-7.6.3"
datadir    = "/home/franza/.cabal/share/SH3Hospital-0.1.0.0"
libexecdir = "/home/franza/.cabal/libexec"

getBinDir, getLibDir, getDataDir, getLibexecDir :: IO FilePath
getBinDir = catchIO (getEnv "SH3Hospital_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "SH3Hospital_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "SH3Hospital_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "SH3Hospital_libexecdir") (\_ -> return libexecdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
