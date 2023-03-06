import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:supercharged/supercharged.dart';

class LineChartWidget extends StatelessWidget {
  const LineChartWidget({required this.incomeList});

  final List<double> incomeList;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.25,
      width: MediaQuery.of(context).size.width * 0.95,
      child: LineChart(
        sampleData1,
        swapAnimationDuration: const Duration(milliseconds: 250),
      ),
    );
  }

  LineChartData get sampleData1 => LineChartData(
        lineTouchData: lineTouchData1,
        gridData: gridData,
        titlesData: titlesData1,
        borderData: borderData,
        lineBarsData: lineBarsData1,
        minX: 0, // El minimo de meses
        maxX: 11, // El maximo de meses
        maxY: incomeList.max(), // El maximo de los valores ahorrados
        minY: 0, // El minimo de los valores ahorrados
      );

  LineTouchData get lineTouchData1 => LineTouchData(
        handleBuiltInTouches: true,
        touchTooltipData: LineTouchTooltipData(
          // Cambia los colores del fondo cuando le das tap para que te muestra
          tooltipBgColor: Color.fromARGB(255, 255, 255, 255).withOpacity(0.8),
        ),
      );

  FlTitlesData get titlesData1 => FlTitlesData(
        bottomTitles: AxisTitles(
          sideTitles: bottomTitles,
        ),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        leftTitles: AxisTitles(
          sideTitles: leftTitles(),
        ),
      );

  List<LineChartBarData> get lineBarsData1 => [
        lineChartBarData1_1,
      ];

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 10,
    );
    //Escojo solo los valores maximos y minimos para la barra lateral
    String text = (value.toInt() == incomeList.max()
        ? incomeList.max().toString() + " \$"
        : (value.toInt() == incomeList.min())
            ? incomeList.min().toString() + " \$"
            : "");

    return Text(text, style: style, textAlign: TextAlign.center);
  }

  SideTitles leftTitles() => SideTitles(
        getTitlesWidget: leftTitleWidgets,
        showTitles: true,
        interval: 1,
        reservedSize: 50,
      );

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 10,
    );
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = const Text('ENE', style: style);
        break;
      case 1:
        text = const Text('FEB', style: style);
        break;
      case 2:
        text = const Text('MAR', style: style);
        break;
      case 3:
        text = const Text('ABR', style: style);
        break;
      case 4:
        text = const Text('MAY', style: style);
        break;
      case 5:
        text = const Text('JUN', style: style);
        break;
      case 6:
        text = const Text('JUL', style: style);
        break;
      case 7:
        text = const Text('AGO', style: style);
        break;
      case 8:
        text = const Text('SEP', style: style);
        break;
      case 9:
        text = const Text('OCT', style: style);
        break;
      case 10:
        text = const Text('NOV', style: style);
        break;
      case 11:
        text = const Text('DEC', style: style);
        break;
      default:
        text = const Text('');
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 10,
      child: text,
    );
  }

  SideTitles get bottomTitles => SideTitles(
        showTitles: true,
        reservedSize: 32,
        interval: 1,
        getTitlesWidget: bottomTitleWidgets,
      );

  FlGridData get gridData => FlGridData(show: false);

  FlBorderData get borderData => FlBorderData(
        show: true,
        border: Border(
          bottom: BorderSide(color: Color.fromARGB(41, 3, 8, 7), width: 4),
          left: const BorderSide(color: Color.fromARGB(41, 3, 8, 7), width: 4),
          right: const BorderSide(color: Colors.transparent),
          top: const BorderSide(color: Colors.transparent),
        ),
      );

  LineChartBarData get lineChartBarData1_1 => LineChartBarData(
        isCurved: true,
        color: Color.fromARGB(232, 182, 104, 1),
        barWidth: 4,
        isStrokeCapRound: true,
        dotData: FlDotData(show: false),
        belowBarData: BarAreaData(show: false),
        spots: [
          FlSpot(0, incomeList[0]),
          FlSpot(1, incomeList[1]),
          FlSpot(2, incomeList[2]),
          FlSpot(3, incomeList[3]),
          FlSpot(4, incomeList[4]),
          FlSpot(5, incomeList[5]),
          FlSpot(6, incomeList[6]),
          FlSpot(7, incomeList[7]),
          FlSpot(8, incomeList[8]),
          FlSpot(9, incomeList[9]),
          FlSpot(10, incomeList[10]),
          FlSpot(11, incomeList[11]),
        ],
      );
}
