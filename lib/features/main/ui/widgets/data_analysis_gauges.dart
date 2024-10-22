import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:nexqloud/core/constants/colors.dart';
import 'package:nexqloud/core/constants/space.dart';
import 'package:nexqloud/core/extensions/log.dart';
import 'package:nexqloud/core/extensions/size_ext.dart';
import 'package:nexqloud/core/extensions/theme_ext.dart';
import 'package:nexqloud/features/main/ui/widgets/custom_line_chart.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class DataAnalysisGauges extends StatelessWidget {
  const DataAnalysisGauges({super.key});

  @override
  Widget build(BuildContext context) {
    context.isDesktop.printInfo();
    context.isMobile.printInfo();
    return Padding(
      padding: const EdgeInsets.only(top: 34),
      child: SizedBox(
        height: context.isDesktop ? context.height * 0.5 : null,
        width: context.width * 0.9,
        child: context.isMobile || context.isTablet
            ? const MobileAnalysisCards()
            : const DesktopAnalysisCards(),
      ),
    );
  }
}

class DesktopAnalysisCards extends StatefulWidget {
  const DesktopAnalysisCards({super.key});

  @override
  _DesktopAnalysisCardsState createState() => _DesktopAnalysisCardsState();
}

class _DesktopAnalysisCardsState extends State<DesktopAnalysisCards> {
  // Define the dynamic data for the gauges
  double diskReadsProgress = 40;
  double diskWritesProgress = 60;
  double cpuProgress = 60;
  double ramProgress = 40;
  double networkOutboundProgress = 40;
  double networkInboundProgress = 60;

  // Mock function to simulate data updates
  void updateGaugeData() {
    setState(() {
      diskReadsProgress = (diskReadsProgress + Random().nextInt(10) - 5)
          .clamp(10, 90)
          .toDouble();
      diskWritesProgress = (diskWritesProgress + Random().nextInt(10) - 5)
          .clamp(10, 90)
          .toDouble();
      cpuProgress =
          (cpuProgress + Random().nextInt(10) - 5).clamp(40, 90).toDouble();
      ramProgress =
          (ramProgress + Random().nextInt(10) - 5).clamp(20, 90).toDouble();
      networkOutboundProgress =
          (networkOutboundProgress + Random().nextInt(10) - 5)
              .clamp(10, 90)
              .toDouble();
      networkInboundProgress =
          (networkInboundProgress + Random().nextInt(10) - 5)
              .clamp(10, 90)
              .toDouble();
    });
  }

  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(milliseconds: 1000), (timer) {
      // 'called'.printInfo();
      updateGaugeData();
    });
  }

  @override
  void dispose() {
    _timer?.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CircularGauge(
            value: diskReadsProgress.toString(),
            progress: diskReadsProgress,
            unit: 'GBit/s',
            title: 'Disk Reads',
            subCardTitle: 'Devices Online',
            subCardValue: '65',
          ),
        ),
        const Space.horizontal(8),
        Expanded(
          child: CircularGauge(
            value: diskWritesProgress.toString(),
            progress: diskWritesProgress,
            unit: 'MBit/s',
            title: 'Disk Writes',
            subCardTitle: 'Total vCPU Cores',
            subCardValue: '8.64K',
          ),
        ),
        const Space.horizontal(8),
        SizedBox(
          width: context.isDesktop ? context.width * 0.16 : 270,
          child: NeedleCircularGauge(
            title: '',
            progress: cpuProgress,
            unit: 'vCPU Utilization',
            value: 'CPU',
            subCardTitle: 'Total vCPU Cores',
            subCardValue: '8.64K',
          ),
        ),
        const Space.horizontal(8),
        SizedBox(
          width: context.isDesktop ? context.width * 0.16 : 270,
          child: NeedleCircularGauge(
            value: 'RAM',
            progress: ramProgress,
            unit: 'Memory Used',
            title: '',
            subCardTitle: "Total AI GPU's",
            subCardValue: '298',
          ),
        ),
        const Space.horizontal(8),
        Expanded(
          child: CircularGauge(
            value: networkOutboundProgress.toString(),
            progress: networkOutboundProgress,
            unit: 'GBit/s',
            title: 'Network Outbound',
            subCardTitle: "Total AI GPU's",
            subCardValue: '298',
          ),
        ),
        const Space.horizontal(8),
        Expanded(
          child: CircularGauge(
            value: networkInboundProgress.toString(),
            progress: networkInboundProgress,
            unit: 'MBit/s',
            title: 'Network Inbound',
            subCardTitle: 'Average Bandwidth',
            subCardValue: '0.8 Gb/s',
          ),
        ),
      ],
    );
  }
}

class MobileAnalysisCards extends StatelessWidget {
  const MobileAnalysisCards({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
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
          ],
        ),
        Space.vertical(8),
        Row(
          children: [
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
          ],
        ),
        Space.vertical(8),
        Row(
          children: [
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
      ],
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
          padding: const EdgeInsets.only(bottom: 26),
          decoration: BoxDecoration(
            color: kWhite.withOpacity(0.05),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: kWhite.withOpacity(0.2), width: 0.5),
          ),
          child: Column(
            children: [
              SizedBox(
                height: context.isDesktop
                    ? context.width * 0.12
                    : context.isTablet
                        ? 185
                        : 185,
                child: Padding(
                  padding: !context.isDesktop
                      ? const EdgeInsets.only(top: 12)
                      : EdgeInsets.zero,
                  child: SfRadialGauge(
                    axes: <RadialAxis>[
                      RadialAxis(
                        startAngle: -90,
                        endAngle: 270,
                        radiusFactor: context.isDesktop
                            ? 0.8
                            : context.isMobile
                                ? 0.76
                                : 1,
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
                                    glowColor: const Color(0xFF33B1FF)
                                        .withOpacity(0.35),
                                    size: context.isDesktop
                                        ? context.width * .11
                                        : context.width * .01,
                                  ),
                                ),
                                Align(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        '$value.0', //'4.126'
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
                          thickness: 0.17,
                          color: Color(0xFFEEEEEE),
                          thicknessUnit: GaugeSizeUnit.factor,
                        ),
                        pointers: <GaugePointer>[
                          RangePointer(
                            enableAnimation: true,
                            animationDuration: 1600,
                            value: progress, // 40
                            width: 0.17,
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
              ),
              // if (context.isMobile || context.isTablet)
              //   const Space.vertical(10),
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
        Container(
          height: 150,
          // width: 180,
          decoration: BoxDecoration(
            color: kWhite.withOpacity(0.05),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: kWhite.withOpacity(0.1), width: 0.5),
          ),
          child: Stack(
            children: [
              const SizedBox(
                height: 150,
                child: CustomLineChart(),
              ),
              Align(
                child: Column(
                  children: [
                    const Space.vertical(16),
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
        DecoratedBox(
          // width: 180,
          decoration: BoxDecoration(
            color: kWhite.withOpacity(0.05),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: kWhite.withOpacity(0.2), width: 0.5),
          ),
          child: Column(
            children: [
              const Space.vertical(10),
              SizedBox(
                height: context.isDesktop
                    ? context.width * 0.132
                    : context.isTablet
                        ? 200
                        : 200,
                child: SfRadialGauge(
                  axes: <RadialAxis>[
                    RadialAxis(
                      // startAngle: -90,
                      // endAngle: 270,
                      radiusFactor: context.isDesktop
                          ? 0.95
                          : context.isMobile
                              ? 0.8
                              : 0.95,
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
                        thickness: 0.2,
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
                          width: 0.2,
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
        Container(
          height: 150,
          // width: 180,
          decoration: BoxDecoration(
            color: kWhite.withOpacity(0.05),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: kWhite.withOpacity(0.1), width: 0.5),
          ),
          child: Stack(
            children: [
              const SizedBox(
                height: 150,
                child: CustomLineChart(),
              ),
              Align(
                child: Column(
                  children: [
                    const Space.vertical(16),
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
