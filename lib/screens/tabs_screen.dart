import 'package:flutter/material.dart';
import './quiz_screen.dart';
import './categories_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TabsScreenState();
}
  class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, Object>> _pages = [
    {'page': CategoriesScreen(), 'title' : 'Categories'},
    {'page': QuizScreen(), 'title': 'Quiz'},
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
      appBar: AppBar(title: Text(_pages[_selectedPageIndex]['title'] as String),
        ),
      body: _pages[_selectedPageIndex]['page'] as Widget,
       bottomNavigationBar: BottomNavigationBar(
         onTap: _selectPage,
         backgroundColor: Theme.of(context).primaryColor,
         unselectedItemColor: Colors.white,
         selectedItemColor: Theme.of(context).colorScheme.secondary,
         currentIndex: _selectedPageIndex,
         items: const [
           BottomNavigationBarItem(icon: Icon(Icons.category),
               label: 'Categories'),
       BottomNavigationBarItem(icon: Icon(Icons.question_mark),
         label: 'Quiz'
           ),
           BottomNavigationBarItem(icon: Icon(Icons.person),
               label: 'Profile'
           )
         ],
       ),


     );
  }
}

