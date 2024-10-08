import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:nexqloud/core/constants/colors.dart';
import 'package:nexqloud/core/constants/space.dart';
import 'package:nexqloud/core/extensions/size_ext.dart';
import 'package:nexqloud/core/extensions/theme_ext.dart';
import 'package:nexqloud/core/ui/widgets/blurred_background.dart';
import 'package:nexqloud/core/ui/widgets/custom_gradient_button.dart';
import 'package:nexqloud/core/utils/app_text_styles.dart';
import 'package:nexqloud/features/main/ui/widgets/line_chart.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:syncfusion_flutter_maps/maps.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late List<Model> _data;
  late MapShapeSource _dataSource;

  @override
  void initState() {
    _data = const <Model>[
      Model('Brazil', -14.235004, -51.92528),
      Model('Germany', 51.16569, 10.451526),
      Model('Australia', -25.274398, 133.775136),
      Model('India', 20.593684, 78.96288),
      Model('Russia', 61.52401, 105.318756),
    ];

    _dataSource = MapShapeSource.asset(
      'world_map.json',
      shapeDataField: 'name',
      dataCount: _data.length,
      primaryValueMapper: (index) => _data[index].country,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: kBackgroundColor,
            ),
          ),
          Positioned(
            right: -200,
            top: -200,
            child: Image.asset('assets/images/png/top_right.png'),
          ),
          Positioned(
            left: 100,
            top: -300,
            child: Image.asset('assets/images/png/top_right.png'),
          ),
          Positioned(
            left: -500,
            top: 100,
            child: Image.asset('assets/images/png/right.png'),
          ),
          Positioned(
            top: 50,
            right: -100,
            // left: -200,
            child: Image.asset('assets/images/png/left.png'),
          ),
          Center(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  const Space.vertical(45),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: context.height * 0.1,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SvgPicture.asset(
                          'assets/icons/svg/nex_logo.svg',
                          height: 32,
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 20),
                          decoration: BoxDecoration(
                            border: GradientBoxBorder(
                              gradient: LinearGradient(
                                colors: [
                                  const Color(0xFF4e65b3).withOpacity(0.5),
                                  kTransparent,
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                              width: 1.5,
                            ),
                            borderRadius: BorderRadius.circular(1000),
                          ),
                          height: 54,
                          child: BlurredBackground(
                            blurColorFilter: kWhite.withOpacity(0.2),
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                TextButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                        WidgetStateProperty.all(kTransparent),
                                  ),
                                  onPressed: null,
                                  child: Text(
                                    'How it works',
                                    style: context.normal?.copyWith(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                const Space.horizontal(25),
                                TextButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                        WidgetStateProperty.all(kTransparent),
                                  ),
                                  onPressed: null,
                                  child: Text(
                                    'Features',
                                    style: context.normal?.copyWith(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                const Space.horizontal(25),
                                TextButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                        WidgetStateProperty.all(kTransparent),
                                  ),
                                  onPressed: null,
                                  child: Text(
                                    'Platform',
                                    style: context.normal?.copyWith(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                const Space.horizontal(25),
                                TextButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                        WidgetStateProperty.all(kTransparent),
                                  ),
                                  onPressed: null,
                                  child: Text(
                                    'FAQs',
                                    style: context.normal?.copyWith(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                const Space.horizontal(25),
                                TextButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                        WidgetStateProperty.all(kTransparent),
                                  ),
                                  onPressed: null,
                                  child: Text(
                                    'Solution',
                                    style: context.normal?.copyWith(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 20),
                          child: Row(
                            children: [
                              TextButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      WidgetStateProperty.all(kTransparent),
                                ),
                                onPressed: () {},
                                child: const Text(
                                  'Sign up',
                                  style: AppTextStyles.medium,
                                ),
                              ),
                              const Space.horizontal(24),
                              SizedBox(
                                width: 120,
                                child: CustomGradientButton(
                                  title: 'Sign In',
                                  onTap: () {},
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Space.vertical(45),
                  Container(
                    height: context.height * 0.78,
                    width: context.width * 0.7,
                    decoration: BoxDecoration(
                      border: GradientBoxBorder(
                        gradient: LinearGradient(
                          colors: [
                            kWhite.withOpacity(0.1),
                            kWhite.withOpacity(0.1),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        gradient: LinearGradient(
                          colors: [
                            kWhite.withOpacity(0.1),
                            kTransparent,
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(38),
                        child: Column(
                          children: [
                            Text(
                              'NEXQLOUD INSIGHTS',
                              style: context.semiBold?.copyWith(
                                fontSize: 32,
                              ),
                            ),
                            const Space.vertical(10),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: '65',
                                    style: context.bold?.copyWith(
                                      fontSize: 24,
                                      color: graphlinecolor2,
                                    ),
                                  ),
                                  TextSpan(
                                    text: ' Active Provider Devices',
                                    style: context.light?.copyWith(
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Space.vertical(20),
                            SizedBox(
                              height: context.height * 0.6,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: SfMaps(
                                  layers: <MapLayer>[
                                    MapShapeLayer(
                                      strokeWidth: 0.15,
                                      source: _dataSource,
                                      initialMarkersCount: 5,
                                      zoomPanBehavior: MapZoomPanBehavior(
                                        enableDoubleTapZooming: true,
                                        // enableMouseWheelZooming: true,
                                        zoomLevel: 1.2,
                                        toolbarSettings:
                                            const MapToolbarSettings(
                                          itemBackgroundColor: graphlinecolor2,
                                          iconColor: kWhite,
                                          itemHoverColor: kPurpleColor,
                                          direction: Axis.vertical,
                                          position:
                                              MapToolbarPosition.bottomRight,
                                        ),
                                      ),
                                      markerBuilder: (context, index) {
                                        return MapMarker(
                                          latitude: _data[index].latitude,
                                          longitude: _data[index].longitude,
                                          size: const Size(10, 10),
                                          iconColor:
                                              graphlinecolor2.withOpacity(0.8),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  ///gauges
                  const Space.vertical(34),
                  SizedBox(
                    height: context.height * 0.58,
                    width: context.width * 0.7,
                    child: const Row(
                      children: [
                        CircularGauge(
                          value: '4.126',
                          progress: 40,
                          unit: 'GBit/s',
                          title: 'Disk Reads',
                        ),
                        Space.horizontal(8),
                        CircularGauge(
                          value: '8.098',
                          progress: 60,
                          unit: 'MBit/s',
                          title: 'Disk Writes',
                        ),
                        Space.horizontal(8),
                        CircularGauge(
                          value: '4.126',
                          progress: 40,
                          unit: 'GBit/s',
                          title: 'Network Outbound',
                        ),
                        Space.horizontal(8),
                        CircularGauge(
                          value: '8.098',
                          progress: 60,
                          unit: 'MBit/s',
                          title: 'Network Inbound',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Model {
  const Model(this.country, this.latitude, this.longitude);

  final String country;
  final double latitude;
  final double longitude;
}

class CircularGauge extends StatelessWidget {
  const CircularGauge({
    super.key,
    required this.value,
    required this.progress,
    required this.unit,
    required this.title,
  });
  final String value;
  final double progress;
  final String unit;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 180,
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
                              Color(0xFF3C30C4),
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
                  color: const Color(0xFFBFBFBF),
                ),
              ),
            ],
          ),
        ),
        const Space.vertical(15),
        Container(
          width: 180,
          decoration: BoxDecoration(
            color: kWhite.withOpacity(0.05),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: kWhite.withOpacity(0.1), width: 0.5),
          ),
          child: Column(
            children: [
              const Space.vertical(32),
              Text(
                '328',
                style: context.bold?.copyWith(fontSize: 32),
              ),
              Text(
                'Devices Online',
                style: context.normal?.copyWith(
                  fontSize: 12,
                  color: const Color(0xFFBFBFBF),
                ),
              ),
              const SizedBox(
                height: 80,
                child: CustomLineChart(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
