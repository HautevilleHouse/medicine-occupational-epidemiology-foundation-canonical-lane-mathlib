import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineOccupationalEpidemiologyFoundationCanonicalLaneLean

structure ExposureResponsePackage where
  exposureLevel : ℝ
  responseRate : ℝ
  doseResponseCurve : ℝ → ℝ
  noObservedAdverseEffectLevel : ℝ
  benchmarkDose : ℝ

structure ExposureResponseEvidence (E : ExposureResponsePackage) where
  exposureNonnegative : E.exposureLevel ≥ 0
  responseBetween : 0 ≤ E.responseRate ∧ E.responseRate ≤ 1
  curveMonotonic : ∀ x y, x ≤ y → E.doseResponseCurve x ≤ E.doseResponseCurve y
  noaelPositive : E.noObservedAdverseEffectLevel > 0
  bmdPositive : E.benchmarkDose > 0

def ExposureResponseClosed (E : ExposureResponsePackage) : Prop :=
  E.exposureLevel ≥ 0 ∧ 0 ≤ E.responseRate ∧ E.responseRate ≤ 1 ∧
  (∀ x y, x ≤ y → E.doseResponseCurve x ≤ E.doseResponseCurve y) ∧
  E.noObservedAdverseEffectLevel > 0 ∧ E.benchmarkDose > 0

theorem exposure_response_closed_from_evidence (E : ExposureResponsePackage) (Ev : ExposureResponseEvidence E) : ExposureResponseClosed E := by
  rcases Ev.responseBetween with ⟨h1, h2⟩
  exact And.intro Ev.exposureNonnegative (And.intro h1 (And.intro h2 (And.intro Ev.curveMonotonic (And.intro Ev.noaelPositive Ev.bmdPositive))))

end MedicineOccupationalEpidemiologyFoundationCanonicalLaneLean
end HautevilleHouse