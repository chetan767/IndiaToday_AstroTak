import 'package:flutter/material.dart';
import 'package:india_today/const.dart';
import 'package:india_today/logic/bloc/bottombar/bottombar_bloc.dart';
import 'package:india_today/ui/screens/astrologer_screen.dart';
import 'package:india_today/ui/screens/panchang_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class PageScreen extends StatelessWidget {
  List<Widget> screens = [
    PanchangScreen(),
    AstrologerScreen(),
    PanchangScreen(),
    PanchangScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          context.read<BottombarBloc>().add(ChangeScreen(index: index));
        }, // new
        currentIndex: context.watch<BottombarBloc>().state.index, // new
        unselectedLabelStyle: TextStyle(color: Colors.grey, fontSize: 8.0.sp),
        selectedLabelStyle: TextStyle(color: Colors.orange, fontSize: 8.0.sp),
        selectedItemColor: Colors.orange,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Image.asset(
                "assets/home.png",
                width: 30,
                color: Colors.grey,
              ),
              activeIcon: Image.asset(
                "assets/home.png",
                color: Colors.orange,
                width: 30,
              ),
              label: "Home"),
          BottomNavigationBarItem(
            label: "Talk to Astologer",
            icon: Image.asset(
              "assets/talk.png",
              color: Colors.grey,
              width: 30,
            ),
            activeIcon: Image.asset(
              "assets/talk.png",
              color: Colors.orange,
              width: 30,
            ),
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/ask.png",
              width: 30,
            ),
            activeIcon: Image.asset(
              "assets/ask.png",
              color: Colors.orange,
              width: 30,
            ),
            label: "Ask Question",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/reports.png",
              width: 30,
            ),
            activeIcon: Image.asset(
              "assets/reports.png",
              color: Colors.orange,
              width: 30,
            ),
            label: "Reports",
          )
        ],
      ),
      appBar: Constants.appBar,
      body: screens[context.watch<BottombarBloc>().state.index],
    );
  }
}
