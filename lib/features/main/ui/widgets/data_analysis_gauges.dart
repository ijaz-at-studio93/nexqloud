import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:nexqloud/core/constants/colors.dart';
import 'package:nexqloud/core/constants/space.dart';
import 'package:nexqloud/core/extensions/size_ext.dart';
import 'package:nexqloud/core/extensions/theme_ext.dart';
import 'package:nexqloud/features/main/ui/widgets/custom_line_chart.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class DataAnalysisGauges extends StatelessWidget {
  const DataAnalysisGauges({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 34),
      child: SizedBox(
        height: context.height * 0.4,
        width: context.width * 0.7,
        child: const Row(
          children: [
            Expanded(
              child: CircularGauge(
                value: '4.126',
                progress: 40,
                unit: 'GBit/s',
                title: 'Disk Reads',
                subCardTitle: 'Devices Online',
                subCardValue: '65',
              ),
            ),
            Space.horizontal(8),
            Expanded(
              child: CircularGauge(
                value: '8.098',
                progress: 60,
                unit: 'MBit/s',
                title: 'Disk Writes',
                subCardTitle: 'Total vCPU Cores',
                subCardValue: '8.64K',
              ),
            ),
            Space.horizontal(8),
            Expanded(
              child: NeedleCircularGauge(
                title: '',
                progress: 60,
                unit: 'vCPU  Utilization',
                value: 'CPU',
                subCardTitle: 'Total vCPU Cores',
                subCardValue: '8.64K',
              ),
            ),
            Space.horizontal(8),
            Expanded(
              child: NeedleCircularGauge(
                value: 'RAM',
                progress: 40,
                unit: 'Memory Used',
                title: '',
                subCardTitle: "Total AI GPU's",
                subCardValue: '298',
              ),
            ),
            Space.horizontal(8),
            Expanded(
              child: CircularGauge(
                value: '4.126',
                progress: 40,
                unit: 'GBit/s',
                title: 'Network Outbound',
                subCardTitle: "Total AI GPU's",
                subCardValue: '298',
              ),
            ),
            Space.horizontal(8),
            Expanded(
              child: CircularGauge(
                value: '8.098',
                progress: 60,
                unit: 'MBit/s',
                title: 'Network Inbound',
                subCardTitle: 'Average Bandwidth',
                subCardValue: '0.8 Gb/s',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CircularGauge extends StatelessWidget {
  const CircularGauge({
    super.key,
    required this.value,
    required this.progress,
    required this.unit,
    required this.title,
    required this.subCardTitle,
    required this.subCardValue,
  });
  final String value;
  final double progress;
  final String unit;
  final String title;
  final String subCardTitle;
  final String subCardValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(bottom: 16),
          decoration: BoxDecoration(
            color: kWhite.withOpacity(0.05),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: kWhite.withOpacity(0.2), width: 0.5),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 144,
                child: SfRadialGauge(
                  axes: <RadialAxis>[
                    RadialAxis(
                      startAngle: -90,
                      endAngle: 270,
                      radiusFactor: 0.8,
                      showFirstLabel: false,
                      showLabels: false,
                      showTicks: false,
                      annotations: [
                        GaugeAnnotation(
                          widget: Stack(
                            children: [
                              Align(
                                child: GlowIcon(
                                  Icons.circle_outlined,
                                  color: kTransparent,
                                  glowColor:
                                      const Color(0xFF33B1FF).withOpacity(0.35),
                                  size: 130,
                                ),
                              ),
                              Align(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      value, //'4.126'
                                      style: context.bold?.copyWith(
                                        fontSize: 18,
                                      ),
                                    ),
                                    Text(
                                      unit, //'GBit/s'
                                      style: context.normal?.copyWith(
                                        fontSize: 10,
                                        color: const Color(0xFFBFBFBF),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                      axisLineStyle: const AxisLineStyle(
                        thickness: 0.15,
                        color: Color(0xFFEEEEEE),
                        thicknessUnit: GaugeSizeUnit.factor,
                      ),
                      pointers: <GaugePointer>[
                        RangePointer(
                          enableAnimation: true,
                          animationDuration: 1600,
                          value: progress, // 40
                          width: 0.15,
                          sizeUnit: GaugeSizeUnit.factor,
                          cornerStyle: CornerStyle.bothCurve,
                          gradient: const SweepGradient(
                            colors: <Color>[
                              Color(0xFF9933FF),
                              Color(0xFF33B1FF),
                            ],
                            stops: <double>[0.25, 0.75],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Text(
                title, //'Disk Reads'
                style: context.normal?.copyWith(
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
        const Space.vertical(6),
        DecoratedBox(
          // width: 180,
          decoration: BoxDecoration(
            color: kWhite.withOpacity(0.05),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: kWhite.withOpacity(0.1), width: 0.5),
          ),
          child: Stack(
            children: [
              const SizedBox(
                height: 134,
                child: CustomLineChart(),
              ),
              Align(
                child: Column(
                  children: [
                    const Space.vertical(32),
                    Text(
                      subCardValue,
                      style: context.bold?.copyWith(fontSize: 32),
                    ),
                    Text(
                      subCardTitle,
                      style: context.normal?.copyWith(
                        fontSize: 12,
                        color: const Color(0xFFBFBFBF),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class NeedleCircularGauge extends StatelessWidget {
  const NeedleCircularGauge({
    super.key,
    required this.value,
    required this.progress,
    required this.unit,
    required this.title,
    required this.subCardTitle,
    required this.subCardValue,
  });
  final String value;
  final double progress;
  final String unit;
  final String title;
  final String subCardTitle;
  final String subCardValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          // width: 180,
          padding: const EdgeInsets.only(bottom: 16),
          decoration: BoxDecoration(
            color: kWhite.withOpacity(0.05),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: kWhite.withOpacity(0.2), width: 0.5),
          ),
          child: Column(
            children: [
              const Space.vertical(10),
              SizedBox(
                height: 134,
                child: SfRadialGauge(
                  axes: <RadialAxis>[
                    RadialAxis(
                      // startAngle: -90,
                      // endAngle: 270,
                      // radiusFactor: 0.9,
                      showFirstLabel: false,
                      showLabels: false,
                      tickOffset: 4,
                      minorTicksPerInterval: 3,
                      majorTickStyle: const MajorTickStyle(
                        length: 0.1,
                        color: kWhite,
                        lengthUnit: GaugeSizeUnit.factor,
                      ),
                      minorTickStyle: const MinorTickStyle(
                        length: 0.05,
                        color: kWhite,
                        lengthUnit: GaugeSizeUnit.factor,
                      ),
                      annotations: [
                        GaugeAnnotation(
                          angle: 90,
                          positionFactor: 0.9,
                          widget: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                value, //'4.126'
                                style: context.bold?.copyWith(
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                unit, //'GBit/s'
                                style: context.normal?.copyWith(
                                  fontSize: 10,
                                  color: const Color(0xFFBFBFBF),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                      axisLineStyle: const AxisLineStyle(
                        thickness: 0.15,
                        color: Color(0xFFEEEEEE),
                        thicknessUnit: GaugeSizeUnit.factor,
                        cornerStyle: CornerStyle.bothCurve,
                      ),
                      pointers: <GaugePointer>[
                        NeedlePointer(
                          enableAnimation: true,
                          animationDuration: 1600,
                          value: progress, // 40
                          needleColor: const Color(0xFF8052FF),
                          needleEndWidth: 4,
                          needleStartWidth: 0,
                          knobStyle: const KnobStyle(
                            color: Colors.white,
                          ),
                        ),
                        RangePointer(
                          enableAnimation: true,
                          animationDuration: 1600,
                          value: progress, // 40
                          width: 0.15,
                          sizeUnit: GaugeSizeUnit.factor,
                          cornerStyle: CornerStyle.bothCurve,
                          gradient: const SweepGradient(
                            colors: <Color>[
                              Color(0xFF33B1FF),
                              Color(0xFF9933FF),
                            ],
                            stops: <double>[0.25, 0.75],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Text(
                title, //'Disk Reads'
                style: context.normal?.copyWith(
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
        const Space.vertical(6),
        DecoratedBox(
          // width: 180,
          decoration: BoxDecoration(
            color: kWhite.withOpacity(0.05),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: kWhite.withOpacity(0.1), width: 0.5),
          ),
          child: Stack(
            children: [
              const SizedBox(
                height: 134,
                child: CustomLineChart(),
              ),
              Align(
                child: Column(
                  children: [
                    const Space.vertical(32),
                    Text(
                      subCardValue,
                      style: context.bold?.copyWith(fontSize: 32),
                    ),
                    Text(
                      subCardTitle,
                      style: context.normal?.copyWith(
                        fontSize: 12,
                        color: const Color(0xFFBFBFBF),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
