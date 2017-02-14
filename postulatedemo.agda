module postulatedemo where

data Colour : Set where
     red : Colour 
     green : Colour
     blue : Colour

data Bool : Set where
  true : Bool
  false : Bool


postulate A : Set
postulate B : Set
postulate C : Set
postulate f : A -> B -> C
--   f : A -> (B -> C)
postulate a : A
postulate b : B
postulate Nat : Set
postulate add : Nat -> Nat -> Nat
postulate  three : Nat



c : C
c = f a b

addthree : Nat -> Nat
addthree = add three

not : Bool → Bool -- '→' is input with '\to'
not true = false
not false = true

changeColour : Colour → Colour
changeColour red = green
changeColour green = red
changeColour blue = blue


test : Set
test = ?


test2 : Set
test2 = ?

