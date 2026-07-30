import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineOccupationalEpidemiologyFoundationCanonicalLaneLean

structure CompartmentModelPackage where
  populationGroups : Type
  flowRates : Type
  initialConditions : Type
  differentialEquations : Prop
  conservationLaw : Prop
  equilibriumAnalysis : Prop
  stabilityConditions : Prop

def CompartmentModelClosed (C : CompartmentModelPackage) : Prop :=
  C.differentialEquations ∧ C.conservationLaw ∧ C.equilibriumAnalysis ∧ C.stabilityConditions

structure CompartmentModelEvidence (C : CompartmentModelPackage) where
  differentialEquationsClosed : C.differentialEquations
  conservationLawClosed : C.conservationLaw
  equilibriumAnalysisClosed : C.equilibriumAnalysis
  stabilityConditionsClosed : C.stabilityConditions

theorem compartment_model_closed_from_evidence (C : CompartmentModelPackage)
    (E : CompartmentModelEvidence C) : CompartmentModelClosed C := by
  exact And.intro E.differentialEquationsClosed
    (And.intro E.conservationLawClosed
      (And.intro E.equilibriumAnalysisClosed E.stabilityConditionsClosed))

end MedicineOccupationalEpidemiologyFoundationCanonicalLaneLean
end HautevilleHouse
