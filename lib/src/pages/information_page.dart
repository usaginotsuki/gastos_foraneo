import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:gastos_foraneo/src/Widgets/Graphs/graphpie_widget.dart';
import 'package:provider/provider.dart';

import '../Providers/main_provider.dart';
import '../Widgets/BottomMenu/bottom_menu_widget.dart';

import '../Widgets/Graphs/graphlinear_widget.dart';
import '../models/user_expenses_model.dart';

class InformationPage extends StatefulWidget {
  const InformationPage({super.key});

  @override
  State<InformationPage> createState() => _InformationPageState();
}

List<UsuarioGastos> listgst = [];
int currentIndex = 0;
UsuarioGastos gst = UsuarioGastos(
    cleaningAmount: 0,
    foodAmount: 0,
    idexp: "",
    studyAmount: 0,
    totalAmount: 0,
    transportAmount: 0,
    variousAmount: 0);
List<Widget> lstdd = [];

class _InformationPageState extends State<InformationPage> {
  String yeardata = "0";
  int currentPage = DateTime.now().month - 1;
  @override
  void dispose() {
    super.dispose();
    listgst.clear();
  }

  @override
  Widget build(BuildContext context) {
    final mainProvider = Provider.of<MainProvider>(context, listen: false);

    CollectionReference clientegastos = FirebaseFirestore.instance
        .collection('usuarios')
        .doc(mainProvider.token)
        .collection("expenses");
    var streamBuilderGastos = clientegastos.snapshots();

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            StreamBuilder(
              stream: streamBuilderGastos,
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return Center(child: CircularProgressIndicator());
                  case ConnectionState.active:
                  case ConnectionState.none:
                  default:
                    return Stack(
                        children: snapshot.data!.docs.map((gastos) {
                      gst = UsuarioGastos.fromJson(
                          gastos.data() as Map<String, dynamic>);
                      if (listgst.isEmpty || listgst.length <= 12) {
                        listgst.add(gst);
                      }

                      return Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.10),
                        child: Stack(
                          children: [
                            (listgst.isNotEmpty && listgst.length >= 12)
                                ? LineChartWidget(
                                    incomeList: [
                                      listgst[0].totalAmount.toDouble(),
                                      listgst[1].totalAmount.toDouble(),
                                      listgst[2].totalAmount.toDouble(),
                                      listgst[3].totalAmount.toDouble(),
                                      listgst[4].totalAmount.toDouble(),
                                      listgst[5].totalAmount.toDouble(),
                                      listgst[6].totalAmount.toDouble(),
                                      listgst[7].totalAmount.toDouble(),
                                      listgst[8].totalAmount.toDouble(),
                                      listgst[9].totalAmount.toDouble(),
                                      listgst[10].totalAmount.toDouble(),
                                      listgst[11].totalAmount.toDouble(),
                                    ],
                                  )
                                : Container(),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height *
                                      0.25),
                              child: Center(
                                child: SizedBox.square(
                                  dimension: MediaQuery.of(context).size.width,
                                  child: PageView.builder(
                                      clipBehavior: Clip.none,
                                      onPageChanged: (index) {},
                                      itemCount: 12,
                                      physics: const ClampingScrollPhysics(),
                                      itemBuilder: (context, int index) {
                                        return PieGraphWidget(
                                          incomeData: [
                                            listgst[index]
                                                .cleaningAmount
                                                .toDouble(),
                                            listgst[index]
                                                .foodAmount
                                                .toDouble(),
                                            listgst[index]
                                                .studyAmount
                                                .toDouble(),
                                            listgst[index]
                                                .transportAmount
                                                .toDouble(),
                                            listgst[index]
                                                .variousAmount
                                                .toDouble(),
                                          ],
                                        );
                                      }),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList());
                }
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomMenuWidget(selectedIndex: 2),
    );
  }
}
