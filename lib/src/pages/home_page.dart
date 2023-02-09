import 'package:flutter/material.dart';

import '../Widgets/BottomMenu/bottom_menu_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pagina Principal"),
      ),
      body: SingleChildScrollView(
        child: Column(children: const [Text("BIENVENIDOS")]),
      ),
      bottomNavigationBar: const BottomMenuWidget(selectedIndex: 1),
    );
  }
}
