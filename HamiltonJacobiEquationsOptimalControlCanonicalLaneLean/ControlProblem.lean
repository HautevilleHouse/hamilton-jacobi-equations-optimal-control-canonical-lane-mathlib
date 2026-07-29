import canonicalLaneMathlib.AdmissibleClass

/-!
# Optimal Control Problem Package

This module encodes the optimal control problem structure.
-/

namespace HautevilleHouse
namespace HamiltonJacobiEquationsOptimalControlCanonicalLaneLean

structure ControlProblem where
  stateSpace : Type u
  controlSpace : Type v
  timeHorizon : ℝ
  initialCondition : stateSpace
  dynamics : stateSpace × controlSpace → stateSpace
  runningCost : stateSpace × controlSpace → ℝ
  terminalCost : stateSpace → ℝ
  admissibleControls : Set (ℝ → controlSpace)
  valueFunction : stateSpace → ℝ

structure ControlProblemEvidence (C : ControlProblem) where
  admissibleControlsClosed : C.admissibleControls.Nonempty
  valueFunctionClosed : C.valueFunction = C.terminalCost

def ControlProblemClosed (C : ControlProblem) : Prop :=
  C.admissibleControls.Nonempty ∧ C.valueFunction = C.terminalCost

theorem control_problem_closed_from_evidence (C : ControlProblem)
    (E : ControlProblemEvidence C) : ControlProblemClosed C := by
  exact And.intro E.admissibleControlsClosed E.valueFunctionClosed

end HamiltonJacobiEquationsOptimalControlCanonicalLaneLean
end HautevilleHouse
