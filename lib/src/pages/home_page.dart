import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gastos_foraneo/src/Providers/main_provider.dart';
import 'package:gastos_foraneo/src/models/user_expenses_model.dart';
import 'package:provider/provider.dart';

import '../Widgets/BottomMenu/bottom_menu_widget.dart';
import '../models/user_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FirebaseFirestore dataUserFuture = FirebaseFirestore.instance;
  Usuario usr = Usuario(correo: "", id: "", name: "", phone: "");
  UsuarioGastos usrgst = UsuarioGastos(
      cleaningAmount: 0,
      foodAmount: 0,
      studyAmount: 0,
      totalAmount: 0,
      transportAmount: 0,
      variousAmount: 0);
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mainProvider = Provider.of<MainProvider>(context, listen: false);
    CollectionReference cliente =
        FirebaseFirestore.instance.collection('usuarios');

    return Scaffold(
      appBar: AppBar(
        title: const Text("Pagina Principal"),
      ),
      body: SingleChildScrollView(
          child: StreamBuilder(
              stream: cliente
                  .where("user_id", isEqualTo: mainProvider.token.toString())
                  .snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: Text('Cargando'));
                }

                return Column(
                    children: snapshot.data!.docs.map((usuario) {
                  var usrss =
                      Usuario.fromJson(usuario.data() as Map<String, dynamic>);

                  return Text(usrss.correo);
                }).toList());
              })),
      bottomNavigationBar: const BottomMenuWidget(selectedIndex: 1),
    );
  }
}
