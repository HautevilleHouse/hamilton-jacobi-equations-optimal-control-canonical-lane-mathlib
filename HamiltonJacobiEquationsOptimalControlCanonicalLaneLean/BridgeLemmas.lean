import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace HamiltonJacobiEquationsOptimalControlCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  HamiltonJacobiWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end HamiltonJacobiEquationsOptimalControlCanonicalLaneLean
end HautevilleHouse
