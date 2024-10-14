import 'package:flutter/material.dart';

import 'package:animate_do/animate_do.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:nexqloud/features/main/ui/widgets/continent_map.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_maps/maps.dart';

import 'package:nexqloud/core/constants/colors.dart';
import 'package:nexqloud/core/constants/space.dart';
import 'package:nexqloud/core/extensions/log.dart';
import 'package:nexqloud/core/extensions/size_ext.dart';
import 'package:nexqloud/core/extensions/theme_ext.dart';
import 'package:nexqloud/features/main/models/server_model.dart';
import 'package:nexqloud/features/main/providers/server_data_provider.dart';

class WorldMap extends StatefulWidget {
  const WorldMap({super.key});

  @override
  State<WorldMap> createState() => _WorldMapState();
}

class _WorldMapState extends State<WorldMap> {
  final _continentsList = {
    'Asia': 'asia.json',
    'Africa': 'africa.json',
    'Europe': 'europe.json',
    'South America': 'south-america.json',
    'Australia': 'australia.json',
    'North America': 'north-america.json',
    'Antarctica': 'oceania.json',
  };

  final List<ServerModel> _worldMapMarkersData = [];
  late MapShapeSource _worldMapDataSource;
  late MapZoomPanBehavior _worldMapZoomPanBehavior;
  late MapShapeLayerController _worldMapShapeController;
  int _selectedIndex = -1;

  @override
  void initState() {
    super.initState();
    context.read<ServerDataProvider>().setData();
    _configureWorldMap();
    _worldMapShapeController = MapShapeLayerController();
    _worldMapZoomPanBehavior = MapZoomPanBehavior(
      enableDoubleTapZooming: true,
      toolbarSettings: const MapToolbarSettings(
        itemBackgroundColor: graphlinecolor2,
        iconColor: kWhite,
        itemHoverColor: kPurpleColor,
        direction: Axis.vertical,
        position: MapToolbarPosition.bottomRight,
      ),
    );
  }

  void _configureWorldMap() {
    final continents = context.read<ServerDataProvider>().getContinentList();
    for (final continent in continents) {
      final serversInAContinent =
          context.read<ServerDataProvider>().findContinentServer(continent);
      _worldMapMarkersData.add(serversInAContinent);
    }

    _worldMapDataSource = MapShapeSource.asset(
      'world_map.json',
      shapeDataField: 'continent',
      dataCount: _worldMapMarkersData.length,
      primaryValueMapper: (index) => _continentsList.keys.toList()[index],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
              if (_selectedIndex == -1) ...[
                SizedBox(
                  height: context.height * 0.58,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: SfMapsTheme(
                      data: SfMapsThemeData(
                        shapeHoverColor: kTransparent,
                        shapeHoverStrokeColor: kWhite.withOpacity(0.22),
                        tooltipColor: kWhite.withOpacity(0.2),
                        tooltipStrokeColor: kWhite.withOpacity(0.1),
                        tooltipBorderRadius: BorderRadius.circular(15),
                      ),
                      child: SfMaps(
                        layers: <MapLayer>[
                          MapShapeLayer(
                            strokeWidth: 0,
                            source: _worldMapDataSource,
                            initialMarkersCount: _worldMapMarkersData.length,
                            color: kWhite.withOpacity(0.2),
                            strokeColor: kWhite.withOpacity(0.22),
                            controller: _worldMapShapeController,
                            zoomPanBehavior: _worldMapZoomPanBehavior,
                            selectedIndex: _selectedIndex,
                            onSelectionChanged: (index) {
                              setState(() {
                                print(_worldMapMarkersData[index].serverName);

                                _selectedIndex = index;
                                if (_selectedIndex == -1) return;
                              });
                            },
                            markerTooltipBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(12),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.all(4),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(7),
                                                color: const Color(0xffa2dcff)
                                                    .withOpacity(0.2),
                                              ),
                                              child: SvgPicture.asset(
                                                'assets/icons/svg/money_icon.svg',
                                                height: 18,
                                              ),
                                            ),
                                            const Space.horizontal(12),
                                            Text(
                                              _worldMapMarkersData[index]
                                                  .serverName,
                                              style: context.medium?.copyWith(
                                                fontSize: 16,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const Space.horizontal(80),
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Image.asset(
                                              'assets/icons/png/online_icon.png',
                                            ),
                                            const Space.horizontal(6),
                                            Text(
                                              _worldMapMarkersData[index]
                                                  .status,
                                              style: context.medium,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    const Space.vertical(18),
                                    // More detailed server information rows...
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        ServerDetailRow(
                                          label: 'Uptime:',
                                          value:
                                              '${_worldMapMarkersData[index].uptime}%',
                                        ),
                                        const Space.horizontal(24),
                                        ServerDetailRow(
                                          label: 'Uptime:',
                                          value:
                                              '${_worldMapMarkersData[index].uptime}%',
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        ServerDetailRow(
                                          label: 'Region:',
                                          value: _worldMapMarkersData[index]
                                              .region,
                                        ),
                                        const Space.horizontal(24),
                                        ServerDetailRow(
                                          label: 'Region:',
                                          value: _worldMapMarkersData[index]
                                              .region,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        ServerDetailRow(
                                          label: 'Cores:',
                                          value:
                                              '${_worldMapMarkersData[index].cores}',
                                        ),
                                        const Space.horizontal(24),
                                        ServerDetailRow(
                                          label: 'Cores:',
                                          value:
                                              '${_worldMapMarkersData[index].cores}',
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        ServerDetailRow(
                                          label: 'Memory:',
                                          value:
                                              '${_worldMapMarkersData[index].memory}GB',
                                        ),
                                        const Space.horizontal(24),
                                        ServerDetailRow(
                                          label: 'Memory:',
                                          value:
                                              '${_worldMapMarkersData[index].memory}GB',
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                            onWillZoom: (details) {
                              try {
                                details.newZoomLevel.printInfo();

                                // Keep the existing logic for zooming in (as it works correctly)
                                if (details.newZoomLevel! > 2 &&
                                    details.newZoomLevel! <= 3) {
                                  _worldMapMarkersData.clear();
                                  final regions = context
                                      .read<ServerDataProvider>()
                                      .getRegionList();
                                  final serversInARegion = <ServerModel>[];
                                  for (final region in regions) {
                                    final servers = context
                                        .read<ServerDataProvider>()
                                        .findRegion(region);
                                    serversInARegion.addAll(servers);
                                  }
                                  _worldMapMarkersData.addAll(serversInARegion);
                                  _worldMapShapeController.clearMarkers();
                                  for (var i = 0;
                                      i < _worldMapMarkersData.length;
                                      i++) {
                                    _worldMapShapeController.insertMarker(i);
                                  }
                                } else if (details.newZoomLevel! >= 4) {
                                  _worldMapMarkersData.clear();
                                  final countries = context
                                      .read<ServerDataProvider>()
                                      .getCountryList();
                                  for (final country in countries) {
                                    final serversInACountry = context
                                        .read<ServerDataProvider>()
                                        .findCountry(country);
                                    _worldMapMarkersData
                                        .addAll(serversInACountry);
                                  }
                                  _worldMapShapeController.clearMarkers();
                                  for (var i = 0;
                                      i < _worldMapMarkersData.length;
                                      i++) {
                                    _worldMapShapeController.insertMarker(i);
                                  }
                                }

                                // Handle zoom out logic correctly by reverting to continents
                                if (details.newZoomLevel! < 4 &&
                                    details.previousZoomLevel! >= 4) {
                                  // Zooming out from level 4+ (countries) to 3 or below (regions or continents)
                                  _worldMapMarkersData.clear();
                                  final regions = context
                                      .read<ServerDataProvider>()
                                      .getRegionList();
                                  final serversInARegion = <ServerModel>[];
                                  for (final region in regions) {
                                    final servers = context
                                        .read<ServerDataProvider>()
                                        .findRegion(region);
                                    serversInARegion.addAll(servers);
                                  }
                                  _worldMapMarkersData.addAll(serversInARegion);
                                  _worldMapShapeController.clearMarkers();
                                  for (var i = 0;
                                      i < _worldMapMarkersData.length;
                                      i++) {
                                    _worldMapShapeController.insertMarker(i);
                                  }
                                } else if (details.newZoomLevel! <= 2 &&
                                    details.previousZoomLevel! > 2) {
                                  // Zooming out further to continent-level markers (reset to the initial state)
                                  _worldMapMarkersData
                                      .clear(); // Clear current markers
                                  final continents = context
                                      .read<ServerDataProvider>()
                                      .getContinentList();
                                  for (final continent in continents) {
                                    final serversInAContinent = context
                                        .read<ServerDataProvider>()
                                        .findContinentServer(continent);
                                    for (final continent in continents) {
                                      final serverInAContinent = context
                                          .read<ServerDataProvider>()
                                          .findContinentServer(continent);
                                      _worldMapMarkersData.add(
                                        serverInAContinent,
                                      ); // Use `add` for a single server
                                    }
                                    // Add continent-level markers
                                  }
                                  _worldMapShapeController.clearMarkers();
                                  for (var i = 0;
                                      i < _worldMapMarkersData.length;
                                      i++) {
                                    _worldMapShapeController.insertMarker(i);
                                  }
                                }
                              } catch (e) {
                                e.printError();
                              }
                              return true;
                            },
                            markerBuilder: (context, index) {
                              double markerSize;

                              // Define marker size based on the number of markers
                              if (_worldMapMarkersData.length <= 10) {
                                // Fewer markers, larger size
                                markerSize = 18.0;
                              } else if (_worldMapMarkersData.length <= 50) {
                                // Moderate number of markers, medium size
                                markerSize = 15.0;
                              } else {
                                // More markers, smaller size
                                markerSize = 10.0;
                              }
                              return MapMarker(
                                latitude: _worldMapMarkersData[index].latitude,
                                longitude:
                                    _worldMapMarkersData[index].longitude,
                                size: Size(markerSize, markerSize),
                                iconColor: graphlinecolor2.withOpacity(0.8),
                                child: ZoomIn(
                                  child: Container(
                                    height: markerSize,
                                    width: markerSize,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: graphlinecolor2.withOpacity(0.8),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ] else
                const ContinentMap(
                  continent: 'Asia',
                  filePath: 'asia.json',
                ),
              //   SizedBox(
              //     height: context.height * 0.58,
              //     child: ClipRRect(
              //       borderRadius: BorderRadius.circular(20),
              //       child: SfMapsTheme(
              //         data: SfMapsThemeData(
              //           shapeHoverColor: kTransparent,
              //           shapeHoverStrokeColor: kWhite.withOpacity(0.22),
              //           tooltipColor: kWhite.withOpacity(0.2),
              //           tooltipStrokeColor: kWhite.withOpacity(0.1),
              //           tooltipBorderRadius: BorderRadius.circular(15),
              //         ),
              //         child: SfMaps(
              //           layers: <MapLayer>[
              //             MapShapeLayer(
              //               strokeWidth: 0,
              //               source: _continentDataSource,
              //               initialMarkersCount: _continentMarkersData.length,
              //               color: kWhite.withOpacity(0.2),
              //               strokeColor: kWhite.withOpacity(0.22),
              //               controller: _continentMapShapeController,
              //               zoomPanBehavior: _continentMapZoomPanBehavior,
              //               markerTooltipBuilder: (context, index) {
              //                 return Padding(
              //                   padding: const EdgeInsets.all(12),
              //                   child: Column(
              //                     mainAxisSize: MainAxisSize.min,
              //                     children: [
              //                       Row(
              //                         mainAxisSize: MainAxisSize.min,
              //                         mainAxisAlignment:
              //                             MainAxisAlignment.spaceBetween,
              //                         children: [
              //                           Row(
              //                             mainAxisSize: MainAxisSize.min,
              //                             children: [
              //                               Container(
              //                                 padding: const EdgeInsets.all(4),
              //                                 decoration: BoxDecoration(
              //                                   borderRadius:
              //                                       BorderRadius.circular(7),
              //                                   color: const Color(0xffa2dcff)
              //                                       .withOpacity(0.2),
              //                                 ),
              //                                 child: SvgPicture.asset(
              //                                   'assets/icons/svg/money_icon.svg',
              //                                   height: 18,
              //                                 ),
              //                               ),
              //                               const Space.horizontal(12),
              //                               Text(
              //                                 _continentMarkersData[index]
              //                                     .serverName,
              //                                 style: context.medium?.copyWith(
              //                                   fontSize: 16,
              //                                 ),
              //                               ),
              //                             ],
              //                           ),
              //                           const Space.horizontal(80),
              //                           Row(
              //                             mainAxisSize: MainAxisSize.min,
              //                             children: [
              //                               Image.asset(
              //                                 'assets/icons/png/online_icon.png',
              //                               ),
              //                               const Space.horizontal(6),
              //                               Text(
              //                                 _continentMarkersData[index]
              //                                     .status,
              //                                 style: context.medium,
              //                               ),
              //                             ],
              //                           ),
              //                         ],
              //                       ),
              //                       const Space.vertical(18),
              //                       // More detailed server information rows...
              //                       Row(
              //                         mainAxisSize: MainAxisSize.min,
              //                         children: [
              //                           ServerDetailRow(
              //                             label: 'Uptime:',
              //                             value:
              //                                 '${_continentMarkersData[index].uptime}%',
              //                           ),
              //                           const Space.horizontal(24),
              //                           ServerDetailRow(
              //                             label: 'Uptime:',
              //                             value:
              //                                 '${_continentMarkersData[index].uptime}%',
              //                           ),
              //                         ],
              //                       ),
              //                       Row(
              //                         mainAxisSize: MainAxisSize.min,
              //                         children: [
              //                           ServerDetailRow(
              //                             label: 'Region:',
              //                             value: _continentMarkersData[index]
              //                                 .region,
              //                           ),
              //                           const Space.horizontal(24),
              //                           ServerDetailRow(
              //                             label: 'Region:',
              //                             value: _continentMarkersData[index]
              //                                 .region,
              //                           ),
              //                         ],
              //                       ),
              //                       Row(
              //                         mainAxisSize: MainAxisSize.min,
              //                         children: [
              //                           ServerDetailRow(
              //                             label: 'Cores:',
              //                             value:
              //                                 '${_continentMarkersData[index].cores}',
              //                           ),
              //                           const Space.horizontal(24),
              //                           ServerDetailRow(
              //                             label: 'Cores:',
              //                             value:
              //                                 '${_continentMarkersData[index].cores}',
              //                           ),
              //                         ],
              //                       ),
              //                       Row(
              //                         mainAxisSize: MainAxisSize.min,
              //                         children: [
              //                           ServerDetailRow(
              //                             label: 'Memory:',
              //                             value:
              //                                 '${_continentMarkersData[index].memory}GB',
              //                           ),
              //                           const Space.horizontal(24),
              //                           ServerDetailRow(
              //                             label: 'Memory:',
              //                             value:
              //                                 '${_continentMarkersData[index].memory}GB',
              //                           ),
              //                         ],
              //                       ),
              //                     ],
              //                   ),
              //                 );
              //               },
              //               // onWillZoom: (details) {
              //               //   try {
              //               //     // details.newZoomLevel.printInfo();

              //               //     // // Keep the existing logic for zooming in (as it works correctly)
              //               //     // if (details.newZoomLevel! > 2 &&
              //               //     //     details.newZoomLevel! <= 3) {
              //               //     //   _worldMapMarkersData.clear();
              //               //     //   final regions = context
              //               //     //       .read<ServerDataProvider>()
              //               //     //       .getRegionList();
              //               //     //   final serversInARegion = <ServerModel>[];
              //               //     //   for (final region in regions) {
              //               //     //     final servers = context
              //               //     //         .read<ServerDataProvider>()
              //               //     //         .findRegion(region);
              //               //     //     serversInARegion.addAll(servers);
              //               //     //   }
              //               //     //   _worldMapMarkersData.addAll(serversInARegion);
              //               //     //   _worldMapShapeController.clearMarkers();
              //               //     //   for (var i = 0;
              //               //     //       i < _worldMapMarkersData.length;
              //               //     //       i++) {
              //               //     //     _worldMapShapeController.insertMarker(i);
              //               //     //   }
              //               //     // } else

              //               //     if (details.newZoomLevel! >= 4) {
              //               //       _worldMapMarkersData.clear();
              //               //       final countries = context
              //               //           .read<ServerDataProvider>()
              //               //           .getCountryList();
              //               //       for (final country in countries) {
              //               //         final serversInACountry = context
              //               //             .read<ServerDataProvider>()
              //               //             .findCountry(country);
              //               //         _worldMapMarkersData
              //               //             .addAll(serversInACountry);
              //               //       }
              //               //       _worldMapShapeController.clearMarkers();
              //               //       for (var i = 0;
              //               //           i < _worldMapMarkersData.length;
              //               //           i++) {
              //               //         _worldMapShapeController.insertMarker(i);
              //               //       }
              //               //     }

              //               //     // Handle zoom out logic correctly by reverting to continents
              //               //     if (details.newZoomLevel! < 4 &&
              //               //         details.previousZoomLevel! >= 4) {
              //               //       // Zooming out from level 4+ (countries) to 3 or below (regions or continents)
              //               //       _worldMapMarkersData.clear();
              //               //       final regions = context
              //               //           .read<ServerDataProvider>()
              //               //           .getRegionList();
              //               //       final serversInARegion = <ServerModel>[];
              //               //       for (final region in regions) {
              //               //         final servers = context
              //               //             .read<ServerDataProvider>()
              //               //             .findRegion(region);
              //               //         serversInARegion.addAll(servers);
              //               //       }
              //               //       _worldMapMarkersData.addAll(serversInARegion);
              //               //       _worldMapShapeController.clearMarkers();
              //               //       for (var i = 0;
              //               //           i < _worldMapMarkersData.length;
              //               //           i++) {
              //               //         _worldMapShapeController.insertMarker(i);
              //               //       }
              //               //     } else if (details.newZoomLevel! <= 2 &&
              //               //         details.previousZoomLevel! > 2) {
              //               //       // Zooming out further to continent-level markers (reset to the initial state)
              //               //       _worldMapMarkersData
              //               //           .clear(); // Clear current markers
              //               //       final continents = context
              //               //           .read<ServerDataProvider>()
              //               //           .getContinentList();
              //               //       for (final continent in continents) {
              //               //         final serversInAContinent = context
              //               //             .read<ServerDataProvider>()
              //               //             .findContinentServer(continent);
              //               //         for (final continent in continents) {
              //               //           final serverInAContinent = context
              //               //               .read<ServerDataProvider>()
              //               //               .findContinentServer(continent);
              //               //           _worldMapMarkersData.add(
              //               //             serverInAContinent,
              //               //           ); // Use `add` for a single server
              //               //         }
              //               //         // Add continent-level markers
              //               //       }
              //               //       _worldMapShapeController.clearMarkers();
              //               //       for (var i = 0;
              //               //           i < _worldMapMarkersData.length;
              //               //           i++) {
              //               //         _worldMapShapeController.insertMarker(i);
              //               //       }
              //               //     }
              //               //   } catch (e) {
              //               //     e.printError();
              //               //   }
              //               //   return true;
              //               // },
              //               // markerBuilder: (context, index) {
              //               //   // double markerSize;

              //               //   // // Define marker size based on the number of markers
              //               //   // if (_continentMarkersData.length <= 10) {
              //               //   //   // Fewer markers, larger size
              //               //   //   markerSize = 18.0;
              //               //   // } else if (_worldMapMarkersData.length <= 50) {
              //               //   //   // Moderate number of markers, medium size
              //               //   //   markerSize = 15.0;
              //               //   // } else {
              //               //   //   // More markers, smaller size
              //               //   //   markerSize = 10.0;
              //               //   // }
              //               //   return MapMarker(
              //               //     latitude: _continentMarkersData[index].latitude,
              //               //     longitude:
              //               //         _continentMarkersData[index].longitude,
              //               //     // size: Size(markerSize, markerSize),
              //               //     iconColor: graphlinecolor2.withOpacity(0.8),
              //               //     child: ZoomIn(
              //               //       child: Container(
              //               //         // height: markerSize,
              //               //         // width: markerSize,
              //               //         decoration: BoxDecoration(
              //               //           shape: BoxShape.circle,
              //               //           color: graphlinecolor2.withOpacity(0.8),
              //               //         ),
              //               //       ),
              //               //     ),
              //               //   );
              //               // },
              //             ),
              //           ],
              //         ),
              //       ),
              //     ),
              //   ),
            ],
          ),
        ),
      ),
    );
  }
}

class ServerDetailRow extends StatelessWidget {
  const ServerDetailRow({
    super.key,
    required this.label,
    required this.value,
  });
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: SizedBox(
        width: context.height * 0.12,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                label,
                overflow: TextOverflow.ellipsis,
                style: context.light,
              ),
            ),
            Flexible(
              child: Text(
                value,
                overflow: TextOverflow.ellipsis,
                style: context.light,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
