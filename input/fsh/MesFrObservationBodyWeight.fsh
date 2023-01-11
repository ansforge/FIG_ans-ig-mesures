

Profile: MesFrObservationBodyWeight
Parent: $FrObservationBodyWeight
Id: mes-fr-observation-body-weight
Description: "Poids du patient"

* meta 1..1
* meta.source ^short = "Uri identifiant les systèmes tiers ayant envoyé la ressource. L’uri est sous la forme d’un oid : « urn:oid:xx.xx.xx »"
* meta.source ^definition = "Uri identifiant les systèmes tiers ayant envoyé la ressource. L’uri est sous la forme d’un oid : « urn:oid:xx.xx.xx »"
* meta.profile 1..*
* meta.profile = Canonical(mes-fr-observation-body-weight) (exactly)

* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #open
* extension ^min = 0
* extension contains mes-reason-for-measurement named MesReasonForMeasurement 0..1

* value[x] ^slicing.rules = #open
* value[x] only Quantity
* valueQuantity = http://unitsofmeasure.org#kg
* valueQuantity.system 1..
* valueQuantity.code 1..

* valueQuantity.code ^definition = "Quantity in \"kg\""

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