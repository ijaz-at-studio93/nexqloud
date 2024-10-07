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
import 'package:nexqloud/features/main/ui/widgets/counter_controls.dart';
import 'package:nexqloud/features/main/ui/widgets/counter_display.dart';
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
          Center(
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
                        height: 24,
                      ),
                      Container(
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
                          ),
                          borderRadius: BorderRadius.circular(1000),
                        ),
                        height: 45,
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
                                onPressed: () {},
                                child: Text(
                                  'How it works',
                                  style: context.normal?.copyWith(
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              const Space.horizontal(25),
                              TextButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      WidgetStateProperty.all(kTransparent),
                                ),
                                onPressed: () {},
                                child: Text(
                                  'Features',
                                  style: context.normal?.copyWith(
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              const Space.horizontal(25),
                              TextButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      WidgetStateProperty.all(kTransparent),
                                ),
                                onPressed: () {},
                                child: Text(
                                  'Platform',
                                  style: context.normal?.copyWith(
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              const Space.horizontal(25),
                              TextButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      WidgetStateProperty.all(kTransparent),
                                ),
                                onPressed: () {},
                                child: Text(
                                  'FAQs',
                                  style: context.normal?.copyWith(
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              const Space.horizontal(25),
                              TextButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      WidgetStateProperty.all(kTransparent),
                                ),
                                onPressed: () {},
                                child: Text(
                                  'Solution',
                                  style: context.normal?.copyWith(
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Row(
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
                    ],
                  ),
                ),
                const Space.vertical(45),
                Container(
                  height: context.height * 0.7,
                  width: context.width * 0.7,
                  decoration: BoxDecoration(
                    border: GradientBoxBorder(
                      gradient: LinearGradient(
                        colors: [
                          kWhite.withOpacity(0.3),
                          kTransparent,
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
                            height: context.height * 0.4,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: SfMaps(
                                layers: <MapLayer>[
                                  MapShapeLayer(
                                    source: _dataSource,
                                    initialMarkersCount: 5,
                                    zoomPanBehavior: MapZoomPanBehavior(
                                      enableDoubleTapZooming: true,
                                      zoomLevel: 2,
                                      toolbarSettings: const MapToolbarSettings(
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
              ],
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
