

Profile: MesObservationGlucose
Parent: $vitalsigns
Id: mes-observation-glucose
Description: """Glycémie - profil créé pour l'alimentation de l'Espace Numérique de Santé.

Ce profil permet de gérer 4 types d'indicateurs de glycémie:
- le taux de glucose sanguin, mesuré en mg/dl
- le taux de glucose interstitiel, mesuré en mg/dl
- l’hémoglobine glyquée (Hb1Ac) mesurée en %
- l’index de gestion de glycémie (IGG) qui procure une estimation de l’HbA1c également mesuré en %

L'extension MesNumberOfDays permet de spécifier le nombre de jours dans la mesure du taux de glucose interstitiel et de l’index de gestion de glycémie (IGG) .

L'extension MesMomentOfMeasurement (contexte de la mesure) est utilisée dans le cas de la mesure du glucose sanguin."""
* meta 1..
* meta.profile 1..*
* meta.profile = Canonical(mes-observation-glucose) (exactly)

* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #open
* extension ^min = 0
* extension contains
    $workflow-supportingInfo named supportingInfo 0..1 and
    mes-reason-for-measurement named MesReasonForMeasurement 0..1 and
    mes-moment-of-measurement named MesMomentOfMeasurement 0..1 and
    mes-number-of-days named MesNumberOfDays 0..1 and
    mes-diabetis-type named MesDiabetisType 0..1
* extension[MesReasonForMeasurement] ^short = "Motif de la mesure"
* extension[MesReasonForMeasurement] ^definition = "Motif de la mesure\r\nTexte libre (ex. diabète, surpoids, maladie du cœur et des vaisseaux, cholestérol…)"

* extension[MesMomentOfMeasurement] ^short = "Moment de la mesure"
* extension[MesMomentOfMeasurement] ^definition = "Moment de la mesure"
* extension[MesMomentOfMeasurement].value[x] from $JDV-J157-MomentGlucose-ENS (required)
* extension[MesMomentOfMeasurement].value[x] ^binding.description = "JDV-J157-MomentGlucose-ENS"

* extension[MesNumberOfDays] ^short = "Nombre de jours"
* extension[MesNumberOfDays] ^definition = "Nombre de jours. \r\nUtilisé pour les mesures du taux de glucose interstitiel et l’index de gestion de glycémie."
* extension[MesNumberOfDays].value[x] 1..
* extension[MesNumberOfDays].value[x] from $JDV-J164-GlucoseNumberOfDays-ENS (required)
* extension[MesNumberOfDays].value[x] ^binding.description = "JDV_J164-GlucoseNumberOfDays-ENS"

* category[VSCat].coding.display = "Signes vitaux" (exactly)

* code from $JDV-J154-TypeGlucose-ENS (extensible)
* code ^short = "Types de glycémie"
* code ^definition = "Types de glycémie:\r\n• Glucose sanguin\r\n• Glucose interstitiel\r\n• Hémoglobine glyquée (HbA1c)\r\n• Index de gestion de glycémie (IGG)"
* code ^binding.description = "Glucose sanguin ou intersticiel"
* code.coding.system 1..
* code.coding.code 1..

* subject only Reference($fr-core-patient)
* encounter only Reference($fr-core-encounter)
* effective[x] only dateTime
* performer only Reference(CareTeam or RelatedPerson or $fr-core-practitioner or PractitionerRole or $fr-core-organization or $fr-core-patient)

* value[x] only Quantity
* valueQuantity.value ^short = "Valeur mesurée"
* valueQuantity.system 1..
* valueQuantity.system = "http://unitsofmeasure.org" (exactly)
* valueQuantity.code 1..
* valueQuantity.code from $JDV-J163-GlucoseUnits-ENS (required)
* valueQuantity.code ^binding.description = "JDV-J163-GlucoseUnits-ENS"

* dataAbsentReason.coding.system 1..
* dataAbsentReason.coding.code 1..

* method from method-glucose-vs (required)
* method ^short = "JDV pour la glycémie "
* method.coding.system 1..1
* method.coding.code 1..1

* device only Reference($PhdDevice)
* device ^definition = "Dispositif utilisé pour l'observation\r\nSi la mesure a été faite par un objet connecté (Profil PhdDevice) =>cette référence est obligatoire"

* referenceRange.appliesTo from $JDV-J148-ReferenceRangeAppliesTo-CISIS (required)
* referenceRange.appliesTo ^binding.description = "JDV_J148-ReferenceRangeAppliesTo-CISIS"
* referenceRange.appliesTo.coding.system 1..
* referenceRange.appliesTo.coding.code 1..
