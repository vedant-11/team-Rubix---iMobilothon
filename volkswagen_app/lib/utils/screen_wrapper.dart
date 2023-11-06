import 'package:flutter/material.dart';
import 'package:volkswagen_app/screens/favourites.dart';
import 'package:volkswagen_app/screens/home.dart';
import 'package:volkswagen_app/screens/profile.dart';

class ScreenWrapper extends StatefulWidget {
  const ScreenWrapper({Key? key}) : super(key: key);

  @override
  State<ScreenWrapper> createState() => _ScreenWrapperState();
}

class _ScreenWrapperState extends State<ScreenWrapper> {
  List<Widget> children = [HomeScreen(), Favourites(), Profile()];
  int _selectedTab = 0;
  void onTap(int i) {
    setState(() {
      _selectedTab = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
                top: 0,
                bottom: 0,
                right: 0,
                left: 0,
                child: IndexedStack(
                  index: _selectedTab,
                  children: children,
                )),
            Positioned(
              bottom: 15,
              left: 26,
              right: 26,
              child: Container(
                height: 69,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {
                          onTap(0);
                        },
                        icon: Icon(
                          Icons.home,
                          size: 28,
                          color: _selectedTab == 0
                              ? Colors.black
                              : Color(0xFFCCCCCC),
                        )),
                    IconButton(
                      onPressed: () {
                        onTap(1);
                      },
                      icon: Icon(
                        Icons.heart_broken,
                        size: 28,
                        color: _selectedTab == 1
                            ? Colors.black
                            : Color(0xFFCCCCCC),
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          onTap(2);
                        },
                        icon: Icon(
                          Icons.person,
                          size: 28,
                          color: _selectedTab == 2
                              ? Colors.black
                              : Color(0xFFCCCCCC),
                        ))
                  ],
                ),
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 8,
                          spreadRadius: -1,
                          offset: Offset(0, -3),
                          color: Color(0xFF323247).withOpacity(0.05)),
                      BoxShadow(
                          blurRadius: 1,
                          spreadRadius: 0,
                          offset: Offset(0, 0),
                          color: Color(0xFF0C1A4B).withOpacity(0.24))
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(44)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
