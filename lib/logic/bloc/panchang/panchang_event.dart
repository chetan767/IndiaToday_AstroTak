part of 'panchang_bloc.dart';

@immutable
abstract class PanchangEvent {}

class PanchangGetTime extends PanchangEvent {
  final DateTime time;
  PanchangGetTime({
    required this.time,
  });
}

class PanchangShow extends PanchangEvent {
  final String place_id;
  PanchangShow({
    required this.place_id,
  });
}
