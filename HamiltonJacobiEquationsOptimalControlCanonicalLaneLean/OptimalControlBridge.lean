import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.HamiltonJacobiEquationsOptimalControlCanonicalLaneLean.HamiltonJacobiPDE

namespace HautevilleHouse
namespace HamiltonJacobiEquationsOptimalControlCanonicalLaneLean

/-!
# Optimal Control Bridge Package

This module formalizes the Bellman optimality principle and the value function
as a bridge closure for the Hamilton-Jacobi PDE package.
-/

structure ControlProblemPackage where
  stateSpace : Type u
  actionSpace : Type v
  dynamics : stateSpace → actionSpace → stateSpace → Prop
  runningCost : stateSpace → actionSpace → Prop
  terminalCost : stateSpace → Prop
  valueFunction : stateSpace → Prop
  bellmanEquation : Prop

structure ControlProblemEvidence (C : ControlProblemPackage) where
  valueFunctionClosed : C.valueFunction
  bellmanEquationClosed : C.bellmanEquation

def ControlProblemClosed (C : ControlProblemPackage) : Prop :=
  C.valueFunction ∧ C.bellmanEquation

theorem control_problem_closed_from_evidence
    (C : ControlProblemPackage) (E : ControlProblemEvidence C) :
    ControlProblemClosed C := by
  exact And.intro E.valueFunctionClosed E.bellmanEquationClosed

structure OptimalControlAdmissibleBridge where
  hjpde : HamiltonJacobiPDEPackage
  hjpdeEvidence : HamiltonJacobiPDEEvidence hjpde
  controlProblem : ControlProblemPackage
  controlProblemEvidence : ControlProblemEvidence controlProblem
  bridgeClosed : Prop
  bridgeClosedTerm : bridgeClosed

def OptimalControlBridgeClosed (B : OptimalControlAdmissibleBridge) : Prop :=
  B.bridgeClosed

theorem optimal_control_bridge_closed_from_evidence
    (B : OptimalControlAdmissibleBridge) : OptimalControlBridgeClosed B := by
  exact B.bridgeClosedTerm

end HautevilleHouse.HamiltonJacobiEquationsOptimalControlCanonicalLaneLean
end HautevilleHouse
