import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class CustomBarChart extends StatefulWidget {
  const CustomBarChart({
    super.key,
  });

  @override
  State<CustomBarChart> createState() => _CustomBarChartState();
}

class _CustomBarChartState extends State<CustomBarChart> {
  final List<BalanceData> data = [
    BalanceData('Start Balance', 1000),
    BalanceData('End Balance', 1500),
  ];

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        barGroups: [
          BarChartGroupData(
            x: 0,
            barRods: [
              BarChartRodData(
                toY: data[0].amount.toDouble(),
                color: Colors.blue,
                width: 50,
                borderRadius: BorderRadius.all(Radius.zero),
                borderSide: BorderSide.none, // Removed outer border
                rodStackItems: [
                  BarChartRodStackItem(
                    0,
                    data[0].amount.toDouble(),
                    Colors.transparent,
                    BorderSide.none,
                  ),
                ],
                backDrawRodData: BackgroundBarChartRodData(
                  show: true,
                  toY: data[0].amount.toDouble(),
                  color: Colors.transparent,
                ),
              ),
            ],
            showingTooltipIndicators: [0],
          ),
          BarChartGroupData(
            x: 1,
            barRods: [
              BarChartRodData(
                toY: data[1].amount.toDouble(),
                color: Colors.orangeAccent,
                width: 50,
                borderRadius: BorderRadius.all(Radius.zero),
                borderSide: BorderSide.none, // Removed outer border
                rodStackItems: [
                  BarChartRodStackItem(
                    0,
                    data[1].amount.toDouble(),
                    Colors.transparent,
                    BorderSide.none,
                  ),
                ],
                backDrawRodData: BackgroundBarChartRodData(
                  show: true,
                  toY: data[1].amount.toDouble(),
                  color: Colors.transparent,
                ),
              ),
            ],
            showingTooltipIndicators: [0],
          ),
        ],
        titlesData: FlTitlesData(
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                if (value.toInt() < 0 || value.toInt() >= data.length) {
                  return const SizedBox.shrink();
                }
                final balanceData = data[value.toInt()];
                return Text(
                  balanceData.label,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                );
              },
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          rightTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          topTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
        ),
        borderData: FlBorderData(show: false),
        barTouchData: BarTouchData(
          touchTooltipData: BarTouchTooltipData(
            tooltipPadding: EdgeInsets.zero,
            tooltipMargin: 8,
            getTooltipItem: (group, groupIndex, rod, rodIndex) {
              return BarTooltipItem(
                '${rod.toY.toInt()}',
                TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              );
            },
            getTooltipColor: (group) => Colors.transparent,
          ),
        ),
      ),
    );
  }
}

class BalanceData {
  final String label;
  final int amount;

  BalanceData(this.label, this.amount);
}
