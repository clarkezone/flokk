import 'package:json_annotation/json_annotation.dart';

// Before this file will compile you need to run codegen for the project.
// in order to run codegen you need to be on the flutter stable branch,
// then use this command in the root of the project: flutter pub run build_runner build --delete-conflicting-outputs
// After that person.g.dart will be created and this project will compile
part 'person.g.dart';

@JsonSerializable()
class People {
  List<Person> value;

  People({this.value});

  factory People.fromJson(Map<String, dynamic> json) => _$PeopleFromJson(json);

  Map<String, dynamic> toJson() => _$PeopleToJson(this);
}

@JsonSerializable()
class Person {
  final String id;
  final String displayName;
  final String givenName;
  final String surname;
  final String birthday;
  final String personNotes;
  final bool isFavorite;
  final String jobTitle;
  final String companyName;
  final String yomiCompany;
  final String department;
  final String officeLocation;
  final String profession;
  final String userPrincipalName;
  final String imAddress;
  final List<ScoredEmailAddress> scoredEmailAddresses;
  final List<Phone> phones;
  final PersonType personType;

  Person(
      {this.id,
      this.displayName,
      this.givenName,
      this.surname,
      this.birthday,
      this.personNotes,
      this.isFavorite,
      this.jobTitle,
      this.companyName,
      this.yomiCompany,
      this.department,
      this.officeLocation,
      this.profession,
      this.userPrincipalName,
      this.imAddress,
      this.scoredEmailAddresses,
      this.phones,
      this.personType});

  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);

  Map<String, dynamic> toJson() => _$PersonToJson(this);
}

@JsonSerializable()
class ScoredEmailAddress {
  String address;
  double relevanceScore;
  String selectionLikelihood;

  ScoredEmailAddress(
      {this.address, this.relevanceScore, this.selectionLikelihood});

  factory ScoredEmailAddress.fromJson(Map<String, dynamic> json) =>
      _$ScoredEmailAddressFromJson(json);

  Map<String, dynamic> toJson() => _$ScoredEmailAddressToJson(this);
}

@JsonSerializable()
class Phone {
  String type;
  String number;

  Phone({this.type, this.number});

  factory Phone.fromJson(Map<String, dynamic> json) => _$PhoneFromJson(json);

  Map<String, dynamic> toJson() => _$PhoneToJson(this);
}

@JsonSerializable()
class PersonType {
  String classOfPerson;
  String subclass;

  PersonType({this.classOfPerson, this.subclass});

  factory PersonType.fromJson(Map<String, dynamic> json) =>
      _$PersonTypeFromJson(json);

  Map<String, dynamic> toJson() => _$PersonTypeToJson(this);
}
