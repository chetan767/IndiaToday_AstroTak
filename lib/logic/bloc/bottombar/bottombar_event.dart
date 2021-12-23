part of 'bottombar_bloc.dart';

@immutable
abstract class BottombarEvent {}

class ChangeScreen extends BottombarEvent {
  final int index;
  ChangeScreen({
    required this.index,
  });
}
