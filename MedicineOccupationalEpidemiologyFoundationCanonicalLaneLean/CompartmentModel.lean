import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineOccupationalEpidemiologyFoundationCanonicalLaneLean

structure CompartmentModelPackage where
  compartments : Type u
  transitionRates : Type v
  basicReproductionNumber : Prop
  endemicEquilibrium : Prop
  epidemicThreshold : Prop

structure CompartmentModelEvidence (C : CompartmentModelPackage) where
  basicReproductionNumberClosed : C.basicReproductionNumber
  endemicEquilibriumClosed : C.endemicEquilibrium
  epidemicThresholdClosed : C.epidemicThreshold

def CompartmentModelClosed (C : CompartmentModelPackage) : Prop :=
  C.basicReproductionNumber ∧ C.endemicEquilibrium ∧ C.epidemicThreshold

theorem compartment_model_closed_from_evidence (C : CompartmentModelPackage)
    (E : CompartmentModelEvidence C) : CompartmentModelClosed C := by
  exact And.intro E.basicReproductionNumberClosed
    (And.intro E.endemicEquilibriumClosed E.epidemicThresholdClosed)

end MedicineOccupationalEpidemiologyFoundationCanonicalLaneLean
end HautevilleHouse
