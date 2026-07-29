import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace HamiltonJacobiEquationsOptimalControlCanonicalLaneLean

structure LaxOleinikSemigroupPackage where
  stateSpace : Type u
  semigroup : Type v
  costFunction : stateSpace → stateSpace → ℝ
  associativity : Prop
  identityElement : Prop
  continuity : Prop

structure LaxOleinikSemigroupEvidence (L : LaxOleinikSemigroupPackage) where
  stateSpaceDefined : L.stateSpace = L.stateSpace
  costFunctionDefined : L.costFunction = L.costFunction
  associativityClosed : L.associativity
  identityElementClosed : L.identityElement
  continuityClosed : L.continuity

def LaxOleinikSemigroupClosed (L : LaxOleinikSemigroupPackage) : Prop :=
  L.associativity ∧ L.identityElement ∧ L.continuity

theorem lax_oleinik_semigroup_closed_from_evidence (L : LaxOleinikSemigroupPackage) (E : LaxOleinikSemigroupEvidence L) : LaxOleinikSemigroupClosed L :=
  by
    exact And.intro E.associativityClosed (And.intro E.identityElementClosed E.continuityClosed)

end HautevilleHouse
end HamiltonJacobiEquationsOptimalControlCanonicalLaneLean