Alias: $FrObservationBodyWeight = http://interopsante.org/fhir/StructureDefinition/FrObservationBodyWeight
Alias: $ENS_ReasonForMeasurement = http://esante.gouv.fr/ci-sis/fhir/StructureDefinition/ENS_ReasonForMeasurement
Alias: $PhdDevice = http://hl7.org/fhir/uv/phd/StructureDefinition/PhdDevice
Alias: $JDV-J145-MethodBodyWeight-ENS = https://mos.esante.gouv.fr/NOS/JDV_J145-MethodBodyWeight-ENS/FHIR/JDV-J145-MethodBodyWeight-ENS

Profile: EnsFrObservationBodyWeight
Parent: $FrObservationBodyWeight
Id: EnsFrObservationBodyWeight
Description: "Poids du patient"
* ^meta.lastUpdated = "2022-08-02T10:13:10.4200798+00:00"
* ^status = #draft
* ^experimental = false
* ^date = "2022-08-02"
* meta 1..1
* meta.source ^short = "Uri identifiant les systèmes tiers ayant envoyé la ressource. L’uri est sous la forme d’un oid : « urn:oid:xx.xx.xx »"
* meta.source ^definition = "Uri identifiant les systèmes tiers ayant envoyé la ressource. L’uri est sous la forme d’un oid : « urn:oid:xx.xx.xx »"
* meta.profile 1..1
* meta.profile = "http://esante.gouv.fr/ci-sis/fhir/StructureDefinition/ENS_FrObservationBodyWeight" (exactly)
* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #open
* extension ^min = 0
* extension contains $ENS_ReasonForMeasurement named ENS_ReasonForMeasurement 0..1
* valueQuantity ^sliceName = "valueQuantity"
* valueQuantity.code = #kg (exactly)
* valueQuantity.code ^short = "\"kg\""
* valueQuantity.code ^definition = "\"kg\""
* dataAbsentReason.coding.system 1..
* dataAbsentReason.coding.code 1..
* method from $JDV-J145-MethodBodyWeight-ENS (required)
* method ^binding.description = "JDV_J145-MethodBodyWeight-ENS"
* device only Reference($PhdDevice)
* device ^short = "Dispositif utilisé pour l'observation"
* device ^definition = "Dispositif utilisé pour l'observation\nSi la mesure a été faite par un objet connecté (Profil PhdDevice)\n=>cette référence est obligatoire"
* referenceRange.appliesTo ^short = "Non utilisé"
* referenceRange.appliesTo ^definition = "Non utilisé"
* hasMember ^short = "Non utilisé"
* derivedFrom ^short = "Non utilisé"
* value[x] ^slicing.rules = #open