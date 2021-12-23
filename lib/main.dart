import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:india_today/logic/bloc/bottombar/bottombar_bloc.dart';
import 'package:india_today/logic/repository.dart';
import 'package:india_today/ui/screens/main_screen.dart';
import 'package:sizer/sizer.dart';
import 'logic/bloc/astrologer/astrologer_bloc.dart';
import 'logic/bloc/panchang/panchang_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AstrolgerRespository>(
          create: (context) => AstrolgerRespository(),
        ),
        RepositoryProvider<PanchangRespository>(
          create: (context) => PanchangRespository(),
        ),
        RepositoryProvider<PanchangLocationRespository>(
          create: (context) => PanchangLocationRespository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AstrologerBloc>(
            create: (context) => AstrologerBloc(
                respository: context.read<AstrolgerRespository>()),
          ),
          BlocProvider<BottombarBloc>(
            create: (context) => BottombarBloc(),
          ),
          BlocProvider<PanchangBloc>(
            create: (context) =>
                PanchangBloc(respository: context.read<PanchangRespository>()),
          ),
        ],
        child: IndiaToday(),
      ),
    );
  }
}

class IndiaToday extends StatefulWidget {
  @override
  State<IndiaToday> createState() => _IndiaTodayState();
}

class _IndiaTodayState extends State<IndiaToday> {
  @override
  void initState() {
    context.read<AstrologerBloc>().add(AstrologerGetData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          '/': (context) => PageScreen(),
        },
        initialRoute: '/',
      );
    });
  }
}
