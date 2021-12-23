import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'bottombar_event.dart';
part 'bottombar_state.dart';

class BottombarBloc extends Bloc<BottombarEvent, BottombarState> {
  BottombarBloc() : super(BottombarState(index: 0)) {
    on<BottombarEvent>((event, emit) {
      if (event is ChangeScreen) {
        emit(state.copyWith(index: event.index));
      }
    });
  }
}
