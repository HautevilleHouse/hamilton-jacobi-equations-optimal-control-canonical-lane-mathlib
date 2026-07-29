import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.HamiltonJacobiEquationsOptimalControlCanonicalLaneLean.HamiltonJacobiPDE
import HautevilleHouse.HamiltonJacobiEquationsOptimalControlCanonicalLaneLean.OptimalControlBridge

namespace HautevilleHouse
namespace HamiltonJacobiEquationsOptimalControlCanonicalLaneLean

def HamiltonJacobiAdmissibleClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem hamilton_jacobi_admissible_endgame (A : AdmissibleClass) :
    HamiltonJacobiAdmissibleClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end HautevilleHouse.HamiltonJacobiEquationsOptimalControlCanonicalLaneLean
end HautevilleHouse
