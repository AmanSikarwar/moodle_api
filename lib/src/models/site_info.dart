import 'package:equatable/equatable.dart';

class SiteInfo extends Equatable {
  SiteInfo({
    required this.sitename,
    required this.username,
    required this.firstname,
    required this.lastname,
    required this.fullname,
    required this.lang,
    required this.userid,
    required this.siteurl,
    required this.userpictureurl,
    required this.functions,
    required this.downloadfiles,
    required this.uploadfiles,
    required this.release,
    required this.version,
    required this.mobilecssurl,
    required this.advancedfeatures,
    required this.usercanmanageownfiles,
    required this.userquota,
    required this.usermaxuploadfilesize,
    required this.userhomepage,
  });

  final String? sitename;
  final String? username;
  final String? firstname;
  final String? lastname;
  final String? fullname;
  final String? lang;
  final num? userid;
  final String? siteurl;
  final String? userpictureurl;
  final List<WSFunction> functions;
  final num? downloadfiles;
  final num? uploadfiles;
  final String? release;
  final String? version;
  final String? mobilecssurl;
  final List<AdvancedFeature> advancedfeatures;
  final bool? usercanmanageownfiles;
  final num? userquota;
  final num? usermaxuploadfilesize;
  final num? userhomepage;

  factory SiteInfo.fromJson(Map<String, dynamic> json) {
    return SiteInfo(
      sitename: json["sitename"],
      username: json["username"],
      firstname: json["firstname"],
      lastname: json["lastname"],
      fullname: json["fullname"],
      lang: json["lang"],
      userid: json["userid"],
      siteurl: json["siteurl"],
      userpictureurl: json["userpictureurl"],
      functions: json["functions"] == null
          ? []
          : List<WSFunction>.from(
              json["functions"]!.map((x) => WSFunction.fromJson(x)),
            ),
      downloadfiles: json["downloadfiles"],
      uploadfiles: json["uploadfiles"],
      release: json["release"],
      version: json["version"],
      mobilecssurl: json["mobilecssurl"],
      advancedfeatures: json["advancedfeatures"] == null
          ? []
          : List<AdvancedFeature>.from(
              json["advancedfeatures"]!
                  .map((x) => AdvancedFeature.fromJson(x)),
            ),
      usercanmanageownfiles: json["usercanmanageownfiles"],
      userquota: json["userquota"],
      usermaxuploadfilesize: json["usermaxuploadfilesize"],
      userhomepage: json["userhomepage"],
    );
  }

  @override
  String toString() {
    return "$sitename, $username, $firstname, $lastname, $fullname, $lang, $userid, $siteurl, $userpictureurl, $functions, $downloadfiles, $uploadfiles, $release, $version, $mobilecssurl, $advancedfeatures, $usercanmanageownfiles, $userquota, $usermaxuploadfilesize, $userhomepage, ";
  }

  @override
  List<Object?> get props => [
        sitename,
        username,
        firstname,
        lastname,
        fullname,
        lang,
        userid,
        siteurl,
        userpictureurl,
        functions,
        downloadfiles,
        uploadfiles,
        release,
        version,
        mobilecssurl,
        advancedfeatures,
        usercanmanageownfiles,
        userquota,
        usermaxuploadfilesize,
        userhomepage,
      ];
}

class AdvancedFeature extends Equatable {
  AdvancedFeature({
    required this.name,
    required this.value,
  });

  final String? name;
  final num? value;

  factory AdvancedFeature.fromJson(Map<String, dynamic> json) {
    return AdvancedFeature(
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

class WSFunction extends Equatable {
  WSFunction({
    required this.name,
    required this.version,
  });

  final String? name;
  final String? version;

  factory WSFunction.fromJson(Map<String, dynamic> json) {
    return WSFunction(
      name: json["name"],
      version: json["version"],
    );
  }

  @override
  String toString() {
    return "$name, $version, ";
  }

  @override
  List<Object?> get props => [
        name,
        version,
      ];
}
