part of 'astrologer_bloc.dart';

class AstrolgerState {
  final String httpStatus;
  final int httpStatusCode;
  final bool success;
  final String message;
  final String apiName;
  final List<Data> data;
  final List<Data> filteredData;
  final List<Data> finalfilteredData;
  final List<Skill> skill_values;
  final List<Language> lang_values;
  final String sorting_value;
  final bool showSearch;

  AstrolgerState({
    this.httpStatus = "",
    this.httpStatusCode = 0,
    this.success = false,
    this.message = "",
    this.apiName = "",
    this.data = const [],
    this.filteredData = const [],
    this.finalfilteredData = const [],
    this.skill_values = const [],
    this.lang_values = const [],
    this.sorting_value = "",
    this.showSearch = false,
  });

  AstrolgerState copyWith({
    String? httpStatus,
    int? httpStatusCode,
    bool? success,
    String? message,
    String? apiName,
    List<Data>? data,
    List<Data>? filteredData,
    List<Data>? finalfilteredData,
    List<Skill>? skill_values,
    List<Language>? lang_values,
    String? sorting_value,
    bool? showSearch,
  }) {
    return AstrolgerState(
      httpStatus: httpStatus ?? this.httpStatus,
      httpStatusCode: httpStatusCode ?? this.httpStatusCode,
      success: success ?? this.success,
      message: message ?? this.message,
      apiName: apiName ?? this.apiName,
      data: data ?? this.data,
      filteredData: filteredData ?? this.filteredData,
      finalfilteredData: finalfilteredData ?? this.finalfilteredData,
      skill_values: skill_values ?? this.skill_values,
      lang_values: lang_values ?? this.lang_values,
      sorting_value: sorting_value ?? this.sorting_value,
      showSearch: showSearch ?? this.showSearch,
    );
  }

  Map<String, dynamic> toMap() {
    print("hhhh");
    return {
      'httpStatus': httpStatus,
      'httpStatusCode': httpStatusCode,
      'success': success,
      'message': message,
      'apiName': apiName,
      'data': data.map((x) => x.toMap()).toList(),
      // 'filteredData': filteredData.map((x) => x.toMap()).toList(),
      // 'finalfilteredData': finalfilteredData.map((x) => x.toMap()).toList(),
      // 'skill_values': skill_values.map((x) => x.toMap()).toList(),
      // 'lang_values': lang_values.map((x) => x.toMap()).toList(),
      // 'sorting_value': sorting_value,
      // 'showSearch': showSearch,
    };
  }

  factory AstrolgerState.fromMap(Map<String, dynamic> map) {
    return AstrolgerState(
      httpStatus: map['httpStatus'] ?? '',
      httpStatusCode: map['httpStatusCode']?.toInt() ?? 0,
      success: map['success'] ?? false,
      message: map['message'] ?? '',
      apiName: map['apiName'] ?? '',
      data: List<Data>.from(map['data']?.map((x) => Data.fromMap(x))),
      // filteredData: List<Data>.from(map['filteredData']?.map((x) => Data.fromMap(x))),
      // finalfilteredData: List<Data>.from(map['finalfilteredData']?.map((x) => Data.fromMap(x))),
      // skill_values: List<Skill>.from(map['skill_values']?.map((x) => Skill.fromMap(x))),
      // lang_values: List<Language>.from(map['lang_values']?.map((x) => Language.fromMap(x))),
      // sorting_value: map['sorting_value'] ?? '',
      // showSearch: map['showSearch'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory AstrolgerState.fromJson(String source) =>
      AstrolgerState.fromMap(json.decode(source));

  @override
  String toString() {
    return 'AstrolgerState(httpStatus: $httpStatus, httpStatusCode: $httpStatusCode, success: $success, message: $message, apiName: $apiName, data: $data, filteredData: $filteredData, finalfilteredData: $finalfilteredData, skill_values: $skill_values, lang_values: $lang_values, sorting_value: $sorting_value, showSearch: $showSearch)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AstrolgerState &&
        other.httpStatus == httpStatus &&
        other.httpStatusCode == httpStatusCode &&
        other.success == success &&
        other.message == message &&
        other.apiName == apiName &&
        listEquals(other.data, data) &&
        listEquals(other.filteredData, filteredData) &&
        listEquals(other.finalfilteredData, finalfilteredData) &&
        listEquals(other.skill_values, skill_values) &&
        listEquals(other.lang_values, lang_values) &&
        other.sorting_value == sorting_value &&
        other.showSearch == showSearch;
  }

  @override
  int get hashCode {
    return httpStatus.hashCode ^
        httpStatusCode.hashCode ^
        success.hashCode ^
        message.hashCode ^
        apiName.hashCode ^
        data.hashCode ^
        filteredData.hashCode ^
        finalfilteredData.hashCode ^
        skill_values.hashCode ^
        lang_values.hashCode ^
        sorting_value.hashCode ^
        showSearch.hashCode;
  }
}

class Data {
  final int id;
  final String urlSlug;
  final String namePrefix;
  final String firstName;
  final String lastName;
  final String aboutMe;
  final String profliePicUrl;
  final int experience;
  final List<Language> languages;
  final int minimumCallDuration;
  final int minimumCallDurationCharges;
  final int additionalPerMinuteCharges;
  final bool isAvailable;
  final int rating;
  final List<Skill> skills;
  final bool isOnCall;
  final int freeMinutes;
  final int additionalMinute;
  final Images images;
  final Availability availability;
  Data({
    required this.id,
    required this.urlSlug,
    required this.namePrefix,
    required this.firstName,
    required this.lastName,
    required this.aboutMe,
    required this.profliePicUrl,
    required this.experience,
    required this.languages,
    required this.minimumCallDuration,
    required this.minimumCallDurationCharges,
    required this.additionalPerMinuteCharges,
    required this.isAvailable,
    required this.rating,
    required this.skills,
    required this.isOnCall,
    required this.freeMinutes,
    required this.additionalMinute,
    required this.images,
    required this.availability,
  });

  Data copyWith({
    int? id,
    String? urlSlug,
    String? namePrefix,
    String? firstName,
    String? lastName,
    String? aboutMe,
    String? profliePicUrl,
    int? experience,
    List<Language>? languages,
    int? minimumCallDuration,
    int? minimumCallDurationCharges,
    int? additionalPerMinuteCharges,
    bool? isAvailable,
    int? rating,
    List<Skill>? skills,
    bool? isOnCall,
    int? freeMinutes,
    int? additionalMinute,
    Images? images,
    Availability? availability,
  }) {
    return Data(
      id: id ?? this.id,
      urlSlug: urlSlug ?? this.urlSlug,
      namePrefix: namePrefix ?? this.namePrefix,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      aboutMe: aboutMe ?? this.aboutMe,
      profliePicUrl: profliePicUrl ?? this.profliePicUrl,
      experience: experience ?? this.experience,
      languages: languages ?? this.languages,
      minimumCallDuration: minimumCallDuration ?? this.minimumCallDuration,
      minimumCallDurationCharges:
          minimumCallDurationCharges ?? this.minimumCallDurationCharges,
      additionalPerMinuteCharges:
          additionalPerMinuteCharges ?? this.additionalPerMinuteCharges,
      isAvailable: isAvailable ?? this.isAvailable,
      rating: rating ?? this.rating,
      skills: skills ?? this.skills,
      isOnCall: isOnCall ?? this.isOnCall,
      freeMinutes: freeMinutes ?? this.freeMinutes,
      additionalMinute: additionalMinute ?? this.additionalMinute,
      images: images ?? this.images,
      availability: availability ?? this.availability,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'urlSlug': urlSlug,
      'namePrefix': namePrefix,
      'firstName': firstName,
      'lastName': lastName,
      'aboutMe': aboutMe,
      'profliePicUrl': profliePicUrl,
      'experience': experience,
      'languages': languages.map((x) => x.toMap()).toList(),
      'minimumCallDuration': minimumCallDuration,
      'minimumCallDurationCharges': minimumCallDurationCharges,
      'additionalPerMinuteCharges': additionalPerMinuteCharges,
      'isAvailable': isAvailable,
      'rating': rating,
      'skills': skills.map((x) => x.toMap()).toList(),
      'isOnCall': isOnCall,
      'freeMinutes': freeMinutes,
      'additionalMinute': additionalMinute,
      'images': images.toMap(),
      'availability': availability.toMap(),
    };
  }

  factory Data.fromMap(Map<String, dynamic> map) {
    return Data(
      id: map['id']?.toInt() ?? 0,
      urlSlug: map['urlSlug'] ?? '',
      namePrefix: map['namePrefix'] ?? '',
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
      aboutMe: map['aboutMe'] ?? '',
      profliePicUrl: map['profliePicUrl'] ?? '',
      experience: map['experience']?.toInt() ?? 0,
      languages: List<Language>.from(
          map['languages']?.map((x) => Language.fromMap(x))),
      minimumCallDuration: map['minimumCallDuration']?.toInt() ?? 0,
      minimumCallDurationCharges:
          map['minimumCallDurationCharges']?.toInt() ?? 0,
      additionalPerMinuteCharges:
          map['additionalPerMinuteCharges']?.toInt() ?? 0,
      isAvailable: map['isAvailable'] ?? false,
      rating: map['rating']?.toInt() ?? 0,
      skills: List<Skill>.from(map['skills']?.map((x) => Skill.fromMap(x))),
      isOnCall: map['isOnCall'] ?? false,
      freeMinutes: map['freeMinutes']?.toInt() ?? 0,
      additionalMinute: map['additionalMinute']?.toInt() ?? 0,
      images: Images.fromMap(map['images']),
      availability: Availability.fromMap(map['availability']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Data.fromJson(String source) => Data.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Data(id: $id, urlSlug: $urlSlug, namePrefix: $namePrefix, firstName: $firstName, lastName: $lastName, aboutMe: $aboutMe, profliePicUrl: $profliePicUrl, experience: $experience, languages: $languages, minimumCallDuration: $minimumCallDuration, minimumCallDurationCharges: $minimumCallDurationCharges, additionalPerMinuteCharges: $additionalPerMinuteCharges, isAvailable: $isAvailable, rating: $rating, skills: $skills, isOnCall: $isOnCall, freeMinutes: $freeMinutes, additionalMinute: $additionalMinute, images: $images, availability: $availability)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Data &&
        other.id == id &&
        other.urlSlug == urlSlug &&
        other.namePrefix == namePrefix &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.aboutMe == aboutMe &&
        other.profliePicUrl == profliePicUrl &&
        other.experience == experience &&
        listEquals(other.languages, languages) &&
        other.minimumCallDuration == minimumCallDuration &&
        other.minimumCallDurationCharges == minimumCallDurationCharges &&
        other.additionalPerMinuteCharges == additionalPerMinuteCharges &&
        other.isAvailable == isAvailable &&
        other.rating == rating &&
        listEquals(other.skills, skills) &&
        other.isOnCall == isOnCall &&
        other.freeMinutes == freeMinutes &&
        other.additionalMinute == additionalMinute &&
        other.images == images &&
        other.availability == availability;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        urlSlug.hashCode ^
        namePrefix.hashCode ^
        firstName.hashCode ^
        lastName.hashCode ^
        aboutMe.hashCode ^
        profliePicUrl.hashCode ^
        experience.hashCode ^
        languages.hashCode ^
        minimumCallDuration.hashCode ^
        minimumCallDurationCharges.hashCode ^
        additionalPerMinuteCharges.hashCode ^
        isAvailable.hashCode ^
        rating.hashCode ^
        skills.hashCode ^
        isOnCall.hashCode ^
        freeMinutes.hashCode ^
        additionalMinute.hashCode ^
        images.hashCode ^
        availability.hashCode;
  }
}

class Language {
  final int id;
  final String name;
  Language({
    required this.id,
    required this.name,
  });

  Language copyWith({
    int? id,
    String? name,
  }) {
    return Language(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  factory Language.fromMap(Map<String, dynamic> map) {
    return Language(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Language.fromJson(String source) =>
      Language.fromMap(json.decode(source));

  @override
  String toString() => '$name';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Language && other.id == id && other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}

class Skill {
  final int id;
  final String name;
  final String description;
  Skill({
    required this.id,
    required this.name,
    required this.description,
  });

  Skill copyWith({
    int? id,
    String? name,
    String? description,
  }) {
    return Skill(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
    };
  }

  factory Skill.fromMap(Map<String, dynamic> map) {
    return Skill(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      description: map['description'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Skill.fromJson(String source) => Skill.fromMap(json.decode(source));

  @override
  String toString() => '$name';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Skill &&
        other.id == id &&
        other.name == name &&
        other.description == description;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ description.hashCode;
}

class Images {
  final Small small;
  final Large large;
  final Medium medium;
  Images({
    required this.small,
    required this.large,
    required this.medium,
  });

  Images copyWith({
    Small? small,
    Large? large,
    Medium? medium,
  }) {
    return Images(
      small: small ?? this.small,
      large: large ?? this.large,
      medium: medium ?? this.medium,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'small': small.toMap(),
      'large': large.toMap(),
      'medium': medium.toMap(),
    };
  }

  factory Images.fromMap(Map<String, dynamic> map) {
    return Images(
      small: Small.fromMap(map['small']),
      large: Large.fromMap(map['large']),
      medium: Medium.fromMap(map['medium']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Images.fromJson(String source) => Images.fromMap(json.decode(source));

  @override
  String toString() => 'Images(small: $small, large: $large, medium: $medium)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Images &&
        other.small == small &&
        other.large == large &&
        other.medium == medium;
  }

  @override
  int get hashCode => small.hashCode ^ large.hashCode ^ medium.hashCode;
}

class Small {
  final String imageUrl;
  final int id;
  Small({
    required this.imageUrl,
    required this.id,
  });

  Small copyWith({
    String? imageUrl,
    int? id,
  }) {
    return Small(
      imageUrl: imageUrl ?? this.imageUrl,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'imageUrl': imageUrl,
      'id': id,
    };
  }

  factory Small.fromMap(Map<String, dynamic> map) {
    return Small(
      imageUrl: map['imageUrl'] ?? '',
      id: map['id']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Small.fromJson(String source) => Small.fromMap(json.decode(source));

  @override
  String toString() => 'Small(imageUrl: $imageUrl, id: $id)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Small && other.imageUrl == imageUrl && other.id == id;
  }

  @override
  int get hashCode => imageUrl.hashCode ^ id.hashCode;
}

class Large {
  final String imageUrl;
  final int id;
  Large({
    required this.imageUrl,
    required this.id,
  });

  Large copyWith({
    String? imageUrl,
    int? id,
  }) {
    return Large(
      imageUrl: imageUrl ?? this.imageUrl,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'imageUrl': imageUrl,
      'id': id,
    };
  }

  factory Large.fromMap(Map<String, dynamic> map) {
    return Large(
      imageUrl: map['imageUrl'] ?? '',
      id: map['id']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Large.fromJson(String source) => Large.fromMap(json.decode(source));

  @override
  String toString() => 'Large(imageUrl: $imageUrl, id: $id)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Large && other.imageUrl == imageUrl && other.id == id;
  }

  @override
  int get hashCode => imageUrl.hashCode ^ id.hashCode;
}

class Medium {
  final String imageUrl;
  final int id;
  Medium({
    required this.imageUrl,
    required this.id,
  });

  Medium copyWith({
    String? imageUrl,
    int? id,
  }) {
    return Medium(
      imageUrl: imageUrl ?? this.imageUrl,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'imageUrl': imageUrl,
      'id': id,
    };
  }

  factory Medium.fromMap(Map<String, dynamic> map) {
    return Medium(
      imageUrl: map['imageUrl'] ?? '',
      id: map['id']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Medium.fromJson(String source) => Medium.fromMap(json.decode(source));

  @override
  String toString() => 'Medium(imageUrl: $imageUrl, id: $id)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Medium && other.imageUrl == imageUrl && other.id == id;
  }

  @override
  int get hashCode => imageUrl.hashCode ^ id.hashCode;
}

class Availability {
  final List<String> days;
  final Slot slot;
  Availability({
    required this.days,
    required this.slot,
  });

  Availability copyWith({
    List<String>? days,
    Slot? slot,
  }) {
    return Availability(
      days: days ?? this.days,
      slot: slot ?? this.slot,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'days': days,
      'slot': slot.toMap(),
    };
  }

  factory Availability.fromMap(Map<String, dynamic> map) {
    print(map);
    return Availability(
      days: map == null ? [] : List<String>.from(map['days']),
      slot: map == null ? Slot() : Slot.fromMap(map['slot']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Availability.fromJson(String source) =>
      Availability.fromMap(json.decode(source));

  @override
  String toString() => 'Availability(days: $days, slot: $slot)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Availability &&
        listEquals(other.days, days) &&
        other.slot == slot;
  }

  @override
  int get hashCode => days.hashCode ^ slot.hashCode;
}

class Slot {
  final String toFormat;
  final String fromFormat;
  final String from;
  final String to;
  Slot({
    this.toFormat = "",
    this.fromFormat = "",
    this.from = "",
    this.to = "",
  });

  Slot copyWith({
    String? toFormat,
    String? fromFormat,
    String? from,
    String? to,
  }) {
    return Slot(
      toFormat: toFormat ?? this.toFormat,
      fromFormat: fromFormat ?? this.fromFormat,
      from: from ?? this.from,
      to: to ?? this.to,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'toFormat': toFormat,
      'fromFormat': fromFormat,
      'from': from,
      'to': to,
    };
  }

  factory Slot.fromMap(Map<String, dynamic> map) {
    return Slot(
      toFormat: map['toFormat'] ?? '',
      fromFormat: map['fromFormat'] ?? '',
      from: map['from'] ?? '',
      to: map['to'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Slot.fromJson(String source) => Slot.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Slot(toFormat: $toFormat, fromFormat: $fromFormat, from: $from, to: $to)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Slot &&
        other.toFormat == toFormat &&
        other.fromFormat == fromFormat &&
        other.from == from &&
        other.to == to;
  }

  @override
  int get hashCode {
    return toFormat.hashCode ^
        fromFormat.hashCode ^
        from.hashCode ^
        to.hashCode;
  }
}
