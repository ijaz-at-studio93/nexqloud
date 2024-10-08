import 'dart:async';
import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:nexqloud/core/constants/colors.dart';

class CustomLineChart extends StatefulWidget {
  const CustomLineChart({super.key});

  @override
  State<CustomLineChart> createState() => _CustomLineChartState();
}

class _CustomLineChartState extends State<CustomLineChart> {
  List<Color> gradientColors = [
    kPurpleColor,
    kPurpleColor,
  ];

  List<Color> gradientColorsBelow = [
    kPurpleColor,
    kBackgroundColor.withOpacity(0.02),
  ];

  List<FlSpot> _dataPoints = [FlSpot(0, 3)]; // Initialize with default data
  late Timer _timer;
  Random _random = Random();
  double _lastXValue = 0;
  int _maxPoints = 50; // Max points to keep in the chart at any time

  @override
  void initState() {
    super.initState();
    _startGeneratingData();
  }

  @override
  void dispose() {
    _timer.cancel(); // Make sure the timer is disposed
    super.dispose();
  }

  // Method to start generating real-time data
  void _startGeneratingData() {
    _timer = Timer.periodic(Duration(milliseconds: 200), (Timer timer) {
      setState(() {
        // Generate a new Y value with some randomness
        double newYValue = 3 + _random.nextDouble() * 3;

        _lastXValue += 1;

        // Add new point to the list
        _dataPoints.add(FlSpot(_lastXValue, newYValue));

        // Limit the number of data points to _maxPoints
        if (_dataPoints.length > _maxPoints) {
          _dataPoints.removeRange(0, _dataPoints.length - _maxPoints);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              top: 15,
            ),
            // Conditionally rendering the chart only when there are data points available
            child: _dataPoints.isNotEmpty
                ? LineChart(
                    mainData(),
                  )
                : Center(
                    child:
                        CircularProgressIndicator()), // Show a loader until data is available
          ),
        ),
      ],
    );
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: const FlGridData(
        show: false,
      ),
      titlesData: const FlTitlesData(
        show: false,
      ),
      borderData: FlBorderData(
        show: false,
      ),
      minX:
          _lastXValue - (_maxPoints - 5), // Show only the last few data points
      maxX: _lastXValue,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: _dataPoints,
          isCurved: true,
          gradient: LinearGradient(
            colors: gradientColors,
          ),
          barWidth: 1.5,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: gradientColorsBelow
                  .map((color) => color.withOpacity(0.3))
                  .toList(),
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
      ],
    );
  }
}
