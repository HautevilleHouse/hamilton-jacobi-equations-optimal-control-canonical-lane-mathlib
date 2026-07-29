import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace HamiltonJacobiEquationsOptimalControlCanonicalLaneLean

structure HamiltonJacobiInequalityPackage where
  hjbPackage : HamiltonJacobiBellmanPackage
  hjiCondition : Prop
  dynamicProgrammingPrinciple : Prop
  hjiConditionHolds : hjiCondition
  dynamicProgrammingPrincipleHolds : dynamicProgrammingPrinciple

structure HamiltonJacobiInequalityEvidence (H : HamiltonJacobiInequalityPackage) where
  hjiConditionClosed : H.hjiCondition
  dynamicProgrammingPrincipleClosed : H.dynamicProgrammingPrinciple

def HamiltonJacobiInequalityClosed (H : HamiltonJacobiInequalityPackage) : Prop :=
  H.hjiCondition ∧ H.dynamicProgrammingPrinciple

theorem hamilton_jacobi_inequality_closed_from_evidence
    (H : HamiltonJacobiInequalityPackage) (E : HamiltonJacobiInequalityEvidence H) :
    HamiltonJacobiInequalityClosed H := by
  exact And.intro E.hjiConditionClosed E.dynamicProgrammingPrincipleClosed

end HautevilleHouse.HamiltonJacobiEquationsOptimalControlCanonicalLaneLean
end HautevilleHouse
