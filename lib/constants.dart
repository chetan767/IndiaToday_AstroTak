import 'package:flutter/material.dart';

import 'logic/bloc/astrologer/astrologer_bloc.dart';

class Constants {
  static List<Skill> skill_values = [
    Skill(id: 1, name: "Astrology", description: ""),
    Skill(id: 2, name: "Vastu", description: ""),
    Skill(id: 3, name: "Numerology", description: ""),
    Skill(id: 4, name: "Palmistry", description: ""),
    Skill(id: 5, name: "Tarot", description: ""),
    Skill(id: 6, name: "Falit Jyotish", description: ""),
    Skill(id: 7, name: "Kundali Grah Dosh", description: ""),
    Skill(id: 8, name: "Vedic Astrology", description: ""),
    Skill(id: 9, name: "Face Reading", description: ""),
  ];

  static List<Language> lang_values = [
    Language(id: 1, name: "Hindi"),
    Language(id: 2, name: "English")
  ];

  static AppBar appBar = AppBar(
    title: Image.asset(
      "assets/logo.png",
      width: 70,
    ),
    centerTitle: true,
    backgroundColor: Colors.white,
    elevation: 0,
    actions: [
      Container(
        margin: EdgeInsets.only(right: 20),
        child: Image.asset(
          "assets/profile.png",
          width: 30,
        ),
      ),
    ],
    leading: Image.asset(
      "assets/hamburger.png",
      width: 30,
    ),
  );
}
