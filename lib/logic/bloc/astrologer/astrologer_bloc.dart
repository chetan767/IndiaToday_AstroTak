import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:india_today/const.dart';
import 'package:india_today/logic/repository.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:convert';
part 'astrologer_event.dart';
part 'astrologer_state.dart';

class AstrologerBloc extends Bloc<AstrologerEvent, AstrolgerState> {
  final AstrolgerRespository respository;

  AstrologerBloc({required this.respository}) : super(AstrolgerState());

  @override
  Stream<AstrolgerState> mapEventToState(
    AstrologerEvent event,
  ) async* {
    if (event is AstrologerGetData) {
      print("www");
      print("start api");

      AstrolgerState astrolgerState = await respository.getData();
      print("done api");

      print(astrolgerState.message);
      String languages = "";
      yield (state.copyWith(
          data: astrolgerState.data, filteredData: astrolgerState.data));

      print("done state");
    } else if (event is AstrologerFilterList) {
      if (event.text == "") {
        yield (state.copyWith(filteredData: state.data));
      } else {
        print(event.text);
        List<Data> filter = state.data.toList();
        List<Data> filter_list1 = filter
            .where((element) => (element.firstName + " " + element.lastName)
                .toLowerCase()
                .contains(event.text.toLowerCase()))
            .toList();

        List<Data> filter_list2 = filter
            .where((element) => (element.skills
                    .toString()
                    .replaceFirst('[', '')
                    .replaceFirst(']', ''))
                .toLowerCase()
                .contains(event.text.toLowerCase()))
            .toList();

        List<Data> filter_list3 = filter
            .where((element) => (element.languages
                    .toString()
                    .replaceFirst('[', '')
                    .replaceFirst(']', ''))
                .toLowerCase()
                .contains(event.text.toLowerCase()))
            .toList();

        print(filter);
        filter_list1.addAll(filter_list2);
        filter_list1.addAll(filter_list3);

        yield (state.copyWith(filteredData: filter_list1.toList()));
      }
    } else if (event is AstologerShowSearch) {
      print(event.show);
      print("xyz");
      if (event.show == false) {
        yield (state.copyWith(filteredData: state.data));
      }
      yield (state.copyWith(showSearch: event.show));
      print("show : " + state.showSearch.toString());
    } else if (event is AstrologerFilterSkill) {
      print("ww");
      var list = event.skills.toList();

      yield state.copyWith(skill_values: list);

      print(state.skill_values);
    } else if (event is AstrologerFilterLang) {
      print(event.lang);
      yield state.copyWith(lang_values: event.lang);
      print(state.lang_values);
    } else if (event is AstrologerFilterBy) {
      print(state.skill_values);

      List<Data> filter_list = state.data.toList();

      List<Skill> skills = state.skill_values;
      List<Language> langs =
          state.lang_values.isEmpty ? Constants.lang_values : state.lang_values;

      List<Data> filter_list1 = filter_list
          .where((element) => element.skills.toSet().containsAll(skills))
          .toList();

      print(filter_list1);
      List<Data> filter_list2 = filter_list1
          .where((element) => element.languages.toSet().containsAll(langs))
          .toList();

      yield state.copyWith(filteredData: filter_list2);
      // filter_list.where((element) => element.skills)
    }
    // }
    //
    else if (event is SortExphightolow) {
      // List<Data> filter = state.data.toList();
      print("ww");
      if (event.toggle == true) {
        List<Data> l = state.filteredData;

        l.sort((a, b) => b.experience.compareTo(a.experience));
        yield state.copyWith(sorting_value: "EHL", filteredData: l);
      } else {
        yield state.copyWith(sorting_value: "");
      }
    } else if (event is SortExplowtohigh) {
      if (event.toggle == true) {
        List<Data> l = state.filteredData;

        l.sort((a, b) => a.experience.compareTo(b.experience));
        yield state.copyWith(sorting_value: "ELH", filteredData: l);
      } else {
        yield state.copyWith(sorting_value: "");
      }
    } else if (event is Pricehightolow) {
      if (event.toggle == true) {
        List<Data> l = state.filteredData;

        l.sort((a, b) => b.additionalPerMinuteCharges
            .compareTo(a.additionalPerMinuteCharges));
        yield state.copyWith(sorting_value: "PHL", filteredData: l);
      } else {
        yield state.copyWith(sorting_value: "");
      }
    } else if (event is Pricelowtohigh) {
      if (event.toggle == true) {
        List<Data> l = state.filteredData;

        l.sort((a, b) => a.additionalPerMinuteCharges
            .compareTo(b.additionalPerMinuteCharges));
        yield state.copyWith(sorting_value: "PLH");
      } else {
        yield state.copyWith(sorting_value: "");
      }
    }

    //else if (event is AstologerShowSearch) {
    //   print(event.show);
    //   print("xyz");
    //   yield (state.copyWith(showSearch: event.show));
    //   print("show : " + state.showSearch.toString());
    // }
  }
}
