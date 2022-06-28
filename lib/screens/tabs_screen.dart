import 'package:flutter/material.dart';
import './quiz_screen.dart';
import './categories_screen.dart';

// Navbar
// erste Seite die aufgerufen wird, verweist direkt auf Categories Screen
class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TabsScreenState();
}
  class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, Object>> _pages = [
    // router, verweist auf Seiten
    {'page': CategoriesScreen(), 'title' : 'Categories'},
    {'page': QuizScreen(), 'title': 'Quiz'},
  ];
  // damit die ausgewählte Seite Categories ist
  int _selectedPageIndex = 0;

  // methode die beim tippen aufgerufen wird
  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }
  @override
    Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(title: Text(_pages[_selectedPageIndex]['title'] as String),
        ),
      body: _pages[_selectedPageIndex]['page'] as Widget,
       bottomNavigationBar: BottomNavigationBar(
         // tippen methode
         onTap: _selectPage,
         backgroundColor: Theme.of(context).primaryColor,
         unselectedItemColor: Colors.white,
         selectedItemColor: Theme.of(context).colorScheme.secondary,
         currentIndex: _selectedPageIndex,

        //navbar items
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: 'Categories'),
          BottomNavigationBarItem(
              icon: Icon(Icons.question_mark), label: 'Quiz'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile')
        ],
       ),


     );
  }
}

