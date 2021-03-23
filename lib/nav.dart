import 'package:flutter/material.dart';
import 'history.dart';
import 'home_page.dart';
import 'package:pizza/const/themeColor.dart';

class Nav extends StatefulWidget {
  @override
  _NavState createState() => _NavState();
}

class _NavState extends State<Nav> {
  int _SelectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[Home(), Text("Order"), History()];

  void _onItemTap(int index) {
    setState(() {
      _SelectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home,color: Themes.color,), title: Text('Home')),
        BottomNavigationBarItem(
            icon: Icon(Icons.food_bank,color: Themes.color,), title: Text('Order')),
        BottomNavigationBarItem(
            icon: Icon(Icons.history,color: Themes.color), title: Text('History')),
      ],
      currentIndex: _SelectedIndex,
      onTap: _onItemTap,
    );
  }
}
