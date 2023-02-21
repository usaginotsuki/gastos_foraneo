import 'package:charts_flutter/flutter.dart';
import 'dart:math';

import 'package:flutter/material.dart';

class PieGraphWidget extends StatefulWidget {
  const PieGraphWidget({super.key, required this.incomeData});
  final List<double> incomeData;

  @override
  State<PieGraphWidget> createState() => _PieGraphWidgetState();
}

class _PieGraphWidgetState extends State<PieGraphWidget> {
  @override
  Widget build(BuildContext context) {
  final  List< Series<double, num>> series = [
      Series<double, num>(
        id: 'Gastox',
        domainFn: (value, index) => index!,
        measureFn: (value, _) => value,
        data: widget.incomeData,
        strokeWidthPxFn: (_, __) => 4,
        labelAccessorFn: (datum, index) => (index == 0) ? "Gastos: $datum" : "",
      )
    ];

    return PieChart (
      series,
     
    );
  }
}
