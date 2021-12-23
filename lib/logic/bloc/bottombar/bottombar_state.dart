part of 'bottombar_bloc.dart';

class BottombarState {
  final int index;
  BottombarState({
    required this.index,
  });

  BottombarState copyWith({
    int? index,
  }) {
    return BottombarState(
      index: index ?? this.index,
    );
  }
}
