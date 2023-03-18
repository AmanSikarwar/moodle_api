import 'package:equatable/equatable.dart';
import 'package:moodle_api/src/models/email.dart';
import 'package:moodle_api/src/models/username.dart';

class UserInfo extends Equatable {
  UserInfo({
    required this.id,
    required this.username,
    required this.fullname,
    required this.email,
    required this.department,
    required this.institution,
    required this.idnumber,
    required this.interests,
    required this.firstaccess,
    required this.lastaccess,
    required this.description,
    required this.descriptionformat,
    required this.city,
    required this.url,
    required this.country,
    required this.profileimageurlsmall,
    required this.profileimageurl,
    required this.customfields,
    required this.preferences,
  });

  final num? id;
  final Username? username;
  final String? fullname;
  final EmailAddress? email;
  final String? department;
  final String? institution;
  final String? idnumber;
  final String? interests;
  final num? firstaccess;
  final num? lastaccess;
  final String? description;
  final num? descriptionformat;
  final String? city;
  final String? url;
  final String? country;
  final String? profileimageurlsmall;
  final String? profileimageurl;
  final List<Customfield> customfields;
  final List<Preference> preferences;

  factory UserInfo.fromJson(List<dynamic> json) {
    return UserInfo(
      id: json[0]["id"],
      username: Username(json[0]["username"]),
      fullname: json[0]["fullname"],
      email: EmailAddress(json[0]["email"]),
      department: json[0]["department"],
      institution: json[0]["institution"],
      idnumber: json[0]["idnumber"],
      interests: json[0]["interests"],
      firstaccess: json[0]["firstaccess"],
      lastaccess: json[0]["lastaccess"],
      description: json[0]["description"],
      descriptionformat: json[0]["descriptionformat"],
      city: json[0]["city"],
      url: json[0]["url"],
      country: json[0]["country"],
      profileimageurlsmall: json[0]["profileimageurlsmall"],
      profileimageurl: json[0]["profileimageurl"],
      customfields: json[0]["customfields"] == null
          ? []
          : List<Customfield>.from(json[0]["customfields"]!
              .map((x) => Customfield.fromJson(x))),
      preferences: json[0]["preferences"] == null
          ? []
          : List<Preference>.from(json[0]["preferences"]!
              .map((x) => Preference.fromJson(x))),
    );
  }

  @override
  String toString() {
    return "$id, ${username?.value}, $fullname, ${email?.value}, $department, $institution, $idnumber, $interests, $firstaccess, $lastaccess, $description, $descriptionformat, $city, $url, $country, $profileimageurlsmall, $profileimageurl, $customfields, $preferences, ";
  }

  @override
  List<Object?> get props => [
        id,
        username,
        fullname,
        email,
        department,
        institution,
        idnumber,
        interests,
        firstaccess,
        lastaccess,
        description,
        descriptionformat,
        city,
        url,
        country,
        profileimageurlsmall,
        profileimageurl,
        customfields,
        preferences,
      ];
}

class Customfield extends Equatable {
  Customfield({
    required this.type,
    required this.value,
    required this.name,
    required this.shortname,
  });

  final String? type;
  final String? value;
  final String? name;
  final String? shortname;

  factory Customfield.fromJson(Map<String, dynamic> json) {
    return Customfield(
      type: json["type"],
      value: json["value"],
      name: json["name"],
      shortname: json["shortname"],
    );
  }

  @override
  String toString() {
    return "$type, $value, $name, $shortname, ";
  }

  @override
  List<Object?> get props => [
        type,
        value,
        name,
        shortname,
      ];
}

class Preference extends Equatable {
  Preference({
    required this.name,
    required this.value,
  });

  final String? name;
  final dynamic value;

  factory Preference.fromJson(Map<String, dynamic> json) {
    return Preference(
      name: json["name"],
      value: json["value"],
    );
  }

  @override
  String toString() {
    return "$name, $value, ";
  }

  @override
  List<Object?> get props => [
        name,
        value,
      ];
}
