class People {
  List<Person> value;

  People({this.value});

  factory People.fromJson(Map<String, dynamic> json) {
    List<Person> valuesList = new List<Person>();
    if (json['value'] != null) {
      valuesList = new List<Person>();
      json['value'].forEach((v) {
        valuesList.add(new Person.fromJson(v));
      });
    }

    return People(value: valuesList);
  }

}

class Person {
  String id;
  String displayName;
  String givenName;
  String surname;
  String birthday;
  String personNotes;
  bool isFavorite;
  String jobTitle;
  String companyName;
  String yomiCompany;
  String department;
  String officeLocation;
  String profession;
  String userPrincipalName;
  String imAddress;
  List<ScoredEmailAddress> scoredEmailAddresses;
  List<Phone> phones;
  PersonType personType;

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

  factory Person.fromJson(Map<String, dynamic> json) {

    List<ScoredEmailAddress> scoredEmailAddressesList = new List<ScoredEmailAddress>();
    if (json['scoredEmailAddresses'] != null) {
      scoredEmailAddressesList = new List<ScoredEmailAddress>();
      json['scoredEmailAddresses'].forEach((v) {
        scoredEmailAddressesList.add(new ScoredEmailAddress.fromJson(v));
      });
    }

    List<Phone> phonesList = new List<Phone>();
    if (json['phones'] != null) {
      phonesList = new List<Phone>();
      json['phones'].forEach((v) {
        phonesList.add(new Phone.fromJson(v));
      });
    }

    PersonType personTypeItem;
    if (json['personType'] != null) {
      personTypeItem = new PersonType.fromJson(json['personType']);
    }

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
      scoredEmailAddresses: scoredEmailAddressesList,
      phones: phonesList,
      personType: personTypeItem
    );
  }
}

class ScoredEmailAddress {
  String address;
  int relevanceScore;
  String selectionLikelihood;

  ScoredEmailAddress(
      {this.address, this.relevanceScore, this.selectionLikelihood});

  ScoredEmailAddress.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    relevanceScore = json['relevanceScore'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['address'] = this.address;
    data['relevanceScore'] = this.relevanceScore;
    data['selectionLikelihood'] = this.selectionLikelihood;

    return data;
  }
}

class Phone {
  String type;
  String number;

  Phone({this.type, this.number});

  Phone.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    number = json['number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['type'] = this.type;
    data['number'] = this.number;

    return data;
  }
}

class PersonType {
  String classOfPerson;
  String subclass;

  PersonType({this.classOfPerson, this.subclass});

  PersonType.fromJson(Map<String, dynamic> json) {
    classOfPerson = json['class'];
    subclass = json['subclass'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['class'] = this.classOfPerson;
    data['subclass'] = this.subclass;

    return data;
  }
}
