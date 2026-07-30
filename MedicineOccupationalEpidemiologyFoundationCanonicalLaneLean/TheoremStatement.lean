import canonicalLaneMathlib.TheoremStatement

namespace HautevilleHouse
namespace MedicineOccupationalEpidemiologyFoundationCanonicalLaneLean

structure MedicineAdmittedObject where
  cohortData : Type
  endpointCondition : Prop
  conclusion : endpointCondition

def MedicineWitnessClosed (O : MedicineAdmittedObject) : Prop :=
  O.endpointCondition

end MedicineOccupationalEpidemiologyFoundationCanonicalLaneLean
end HautevilleHouse