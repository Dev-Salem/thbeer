import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:thbeer/screens/bookmarks_screen.dart';
import 'package:thbeer/widgets/verses_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _currentIndex = 0;
  final screens = [const VersesList(), const BookmarksScreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: SalomonBottomBar(
            currentIndex: _currentIndex,
            onTap: (i) {
              setState(() {
                _currentIndex = i;
              });
            },
            items: [
              SalomonBottomBarItem(
                  icon: const Icon(Icons.home), title: const Text('الرئيسة')),
              SalomonBottomBarItem(
                  icon: const Icon(Icons.bookmark),
                  title: const Text('اشارات مرجعية')),
            ]),
        appBar: AppBar(
          backgroundColor: context.primaryColor,
          title: const Text(
            "تحبير",
            style: TextStyle(fontSize: 30),
          ),
        ),
        body: screens[_currentIndex]);
  }
}
