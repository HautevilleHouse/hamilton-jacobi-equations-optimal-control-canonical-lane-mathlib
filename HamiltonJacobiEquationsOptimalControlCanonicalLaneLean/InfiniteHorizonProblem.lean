import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace HamiltonJacobiEquationsOptimalControlCanonicalLaneLean

structure InfiniteHorizonProblemPackage where
  hjbPackage : HamiltonJacobiBellmanPackage
  discountRate : ℝ
  infiniteHorizonValueFunction : hjbPackage.stateSpace -> ℝ
  stationaryHJBEquation : Prop
  stationaryHJBEquationHolds : stationaryHJBEquation

structure InfiniteHorizonProblemEvidence (I : InfiniteHorizonProblemPackage) where
  stationaryHJBEquationClosed : I.stationaryHJBEquation

def InfiniteHorizonProblemClosed (I : InfiniteHorizonProblemPackage) : Prop :=
  I.stationaryHJBEquation

theorem infinite_horizon_problem_closed_from_evidence
    (I : InfiniteHorizonProblemPackage) (E : InfiniteHorizonProblemEvidence I) :
    InfiniteHorizonProblemClosed I := by
  exact E.stationaryHJBEquationClosed

end HautevilleHouse.HamiltonJacobiEquationsOptimalControlCanonicalLaneLean
end HautevilleHouse
