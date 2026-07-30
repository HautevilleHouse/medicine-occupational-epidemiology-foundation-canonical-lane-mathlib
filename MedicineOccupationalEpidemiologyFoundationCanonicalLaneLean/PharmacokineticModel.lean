import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineOccupationalEpidemiologyFoundationCanonicalLaneLean

structure PharmacokineticModelPackage where
  doseAmount : ℝ
  volumeDistribution : ℝ
  eliminationRate : ℝ
  absorptionRate : ℝ
  bioavailability : ℝ
  timePoints : List ℝ
  concentrationValues : List ℝ

structure PharmacokineticModelEvidence (P : PharmacokineticModelPackage) where
  dosePositive : P.doseAmount > 0
  volumePositive : P.volumeDistribution > 0
  eliminationPositive : P.eliminationRate > 0
  absorptionNonnegative : P.absorptionRate ≥ 0
  bioavailabilityBetween : 0 ≤ P.bioavailability ∧ P.bioavailability ≤ 1
  concentrationsNonnegative : ∀ c ∈ P.concentrationValues, c ≥ 0

def PharmacokineticModelClosed (P : PharmacokineticModelPackage) : Prop :=
  P.doseAmount > 0 ∧ P.volumeDistribution > 0 ∧ P.eliminationRate > 0 ∧ P.absorptionRate ≥ 0 ∧
  0 ≤ P.bioavailability ∧ P.bioavailability ≤ 1 ∧ (∀ c ∈ P.concentrationValues, c ≥ 0)

theorem pharmacokinetic_model_closed_from_evidence (P : PharmacokineticModelPackage) (E : PharmacokineticModelEvidence P) : PharmacokineticModelClosed P := by
  rcases E.bioavailabilityBetween with ⟨h1, h2⟩
  exact And.intro E.dosePositive (And.intro E.volumePositive (And.intro E.eliminationPositive (And.intro E.absorptionNonnegative (And.intro h1 (And.intro h2 E.concentrationsNonnegative)))))

end MedicineOccupationalEpidemiologyFoundationCanonicalLaneLean
end HautevilleHouse