module dependant where

data Gender : Set where
  male : Gender 
  female : Gender

data MaleNames : Set where
  john tom : MaleNames
  
data FemaleNames : Set where
  jill anne : FemaleNames 

NamesByGender : Gender →  Set 
NamesByGender male = MaleNames
NamesByGender female = FemaleNames 

--dependant type

f : (g : Gender) → NamesByGender g
f male = john   --    anne   wouldn't work
f female = anne

data Names : Set where
  anne john jill : Names 
  
data IsMale : Names → Set where 
  johnIsMale : IsMale john 
 
g : (a : Names) → IsMale a → Gender 
g .john johnIsMale = male   --.john = something which is automatically inferred (derived)

  

  



