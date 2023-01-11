

Profile: MesObservationHeadCircumference
Parent: $vitalsigns
Id: mes-observation-head-circumference
* meta 1..
* meta.source ^short = "Uri identifiant les systèmes tiers ayant envoyé la ressource."
* meta.source ^definition = "Uri identifiant les systèmes tiers ayant envoyé la ressource.\r\nL’uri est sous la forme d’un oid : « urn:oid:xx.xx.xx »"
* meta.profile 1..*
* meta.profile = Canonical(mes-observation-head-circumference) (exactly)

* extension ^slicing.discriminator[0].type = #value
* extension ^slicing.discriminator[=].path = "url"
* extension ^slicing.rules = #open
* extension ^min = 0
* extension contains
    $workflow-supportingInfo named supportingInfo 0..1 and
    mes-reason-for-measurement named MesReasonForMeasurement 0..1
* extension[supportingInfo] ^isModifier = false
* extension[MesReasonForMeasurement] ^short = "Motif de la mesure"
* extension[MesReasonForMeasurement] ^definition = "Motif de la mesure"
* extension[MesReasonForMeasurement] ^isModifier = false

* code.coding ^slicing.discriminator[0].type = #value
* code.coding ^slicing.discriminator[=].path = "code"
* code.coding ^slicing.discriminator[+].type = #value
* code.coding ^slicing.discriminator[=].path = "system"
* code.coding ^slicing.rules = #open
* code.coding contains headCircumCode 1..1
* code.coding[headCircumCode].system 1..
* code.coding[headCircumCode].system = "http://loinc.org" (exactly)
* code.coding[headCircumCode].code 1..
* code.coding[headCircumCode].code = #8287-5 (exactly)

* subject only Reference($fr-core-patient)
* encounter only Reference($fr-core-encounter)
* performer only Reference(CareTeam or RelatedPerson or $fr-core-patient or $fr-core-practitioner or PractitionerRole or $fr-core-organization)

* value[x] only Quantity
* value[x] ^slicing.discriminator[0].type = #type
* value[x] ^slicing.discriminator[=].path = "$this"
* value[x] ^slicing.rules = #open
* valueQuantity only Quantity
* valueQuantity ^sliceName = "valueQuantity"
* valueQuantity = $UCUM#cm (exactly)
* valueQuantity.value 1..
* valueQuantity.unit 1..
* valueQuantity.system 1..
* valueQuantity.code 1..