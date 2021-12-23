import 'dart:convert';

import 'package:flutter/foundation.dart';

class LocationState {
  final String httpStatus;
  final int httpStatusCode;
  final bool success;
  final String message;
  final String apiName;
  final List<LocationData> data;
  LocationState({
    this.httpStatus = "",
    this.httpStatusCode = 0,
    this.success = false,
    this.message = "",
    this.apiName = "",
    this.data = const [],
  });

  LocationState copyWith({
    String? httpStatus,
    int? httpStatusCode,
    bool? success,
    String? message,
    String? apiName,
    List<LocationData>? data,
  }) {
    return LocationState(
      httpStatus: httpStatus ?? this.httpStatus,
      httpStatusCode: httpStatusCode ?? this.httpStatusCode,
      success: success ?? this.success,
      message: message ?? this.message,
      apiName: apiName ?? this.apiName,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'httpStatus': httpStatus,
      'httpStatusCode': httpStatusCode,
      'success': success,
      'message': message,
      'apiName': apiName,
      'data': data.map((x) => x.toMap()).toList(),
    };
  }

  factory LocationState.fromMap(Map<String, dynamic> map) {
    return LocationState(
      httpStatus: map['httpStatus'] ?? '',
      httpStatusCode: map['httpStatusCode']?.toInt() ?? 0,
      success: map['success'] ?? false,
      message: map['message'] ?? '',
      apiName: map['apiName'] ?? '',
      data: List<LocationData>.from(
          map['data']?.map((x) => LocationData.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory LocationState.fromJson(String source) =>
      LocationState.fromMap(json.decode(source));

  @override
  String toString() {
    return 'LocationState(httpStatus: $httpStatus, httpStatusCode: $httpStatusCode, success: $success, message: $message, apiName: $apiName, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LocationState &&
        other.httpStatus == httpStatus &&
        other.httpStatusCode == httpStatusCode &&
        other.success == success &&
        other.message == message &&
        other.apiName == apiName &&
        listEquals(other.data, data);
  }

  @override
  int get hashCode {
    return httpStatus.hashCode ^
        httpStatusCode.hashCode ^
        success.hashCode ^
        message.hashCode ^
        apiName.hashCode ^
        data.hashCode;
  }
}

class LocationData {
  String placeName;
  String placeId;

  LocationData({required this.placeName, required this.placeId});

  Map<String, dynamic> toMap() {
    return {
      'placeName': placeName,
      'placeId': placeId,
    };
  }

  factory LocationData.fromMap(Map<String, dynamic> map) {
    return LocationData(
      placeName: map['placeName'] ?? '',
      placeId: map['placeId'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory LocationData.fromJson(String source) =>
      LocationData.fromMap(json.decode(source));

  LocationData copyWith({
    String? placeName,
    String? placeId,
  }) {
    return LocationData(
      placeName: placeName ?? this.placeName,
      placeId: placeId ?? this.placeId,
    );
  }
}
