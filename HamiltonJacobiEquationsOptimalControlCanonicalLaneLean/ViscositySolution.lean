import canonicalLaneMathlib.AdmissibleClass

/-!
# Viscosity Solution Package

This module defines viscosity solutions of Hamilton-Jacobi equations.
-/

namespace HautevilleHouse
namespace HamiltonJacobiEquationsOptimalControlCanonicalLaneLean

structure ViscositySolution where
  stateSpace : Type u
  hamiltonian : (stateSpace → ℝ) → stateSpace → ℝ
  subsolutionCondition : (stateSpace → ℝ) → Prop
  supersolutionCondition : (stateSpace → ℝ) → Prop
  viscositySolution : (stateSpace → ℝ) → Prop

structure ViscositySolutionEvidence (V : ViscositySolution) where
  subsolutionConditionClosed : ∀ (u : stateSpace → ℝ), V.subsolutionCondition u → V.viscositySolution u
  supersolutionConditionClosed : ∀ (u : stateSpace → ℝ), V.supersolutionCondition u → V.viscositySolution u

def ViscositySolutionClosed (V : ViscositySolution) : Prop :=
  ∀ (u : stateSpace → ℝ), (V.subsolutionCondition u ∧ V.supersolutionCondition u) → V.viscositySolution u

theorem viscosity_solution_closed_from_evidence (V : ViscositySolution)
    (E : ViscositySolutionEvidence V) : ViscositySolutionClosed V := by
  intro u ⟨hsub, hsup⟩
  exact E.subsolutionConditionClosed u hsub

end HamiltonJacobiEquationsOptimalControlCanonicalLaneLean
end HautevilleHouse
