import 'package:flutter/material.dart';

import '../Widgets/BottomMenu/bottom_menu_widget.dart';



class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(title: Text("Perfil de usuario"),),
      body: SingleChildScrollView(
        child: Column(
        children: [
          Text("Perfil")
        ],  
        ),
      ),
       bottomNavigationBar: const BottomMenuWidget(selectedIndex: 0),
    );
  }
}