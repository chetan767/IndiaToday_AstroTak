part of 'astrologer_bloc.dart';

@immutable
abstract class AstrologerEvent {}

class AstrologerGetData extends AstrologerEvent {}

class AstrologerFilterList extends AstrologerEvent {
  String text;
  AstrologerFilterList({
    required this.text,
  });
}

class SortExphightolow extends AstrologerEvent {
  bool toggle;
  SortExphightolow({
    required this.toggle,
  });
}

class SortExplowtohigh extends AstrologerEvent {
  bool toggle;
  SortExplowtohigh({
    required this.toggle,
  });
}

class Pricelowtohigh extends AstrologerEvent {
  bool toggle;
  Pricelowtohigh({
    required this.toggle,
  });
}

class Pricehightolow extends AstrologerEvent {
  bool toggle;
  Pricehightolow({
    required this.toggle,
  });
}

class AstologerShowSearch extends AstrologerEvent {
  final bool show;
  AstologerShowSearch({
    required this.show,
  });
}

class AstrologerFilterBy extends AstrologerEvent {}

class AstrologerFilterSkill extends AstrologerEvent {
  List<Skill> skills;
  AstrologerFilterSkill({
    required this.skills,
  });
}

class AstrologerFilterLang extends AstrologerEvent {
  List<Language> lang;
  AstrologerFilterLang({
    required this.lang,
  });
}
