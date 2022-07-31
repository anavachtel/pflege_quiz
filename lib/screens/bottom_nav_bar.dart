import 'package:flutter/material.dart';
import 'package:meals_app/screens/categories_list.dart';
import 'package:meals_app/screens/profile.dart';
import 'package:meals_app/screens/welcome_page.dart';
import 'package:provider/provider.dart';

import '../helpers/appcolors.dart';
import '../services/profile_service.dart';

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
    ProfileService profilService =
        Provider.of<ProfileService>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          _pages[_selectedPageIndex]['title'] as String,
          style: TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.w900),
          textAlign: TextAlign.center,
        ),
        actions: [
          IconButton(
              icon: Icon(
                Icons.follow_the_signs_outlined,
                size: 35,
              ),
              onPressed: () async {
                profilService.signOut();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => WelcomePage()));
                //code to execute when this button is pressed
              })
        ],
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
