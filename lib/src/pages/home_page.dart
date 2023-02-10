import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gastos_foraneo/src/Providers/main_provider.dart';
import 'package:gastos_foraneo/src/models/user_expenses_model.dart';
import 'package:provider/provider.dart';

import '../Widgets/BottomMenu/bottom_menu_widget.dart';
import '../Widgets/utils/dialog_ulit.dart';
import '../models/user_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController controllerTextLimp = TextEditingController();
  TextEditingController controllerTextComi = TextEditingController();
  TextEditingController controllerTextEstu = TextEditingController();
  TextEditingController controllerTextTota = TextEditingController();
  TextEditingController controllerTextTrasn = TextEditingController();
  TextEditingController controllerTextVario = TextEditingController();

  PageController _controller = PageController();
  int currentPage = DateTime.now().month - 1;
  String tipodepago = "";
  String yeardata = "0";
  FirebaseFirestore dataUserFuture = FirebaseFirestore.instance;
  Usuario usr = Usuario(correo: "", id: "", name: "", phone: "");
  UsuarioGastos usrgst = UsuarioGastos(
      cleaningAmount: 0,
      foodAmount: 0,
      idexp: "",
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
    CollectionReference clientegastos = FirebaseFirestore.instance
        .collection('usuarios')
        .doc(mainProvider.token)
        .collection("expenses");
    _editParamGastos(String type, String newValue) {
      final mainProvider = Provider.of<MainProvider>(context, listen: false);
      clientegastos.doc("exp" + mainProvider.token).update((type == "limpieza")
          ? {
              'user_cleaningAmount': num.parse(newValue),
            }
          : (type == "comida")
              ? {
                  'user_foodAmount': num.parse(newValue),
                }
              : (type == "estudio")
                  ? {
                      'user_studyAmount': num.parse(newValue),
                    }
                  : (type == "transporte")
                      ? {
                          'user_transportAmount': num.parse(newValue),
                        }
                      : (type == "varios")
                          ? {
                              'user_variousAmount': num.parse(newValue),
                            }
                          : (type == "varios")
                              ? {
                                 'user_variousAmount': num.parse(newValue),
                              }
                              : {
                                 
                                });
    }

    _alertDialog(String type, TextEditingController controller) {
      DialogUtils.showAlertWithCustomActions(context, "", [
        TextFormField(
          decoration: InputDecoration(labelText: "Escriba el nuevo $type"),
          controller: controller,
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.allow(RegExp(r'^[1-9][\.\d]*(,\d+)?$')),
          ],
          onFieldSubmitted: (newValue) {
            setState(() {
              _editParamGastos(type, newValue);
              Navigator.pop(context, 'OK');
            });
          },
        )
      ]);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Pagina Principal"),
      ),
      body: SingleChildScrollView(
          child: StreamBuilder(
              stream: clientegastos.snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }
                return Column(
                    children: snapshot.data!.docs.map((gastos) {
                  var gasto = UsuarioGastos.fromJson(
                      gastos.data() as Map<String, dynamic>);
                  num total = gasto.cleaningAmount +
                      gasto.foodAmount +
                      gasto.studyAmount +
                      gasto.transportAmount +
                      gasto.variousAmount;
                  return Column(
                    children: [
                      _selector(),
                      Column(
                        children: [
                          Text(
                            gasto.totalAmount.toString(),
                            style: (total > gasto.totalAmount)
                                ? TextStyle(
                                    fontSize: 50, color: Color(0xffF02E65))
                                : TextStyle(
                                    fontSize: 50,
                                    color: Color.fromARGB(255, 46, 240, 127)),
                          ),
                          Text(
                            "Fondos",
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          Card(
                            child: Wrap(
                              spacing: 20,
                              runSpacing: 20,
                              children: [
                                Card(
                                  child: ListTile(
                                    onTap: () {
                                      tipodepago = "limpieza";
                                      _alertDialog(tipodepago, controllerTextLimp);
                                    },
                                    leading: Icon(Icons.wash),
                                    title: const Text("Limpieza"),
                                    trailing: Text(
                                        gasto.cleaningAmount.toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineSmall),
                                  ),
                                ),
                                Card(
                                  child: ListTile(
                                    onTap: () {
                                      tipodepago = "comida";
                                      _alertDialog(tipodepago, controllerTextComi);
                                    },
                                    leading: Icon(Icons.food_bank),
                                    title: const Text("Comida"),
                                    trailing: Text(gasto.foodAmount.toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineSmall),
                                  ),
                                ),
                                Card(
                                  child: ListTile(
                                     onTap: () {
                                      tipodepago = "estudios";
                                      _alertDialog(tipodepago, controllerTextComi);
                                    },
                                    leading: Icon(Icons.book),
                                    title: const Text("Estudios"),
                                    trailing: Text(gasto.studyAmount.toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineSmall),
                                  ),
                                ),
                                Card(
                                  child: ListTile(
                                      onTap: () {
                                      tipodepago = "transporte";
                                      _alertDialog(tipodepago, controllerTextComi);
                                    },
                                    leading: Icon(Icons.bus_alert),
                                    title: const Text("Transporte"),
                                    trailing: Text(
                                        gasto.transportAmount.toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineSmall),
                                  ),
                                ),
                                Card(
                                  child: ListTile(
                                      onTap: () {
                                      tipodepago = "varios";
                                      _alertDialog(tipodepago, controllerTextComi);
                                    },
                                    leading: Icon(Icons.festival),
                                    title: const Text("Varios"),
                                    trailing: Text(
                                        gasto.variousAmount.toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineSmall),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      OutlinedButton(
                          onPressed: () {
                               tipodepago = "fondos";
                                      _alertDialog(tipodepago, controllerTextTota);
                          }, child: Text("Agregar Fondos")),
                           OutlinedButton(
                          onPressed: () {
                            _alertDialog(tipodepago, controllerTextTota);
                          }, child: Text("Enviar el Reporte")),
                    ],
                  );
                }).toList());
              })),
      bottomNavigationBar: const BottomMenuWidget(selectedIndex: 1),
    );
  }

  Widget _selector() {
    return SizedBox.fromSize(
      size: Size.fromHeight(70.0),
      child: PageView(
        onPageChanged: (newPage) {
          yeardata = newPage.toString();
        },
        controller: _controller,
        children: <Widget>[
          _pageItem("Enero", 0),
          _pageItem("Febrero", 1),
          _pageItem("Marzo", 2),
          _pageItem("Abril", 3),
          _pageItem("Mayo", 4),
          _pageItem("Junio", 5),
          _pageItem("Julio", 6),
          _pageItem("Augosto", 7),
          _pageItem("Septiembre", 8),
          _pageItem("Octubre", 9),
          _pageItem("Noviembre", 10),
          _pageItem("Diciembre", 11),
        ],
      ),
    );
  }

  Widget _pageItem(String name, int position) {
    var _alignment;
    final selected = TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      color: Colors.blueGrey,
    );
    final unselected = TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.normal,
      color: Colors.blueGrey.withOpacity(0.4),
    );

    if (position == currentPage) {
      _alignment = Alignment.center;
    } else if (position > currentPage) {
      _alignment = Alignment.center;
    } else {
      _alignment = Alignment.center;
    }

    return Align(
      alignment: _alignment,
      child: Text(
        name,
        style: position == currentPage ? selected : unselected,
      ),
    );
  }
}
