import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:word_guess/core/themeNotifier.dart';
import 'package:word_guess/core/viewModels/statistics_model.dart';
import 'package:word_guess/ui/shared/app_colours.dart';
import 'package:word_guess/ui/shared/app_text_styles.dart';
import 'package:word_guess/ui/shared/app_ui_sizes.dart';
import 'dart:math';

import 'package:word_guess/ui/shared/app_ui_spacing.dart';

/// barchart for attempts distribution
class BarchartSection extends StatelessWidget {
  const BarchartSection({Key? key}) : super(key: key);

  final double minBackgroundY = 5;
  final double minBarHeight = 0.1;
  final double barWidth = 16;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Attempt distribution',
          style: textFootnote.copyWith(color: myGrey),
        ),
        UIHelper.verticalSpaceLarge(),
        AspectRatio(
          aspectRatio: 1.66,
          child: BarChart(
            BarChartData(
              alignment: BarChartAlignment.spaceBetween,
              barTouchData: BarTouchData(
                allowTouchBarBackDraw: true,
                touchTooltipData: BarTouchTooltipData(
                  tooltipBgColor: Colors.transparent,
                  tooltipPadding: const EdgeInsets.all(0),
                  tooltipMargin: 2,
                  fitInsideHorizontally: false,
                  fitInsideVertically: false,
                  getTooltipItem: (group, groupIndex, rod, rodIndex) {
                    return BarTooltipItem(
                      '${(rod.y == minBarHeight) ? 0 : rod.y.toInt()}',
                      textFootnote.copyWith(
                        color:
                            Provider.of<ThemeNotifier>(context, listen: false)
                                .getHighlightColor(false),
                      ),
                    );
                  },
                ),
              ),
              titlesData: FlTitlesData(
                show: true,
                bottomTitles: SideTitles(
                  showTitles: true,
                  getTextStyles: (context, value) =>
                      const TextStyle(color: myGrey, fontSize: 10),
                  margin: 10,
                  getTitles: (double value) {
                    switch (value.toInt()) {
                      case 0:
                        return '1';
                      case 1:
                        return '2';
                      case 2:
                        return '3';
                      case 3:
                        return '4';
                      case 4:
                        return '5';
                      case 5:
                        return '6';
                      default:
                        return '';
                    }
                  },
                ),
                leftTitles: SideTitles(showTitles: false),
                topTitles: SideTitles(showTitles: false),
                rightTitles: SideTitles(showTitles: false),
              ),
              gridData: FlGridData(show: false),
              borderData: FlBorderData(show: false),
              groupsSpace: 4,
              barGroups: _getBarGroups(context),
            ),
          ),
        ),
      ],
    );
  }

  /// create list of group data from db data
  List<BarChartGroupData> _getBarGroups(BuildContext context) {
    List<int> values = Provider.of<StatisticsModel>(context).getAttempsData();
    //calculate background bar height depending on max bar value
    double backgroundY = (values.reduce(max)).toDouble();
    List<BarChartGroupData> groupDataList = [];
    for (var i = 0; i < 6; i++) {
      double y = values[i].toDouble();
      groupDataList.add(
        BarChartGroupData(
          x: i,
          barRods: [
            BarChartRodData(
              y: (y < 1) ? minBarHeight : y,
              colors: [myGreen],
              width: barWidth,
              borderRadius: const BorderRadius.all(Radius.circular(barRadius)),
              backDrawRodData: BackgroundBarChartRodData(
                show: true,
                y: (backgroundY < minBackgroundY)
                    ? minBackgroundY
                    : backgroundY,
                colors: [Colors.transparent],
              ),
            ),
          ],
          showingTooltipIndicators: [0],
        ),
      );
    }
    return groupDataList;
  }
}
