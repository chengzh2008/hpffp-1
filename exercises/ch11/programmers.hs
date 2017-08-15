data OperatingSystem
  = GnuPlusLinux
  | OpenBSDPlusNevermindJustBSDStill
  | Mac
  | Windows
  deriving (Eq, Show)

data ProgrammingLanguage
  = Haskell
  | Agda
  | Idris
  | Purescript
  deriving (Eq, Show)

data Programmer = Programmer
  { os :: OperatingSystem
  , lang :: ProgrammingLanguage
  } deriving (Eq, Show)

allOSes :: [OperatingSystem]
allOSes = [GnuPlusLinux, OpenBSDPlusNevermindJustBSDStill, Mac, Windows]

allLangs :: [ProgrammingLanguage]
allLangs = [Haskell, Agda, Idris, Purescript]

allProgrammers :: [Programmer]
allProgrammers = [Programmer x y | x <- allOSes, y <- allLangs]
