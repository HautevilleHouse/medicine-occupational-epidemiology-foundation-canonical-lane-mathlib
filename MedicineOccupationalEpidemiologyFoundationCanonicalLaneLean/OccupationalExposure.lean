import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineOccupationalEpidemiologyFoundationCanonicalLaneLean

structure OccupationalExposurePackage where
  agentName : String
  exposureRoute : String
  exposureDuration : Prop
  exposureConcentration : Prop
  doseResponse : Prop
  occupationalLimit : Prop

structure OccupationalExposureEvidence (E : OccupationalExposurePackage) where
  exposureDurationClosed : E.exposureDuration
  exposureConcentrationClosed : E.exposureConcentration
  doseResponseClosed : E.doseResponse
  occupationalLimitClosed : E.occupationalLimit

def OccupationalExposureClosed (E : OccupationalExposurePackage) : Prop :=
  E.exposureDuration ∧ E.exposureConcentration ∧ E.doseResponse ∧ E.occupationalLimit

theorem occupational_exposure_closed_from_evidence (E : OccupationalExposurePackage)
    (Ev : OccupationalExposureEvidence E) : OccupationalExposureClosed E := by
  exact And.intro Ev.exposureDurationClosed
    (And.intro Ev.exposureConcentrationClosed
      (And.intro Ev.doseResponseClosed Ev.occupationalLimitClosed))

end MedicineOccupationalEpidemiologyFoundationCanonicalLaneLean
end HautevilleHouse
