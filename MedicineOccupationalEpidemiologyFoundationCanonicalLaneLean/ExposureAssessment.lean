import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineOccupationalEpidemiologyFoundationCanonicalLaneLean

structure ExposureAssessmentPackage where
  exposureMeasurement : Prop
  exposureDose : Prop
  exposureDuration : Prop
  exposureFrequency : Prop
  cumulativeExposure : Prop
  peakExposure : Prop
  biologicalMonitoring : Prop
  exposureModeling : Prop

def ExposureAssessmentClosed (E : ExposureAssessmentPackage) : Prop :=
  E.exposureMeasurement ∧ E.exposureDose ∧ E.exposureDuration ∧ E.exposureFrequency ∧
  E.cumulativeExposure ∧ E.peakExposure ∧ E.biologicalMonitoring ∧ E.exposureModeling

structure ExposureAssessmentEvidence (E : ExposureAssessmentPackage) where
  exposureMeasurementClosed : E.exposureMeasurement
  exposureDoseClosed : E.exposureDose
  exposureDurationClosed : E.exposureDuration
  exposureFrequencyClosed : E.exposureFrequency
  cumulativeExposureClosed : E.cumulativeExposure
  peakExposureClosed : E.peakExposure
  biologicalMonitoringClosed : E.biologicalMonitoring
  exposureModelingClosed : E.exposureModeling

theorem exposure_assessment_closed_from_evidence (E : ExposureAssessmentPackage)
    (Ev : ExposureAssessmentEvidence E) : ExposureAssessmentClosed E := by
  exact And.intro Ev.exposureMeasurementClosed
    (And.intro Ev.exposureDoseClosed
      (And.intro Ev.exposureDurationClosed
        (And.intro Ev.exposureFrequencyClosed
          (And.intro Ev.cumulativeExposureClosed
            (And.intro Ev.peakExposureClosed
              (And.intro Ev.biologicalMonitoringClosed Ev.exposureModelingClosed))))))

end MedicineOccupationalEpidemiologyFoundationCanonicalLaneLean
end HautevilleHouse
