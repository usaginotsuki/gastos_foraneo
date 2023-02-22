import 'package:flutter/material.dart';
import 'package:gastos_foraneo/src/pages/home_page.dart';
import 'package:gastos_foraneo/src/pages/information_page.dart';
import 'package:gastos_foraneo/src/pages/setting_page.dart';

import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';
import 'package:page_transition/page_transition.dart';

class BottomMenuWidget extends StatefulWidget {
  const BottomMenuWidget({super.key, required this.selectedIndex});
  final int selectedIndex;

  @override
  State<BottomMenuWidget> createState() => _BottomMenuWidgetState();
}

late int indexSelected;

class _BottomMenuWidgetState extends State<BottomMenuWidget> {
  @override
  void initState() {
    super.initState();
    indexSelected = widget.selectedIndex;
  }

  @override
  Widget build(BuildContext context) {
    return SlidingClippedNavBar(
      backgroundColor: Colors.white,
      onButtonPressed: onButtonPressed,
      iconSize: 30,
      activeColor: Theme.of(context).primaryColor,
      selectedIndex: indexSelected,
      barItems: [
        BarItem(
          icon: Icons.settings,
          title: 'Perfil',
        ),
        BarItem(
          icon: Icons.home,
          title: 'Home',
        ),
        BarItem(
          icon: Icons.info,
          title: 'Información',
        ),
      ],
    );
  }

  void onButtonPressed(int index) {
    Navigator.pop(context);
    if (widget.selectedIndex != index) {
      setState(() {
        indexSelected = index;
        if (indexSelected == 0) {
         Navigator.push(
                 context,
                  PageTransition(
                    type: PageTransitionType.leftToRight,
                    child: SettingPage(),
                    duration: Duration(milliseconds: 400),
                  ),
            );
        } else if (indexSelected == 1) {
           Navigator.push(
                 context,
                  PageTransition(
                    type: PageTransitionType.fade,
                    child: HomePage(),
                    duration: Duration(milliseconds: 500),
                  ),
            );
        } else if (indexSelected == 2) {
         Navigator.push(
                 context,
                  PageTransition(
                    type: PageTransitionType.leftToRightWithFade,
                    child: InformationPage(),
                    duration: Duration(milliseconds: 500),
                  ),
            );
        }
      });
    }
  }
}
