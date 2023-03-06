import 'dart:ffi';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../Core/Colors/Hex_Color.dart';

class PieGraphWidget extends StatefulWidget {
  const PieGraphWidget({super.key, required this.incomeData});
  final List<double> incomeData;

  @override
  State<PieGraphWidget> createState() => _PieGraphWidgetState();
}

class _PieGraphWidgetState extends State<PieGraphWidget> {
  int touchedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: MediaQuery.of(context).size.width * 0.95,
      child: PieChart(
        PieChartData(
          pieTouchData: PieTouchData(
            touchCallback: (FlTouchEvent event, pieTouchResponse) {
              setState(() {
                if (!event.isInterestedForInteractions ||
                    pieTouchResponse == null ||
                    pieTouchResponse.touchedSection == null) {
                  touchedIndex = -1;
                  return;
                }
                touchedIndex =
                    pieTouchResponse.touchedSection!.touchedSectionIndex;
              });
            },
          ),
          borderData: FlBorderData(
            show: false,
          ),
          sectionsSpace: 0,
          centerSpaceRadius: 0,
          sections: showingSections(),
        ),
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(5, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 15.0 : 12.0;
      final radius = isTouched ? 185.0 : 180.0;
      const shadows = [Shadow(color: Colors.black, blurRadius: 2)];

      switch (i) {
        case 0:
          return PieChartSectionData(
            color: HexColor("#bdb2ff").withOpacity(0.6),
            value: widget.incomeData[0],
            title: 'Limpieza:  ${widget.incomeData[1]} \$',
            showTitle: isTouched,
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
              shadows: shadows,
            ),
            badgePositionPercentageOffset: .98,
          );
        case 1:
          return PieChartSectionData(
            color: HexColor("#ffc6ff"),
            value: widget.incomeData[1],
            title: 'Comida:  ${widget.incomeData[2]} \$',
            radius: radius,
            showTitle: isTouched,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
              shadows: shadows,
            ),
            badgePositionPercentageOffset: .98,
          );
        case 2:
          return PieChartSectionData(
            color: HexColor("#64dfdf").withOpacity(0.6),
            value: widget.incomeData[2],
            title: 'Estudio:  ${widget.incomeData[3]} \$',
            radius: radius,
            showTitle: isTouched,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
              shadows: shadows,
            ),
            badgePositionPercentageOffset: .98,
          );
        case 3:
          return PieChartSectionData(
            color: HexColor("#fdffb6").withOpacity(0.7),
            value: widget.incomeData[3],
            title: 'Transporte:  ${widget.incomeData[4]} \$',
            radius: radius,
            showTitle: isTouched,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
              shadows: shadows,
            ),
            badgePositionPercentageOffset: .6,
          );
        case 4:
          return PieChartSectionData(
            color: HexColor("#ffd6a5").withOpacity(0.7),
            value: widget.incomeData[4],
            title: 'Varios  ${widget.incomeData[4]} \$',
            radius: radius,
            showTitle: isTouched,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
              shadows: shadows,
            ),
            badgePositionPercentageOffset: .98,
          );
        default:
          throw Exception('Oh no');
      }
    });
  }
}

class _Badge extends StatelessWidget {
  const _Badge(
    this.svgAsset, {
    required this.size,
    required this.borderColor,
  });
  final String svgAsset;
  final double size;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: PieChart.defaultDuration,
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(
          color: borderColor,
          width: 2,
        ),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(.5),
            offset: const Offset(3, 3),
            blurRadius: 3,
          ),
        ],
      ),
      padding: EdgeInsets.all(size * .15),
      child: Center(
        child: SvgPicture.asset(
          svgAsset,
        ),
      ),
    );
  }
}
