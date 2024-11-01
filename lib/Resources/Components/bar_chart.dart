import 'package:duseca_calender_app/AppConstant/app_constant.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BarChartSample2 extends StatefulWidget {
  BarChartSample2({Key? key}) : super(key: key);

  final Color unfilledColor = const Color(0xFFF0F1F5);
  final List<int> data = [7, 10, 8, 15, 6, 13, 9];
  final List<String> labels = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday'
  ];
  final String title = 'Weekly Sales';
  final String subtitle = 'Sales data over the week';

  @override
  State<StatefulWidget> createState() => BarChartSample2State();
}

class BarChartSample2State extends State<BarChartSample2> {
  final double barWidth = 15;

  late List<BarChartGroupData> rawBarGroups;
  late List<BarChartGroupData> showingBarGroups;

  int touchedGroupIndex = -1;

  final List<Color> filledColors = [
    kColorPurple,
    kColorPurple,
    kColorPurple,
    kColorOrange,
    kColorPurple,
    kColorPurple,
    kColorPurple,
  ];

  @override
  void initState() {
    super.initState();
    rawBarGroups = List.generate(widget.data.length,
        (index) => makeGroupData(index, widget.data[index]));
    showingBarGroups = rawBarGroups;
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const SizedBox(height: 24),
          Expanded(
            child: BarChart(
              BarChartData(
                barTouchData: BarTouchData(
                  touchTooltipData: BarTouchTooltipData(
                    tooltipRoundedRadius: 48,
                    getTooltipItem: (group, groupIndex, rod, rodIndex) {
                      return BarTooltipItem(
                        '${widget.labels[groupIndex]}: ${rod.toY}',
                        const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      );
                    },
                  ),
                  touchCallback: (event, response) {
                    if (response == null || response.spot == null) {
                      setState(() {
                        touchedGroupIndex = -1;
                        showingBarGroups = List.of(rawBarGroups);
                      });
                      return;
                    }

                    touchedGroupIndex = response.spot!.touchedBarGroupIndex;

                    setState(() {
                      if (!event.isInterestedForInteractions) {
                        touchedGroupIndex = -1;
                        showingBarGroups = List.of(rawBarGroups);
                        return;
                      }
                      showingBarGroups = List.of(rawBarGroups);
                    });
                  },
                ),
                titlesData: FlTitlesData(
                  show: true,
                  rightTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  topTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: bottomTitles,
                      reservedSize: 42,
                    ),
                  ),
                  leftTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                ),
                borderData: FlBorderData(show: false),
                barGroups: showingBarGroups,
                gridData: const FlGridData(
                  show: false,
                ),
              ),
              swapAnimationDuration: const Duration(milliseconds: 250),
              swapAnimationCurve: Curves.easeInOut,
            ),
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }

  Widget bottomTitles(double value, TitleMeta meta) {
    final titles = widget.labels;
    final dayAbbreviations = {
      'Monday': 'M',
      'Tuesday': 'T',
      'Wednesday': 'W',
      'Thursday': 'T',
      'Friday': 'F',
      'Saturday': 'S',
      'Sunday': 'S',
    };

    final Widget text = Text(
      dayAbbreviations[titles[value.toInt()]] ?? titles[value.toInt()],
      style: const TextStyle(
        color: Color(0xff7589a2),
        fontFamily: "popins",
        fontSize: 12,
      ),
    );

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 15, // Increased spacing between labels
      child: text,
    );
  }

  BarChartGroupData makeGroupData(int x, int y1) {
    return BarChartGroupData(
      barsSpace: 32,
      x: x,
      barRods: [
        BarChartRodData(
          toY: y1.toDouble(),
          color: filledColors[x % filledColors.length],
          width: barWidth,
          borderRadius: BorderRadius.circular(25),
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: 20,
            color: widget.unfilledColor,
          ),
        ),
      ],
    );
  }
}
