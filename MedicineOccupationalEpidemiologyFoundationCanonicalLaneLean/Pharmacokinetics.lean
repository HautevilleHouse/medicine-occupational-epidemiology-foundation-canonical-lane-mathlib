import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineOccupationalEpidemiologyFoundationCanonicalLaneLean

structure PharmacokineticsPackage where
  drugName : String
  absorptionRate : Prop
  distributionVolume : Prop
  eliminationHalfLife : Prop
  bioavailability : Prop
  clearance : Prop

structure PharmacokineticsEvidence (P : PharmacokineticsPackage) where
  absorptionRateClosed : P.absorptionRate
  distributionVolumeClosed : P.distributionVolume
  eliminationHalfLifeClosed : P.eliminationHalfLife
  bioavailabilityClosed : P.bioavailability
  clearanceClosed : P.clearance

def PharmacokineticsClosed (P : PharmacokineticsPackage) : Prop :=
  P.absorptionRate ∧ P.distributionVolume ∧ P.eliminationHalfLife ∧
  P.bioavailability ∧ P.clearance

theorem pharmacokinetics_closed_from_evidence (P : PharmacokineticsPackage)
    (E : PharmacokineticsEvidence P) : PharmacokineticsClosed P := by
  exact And.intro E.absorptionRateClosed
    (And.intro E.distributionVolumeClosed
      (And.intro E.eliminationHalfLifeClosed
        (And.intro E.bioavailabilityClosed E.clearanceClosed)))

end MedicineOccupationalEpidemiologyFoundationCanonicalLaneLean
end HautevilleHouse
