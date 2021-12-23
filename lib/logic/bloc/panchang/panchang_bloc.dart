import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:india_today/logic/repository.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

part 'panchang_event.dart';
part 'panchang_state.dart';

class PanchangBloc extends Bloc<PanchangEvent, PanchangState> {
  final PanchangRespository respository;

  PanchangBloc({required this.respository})
      : super(PanchangState(time: DateTime.now()));

  @override
  Stream<PanchangState> mapEventToState(
    PanchangEvent event,
  ) async* {
    if (event is PanchangGetTime) {
      yield state.copyWith(time: event.time);
    } else if (event is PanchangShow) {
      PanchangState panchangState =
          await respository.getData(event.place_id, state.time!);
      yield state.copyWith(
          httpStatus: panchangState.httpStatus,
          httpStatusCode: panchangState.httpStatusCode,
          message: panchangState.message,
          success: panchangState.success,
          data: panchangState.data,
          place_id: event.place_id);
    }
  }
}
