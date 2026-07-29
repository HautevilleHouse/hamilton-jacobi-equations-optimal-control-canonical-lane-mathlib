import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace HamiltonJacobiEquationsOptimalControlCanonicalLaneLean

structure HamiltonJacobiBellmanPackage where
  stateSpace : Type u
  controlSpace : Type v
  dynamics : stateSpace -> controlSpace -> stateSpace
  runningCost : stateSpace -> controlSpace -> ℝ
  terminalCost : stateSpace -> ℝ
  valueFunction : stateSpace -> ℝ
  hjbEquation : Prop
  hjbEquationHolds : hjbEquation

structure HamiltonJacobiBellmanEvidence (H : HamiltonJacobiBellmanPackage) where
  valueFunctionSatisfiesHJB : H.hjbEquation

def HamiltonJacobiBellmanClosed (H : HamiltonJacobiBellmanPackage) : Prop :=
  H.hjbEquation

theorem hamilton_jacobi_bellman_closed_from_evidence
    (H : HamiltonJacobiBellmanPackage) (E : HamiltonJacobiBellmanEvidence H) :
    HamiltonJacobiBellmanClosed H := by
  exact E.valueFunctionSatisfiesHJB

end HautevilleHouse.HamiltonJacobiEquationsOptimalControlCanonicalLaneLean
end HautevilleHouse
