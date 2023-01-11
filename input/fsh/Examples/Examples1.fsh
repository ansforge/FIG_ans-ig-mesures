
Instance: ExamplefrPatient001
InstanceOf: $fr-core-patient
Usage: #example
* identifier.use = #official
* identifier.system = "1.2.250.1.213.1.4.2"
* identifier.value = "123456789012244"
* active = true

* name[0].use = #official
* name[=].family = "Durand"
* name[=].given[0] = "Pierre"
* name[=].given[+] = "Jean"

* telecom[0].use = #home
* telecom[0].system = #phone
* telecom[0].value = "01 23 24 67 89"
* telecom[1].use = #work
* telecom[1].rank = 1
* telecom[1].system = #phone
* telecom[1].value = "01 99 88 77 66"
* telecom[2].use = #mobile
* telecom[2].rank = 2
* telecom[2].system = #phone
* telecom[2].value = "06 80 55 34 33"

* gender = #male
* birthDate = "1974-12-25"
* deceasedBoolean = false
* address.use = #home
* address.type = #both
* address.text = "367 rue Troussier, 45100 Orléans, France"
* address.line = "367 rue Troussier"
* address.city = "Orléans"
* address.postalCode = "45100"
* address.period.start = "2018-06-01"


Instance: ExampleMesFrObservationBodyWeight001
InstanceOf: MesFrObservationBodyWeight
Usage: #example
* status = #final
* category = http://terminology.hl7.org/CodeSystem/observation-category#vital-signs "Vital Signs"
* category.text = "Vital Signs"
* code = http://loinc.org#29463-7XX "Body weight"
* subject = Reference(ExamplefrPatient001XX) "Pierre Durand"
  * type = "Patient"
* effectiveDateTime = "2022-11-06"
//* extension[birthPlace].url = https://simplifier.net/ci-sis/files/ensreasonformeasurement.xml

