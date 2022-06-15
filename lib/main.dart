import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import './pages/home.dart';
import './pages/searchPage.dart';
import './pages/mypage.dart';

void main() {
  runApp(const MyApp());
}

const seedColor = Color.fromARGB(172, 81, 255, 0);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: seedColor),
          textTheme: TextTheme(
            headline1: GoogleFonts.ibmPlexSansKr(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
            headline2: GoogleFonts.ibmPlexSansKr(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
            subtitle1: GoogleFonts.ibmPlexSansKr(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black
            ),
            subtitle2: GoogleFonts.ibmPlexSansKr(
              fontSize: 14,
              fontWeight: FontWeight.normal,
              color: Colors.grey,
            )
          ),
        ),
        builder: EasyLoading.init(),
        home: Main());
  }
}

class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "홈",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: "검색",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: "내정보",
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
        body: SafeArea(
          child: _pageOption.elementAt(_selectedIndex),
        ));
  }
}

List _pageOption = [Home(), SearchPage(), Mypage()];
