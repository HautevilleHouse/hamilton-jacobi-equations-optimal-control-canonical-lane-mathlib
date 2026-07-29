import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace HamiltonJacobiEquationsOptimalControlCanonicalLaneLean

structure OptimalControlPackage where
  hjbPackage : HamiltonJacobiBellmanPackage
  controlSet : Type v
  admissibleControls : Set (hjbPackage.controlSpace)
  existenceCondition : Prop
  existenceProof : existenceCondition

structure OptimalControlEvidence (O : OptimalControlPackage) where
  existenceConditionClosed : O.existenceCondition

def OptimalControlClosed (O : OptimalControlPackage) : Prop :=
  O.existenceCondition

theorem optimal_control_closed_from_evidence
    (O : OptimalControlPackage) (E : OptimalControlEvidence O) :
    OptimalControlClosed O := by
  exact E.existenceConditionClosed

end HautevilleHouse.HamiltonJacobiEquationsOptimalControlCanonicalLaneLean
end HautevilleHouse
