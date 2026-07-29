import canonicalLaneMathlib.AdmissibleClass

/-!
# Optimal Control Package
-/

namespace HautevilleHouse
namespace HamiltonJacobiEquationsOptimalControlCanonicalLaneLean

structure OptimalControlPackage where
  controlSpace : Type u
  dynamics : Prop
  costFunctional : Prop
  optimalControlExists : Prop
  PontryaginMaximumPrinciple : Prop

structure OptimalControlEvidence (C : OptimalControlPackage) where
  optimalControlExistsClosed : C.optimalControlExists
  pontryaginMaximumPrincipleClosed : C.PontryaginMaximumPrinciple

def OptimalControlClosed (C : OptimalControlPackage) : Prop :=
  C.optimalControlExists ∧ C.PontryaginMaximumPrinciple

theorem optimal_control_closed_from_evidence
    (C : OptimalControlPackage) (E : OptimalControlEvidence C) :
    OptimalControlClosed C := by
  exact And.intro E.optimalControlExistsClosed E.pontryaginMaximumPrincipleClosed

end HamiltonJacobiEquationsOptimalControlCanonicalLaneLean
end HautevilleHouse
