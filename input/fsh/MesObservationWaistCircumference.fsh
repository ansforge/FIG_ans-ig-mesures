

Profile: MesObservationWaistCircumference
Parent: $vitalsigns
Id: mes-observation-waist-circumference
* meta 1..
* meta.source ^short = "Uri identifiant les systèmes tiers ayant envoyé la ressource. L’uri est sous la forme d’une oid : « urn:oid:xx.xx.xx »"
* meta.source ^definition = "Uri identifiant les systèmes tiers ayant envoyé la ressource. L’uri est sous la forme d’une oid : « urn:oid:xx.xx.xx »"
* meta.profile 1..*
* meta.profile = Canonical(mes-observation-waist-circumference) (exactly)

* extension ^slicing.discriminator[0].type = #value
* extension ^slicing.discriminator[=].path = "url"
* extension ^slicing.rules = #open
* extension ^min = 0
* extension contains
    $workflow-supportingInfo named supportingInfo 0..1 and
    mes-reason-for-measurement named ENS_ReasonForMeasurement 0..1

* extension[MesReasonForMeasurement] ^short = "Motif de la mesure"
* extension[MesReasonForMeasurement] ^definition = "Motif de la mesure\r\nTexte libre (ex. surpoids ou obésité, diabète, maladie du cœur et des vaisseaux, tabac…)"

* code.coding ^slicing.discriminator[0].type = #value
* code.coding ^slicing.discriminator[=].path = "code"
* code.coding ^slicing.discriminator[+].type = #value
* code.coding ^slicing.discriminator[=].path = "system"
* code.coding ^slicing.rules = #open

* code.coding contains WaistCircumferenceCode 1..1
* code.coding[WaistCircumferenceCode].system 1..
* code.coding[WaistCircumferenceCode].code 1..
* code.coding[WaistCircumferenceCode] = http://loinc.org#8280-0 (exactly)

* subject only Reference($fr-core-patient)
* encounter only Reference($fr-core-encounter)
* performer only Reference(CareTeam or RelatedPerson or $fr-core-patient or $fr-core-practitioner or PractitionerRole or $fr-core-organization)

* value[x] only Quantity
* valueQuantity = http://unitsofmeasure.org#cm
* valueQuantity.system 1..
* valueQuantity.code 1..

* dataAbsentReason.coding.system 1..
* dataAbsentReason.coding.code 1..

* bodySite ^short = "Non utilisé"
* bodySite ^definition = "Non utilisé"

* method ^short = "Non utilisé"
* method ^definition = "Non utilisé"

* device only Reference($PhdDevice)
* device ^short = "Dispositif utilisé pour l'observation"
* device ^definition = "Dispositif utilisé pour l'observation\r\nSi la mesure a été faite par un objet connecté (Profil PhdDevice)\r\n=>cette référence est obligatoire"

* referenceRange.appliesTo ^short = "Non utilisé"
* referenceRange.appliesTo ^definition = "Non utilisé"

* hasMember ^short = "Non utilisé"
* hasMember ^definition = "Non utilisé"

* derivedFrom ^short = "Non utilisé"
* derivedFrom ^definition = "Non utilisé"