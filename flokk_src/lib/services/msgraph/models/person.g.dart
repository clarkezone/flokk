// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

People _$PeopleFromJson(Map<String, dynamic> json) {
  return People(
    value: (json['value'] as List)
        ?.map((e) =>
            e == null ? null : Person.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$PeopleToJson(People instance) => <String, dynamic>{
      'value': instance.value,
    };

Person _$PersonFromJson(Map<String, dynamic> json) {
  return Person(
    id: json['id'] as String,
    displayName: json['displayName'] as String,
    givenName: json['givenName'] as String,
    surname: json['surname'] as String,
    birthday: json['birthday'] as String,
    personNotes: json['personNotes'] as String,
    isFavorite: json['isFavorite'] as bool,
    jobTitle: json['jobTitle'] as String,
    companyName: json['companyName'] as String,
    yomiCompany: json['yomiCompany'] as String,
    department: json['department'] as String,
    officeLocation: json['officeLocation'] as String,
    profession: json['profession'] as String,
    userPrincipalName: json['userPrincipalName'] as String,
    imAddress: json['imAddress'] as String,
    scoredEmailAddresses: (json['scoredEmailAddresses'] as List)
        ?.map((e) => e == null
            ? null
            : ScoredEmailAddress.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    phones: (json['phones'] as List)
        ?.map(
            (e) => e == null ? null : Phone.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    personType: json['personType'] == null
        ? null
        : PersonType.fromJson(json['personType'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PersonToJson(Person instance) => <String, dynamic>{
      'id': instance.id,
      'displayName': instance.displayName,
      'givenName': instance.givenName,
      'surname': instance.surname,
      'birthday': instance.birthday,
      'personNotes': instance.personNotes,
      'isFavorite': instance.isFavorite,
      'jobTitle': instance.jobTitle,
      'companyName': instance.companyName,
      'yomiCompany': instance.yomiCompany,
      'department': instance.department,
      'officeLocation': instance.officeLocation,
      'profession': instance.profession,
      'userPrincipalName': instance.userPrincipalName,
      'imAddress': instance.imAddress,
      'scoredEmailAddresses': instance.scoredEmailAddresses,
      'phones': instance.phones,
      'personType': instance.personType,
    };

ScoredEmailAddress _$ScoredEmailAddressFromJson(Map<String, dynamic> json) {
  return ScoredEmailAddress(
    address: json['address'] as String,
    relevanceScore: (json['relevanceScore'] as num)?.toDouble(),
    selectionLikelihood: json['selectionLikelihood'] as String,
  );
}

Map<String, dynamic> _$ScoredEmailAddressToJson(ScoredEmailAddress instance) =>
    <String, dynamic>{
      'address': instance.address,
      'relevanceScore': instance.relevanceScore,
      'selectionLikelihood': instance.selectionLikelihood,
    };

Phone _$PhoneFromJson(Map<String, dynamic> json) {
  return Phone(
    type: json['type'] as String,
    number: json['number'] as String,
  );
}

Map<String, dynamic> _$PhoneToJson(Phone instance) => <String, dynamic>{
      'type': instance.type,
      'number': instance.number,
    };

PersonType _$PersonTypeFromJson(Map<String, dynamic> json) {
  return PersonType(
    classOfPerson: json['classOfPerson'] as String,
    subclass: json['subclass'] as String,
  );
}

Map<String, dynamic> _$PersonTypeToJson(PersonType instance) =>
    <String, dynamic>{
      'classOfPerson': instance.classOfPerson,
      'subclass': instance.subclass,
    };
