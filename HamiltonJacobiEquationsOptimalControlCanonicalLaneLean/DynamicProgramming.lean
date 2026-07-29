import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.HamiltonJacobiEquationsOptimalControlCanonicalLaneLean.HamiltonJacobiPDE

namespace HautevilleHouse
namespace HamiltonJacobiEquationsOptimalControlCanonicalLaneLean

structure DynamicProgrammingPackage {P : HamiltonJacobiPDEPackage} where
  bellmanPrinciple : Prop
  valueIteration : Prop
  convergenceResult : Prop

structure DynamicProgrammingEvidence {P : HamiltonJacobiPDEPackage} (D : DynamicProgrammingPackage P) where
  bellmanPrincipleClosed : D.bellmanPrinciple
  valueIterationClosed : D.valueIteration
  convergenceResultClosed : D.convergenceResult

def DynamicProgrammingClosed {P : HamiltonJacobiPDEPackage} (D : DynamicProgrammingPackage P) : Prop :=
  D.bellmanPrinciple ∧ D.valueIteration ∧ D.convergenceResult

theorem dynamic_programming_closed_from_evidence {P : HamiltonJacobiPDEPackage}
    (D : DynamicProgrammingPackage P) (E : DynamicProgrammingEvidence D) :
    DynamicProgrammingClosed D := by
  exact And.intro E.bellmanPrincipleClosed
    (And.intro E.valueIterationClosed E.convergenceResultClosed)

end HautevilleHouse
end HamiltonJacobiEquationsOptimalControlCanonicalLaneLean