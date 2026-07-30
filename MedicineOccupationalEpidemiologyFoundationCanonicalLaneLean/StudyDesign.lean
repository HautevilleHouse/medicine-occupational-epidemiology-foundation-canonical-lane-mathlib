import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineOccupationalEpidemiologyFoundationCanonicalLaneLean

structure StudyDesignPackage where
  cohortStudy : Prop
  caseControlStudy : Prop
  crossSectionalStudy : Prop
  randomizedControlledTrial : Prop
  sampleSizeCalculation : Prop
  randomizationProcedure : Prop
  blindingMethod : Prop
  confoundingControl : Prop
  biasMinimization : Prop

def StudyDesignClosed (S : StudyDesignPackage) : Prop :=
  S.cohortStudy ∧ S.caseControlStudy ∧ S.crossSectionalStudy ∧ S.randomizedControlledTrial ∧
  S.sampleSizeCalculation ∧ S.randomizationProcedure ∧ S.blindingMethod ∧
  S.confoundingControl ∧ S.biasMinimization

structure StudyDesignEvidence (S : StudyDesignPackage) where
  cohortStudyClosed : S.cohortStudy
  caseControlStudyClosed : S.caseControlStudy
  crossSectionalStudyClosed : S.crossSectionalStudy
  randomizedControlledTrialClosed : S.randomizedControlledTrial
  sampleSizeCalculationClosed : S.sampleSizeCalculation
  randomizationProcedureClosed : S.randomizationProcedure
  blindingMethodClosed : S.blindingMethod
  confoundingControlClosed : S.confoundingControl
  biasMinimizationClosed : S.biasMinimization

theorem study_design_closed_from_evidence (S : StudyDesignPackage)
    (E : StudyDesignEvidence S) : StudyDesignClosed S := by
  exact And.intro E.cohortStudyClosed
    (And.intro E.caseControlStudyClosed
      (And.intro E.crossSectionalStudyClosed
        (And.intro E.randomizedControlledTrialClosed
          (And.intro E.sampleSizeCalculationClosed
            (And.intro E.randomizationProcedureClosed
              (And.intro E.blindingMethodClosed
                (And.intro E.confoundingControlClosed E.biasMinimizationClosed)))))))

end MedicineOccupationalEpidemiologyFoundationCanonicalLaneLean
end HautevilleHouse
