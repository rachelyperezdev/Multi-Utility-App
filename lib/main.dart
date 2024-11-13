import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:tarea_6/bloc/age/age_bloc.dart';
import 'package:tarea_6/bloc/gender/gender_bloc.dart';
import 'package:tarea_6/bloc/news/news_bloc.dart';
import 'package:tarea_6/bloc/universities/university_bloc.dart';
import 'package:tarea_6/mainwrapper.dart';
import 'package:tarea_6/services/age_service.dart';
import 'package:tarea_6/services/gender_service.dart';
import 'package:tarea_6/services/news_service.dart';
import 'package:tarea_6/services/university_service.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:tarea_6/services/weather_service.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  Intl.defaultLocale = 'es_ES';
  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (context) => GenderBloc(GenderService())),
    BlocProvider(create: (context) => AgeBloc(AgeService())),
    BlocProvider(create: (context) => UniversityBloc(UniversityService())),
    BlocProvider(create: (context) => NewsBloc(NewsService())),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Tarea 6",
      theme: ThemeData(
          useMaterial3: true,
          textTheme: GoogleFonts.poppinsTextTheme(),
          // fontFamily: GoogleFonts.montserrat().fontFamily,
          scaffoldBackgroundColor: const Color.fromARGB(255, 222, 230, 253)),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''),
        Locale('es', ''),
      ],
      home: const Banner(
        message: 'Tarea 6',
        location: BannerLocation.topEnd,
        child: MainWrapper(),
      ),
    );
  }
}
