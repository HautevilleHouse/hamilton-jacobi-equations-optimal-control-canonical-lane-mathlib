import HautevilleHouse.HamiltonJacobiEquationsOptimalControlCanonicalLaneLean.MathlibHamiltonJacobi

namespace HautevilleHouse
namespace HamiltonJacobiEquationsOptimalControlCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure AdmittedObject where
  stateSpace : Type
  dynamics : Type
  costFunctional : Prop
  valueFunction : Type
  conclusion : costFunctional → valueFunction

def HamiltonJacobiWitnessClosed (O : AdmittedObject) : Prop :=
  O.costFunctional

end HamiltonJacobiEquationsOptimalControlCanonicalLaneLean
end HautevilleHouse