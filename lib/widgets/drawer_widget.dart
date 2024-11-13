import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tarea_6/bloc/drawer/drawer_event.dart';
import 'package:tarea_6/bloc/drawer/nav_drawer_bloc.dart';
import 'package:tarea_6/bloc/drawer/nav_drawer_state.dart';
import 'package:iconly/iconly.dart';

class _NavigationItem {
  final NavItem item;
  final String title;
  final IconData icon;

  _NavigationItem(this.item, this.title, this.icon);
}

class NavDrawerWidget extends StatelessWidget {
  NavDrawerWidget({super.key});

  final List<_NavigationItem> _listItems = [
    _NavigationItem(NavItem.homeView, "Inicio", IconlyBold.home),
    _NavigationItem(
        NavItem.genreByNameView, "Género x Nombre", IconlyBold.home),
    _NavigationItem(
        NavItem.ageByNameView, "Edad x Nombre", IconlyBold.calendar),
    _NavigationItem(NavItem.universityByCountryView, "Universidad x País",
        IconlyBold.paper_negative),
    _NavigationItem(NavItem.climateInDRView, "Clima RD", IconlyBold.home),
    _NavigationItem(NavItem.newsView, "Noticias", IconlyBold.home),
    _NavigationItem(NavItem.hireMeView, "Contrátame", IconlyBold.user_2),
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromARGB(255, 238, 242, 255),
      child: Column(
        children: [
          const UserAccountsDrawerHeader(
            accountName: Text(
              'Rachely Pérez',
              style: TextStyle(color: Color.fromARGB(255, 246, 248, 255)),
            ),
            accountEmail: Text(
              '20221856@itla.edu.do',
              style: TextStyle(color: Color.fromARGB(255, 246, 248, 255)),
            ),
            decoration: BoxDecoration(color: Color.fromARGB(255, 84, 124, 255)),
          ),
          ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: _listItems.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) =>
                  BlocBuilder<NavDrawerBloc, NavDrawerState>(
                    builder: (BuildContext context, NavDrawerState state) =>
                        _buildItem(_listItems[index], state),
                  ))
        ],
      ),
    );
  }

  Widget _buildItem(_NavigationItem data, NavDrawerState state) =>
      _makeListItem(data, state);

  Widget _makeListItem(_NavigationItem data, NavDrawerState state) => Card(
        //color: const Color.fromARGB(255, 246, 248, 255),
        color: const Color.fromARGB(255, 238, 242, 255),
        shape: const ContinuousRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        borderOnForeground: true,
        elevation: 0,
        margin: EdgeInsets.zero,
        child: Builder(
          builder: (BuildContext context) => ListTile(
            title: Text(
              data.title,
              style: TextStyle(
                fontWeight: data.item == state.selectedItem
                    ? FontWeight.bold
                    : FontWeight.w300,
                color: data.item == state.selectedItem
                    ? const Color.fromARGB(255, 84, 124, 255)
                    : const Color.fromARGB(255, 142, 159, 215),
              ),
            ),
            leading: Icon(
              data.icon,
              color: data.item == state.selectedItem
                  ? const Color.fromARGB(255, 84, 124, 255)
                  : const Color.fromARGB(255, 142, 159, 215),
            ),
            onTap: () => _handleItemClick(context, data.item),
          ),
        ),
      );

  void _handleItemClick(BuildContext context, NavItem item) {
    BlocProvider.of<NavDrawerBloc>(context).add(NavigateTo(item));
    Navigator.pop(context);
  }
}
