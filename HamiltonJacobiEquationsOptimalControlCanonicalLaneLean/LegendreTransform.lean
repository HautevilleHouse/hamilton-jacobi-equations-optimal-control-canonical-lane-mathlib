import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace HamiltonJacobiEquationsOptimalControlCanonicalLaneLean

structure LegendreTransformPackage where
  originalFunction : ℝ → ℝ
  convexConjugate : ℝ → ℝ
  invertibilityCondition : Prop
  smoothnessProperties : Prop

structure LegendreTransformEvidence (L : LegendreTransformPackage) where
  invertibilityConditionClosed : L.invertibilityCondition
  smoothnessPropertiesClosed : L.smoothnessProperties

def LegendreTransformClosed (L : LegendreTransformPackage) : Prop :=
  L.invertibilityCondition ∧ L.smoothnessProperties

theorem legendre_transform_closed_from_evidence (L : LegendreTransformPackage) (E : LegendreTransformEvidence L) :
    LegendreTransformClosed L := by
  exact And.intro E.invertibilityConditionClosed E.smoothnessPropertiesClosed

end HautevilleHouse
end HamiltonJacobiEquationsOptimalControlCanonicalLaneLean