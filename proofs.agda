module proofs where 

-- A proof  program based around even numbers 

  data ℕ : Set where 
    zero : ℕ 
    suc : ℕ → ℕ

  _+_ : ℕ → ℕ → ℕ
  zero + n = n 
  (suc n) + m = suc (n + m)

  data _even : ℕ → Set where 
   ZERO : zero even 
   STEP : ∀ x → x even → suc (suc x) even 

proof₁ : suc (suc (suc (suc zero))) even
proof₁ = STEP (suc (suc zero)) (STEP zero ZERO) 
-- STEP { }1 { }2
--{ }1 is the number we must provide for x when applying the STEP constructor 
--{ }?2 proof obligation that shows 2 is even 


proof₂ : ℕ → ℕ
proof₂  ν = ν --\n.u

proof₂' : (A : Set) → A → A
proof₂' _ x = x
