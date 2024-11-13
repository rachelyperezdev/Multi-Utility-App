import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tarea_6/bloc/drawer/nav_drawer_bloc.dart';
import 'package:tarea_6/bloc/drawer/nav_drawer_state.dart';
import 'package:tarea_6/views/age_by_name_view.dart';
import 'package:tarea_6/views/climate_in_dr_view.dart';
import 'package:tarea_6/views/genre_by_name_view.dart';
import 'package:tarea_6/views/hire_me_view.dart';
import 'package:tarea_6/views/home_view.dart';
import 'package:tarea_6/views/news_view.dart';
import 'package:tarea_6/views/university_by_country_view.dart';
import 'package:tarea_6/widgets/drawer_widget.dart';

class MainWrapper extends StatefulWidget {
  const MainWrapper({super.key});

  @override
  _MainWrapperState createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  late NavDrawerBloc _bloc;
  late Widget _content;

  @override
  void initState() {
    super.initState();
    _bloc = NavDrawerBloc();
    _content = _getContentFromState(_bloc.state.selectedItem);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NavDrawerBloc>(
        create: (BuildContext context) => _bloc,
        child: BlocConsumer<NavDrawerBloc, NavDrawerState>(
          listener: (BuildContext context, NavDrawerState state) {
            _content = _getContentFromState(state.selectedItem);
          },
          buildWhen: (previous, current) {
            return previous.selectedItem != current.selectedItem;
          },
          listenWhen: (previous, current) {
            return previous.selectedItem != current.selectedItem;
          },
          builder: (BuildContext context, NavDrawerState state) {
            return Scaffold(
              appBar: AppBar(
                title: Text(
                  _getAppBarTitle(state.selectedItem),
                  style: const TextStyle(
                      color: Color.fromARGB(255, 84, 124, 255),
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                backgroundColor: const Color.fromARGB(255, 238, 242, 255),
                iconTheme: const IconThemeData(
                    color: Color.fromARGB(255, 84, 124, 255)),
              ),
              drawer: NavDrawerWidget(),
              body: AnimatedSwitcher(
                switchInCurve: Curves.fastLinearToSlowEaseIn,
                switchOutCurve: Curves.linearToEaseOut,
                duration: const Duration(milliseconds: 400),
                child: _content,
              ),
            );
          },
        ));
  }

  Widget _getContentFromState(NavItem selectedItem) {
    switch (selectedItem) {
      case NavItem.homeView:
        return const HomeView();
      case NavItem.genreByNameView:
        return const GenreByNameView();
      case NavItem.ageByNameView:
        return const AgeByNameView();
      case NavItem.universityByCountryView:
        return const UniversityByCountryView();
      case NavItem.climateInDRView:
        return const WeatherInDRView();
      case NavItem.newsView:
        return const NewsView();
      case NavItem.hireMeView:
        return const HireMeView();
      default:
        return const HomeView();
    }
  }

  String _getAppBarTitle(NavItem selectedItem) {
    switch (selectedItem) {
      case NavItem.homeView:
        return "Inicio";
      case NavItem.genreByNameView:
        return "Género de acuerdo al Nombre";
      case NavItem.ageByNameView:
        return "Edad de acuerdo al Nombre";
      case NavItem.universityByCountryView:
        return "Universidad de acuerdo al País";
      case NavItem.climateInDRView:
        return "Clima Actual en Rep. Dom";
      case NavItem.newsView:
        return "Noticias";
      case NavItem.hireMeView:
        return "Contrátame";
      default:
        return "Inicio";
    }
  }
}
