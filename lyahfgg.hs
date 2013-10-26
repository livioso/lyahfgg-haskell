(&&&) :: Bool -> Bool -> Bool
(&&&) True True = True
(&&&) _ _		= False

-- disjoint datatype 
data IntOrBool = BoolKind Bool | IntKind Integer deriving (Show)
getIntFromBoolOrBoolFromBool :: IntOrBool -> Integer
getIntFromBoolOrBoolFromBool (BoolKind a) = 1
getIntFromBoolOrBoolFromBool (IntKind a) = a


-- cart. pro. type
data Mercedes = C180 | C220 | C250 deriving (Show)
data CarColor = Red | Green | Yellow | Pink deriving (Show)
data MercedesDescription = MercedesDesc Mercedes CarColor deriving (Show)

isMyMercedesCool :: MercedesDescription -> String
isMyMercedesCool (MercedesDesc _ Pink) = "Dude WTF? A pink Mercedes?" -- The uncool guys 
isMyMercedesCool (MercedesDesc _ _) = "Wow, bro! Cool car." -- The cool guys

makeMyMercedesCool :: MercedesDescription -> MercedesDescription
makeMyMercedesCool (MercedesDesc a Pink) = MercedesDesc a Red
makeMyMercedesCool a					 = a


-- cart. pro. type mixed with non cart. pro. type
data ShapeType = Rectangle Integer Integer | Circle Integer | Point
calculateArea :: ShapeType -> Integer
calculateArea (Rectangle a b) = a * b
calculateArea (Circle r) = r * 3
calculateArea (Point) = 0


-- Maybe / Either
getTranslationIfPossible :: Maybe a -> Maybe b -> Maybe (a,b)
getTranslationIfPossible a Nothing =  Nothing
getTranslationIfPossible Nothing b =  Nothing
getTranslationIfPossible (Just a) (Just b) = Just(a, b)

-- Tuples, pairs and stuff
data TupleType a b = TupleData a b deriving (Show)

firsty :: (a, b) -> a
firsty (a, b) = a

-- Vector examples
normOfVector :: (Double, Double, Double) -> Double
normOfVector (x1, x2, x3) = sqrt(x1^2 + x2^2 + x3^2)

negateVector :: (Double, Double, Double) -> (Double, Double, Double)
negateVector (x1, x2, x3) = (-x1, -x2, -x3)

addVector :: (Double, Double, Double) -> (Double, Double, Double) -> (Double, Double, Double)
addVector (xa1, xa2, xa3) (xb1, xb2, xb3) = (xa1 + xb1, xa2 + xb2, xa3 + xb3)

-- Higher order functions
twice :: (Integer -> Integer) -> Integer -> Integer
twice f x = 2 * f(x)


-- curry and uncurry
ccurry :: ((a, b) -> f) -> a -> b -> f
ccurry f a b = f(a, b)

unccurry :: (a -> b -> f) -> ((a, b) -> f)
unccurry f(a, b) = f a b


-- (.), even, odd, not, b2i
punkt :: (c -> d) -> (b -> c) -> b -> d
punkt f g x = f(g x)

isEven :: Int -> Bool
isEven a = a `mod` 2 == 0

isOdd :: Int -> Bool
isOdd a = not (isEven a)

makeNot :: Bool -> Bool
makeNot True = False
makeNot False = True

b2i :: Bool -> Int
b2i True = 1
b2i False = 0

doFlip :: (a -> b -> f) -> (b -> a -> f)
doFlip f a b = f b a

data Vector = Vec2 Int Int | Vec3 Int Int Int deriving (Show)

plusV :: Vector -> Vector -> Vector
plusV (Vec2 a b) (Vec2 x y) = Vec2 (a+x) (b+y)
plusV (Vec3 a b c) (Vec3 x y z) = Vec3 (a+x) (b+y) (c+z)

negV :: Vector -> Vector
negV (Vec3 a b c) = Vec3 (-a) (-b) (-c)
negV (Vec2 a b) = Vec2 a b

minusV :: Maybe Vector -> Maybe Vector -> Maybe Vector
minusV (Just(Vec2 a b)) (Just(Vec2 x y)) = Just(Vec2 (a-x) (b-y))
minusV (Just(Vec3 a b c)) (Just(Vec3 x y z)) = Just(Vec3 (a-x) (b-y) (c-z))
minusV Nothing _ = Nothing
minusV _ Nothing = Nothing

main = do
	let myMercedes = MercedesDesc C180 Pink
	print (myMercedes)
	print (isMyMercedesCool myMercedes)
	let myNowCoolMercedes = (makeMyMercedesCool myMercedes)
	print (isMyMercedesCool myNowCoolMercedes)
	
	let me2 = ("Livio Bieri", 007)
	print (firsty me2)

	let me = TupleData "Livio Bieri" 17108623
	print(me)

	print(normOfVector (1,2,3))
	print(negateVector (1,2,3))
	print(addVector (1,2,3) (1,2,3))

	print(punkt id id 2)
	print((id.id) 2)

	print(isEven 1)
	print(isEven 2)

	print(isOdd 1)
	print(isOdd 2)

	let u = Vec3 1 2 3
	let v = Vec3 1 2 3
	print(plusV u v)
	print(negV u)
	print(minusV (Just u) (Just v))