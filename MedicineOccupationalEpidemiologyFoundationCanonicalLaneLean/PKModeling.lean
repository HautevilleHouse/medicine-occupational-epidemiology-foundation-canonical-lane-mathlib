import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineOccupationalEpidemiologyFoundationCanonicalLaneLean

structure PKModelingPackage where
  compartmentCount : Nat
  absorptionRate : Type
  eliminationRate : Type
  volumeDistribution : Type
  doseSchedule : Prop
  firstOrderKinetics : Prop
  linearPharmacokinetics : Prop
  steadyStateReachable : Prop

structure PKModelingEvidence (P : PKModelingPackage) where
  doseScheduleClosed : P.doseSchedule
  firstOrderKineticsClosed : P.firstOrderKinetics
  linearPharmacokineticsClosed : P.linearPharmacokinetics
  steadyStateReachableClosed : P.steadyStateReachable

def PKModelingClosed (P : PKModelingPackage) : Prop :=
  P.doseSchedule ∧ P.firstOrderKinetics ∧ P.linearPharmacokinetics ∧ P.steadyStateReachable

theorem pk_modeling_closed_from_evidence (P : PKModelingPackage) (E : PKModelingEvidence P) :
    PKModelingClosed P := by
  exact And.intro E.doseScheduleClosed (
    And.intro E.firstOrderKineticsClosed (
      And.intro E.linearPharmacokineticsClosed E.steadyStateReachableClosed))

end MedicineOccupationalEpidemiologyFoundationCanonicalLaneLean
end HautevilleHouse