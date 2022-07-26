import 'package:flutter/material.dart';
import 'package:meals_app/screens/categories_list.dart';
import 'package:meals_app/screens/profile.dart';

import '../helpers/appcolors.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final List<Map<String, Object>> _pages = [
    {'page': CategoryListPage(), 'title': 'Kategorien'},
    {'page': Profile(), 'title': 'Profil'},
  ];
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _pages[_selectedPageIndex]['title'] as String,
        ),
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.MAIN_COLOR,
      ),
      body: _pages[_selectedPageIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: AppColors.MAIN_COLOR,
        unselectedItemColor: Colors.blue,
        selectedItemColor: Colors.white,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: 'Kategorien'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil')
        ],
      ),
    );
  }
}
