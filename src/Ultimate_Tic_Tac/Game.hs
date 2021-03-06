module Game where

import Data.Array

data Player = PlayerX | PlayerO deriving (Eq, Show)
type Cell = Maybe Player
data PlayerA = Player_X | Player_O | Tie  deriving (Eq, Show)
type CellA = Maybe PlayerA
data State = Running | GameOver (Maybe PlayerA) deriving (Eq, Show)

-- | Stores 9 x 9 game board
type Board = Array (Int, Int) Cell

-- | Stores 3 x 3 Big Game Board
type BBoard = Array (Int,Int) CellA

-- | Stores Game State
data Game = Game { gameBoard :: Board
				 , bigBoard :: BBoard
				 , prevMove :: (Int,Int)
				 , currentBox :: (Int, Int)
                 , gamePlayer :: Player
                 , gameState :: State
                 , flag :: Int
                 } deriving (Eq, Show)

screenWidth :: Int
screenWidth = 540

screenHeight :: Int
screenHeight = 540

cellWidth :: Float
cellWidth = 60

cellHeight :: Float
cellHeight = 60

-- | Initial Game state
initialGame = Game { gameBoard = array indexRange $ zip (range indexRange) (repeat Nothing)
				   , bigBoard = array iRange $ zip (range iRange) (repeat Nothing)
				   , prevMove = (-1,-1)
				   , currentBox = (-1,-1)
                   , gamePlayer = PlayerX
                   , gameState = Running
                   , flag = 0
                   }
    where indexRange = ((0, 0), (8, 8))
    	  iRange = ((0,0),(2,2))