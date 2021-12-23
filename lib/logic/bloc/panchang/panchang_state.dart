part of 'panchang_bloc.dart';

class PanchangState {
  final String httpStatus;
  final int httpStatusCode;
  final bool success;
  final String message;
  final String apiName;
  final Data? data;
  final DateTime? time;
  final String place_id;

  PanchangState({
    this.httpStatus = "",
    this.httpStatusCode = 0,
    this.success = false,
    this.message = "",
    this.apiName = "",
    this.data,
    this.time,
    this.place_id = "",
  });

  PanchangState copyWith({
    String? httpStatus,
    int? httpStatusCode,
    bool? success,
    String? message,
    String? apiName,
    Data? data,
    DateTime? time,
    String? place_id,
  }) {
    return PanchangState(
      httpStatus: httpStatus ?? this.httpStatus,
      httpStatusCode: httpStatusCode ?? this.httpStatusCode,
      success: success ?? this.success,
      message: message ?? this.message,
      apiName: apiName ?? this.apiName,
      data: data ?? this.data,
      time: time ?? this.time,
      place_id: place_id ?? this.place_id,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'httpStatus': httpStatus,
      'httpStatusCode': httpStatusCode,
      'success': success,
      'message': message,
      'apiName': apiName,
      'data': data?.toMap(),
      'time': time?.millisecondsSinceEpoch,
      'place_id': place_id,
    };
  }

  factory PanchangState.fromMap(Map<String, dynamic> map) {
    return PanchangState(
      httpStatus: map['httpStatus'] ?? '',
      httpStatusCode: map['httpStatusCode']?.toInt() ?? 0,
      success: map['success'] ?? false,
      message: map['message'] ?? '',
      apiName: map['apiName'] ?? '',
      data: map['data'] != null ? Data.fromMap(map['data']) : null,
      time: map['time'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['time'])
          : null,
      place_id: map['place_id'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory PanchangState.fromJson(String source) =>
      PanchangState.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PanchangState(httpStatus: $httpStatus, httpStatusCode: $httpStatusCode, success: $success, message: $message, apiName: $apiName, data: $data, time: $time, place_id: $place_id)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PanchangState &&
        other.httpStatus == httpStatus &&
        other.httpStatusCode == httpStatusCode &&
        other.success == success &&
        other.message == message &&
        other.apiName == apiName &&
        other.data == data &&
        other.time == time &&
        other.place_id == place_id;
  }

  @override
  int get hashCode {
    return httpStatus.hashCode ^
        httpStatusCode.hashCode ^
        success.hashCode ^
        message.hashCode ^
        apiName.hashCode ^
        data.hashCode ^
        time.hashCode ^
        place_id.hashCode;
  }
}

class Data {
  final String day;
  final String sunrise;
  final String sunset;
  final String moonrise;
  final String moonset;
  final String vedic_sunrise;
  final String vedic_sunset;
  final Tithi tithi;
  final Nakshatra nakshatra;
  final Yog yog;
  final Karan karan;
  final Hindu_maah hindu_maah;
  final String paksha;
  final String ritu;
  final String sun_sign;
  final String moon_sign;
  final String ayana;
  final String panchang_yog;
  final int vikram_samvat;
  final int shaka_samvat;
  final String vkram_samvat_name;
  final String shaka_samvat_name;
  final String disha_shool;
  final String disha_shool_remedies;
  final Nak_shool nak_shool;
  final String moon_nivas;
  final Abhijit_muhurta abhijit_muhurta;
  final Rahukaal rahukaal;
  final GuliKaal guliKaal;
  final Yamghant_kaal yamghant_kaal;
  Data({
    required this.day,
    required this.sunrise,
    required this.sunset,
    required this.moonrise,
    required this.moonset,
    required this.vedic_sunrise,
    required this.vedic_sunset,
    required this.tithi,
    required this.nakshatra,
    required this.yog,
    required this.karan,
    required this.hindu_maah,
    required this.paksha,
    required this.ritu,
    required this.sun_sign,
    required this.moon_sign,
    required this.ayana,
    required this.panchang_yog,
    required this.vikram_samvat,
    required this.shaka_samvat,
    required this.vkram_samvat_name,
    required this.shaka_samvat_name,
    required this.disha_shool,
    required this.disha_shool_remedies,
    required this.nak_shool,
    required this.moon_nivas,
    required this.abhijit_muhurta,
    required this.rahukaal,
    required this.guliKaal,
    required this.yamghant_kaal,
  });

  Data copyWith({
    String? day,
    String? sunrise,
    String? sunset,
    String? moonrise,
    String? moonset,
    String? vedic_sunrise,
    String? vedic_sunset,
    Tithi? tithi,
    Nakshatra? nakshatra,
    Yog? yog,
    Karan? karan,
    Hindu_maah? hindu_maah,
    String? paksha,
    String? ritu,
    String? sun_sign,
    String? moon_sign,
    String? ayana,
    String? panchang_yog,
    int? vikram_samvat,
    int? shaka_samvat,
    String? vkram_samvat_name,
    String? shaka_samvat_name,
    String? disha_shool,
    String? disha_shool_remedies,
    Nak_shool? nak_shool,
    String? moon_nivas,
    Abhijit_muhurta? abhijit_muhurta,
    Rahukaal? rahukaal,
    GuliKaal? guliKaal,
    Yamghant_kaal? yamghant_kaal,
  }) {
    return Data(
      day: day ?? this.day,
      sunrise: sunrise ?? this.sunrise,
      sunset: sunset ?? this.sunset,
      moonrise: moonrise ?? this.moonrise,
      moonset: moonset ?? this.moonset,
      vedic_sunrise: vedic_sunrise ?? this.vedic_sunrise,
      vedic_sunset: vedic_sunset ?? this.vedic_sunset,
      tithi: tithi ?? this.tithi,
      nakshatra: nakshatra ?? this.nakshatra,
      yog: yog ?? this.yog,
      karan: karan ?? this.karan,
      hindu_maah: hindu_maah ?? this.hindu_maah,
      paksha: paksha ?? this.paksha,
      ritu: ritu ?? this.ritu,
      sun_sign: sun_sign ?? this.sun_sign,
      moon_sign: moon_sign ?? this.moon_sign,
      ayana: ayana ?? this.ayana,
      panchang_yog: panchang_yog ?? this.panchang_yog,
      vikram_samvat: vikram_samvat ?? this.vikram_samvat,
      shaka_samvat: shaka_samvat ?? this.shaka_samvat,
      vkram_samvat_name: vkram_samvat_name ?? this.vkram_samvat_name,
      shaka_samvat_name: shaka_samvat_name ?? this.shaka_samvat_name,
      disha_shool: disha_shool ?? this.disha_shool,
      disha_shool_remedies: disha_shool_remedies ?? this.disha_shool_remedies,
      nak_shool: nak_shool ?? this.nak_shool,
      moon_nivas: moon_nivas ?? this.moon_nivas,
      abhijit_muhurta: abhijit_muhurta ?? this.abhijit_muhurta,
      rahukaal: rahukaal ?? this.rahukaal,
      guliKaal: guliKaal ?? this.guliKaal,
      yamghant_kaal: yamghant_kaal ?? this.yamghant_kaal,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'day': day,
      'sunrise': sunrise,
      'sunset': sunset,
      'moonrise': moonrise,
      'moonset': moonset,
      'vedic_sunrise': vedic_sunrise,
      'vedic_sunset': vedic_sunset,
      'tithi': tithi.toMap(),
      'nakshatra': nakshatra.toMap(),
      'yog': yog.toMap(),
      'karan': karan.toMap(),
      'hindu_maah': hindu_maah.toMap(),
      'paksha': paksha,
      'ritu': ritu,
      'sun_sign': sun_sign,
      'moon_sign': moon_sign,
      'ayana': ayana,
      'panchang_yog': panchang_yog,
      'vikram_samvat': vikram_samvat,
      'shaka_samvat': shaka_samvat,
      'vkram_samvat_name': vkram_samvat_name,
      'shaka_samvat_name': shaka_samvat_name,
      'disha_shool': disha_shool,
      'disha_shool_remedies': disha_shool_remedies,
      'nak_shool': nak_shool.toMap(),
      'moon_nivas': moon_nivas,
      'abhijit_muhurta': abhijit_muhurta.toMap(),
      'rahukaal': rahukaal.toMap(),
      'guliKaal': guliKaal.toMap(),
      'yamghant_kaal': yamghant_kaal.toMap(),
    };
  }

  factory Data.fromMap(Map<String, dynamic> map) {
    return Data(
      day: map['day'] ?? '',
      sunrise: map['sunrise'] ?? '',
      sunset: map['sunset'] ?? '',
      moonrise: map['moonrise'] ?? '',
      moonset: map['moonset'] ?? '',
      vedic_sunrise: map['vedic_sunrise'] ?? '',
      vedic_sunset: map['vedic_sunset'] ?? '',
      tithi: Tithi.fromMap(map['tithi']),
      nakshatra: Nakshatra.fromMap(map['nakshatra']),
      yog: Yog.fromMap(map['yog']),
      karan: Karan.fromMap(map['karan']),
      hindu_maah: Hindu_maah.fromMap(map['hindu_maah']),
      paksha: map['paksha'] ?? '',
      ritu: map['ritu'] ?? '',
      sun_sign: map['sun_sign'] ?? '',
      moon_sign: map['moon_sign'] ?? '',
      ayana: map['ayana'] ?? '',
      panchang_yog: map['panchang_yog'] ?? '',
      vikram_samvat: map['vikram_samvat']?.toInt() ?? 0,
      shaka_samvat: map['shaka_samvat']?.toInt() ?? 0,
      vkram_samvat_name: map['vkram_samvat_name'] ?? '',
      shaka_samvat_name: map['shaka_samvat_name'] ?? '',
      disha_shool: map['disha_shool'] ?? '',
      disha_shool_remedies: map['disha_shool_remedies'] ?? '',
      nak_shool: Nak_shool.fromMap(map['nak_shool']),
      moon_nivas: map['moon_nivas'] ?? '',
      abhijit_muhurta: Abhijit_muhurta.fromMap(map['abhijit_muhurta']),
      rahukaal: Rahukaal.fromMap(map['rahukaal']),
      guliKaal: GuliKaal.fromMap(map['guliKaal']),
      yamghant_kaal: Yamghant_kaal.fromMap(map['yamghant_kaal']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Data.fromJson(String source) => Data.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Data(day: $day, sunrise: $sunrise, sunset: $sunset, moonrise: $moonrise, moonset: $moonset, vedic_sunrise: $vedic_sunrise, vedic_sunset: $vedic_sunset, tithi: $tithi, nakshatra: $nakshatra, yog: $yog, karan: $karan, hindu_maah: $hindu_maah, paksha: $paksha, ritu: $ritu, sun_sign: $sun_sign, moon_sign: $moon_sign, ayana: $ayana, panchang_yog: $panchang_yog, vikram_samvat: $vikram_samvat, shaka_samvat: $shaka_samvat, vkram_samvat_name: $vkram_samvat_name, shaka_samvat_name: $shaka_samvat_name, disha_shool: $disha_shool, disha_shool_remedies: $disha_shool_remedies, nak_shool: $nak_shool, moon_nivas: $moon_nivas, abhijit_muhurta: $abhijit_muhurta, rahukaal: $rahukaal, guliKaal: $guliKaal, yamghant_kaal: $yamghant_kaal)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Data &&
        other.day == day &&
        other.sunrise == sunrise &&
        other.sunset == sunset &&
        other.moonrise == moonrise &&
        other.moonset == moonset &&
        other.vedic_sunrise == vedic_sunrise &&
        other.vedic_sunset == vedic_sunset &&
        other.tithi == tithi &&
        other.nakshatra == nakshatra &&
        other.yog == yog &&
        other.karan == karan &&
        other.hindu_maah == hindu_maah &&
        other.paksha == paksha &&
        other.ritu == ritu &&
        other.sun_sign == sun_sign &&
        other.moon_sign == moon_sign &&
        other.ayana == ayana &&
        other.panchang_yog == panchang_yog &&
        other.vikram_samvat == vikram_samvat &&
        other.shaka_samvat == shaka_samvat &&
        other.vkram_samvat_name == vkram_samvat_name &&
        other.shaka_samvat_name == shaka_samvat_name &&
        other.disha_shool == disha_shool &&
        other.disha_shool_remedies == disha_shool_remedies &&
        other.nak_shool == nak_shool &&
        other.moon_nivas == moon_nivas &&
        other.abhijit_muhurta == abhijit_muhurta &&
        other.rahukaal == rahukaal &&
        other.guliKaal == guliKaal &&
        other.yamghant_kaal == yamghant_kaal;
  }

  @override
  int get hashCode {
    return day.hashCode ^
        sunrise.hashCode ^
        sunset.hashCode ^
        moonrise.hashCode ^
        moonset.hashCode ^
        vedic_sunrise.hashCode ^
        vedic_sunset.hashCode ^
        tithi.hashCode ^
        nakshatra.hashCode ^
        yog.hashCode ^
        karan.hashCode ^
        hindu_maah.hashCode ^
        paksha.hashCode ^
        ritu.hashCode ^
        sun_sign.hashCode ^
        moon_sign.hashCode ^
        ayana.hashCode ^
        panchang_yog.hashCode ^
        vikram_samvat.hashCode ^
        shaka_samvat.hashCode ^
        vkram_samvat_name.hashCode ^
        shaka_samvat_name.hashCode ^
        disha_shool.hashCode ^
        disha_shool_remedies.hashCode ^
        nak_shool.hashCode ^
        moon_nivas.hashCode ^
        abhijit_muhurta.hashCode ^
        rahukaal.hashCode ^
        guliKaal.hashCode ^
        yamghant_kaal.hashCode;
  }
}

class Tithi {
  final TithiDetails details;
  final End_time end_time;
  final int end_time_ms;
  Tithi({
    required this.details,
    required this.end_time,
    required this.end_time_ms,
  });

  Tithi copyWith({
    TithiDetails? details,
    End_time? end_time,
    int? end_time_ms,
  }) {
    return Tithi(
      details: details ?? this.details,
      end_time: end_time ?? this.end_time,
      end_time_ms: end_time_ms ?? this.end_time_ms,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'details': details.toMap(),
      'end_time': end_time.toMap(),
      'end_time_ms': end_time_ms,
    };
  }

  factory Tithi.fromMap(Map<String, dynamic> map) {
    return Tithi(
      details: TithiDetails.fromMap(map['details']),
      end_time: End_time.fromMap(map['end_time']),
      end_time_ms: map['end_time_ms']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Tithi.fromJson(String source) => Tithi.fromMap(json.decode(source));

  @override
  String toString() =>
      'Tithi(details: $details, end_time: $end_time, end_time_ms: $end_time_ms)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Tithi &&
        other.details == details &&
        other.end_time == end_time &&
        other.end_time_ms == end_time_ms;
  }

  @override
  int get hashCode =>
      details.hashCode ^ end_time.hashCode ^ end_time_ms.hashCode;
}

class TithiDetails {
  final int tithi_number;
  final String tithi_name;
  final String special;
  final String summary;
  final String deity;
  TithiDetails({
    required this.tithi_number,
    required this.tithi_name,
    required this.special,
    required this.summary,
    required this.deity,
  });

  TithiDetails copyWith({
    int? tithi_number,
    String? tithi_name,
    String? special,
    String? summary,
    String? deity,
  }) {
    return TithiDetails(
      tithi_number: tithi_number ?? this.tithi_number,
      tithi_name: tithi_name ?? this.tithi_name,
      special: special ?? this.special,
      summary: summary ?? this.summary,
      deity: deity ?? this.deity,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'tithi_number': tithi_number,
      'tithi_name': tithi_name,
      'special': special,
      'summary': summary,
      'deity': deity,
    };
  }

  factory TithiDetails.fromMap(Map<String, dynamic> map) {
    return TithiDetails(
      tithi_number: map['tithi_number']?.toInt() ?? 0,
      tithi_name: map['tithi_name'] ?? '',
      special: map['special'] ?? '',
      summary: map['summary'] ?? '',
      deity: map['deity'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory TithiDetails.fromJson(String source) =>
      TithiDetails.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Details(tithi_number: $tithi_number, tithi_name: $tithi_name, special: $special, summary: $summary, deity: $deity)';
  }

  @override
  int get hashCode {
    return tithi_number.hashCode ^
        tithi_name.hashCode ^
        special.hashCode ^
        summary.hashCode ^
        deity.hashCode;
  }
}

class End_time {
  final int hour;
  final int minute;
  final int second;
  End_time({
    required this.hour,
    required this.minute,
    required this.second,
  });

  End_time copyWith({
    int? hour,
    int? minute,
    int? second,
  }) {
    return End_time(
      hour: hour ?? this.hour,
      minute: minute ?? this.minute,
      second: second ?? this.second,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'hour': hour,
      'minute': minute,
      'second': second,
    };
  }

  factory End_time.fromMap(Map<String, dynamic> map) {
    return End_time(
      hour: map['hour']?.toInt() ?? 0,
      minute: map['minute']?.toInt() ?? 0,
      second: map['second']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory End_time.fromJson(String source) =>
      End_time.fromMap(json.decode(source));

  @override
  String toString() =>
      'End_time(hour: $hour, minute: $minute, second: $second)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is End_time &&
        other.hour == hour &&
        other.minute == minute &&
        other.second == second;
  }

  @override
  int get hashCode => hour.hashCode ^ minute.hashCode ^ second.hashCode;
}

class Nakshatra {
  final NakshatraDetails details;
  final End_time end_time;
  final int end_time_ms;
  Nakshatra({
    required this.details,
    required this.end_time,
    required this.end_time_ms,
  });

  Nakshatra copyWith({
    NakshatraDetails? details,
    End_time? end_time,
    int? end_time_ms,
  }) {
    return Nakshatra(
      details: details ?? this.details,
      end_time: end_time ?? this.end_time,
      end_time_ms: end_time_ms ?? this.end_time_ms,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'details': details.toMap(),
      'end_time': end_time.toMap(),
      'end_time_ms': end_time_ms,
    };
  }

  factory Nakshatra.fromMap(Map<String, dynamic> map) {
    return Nakshatra(
      details: NakshatraDetails.fromMap(map['details']),
      end_time: End_time.fromMap(map['end_time']),
      end_time_ms: map['end_time_ms']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Nakshatra.fromJson(String source) =>
      Nakshatra.fromMap(json.decode(source));

  @override
  String toString() =>
      'Nakshatra(details: $details, end_time: $end_time, end_time_ms: $end_time_ms)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Nakshatra &&
        other.details == details &&
        other.end_time == end_time &&
        other.end_time_ms == end_time_ms;
  }

  @override
  int get hashCode =>
      details.hashCode ^ end_time.hashCode ^ end_time_ms.hashCode;
}

class NakshatraDetails {
  final int nak_number;
  final String nak_name;
  final String ruler;
  final String deity;
  final String special;
  final String summary;
  NakshatraDetails({
    required this.nak_number,
    required this.nak_name,
    required this.ruler,
    required this.deity,
    required this.special,
    required this.summary,
  });

  NakshatraDetails copyWith({
    int? nak_number,
    String? nak_name,
    String? ruler,
    String? deity,
    String? special,
    String? summary,
  }) {
    return NakshatraDetails(
      nak_number: nak_number ?? this.nak_number,
      nak_name: nak_name ?? this.nak_name,
      ruler: ruler ?? this.ruler,
      deity: deity ?? this.deity,
      special: special ?? this.special,
      summary: summary ?? this.summary,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'nak_number': nak_number,
      'nak_name': nak_name,
      'ruler': ruler,
      'deity': deity,
      'special': special,
      'summary': summary,
    };
  }

  factory NakshatraDetails.fromMap(Map<String, dynamic> map) {
    return NakshatraDetails(
      nak_number: map['nak_number']?.toInt() ?? 0,
      nak_name: map['nak_name'] ?? '',
      ruler: map['ruler'] ?? '',
      deity: map['deity'] ?? '',
      special: map['special'] ?? '',
      summary: map['summary'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory NakshatraDetails.fromJson(String source) =>
      NakshatraDetails.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Details(nak_number: $nak_number, nak_name: $nak_name, ruler: $ruler, deity: $deity, special: $special, summary: $summary)';
  }

  @override
  int get hashCode {
    return nak_number.hashCode ^
        nak_name.hashCode ^
        ruler.hashCode ^
        deity.hashCode ^
        special.hashCode ^
        summary.hashCode;
  }
}

class Yog {
  final YogDetails details;
  final End_time end_time;
  final int end_time_ms;
  Yog({
    required this.details,
    required this.end_time,
    required this.end_time_ms,
  });

  Yog copyWith({
    YogDetails? details,
    End_time? end_time,
    int? end_time_ms,
  }) {
    return Yog(
      details: details ?? this.details,
      end_time: end_time ?? this.end_time,
      end_time_ms: end_time_ms ?? this.end_time_ms,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'details': details.toMap(),
      'end_time': end_time.toMap(),
      'end_time_ms': end_time_ms,
    };
  }

  factory Yog.fromMap(Map<String, dynamic> map) {
    return Yog(
      details: YogDetails.fromMap(map['details']),
      end_time: End_time.fromMap(map['end_time']),
      end_time_ms: map['end_time_ms']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Yog.fromJson(String source) => Yog.fromMap(json.decode(source));

  @override
  String toString() =>
      'Yog(details: $details, end_time: $end_time, end_time_ms: $end_time_ms)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Yog &&
        other.details == details &&
        other.end_time == end_time &&
        other.end_time_ms == end_time_ms;
  }

  @override
  int get hashCode =>
      details.hashCode ^ end_time.hashCode ^ end_time_ms.hashCode;
}

class YogDetails {
  final int yog_number;
  final String yog_name;
  final String special;
  final String meaning;
  YogDetails({
    required this.yog_number,
    required this.yog_name,
    required this.special,
    required this.meaning,
  });

  YogDetails copyWith({
    int? yog_number,
    String? yog_name,
    String? special,
    String? meaning,
  }) {
    return YogDetails(
      yog_number: yog_number ?? this.yog_number,
      yog_name: yog_name ?? this.yog_name,
      special: special ?? this.special,
      meaning: meaning ?? this.meaning,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'yog_number': yog_number,
      'yog_name': yog_name,
      'special': special,
      'meaning': meaning,
    };
  }

  factory YogDetails.fromMap(Map<String, dynamic> map) {
    return YogDetails(
      yog_number: map['yog_number']?.toInt() ?? 0,
      yog_name: map['yog_name'] ?? '',
      special: map['special'] ?? '',
      meaning: map['meaning'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory YogDetails.fromJson(String source) =>
      YogDetails.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Details(yog_number: $yog_number, yog_name: $yog_name, special: $special, meaning: $meaning)';
  }

  @override
  int get hashCode {
    return yog_number.hashCode ^
        yog_name.hashCode ^
        special.hashCode ^
        meaning.hashCode;
  }
}

class Karan {
  final KaranDetails details;
  final End_time end_time;
  final int end_time_ms;
  Karan({
    required this.details,
    required this.end_time,
    required this.end_time_ms,
  });

  Karan copyWith({
    KaranDetails? details,
    End_time? end_time,
    int? end_time_ms,
  }) {
    return Karan(
      details: details ?? this.details,
      end_time: end_time ?? this.end_time,
      end_time_ms: end_time_ms ?? this.end_time_ms,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'details': details.toMap(),
      'end_time': end_time.toMap(),
      'end_time_ms': end_time_ms,
    };
  }

  factory Karan.fromMap(Map<String, dynamic> map) {
    return Karan(
      details: KaranDetails.fromMap(map['details']),
      end_time: End_time.fromMap(map['end_time']),
      end_time_ms: map['end_time_ms']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Karan.fromJson(String source) => Karan.fromMap(json.decode(source));

  @override
  String toString() =>
      'Karan(details: $details, end_time: $end_time, end_time_ms: $end_time_ms)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Karan &&
        other.details == details &&
        other.end_time == end_time &&
        other.end_time_ms == end_time_ms;
  }

  @override
  int get hashCode =>
      details.hashCode ^ end_time.hashCode ^ end_time_ms.hashCode;
}

class KaranDetails {
  final int karan_number;
  final String karan_name;
  final String special;
  final String deity;
  KaranDetails({
    required this.karan_number,
    required this.karan_name,
    required this.special,
    required this.deity,
  });

  KaranDetails copyWith({
    int? karan_number,
    String? karan_name,
    String? special,
    String? deity,
  }) {
    return KaranDetails(
      karan_number: karan_number ?? this.karan_number,
      karan_name: karan_name ?? this.karan_name,
      special: special ?? this.special,
      deity: deity ?? this.deity,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'karan_number': karan_number,
      'karan_name': karan_name,
      'special': special,
      'deity': deity,
    };
  }

  factory KaranDetails.fromMap(Map<String, dynamic> map) {
    return KaranDetails(
      karan_number: map['karan_number']?.toInt() ?? 0,
      karan_name: map['karan_name'] ?? '',
      special: map['special'] ?? '',
      deity: map['deity'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory KaranDetails.fromJson(String source) =>
      KaranDetails.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Details(karan_number: $karan_number, karan_name: $karan_name, special: $special, deity: $deity)';
  }

  @override
  int get hashCode {
    return karan_number.hashCode ^
        karan_name.hashCode ^
        special.hashCode ^
        deity.hashCode;
  }
}

class Hindu_maah {
  final bool adhik_status;
  final String purnimanta;
  final String amanta;
  final int amanta_id;
  final int purnimanta_id;
  Hindu_maah({
    required this.adhik_status,
    required this.purnimanta,
    required this.amanta,
    required this.amanta_id,
    required this.purnimanta_id,
  });

  Hindu_maah copyWith({
    bool? adhik_status,
    String? purnimanta,
    String? amanta,
    int? amanta_id,
    int? purnimanta_id,
  }) {
    return Hindu_maah(
      adhik_status: adhik_status ?? this.adhik_status,
      purnimanta: purnimanta ?? this.purnimanta,
      amanta: amanta ?? this.amanta,
      amanta_id: amanta_id ?? this.amanta_id,
      purnimanta_id: purnimanta_id ?? this.purnimanta_id,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'adhik_status': adhik_status,
      'purnimanta': purnimanta,
      'amanta': amanta,
      'amanta_id': amanta_id,
      'purnimanta_id': purnimanta_id,
    };
  }

  factory Hindu_maah.fromMap(Map<String, dynamic> map) {
    return Hindu_maah(
      adhik_status: map['adhik_status'] ?? false,
      purnimanta: map['purnimanta'] ?? '',
      amanta: map['amanta'] ?? '',
      amanta_id: map['amanta_id']?.toInt() ?? 0,
      purnimanta_id: map['purnimanta_id']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Hindu_maah.fromJson(String source) =>
      Hindu_maah.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Hindu_maah(adhik_status: $adhik_status, purnimanta: $purnimanta, amanta: $amanta, amanta_id: $amanta_id, purnimanta_id: $purnimanta_id)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Hindu_maah &&
        other.adhik_status == adhik_status &&
        other.purnimanta == purnimanta &&
        other.amanta == amanta &&
        other.amanta_id == amanta_id &&
        other.purnimanta_id == purnimanta_id;
  }

  @override
  int get hashCode {
    return adhik_status.hashCode ^
        purnimanta.hashCode ^
        amanta.hashCode ^
        amanta_id.hashCode ^
        purnimanta_id.hashCode;
  }
}

class Nak_shool {
  final String direction;
  final String remedies;
  Nak_shool({
    required this.direction,
    required this.remedies,
  });

  Nak_shool copyWith({
    String? direction,
    String? remedies,
  }) {
    return Nak_shool(
      direction: direction ?? this.direction,
      remedies: remedies ?? this.remedies,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'direction': direction,
      'remedies': remedies,
    };
  }

  factory Nak_shool.fromMap(Map<String, dynamic> map) {
    return Nak_shool(
      direction: map['direction'] ?? '',
      remedies: map['remedies'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Nak_shool.fromJson(String source) =>
      Nak_shool.fromMap(json.decode(source));

  @override
  String toString() => 'Nak_shool(direction: $direction, remedies: $remedies)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Nak_shool &&
        other.direction == direction &&
        other.remedies == remedies;
  }

  @override
  int get hashCode => direction.hashCode ^ remedies.hashCode;
}

class Abhijit_muhurta {
  final String start;
  final String end;
  Abhijit_muhurta({
    required this.start,
    required this.end,
  });

  Abhijit_muhurta copyWith({
    String? start,
    String? end,
  }) {
    return Abhijit_muhurta(
      start: start ?? this.start,
      end: end ?? this.end,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'start': start,
      'end': end,
    };
  }

  factory Abhijit_muhurta.fromMap(Map<String, dynamic> map) {
    return Abhijit_muhurta(
      start: map['start'] ?? '',
      end: map['end'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Abhijit_muhurta.fromJson(String source) =>
      Abhijit_muhurta.fromMap(json.decode(source));

  @override
  String toString() => 'Abhijit_muhurta(start: $start, end: $end)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Abhijit_muhurta && other.start == start && other.end == end;
  }

  @override
  int get hashCode => start.hashCode ^ end.hashCode;
}

class Rahukaal {
  final String start;
  final String end;
  Rahukaal({
    required this.start,
    required this.end,
  });

  Rahukaal copyWith({
    String? start,
    String? end,
  }) {
    return Rahukaal(
      start: start ?? this.start,
      end: end ?? this.end,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'start': start,
      'end': end,
    };
  }

  factory Rahukaal.fromMap(Map<String, dynamic> map) {
    return Rahukaal(
      start: map['start'] ?? '',
      end: map['end'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Rahukaal.fromJson(String source) =>
      Rahukaal.fromMap(json.decode(source));

  @override
  String toString() => 'Rahukaal(start: $start, end: $end)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Rahukaal && other.start == start && other.end == end;
  }

  @override
  int get hashCode => start.hashCode ^ end.hashCode;
}

class GuliKaal {
  final String start;
  final String end;
  GuliKaal({
    required this.start,
    required this.end,
  });

  GuliKaal copyWith({
    String? start,
    String? end,
  }) {
    return GuliKaal(
      start: start ?? this.start,
      end: end ?? this.end,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'start': start,
      'end': end,
    };
  }

  factory GuliKaal.fromMap(Map<String, dynamic> map) {
    return GuliKaal(
      start: map['start'] ?? '',
      end: map['end'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory GuliKaal.fromJson(String source) =>
      GuliKaal.fromMap(json.decode(source));

  @override
  String toString() => 'GuliKaal(start: $start, end: $end)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GuliKaal && other.start == start && other.end == end;
  }

  @override
  int get hashCode => start.hashCode ^ end.hashCode;
}

class Yamghant_kaal {
  final String start;
  final String end;
  Yamghant_kaal({
    required this.start,
    required this.end,
  });

  Yamghant_kaal copyWith({
    String? start,
    String? end,
  }) {
    return Yamghant_kaal(
      start: start ?? this.start,
      end: end ?? this.end,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'start': start,
      'end': end,
    };
  }

  factory Yamghant_kaal.fromMap(Map<String, dynamic> map) {
    return Yamghant_kaal(
      start: map['start'] ?? '',
      end: map['end'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Yamghant_kaal.fromJson(String source) =>
      Yamghant_kaal.fromMap(json.decode(source));

  @override
  String toString() => 'Yamghant_kaal(start: $start, end: $end)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Yamghant_kaal && other.start == start && other.end == end;
  }

  @override
  int get hashCode => start.hashCode ^ end.hashCode;
}
