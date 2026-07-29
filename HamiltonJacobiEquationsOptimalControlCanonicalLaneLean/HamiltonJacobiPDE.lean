import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace HamiltonJacobiEquationsOptimalControlCanonicalLaneLean

/-!
# Hamilton-Jacobi PDE Package

This module formalizes the Hamilton-Jacobi equation as an admissible-class package.
The classical Hamilton-Jacobi PDE is:
  ∂_t u + H(t, x, ∇_x u) = 0
with boundary condition u(0, x) = J(x). We capture the essential structure.
-/

structure HamiltonJacobiPDEPackage where
  stateSpace : Type u
  timeDomain : Type v
  valueFunction : stateSpace → timeDomain → Prop
  hamiltonian : stateSpace → (stateSpace → Prop) → Prop
  equation : Prop
  boundaryCondition : Prop
  viscositySolution : Prop

structure HamiltonJacobiPDEEvidence (H : HamiltonJacobiPDEPackage) where
  equationClosed : H.equation
  boundaryConditionClosed : H.boundaryCondition
  viscositySolutionClosed : H.viscositySolution

def HamiltonJacobiPDEClosed (H : HamiltonJacobiPDEPackage) : Prop :=
  H.equation ∧ H.boundaryCondition ∧ H.viscositySolution

theorem hamilton_jacobi_pde_closed_from_evidence
    (H : HamiltonJacobiPDEPackage) (E : HamiltonJacobiPDEEvidence H) :
    HamiltonJacobiPDEClosed H := by
  exact And.intro E.equationClosed (And.intro E.boundaryConditionClosed E.viscositySolutionClosed)

end HautevilleHouse.HamiltonJacobiEquationsOptimalControlCanonicalLaneLean
end HautevilleHouse
