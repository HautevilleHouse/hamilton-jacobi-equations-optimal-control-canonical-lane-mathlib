import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace HamiltonJacobiEquationsOptimalControlCanonicalLaneLean

structure PontryaginMaximumPrinciplePackage where
  stateSpace : Type u
  controlSpace : Type v
  adjointEquation : Type w
  hamiltonian : Type z
  necessaryCondition : Prop
  sufficientCondition : Prop

structure PontryaginMaximumPrincipleEvidence (P : PontryaginMaximumPrinciplePackage) where
  necessaryConditionClosed : P.necessaryCondition
  sufficientConditionClosed : P.sufficientCondition

def PontryaginMaximumPrincipleClosed (P : PontryaginMaximumPrinciplePackage) : Prop :=
  P.necessaryCondition ∧ P.sufficientCondition

theorem pontryagin_maximum_principle_closed_from_evidence (P : PontryaginMaximumPrinciplePackage) (E : PontryaginMaximumPrincipleEvidence P) : PontryaginMaximumPrincipleClosed P :=
  by
    exact And.intro E.necessaryConditionClosed E.sufficientConditionClosed

end HautevilleHouse
end HamiltonJacobiEquationsOptimalControlCanonicalLaneLean