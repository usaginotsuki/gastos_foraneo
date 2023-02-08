import 'package:flutter/material.dart';

import '../Widgets/BottomMenu/bottom_menu_widget.dart';





class InformationPage extends StatefulWidget {
  const InformationPage({super.key});

  @override
  State<InformationPage> createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Información"),),
      body: SingleChildScrollView(
        child: Column(
        children: [
          Text("Informacion")
        ],  
        ),
      ),
       bottomNavigationBar: const BottomMenuWidget(selectedIndex: 2),
    );
  }
}