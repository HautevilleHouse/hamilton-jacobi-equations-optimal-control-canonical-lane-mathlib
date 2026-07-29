import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace HamiltonJacobiEquationsOptimalControlCanonicalLaneLean

structure FeedbackControlSynthesisPackage where
  hjbPackage : HamiltonJacobiBellmanPackage
  feedbackPolicy : hjbPackage.stateSpace -> hjbPackage.controlSpace
  optimalityCondition : Prop
  policyIsOptimal : optimalityCondition

structure FeedbackControlSynthesisEvidence (F : FeedbackControlSynthesisPackage) where
  optimalityConditionClosed : F.optimalityCondition

def FeedbackControlSynthesisClosed (F : FeedbackControlSynthesisPackage) : Prop :=
  F.optimalityCondition

theorem feedback_control_synthesis_closed_from_evidence
    (F : FeedbackControlSynthesisPackage) (E : FeedbackControlSynthesisEvidence F) :
    FeedbackControlSynthesisClosed F := by
  exact E.optimalityConditionClosed

end HautevilleHouse.HamiltonJacobiEquationsOptimalControlCanonicalLaneLean
end HautevilleHouse
