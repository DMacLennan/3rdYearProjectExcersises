module IPL where 

{-
this sectionshows how to  encode propositional logic into Agda’s type system. The correspondences discussed here between disjunction and sum types, conjunction and product types, functions and implication, and propositions and types are the fundamentals behind the Curry-Howard Correspondence. Using these tools, you can encode any constructive proof in Agda, which covers a vast range of possible proofs, including the vast majority of proofs encountered in program verification
-}
 
--Excersise from "Learn You an Agda"

--new data type parameterized by two propositions p and q which make up the components of the conjunction. Conjunction itself is a proposition and we give it the type Set
  data _∧_ (P : Set) (Q : Set) : Set where
    ∧-intro : P → Q → (P ∧ Q) 

--Now prove some some simple properties about conjunctions such as P ∧ Q ⇒ P (elimination rule)
proof₁ : {P Q : Set} → (P ∧ Q) → P
proof₁ (∧-intro p q) = p

proof₂ : {P Q : Set} → (P ∧ Q) → Q
proof₂ (∧-intro p q) = q

--Bijection definition - A ⇒ B ∧ B ⇒ A 
_⇔_ : (P : Set) → (Q : Set) → Set 
a ⇔ b = (a → b) ∧ (b → a)

--commutative property says that A ∧ B ⇔ B ∧ A
∧-comm' : {P Q : Set} → (P ∧ Q) → (Q ∧ P)
∧-comm' (∧-intro p q) = ∧-intro q p
-- ∧-comm'  (∧-intro p q) = ∧-intro q p

∧-comm : {P Q : Set} →  (P ∧ Q) ⇔ (Q ∧ P)
∧-comm =  ∧-intro ∧-comm'  ∧-comm' 

--proving ∧  associativity 
∧-assoc₁ : { P Q R : Set} → ((P ∧ Q) ∧ R) → (P ∧ (Q ∧ R))
∧-assoc₁ (∧-intro (∧-intro p q) r) = ∧-intro p (∧-intro q r)  -- (∧-intro (∧-intro p q ) r) = ∧-intro p (∧-intro q r)

∧-assoc₂ : { P Q R : Set } → (P ∧ (Q ∧ R)) → ((P ∧ Q) ∧ R)
∧-assoc₂ (∧-intro p (∧-intro q r)) = ∧-intro (∧-intro p q) r

∧-assoc : { P Q R : Set } → ((P ∧ Q) ∧ R) ⇔ (P ∧ (Q ∧ R))
∧-assoc = ∧-intro ∧-assoc₁ ∧-assoc₂  -- ∧-intro?   --  ∧-assoc₂

--Unlke conjunction (which is a pair) disjunction is a sum/either type as it only requires one proof in order to hold.
data _∨_ (P Q : Set)  : Set where 
     ∨-intro₁ : P → P ∨ Q     --2 const, one for each possible component 
     ∨-intro₂ : Q → P ∨ Q

--using the above we can come up with the disjunction elimination proof
-- ∀A B C ⇒ ((A ⇒ C) ∧ (B ⇒ C) ∧ (A ∨ B)) ⇒ C 
--if A implies C and B implies C and A is true or B is true then if follows that C is true 
∨-elim : {A B C : Set }→ (A → C) → (B → C) → (A ∨ B) → C
∨-elim ac bc (∨-intro₁ a) = ac a
∨-elim ac bc (∨-intro₂ b) = bc b  

--We can also prove the algabraic properties of disjunction such as commutativity
∨-comm' : {P Q : Set} → (P ∨ Q) → (Q ∨ P)
∨-comm' (∨-intro₁ p) = ∨-intro₂ p
∨-comm' (∨-intro₂ q) = ∨-intro₁ q

∨-comm : {P Q : Set} → (P ∨ Q) ⇔ (Q ∨ P)
∨-comm = ∧-intro ∨-comm' ∨-comm'


--associativity proof?




