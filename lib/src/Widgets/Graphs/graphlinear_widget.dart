import 'dart:math';

import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart';

class LinearGraphWidget extends StatefulWidget {
  const LinearGraphWidget({super.key, required this.incomeData});
  final List<double> incomeData;
  @override
  State<LinearGraphWidget> createState() => _LinearGraphWidgetState();
}

class _LinearGraphWidgetState extends State<LinearGraphWidget> {
  @override
  Widget build(BuildContext context) {
    List<Series<double, num>> series = [
      Series<double, int>(
        id: 'Gasto',
        colorFn: (_, __) => MaterialPalette.blue.shadeDefault,
        domainFn: (value, index) => index!,
        measureFn: (value, _) => value,
        data: widget.incomeData,
        strokeWidthPxFn: (_, __) => 4,
      )
    ];

    return LineChart(
      series,
      animate: false,
      selectionModels: [
        SelectionModelConfig(
          type: SelectionModelType.info,
          changedListener: _onSelectionChanged,
        )
      ],
      domainAxis: NumericAxisSpec(
          tickProviderSpec: StaticNumericTickProviderSpec([
        TickSpec(0, label: '1'),
        TickSpec(1, label: '2'),
        TickSpec(2, label: '3'),
        TickSpec(3, label: '4'),
        TickSpec(4, label: '5'),
        TickSpec(5, label: '6'),
        TickSpec(6, label: '7'),
        TickSpec(7, label: '8'),
        TickSpec(8, label: '9'),
        TickSpec(9, label: '10'),
        TickSpec(10, label: '11'),
        TickSpec(11, label: '12'),
      ])),
      primaryMeasureAxis: NumericAxisSpec(
        tickProviderSpec: BasicNumericTickProviderSpec(
          desiredTickCount: 4,
        ),
      ),
    );
  }

  _onSelectionChanged(SelectionModel model) {
    final selectedDatum = model.selectedDatum;

    var time;
    final measures = <String, double>{};

    if (selectedDatum.isNotEmpty) {
      time = selectedDatum.first.datum;
      selectedDatum.forEach((SeriesDatum datumPair) {
        measures[datumPair.series.displayName!] = datumPair.datum;
      });
    }
  }
}
