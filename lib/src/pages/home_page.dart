import '../Widgets/BottomMenu/bottom_menu_widget.dart';
import '../Widgets/utils/dialog_ulit.dart';
import '../services/auth.services.dart';
import '../../Core/Colors/Hex_Color.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gastos_foraneo/src/Providers/main_provider.dart';
import 'package:gastos_foraneo/src/models/user_expenses_model.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isVisible = true;

  TextEditingController controllerTextLimp = TextEditingController();
  TextEditingController controllerTextComi = TextEditingController();
  TextEditingController controllerTextEstu = TextEditingController();
  TextEditingController controllerTextTota = TextEditingController();
  TextEditingController controllerTextTrasn = TextEditingController();
  TextEditingController controllerTextVario = TextEditingController();

  AuthServices auth = AuthServices();
  PageController _controller = PageController();
  int currentPage = DateTime.now().month - 1;
  String tipodepago = "";
  String yeardata = "0";
  bool hasDataf = true;
  FirebaseFirestore dataUserFuture = FirebaseFirestore.instance;
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
    hasDataf = true;
  }

  @override
  Widget build(BuildContext context) {
    final mainProvider = Provider.of<MainProvider>(context, listen: false);
    CollectionReference clientegastos = FirebaseFirestore.instance
        .collection('usuarios')
        .doc(mainProvider.token)
        .collection("expenses");
    _editParamGastos(String type, String newValue) {
      UsuarioGastos gst = UsuarioGastos(
          cleaningAmount: 0,
          foodAmount: 0,
          idexp: "",
          studyAmount: 0,
          totalAmount: 0,
          transportAmount: 0,
          variousAmount: 0);
      (type == "limpieza")
          ? gst.cleaningAmount = num.parse(newValue)
          : (type == "comida")
              ? gst.foodAmount = num.parse(newValue)
              : (type == "estudio")
                  ? gst.studyAmount = num.parse(newValue)
                  : (type == "transporte")
                      ? gst.transportAmount = num.parse(newValue)
                      : (type == "varios")
                          ? gst.variousAmount = num.parse(newValue)
                          : (type == "fondos")
                              ? gst.totalAmount = num.parse(newValue)
                              : gst.totalAmount;
      clientegastos
          .doc("exp" + mainProvider.token + yeardata)
          .update((type == "limpieza")
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
                              : (type == "fondos")
                                  ? {
                                      'user_totalAmount': num.parse(newValue),
                                    }
                                  : {});
    }

    TextEditingController _controllers = TextEditingController();

    _alertDialog(String type, TextEditingController controller) {
      DialogUtils.showAlertWithCustomActions(context, "", [
        (type != "reporte")
            ? TextFormField(
                decoration:
                    InputDecoration(labelText: "Agrege un nuevo monto a $type"),
                controller: _controllers,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(
                      RegExp(r'^[1-9][\.\d]*(,\d+)?$')),
                ],
                onTap: () {
                  _controllers.clear();
                },
                onFieldSubmitted: (newValue) {
                  setState(() {
                    if (type != "reporte") {
                      _editParamGastos(type, newValue);
                      Navigator.pop(context, 'OK');
                    }
                  });
                },
              )
            : Row(
                children: [
                  OutlinedButton(
                      onPressed: () {
                        auth.userNonthReport(
                            mainProvider.token, yeardata, usrgst);
                        Navigator.pop(context, 'OK');
                      },
                      child: Text("Enviar")),
                  OutlinedButton(
                      onPressed: () {
                        Navigator.pop(context, 'OK');
                        // print("gasos " + controllerTextEstu.toString());
                      },
                      child: Text("Cancelar")),
                ],
              )
      ]);
    }

    var streamBuilderGastos = clientegastos
        .where("user_idexp", isEqualTo: "exp" + mainProvider.token + yeardata)
        .snapshots();

    Widget _selector() {
      return SizedBox.fromSize(
        size: Size.fromHeight(70.0),
        child: PageView(
          onPageChanged: (newPage) {
            setState(() {
              yeardata = newPage.toString();
              streamBuilderGastos = clientegastos
                  .where("user_idexp",
                      isEqualTo: "exp" + mainProvider.token + yeardata)
                  .snapshots();
            });
          },
          controller: _controller,
          children: <Widget>[
            _pageItem("------- Enero -------", 0),
            _pageItem("------- Febrero -------", 1),
            _pageItem("------- Marzo -------", 2),
            _pageItem("------- Abril -------", 3),
            _pageItem("------- Mayo -------", 4),
            _pageItem("------- Junio -------", 5),
            _pageItem("------- Julio -------", 6),
            _pageItem("------- Augosto -------", 7),
            _pageItem("----- Septiembre -----", 8),
            _pageItem("------- Octubre -------", 9),
            _pageItem("------ Noviembre ------", 10),
            _pageItem("------ Diciembre ------", 11),
          ],
        ),
      );
    }

    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          const Padding(padding: EdgeInsets.only(top: 50.0)),
          Container(
              height: MediaQuery.of(context).size.height.round() * 0.1,
              width: MediaQuery.of(context).size.width.round() * 0.97,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: const [0.1, 0.4, 0.7, 0.9],
                    colors: [
                      HexColor("#4b4293").withOpacity(0.4),
                      HexColor("#4b4293").withOpacity(0.4),
                      HexColor("#08418e").withOpacity(0.4),
                      HexColor("#08418e").withOpacity(0.4)
                    ],
                  )),
              child: Image.asset('assets/gasto.png')),
          OutlinedButton(
              onPressed: () {
                tipodepago = "fondos";
                _alertDialog(tipodepago, controllerTextTota);
              },
              child: Text("Agregar Fondos ")),
          _selector(),
          Visibility(
            visible: isVisible,
            child: OutlinedButton(
                onPressed: () {
                  tipodepago = "reporte";
                  _alertDialog(tipodepago, controllerTextTota);
                },
                child: Text("Generar un Nuevo Reporte")),
          ),
          StreamBuilder(
              stream: streamBuilderGastos,
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.data?.docs.length == 0) {
                  isVisible = true;
                } else if (snapshot.data?.docs.length != 0) {
                  isVisible = false;
                }
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return Center(child: CircularProgressIndicator());
                  case ConnectionState.active:

                  case ConnectionState.none:
                  default:
                    if (snapshot.data?.docs.length == 0) {
                      hasDataf = false;
                    } else {
                      hasDataf = true;
                    }
                }

                return Column(
                    children: snapshot.data!.docs.map((gastos) {
                  var gasto = UsuarioGastos.fromJson(
                      gastos.data() as Map<String, dynamic>);

                  usrgst = gasto;

                  num total = gasto.cleaningAmount +
                      gasto.foodAmount +
                      gasto.studyAmount +
                      gasto.transportAmount +
                      gasto.variousAmount;

                  return Column(
                    children: [
                      Column(
                        children: [
                          Text(
                            gasto.totalAmount.toString(),
                            style: (total > gasto.totalAmount)
                                ? TextStyle(
                                    fontSize: 50,
                                    color: Color.fromARGB(244, 203, 28, 89))
                                : TextStyle(
                                    fontSize: 50,
                                    color: Color.fromARGB(145, 1, 182, 122)),
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
                                      _alertDialog(
                                          tipodepago, controllerTextLimp);
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
                                      _alertDialog(
                                          tipodepago, controllerTextComi);
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
                                      tipodepago = "estudio";
                                      _alertDialog(
                                          tipodepago, controllerTextComi);
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
                                      _alertDialog(
                                          tipodepago, controllerTextComi);
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
                                      _alertDialog(
                                          tipodepago, controllerTextComi);
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
                    ],
                  );
                }).toList());
              }),
        ],
      )),
      bottomNavigationBar: const BottomMenuWidget(selectedIndex: 1),
    );
  }

  Widget _pageItem(String name, int position) {
    var _alignment;

    final selected = TextStyle(
      fontSize: 40.0,
      fontWeight: FontWeight.normal,
      //fontWeight: FontWeight.bold,
      color: Color.fromARGB(255, 15, 14, 40).withOpacity(0.7),
    );

    final unselected = TextStyle(
      fontSize: 40.0,
      fontWeight: FontWeight.normal,
      color: Color.fromARGB(255, 15, 14, 40).withOpacity(0.7),
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
