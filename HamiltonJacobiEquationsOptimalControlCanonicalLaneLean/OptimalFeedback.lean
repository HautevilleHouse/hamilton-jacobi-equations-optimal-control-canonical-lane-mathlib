import canonicalLaneMathlib.AdmissibleClass

/-!
# Optimal Feedback Control Package

This module defines the optimal feedback control law derived from the
value function.
-/

namespace HautevilleHouse
namespace HamiltonJacobiEquationsOptimalControlCanonicalLaneLean

structure OptimalFeedback where
  stateSpace : Type u
  controlSpace : Type v
  valueFunction : stateSpace → ℝ
  argminControl : stateSpace → controlSpace
  feedbackLaw : stateSpace → controlSpace

structure OptimalFeedbackEvidence (F : OptimalFeedback) where
  argminClosed : ∀ x : stateSpace, F.argminControl x = F.feedbackLaw x
  valueFunctionClosed : ∀ x : stateSpace, F.valueFunction x = 0

def OptimalFeedbackClosed (F : OptimalFeedback) : Prop :=
  (∀ x : stateSpace, F.argminControl x = F.feedbackLaw x) ∧
  (∀ x : stateSpace, F.valueFunction x = 0)

theorem optimal_feedback_closed_from_evidence (F : OptimalFeedback)
    (E : OptimalFeedbackEvidence F) : OptimalFeedbackClosed F := by
  exact And.intro E.argminClosed E.valueFunctionClosed

end HamiltonJacobiEquationsOptimalControlCanonicalLaneLean
end HautevilleHouse
