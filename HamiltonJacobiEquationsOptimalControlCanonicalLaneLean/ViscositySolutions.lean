import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace HamiltonJacobiEquationsOptimalControlCanonicalLaneLean

structure ViscositySolutionPackage where
  valueFunction : Type u
  hjbEquation : Prop
  subsolutionProperty : Prop
  supersolutionProperty : Prop
  uniqueness : Prop
  comparisonPrinciple : Prop

structure ViscositySolutionEvidence (V : ViscositySolutionPackage) where
  valueFunctionDefined : V.valueFunction = V.valueFunction
  subsolutionPropertyClosed : V.subsolutionProperty
  supersolutionPropertyClosed : V.supersolutionProperty
  uniquenessClosed : V.uniqueness
  comparisonPrincipleClosed : V.comparisonPrinciple

def ViscositySolutionClosed (V : ViscositySolutionPackage) : Prop :=
  V.subsolutionProperty ∧ V.supersolutionProperty ∧ V.uniqueness ∧ V.comparisonPrinciple

theorem viscosity_solution_closed_from_evidence (V : ViscositySolutionPackage) (E : ViscositySolutionEvidence V) : ViscositySolutionClosed V :=
  by
    exact And.intro E.subsolutionPropertyClosed (And.intro E.supersolutionPropertyClosed (And.intro E.uniquenessClosed E.comparisonPrincipleClosed))

end HautevilleHouse
end HamiltonJacobiEquationsOptimalControlCanonicalLaneLean