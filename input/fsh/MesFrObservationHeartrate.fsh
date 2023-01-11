

Profile: MesFrObservationHeartrate
Parent: $FrObservationHeartrate
Id: mes-fr-observation-heartrate
* meta 1..
* meta.source ^short = "Uri identifiant les systèmes tiers ayant envoyé la ressource. L’uri est sous la forme d’un oid : « urn:oid:xx.xx.xx »"
* meta.source ^definition = "Uri identifiant les systèmes tiers ayant envoyé la ressource. L’uri est sous la forme d’un oid : « urn:oid:xx.xx.xx »"
* meta.profile 1..*
* meta.profile = Canonical(mes-fr-observation-heartrate) (exactly)

* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #open
* extension ^min = 0
* extension[levelOfExertion] ^sliceName = "levelOfExertion"
* extension[levelOfExertion] ^short = "Cette extension permet de définir le niveau d'effort (au repos, à l'effort, après l'effort) lors de la mesure de la fréquence respiratoire"
* extension[levelOfExertion] ^definition = "Cette extension permet de définir le niveau d'effort (au repos, à l'effort, après l'effort) lors de la mesure de la fréquence respiratoire"
* extension[levelOfExertion] ^min = 0
* extension[bodyPosition] ^sliceName = "bodyPosition"
* extension[bodyPosition] ^short = "La position du corps au moment de l'observation, par exemple debout, assis. A n'utiliser que lorsque la position du corps n'est pas pré-coordonnée dans le code d'observation."
* extension[bodyPosition] ^definition = "La position du corps au moment de l'observation, par exemple debout, assis. A n'utiliser que lorsque la position du corps n'est pas pré-coordonnée dans le code d'observation."
* extension[bodyPosition] ^min = 0
* extension contains mes-moment-of-measurement named MesMomentOfMeasurement 0..1
* extension[MesMomentOfMeasurement] ^short = "Moment de la mesure"
* extension[MesMomentOfMeasurement] ^definition = "Moment de la mesure\r\nTexte libre"

* dataAbsentReason.coding.system 1..
* dataAbsentReason.coding.code 1..

* bodySite ^short = "Non utilisé"
* bodySite ^definition = "Non utilisé"

* method from $JDV-J147-MethodHeartrate-ENS (required)
* method ^short = "Méthode de la mesure"
* method ^definition = "Méthode de la mesure"
* method ^binding.description = "JDV_J147-MethodHeartrate-ENS"

* device only Reference($PhdDevice)
* device ^short = "Dispositif utilisé pour l'observation"
* device ^definition = "Dispositif utilisé pour l'observation\r\nSi la mesure a été faite par un objet connecté (Profil PhdDevice)\r\n=>cette référence est obligatoire"

* referenceRange.appliesTo from $JDV-J148-ReferenceRangeAppliesTo-CISIS (required)
* referenceRange.appliesTo ^binding.description = "JDV_J148-ReferenceRangeAppliesTo-CISIS"
* referenceRange.appliesTo.coding.system 1..
* referenceRange.appliesTo.coding.code 1..

* hasMember ^short = "Non utilisé"
* hasMember ^definition = "Non utilisé"

* value[x] ^slicing.rules = #open