import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:nexqloud/core/extensions/log.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_maps/maps.dart';

import 'package:nexqloud/core/constants/colors.dart';
import 'package:nexqloud/core/constants/space.dart';
import 'package:nexqloud/core/extensions/size_ext.dart';
import 'package:nexqloud/core/extensions/theme_ext.dart';
import 'package:nexqloud/features/main/models/server_model.dart';
import 'package:nexqloud/features/main/providers/server_data_provider.dart';
import 'package:nexqloud/features/main/ui/widgets/world_map.dart';

class ContinentMap extends StatefulWidget {
  const ContinentMap({
    super.key,
    required this.continent,
    required this.filePath,
  });
  final String continent;
  final String filePath;

  @override
  State<ContinentMap> createState() => _ContinentMapState();
}

class _ContinentMapState extends State<ContinentMap> {
  final List<ServerModel> _continentMarkersData = [];
  late MapShapeSource _continentDataSource;
  late MapZoomPanBehavior _continentMapZoomPanBehavior;
  late MapShapeLayerController _continentMapShapeController;

  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    _configureContinentMap();
  }

  Future<void> _configureContinentMap() async {
    _continentMapShapeController = MapShapeLayerController();
    _continentMapZoomPanBehavior = MapZoomPanBehavior(
      enableDoubleTapZooming: true,
      toolbarSettings: const MapToolbarSettings(
        itemBackgroundColor: graphlinecolor2,
        iconColor: kWhite,
        itemHoverColor: kPurpleColor,
        direction: Axis.vertical,
        position: MapToolbarPosition.bottomRight,
      ),
    );

    try {
      setState(() {
        isLoading = true;
      });
      await Future.delayed(const Duration(seconds: 1), () {
        final countries =
            context.read<ServerDataProvider>().findCountryInContinent(
                  widget.continent,
                );
        for (final country in countries) {
          final serversInACountry =
              context.read<ServerDataProvider>().findCountry(country);
          print('serversInACountry: $serversInACountry');
          _continentMarkersData.addAll(serversInACountry);
        }

        _continentMapShapeController.clearMarkers();
        for (var i = 0; i < _continentMarkersData.length; i++) {
          _continentMapShapeController.insertMarker(i);
        }
      });

      _continentDataSource = MapShapeSource.asset(
        widget.filePath,
        // shapeDataField: 'country',
        // shapeDataField: 'continent',
        dataCount: _continentMarkersData.length,
      );
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      e.printError();
    }
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : SizedBox(
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
                      source: _continentDataSource,
                      initialMarkersCount: _continentMarkersData.length,
                      color: kWhite.withOpacity(0.2),
                      strokeColor: kWhite.withOpacity(0.22),
                      controller: _continentMapShapeController,
                      zoomPanBehavior: _continentMapZoomPanBehavior,
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
                                        _continentMarkersData[index].serverName,
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
                                        _continentMarkersData[index].status,
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
                                        '${_continentMarkersData[index].uptime}%',
                                  ),
                                  const Space.horizontal(24),
                                  ServerDetailRow(
                                    label: 'Uptime:',
                                    value:
                                        '${_continentMarkersData[index].uptime}%',
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ServerDetailRow(
                                    label: 'Region:',
                                    value: _continentMarkersData[index].region,
                                  ),
                                  const Space.horizontal(24),
                                  ServerDetailRow(
                                    label: 'Region:',
                                    value: _continentMarkersData[index].region,
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ServerDetailRow(
                                    label: 'Cores:',
                                    value:
                                        '${_continentMarkersData[index].cores}',
                                  ),
                                  const Space.horizontal(24),
                                  ServerDetailRow(
                                    label: 'Cores:',
                                    value:
                                        '${_continentMarkersData[index].cores}',
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ServerDetailRow(
                                    label: 'Memory:',
                                    value:
                                        '${_continentMarkersData[index].memory}GB',
                                  ),
                                  const Space.horizontal(24),
                                  ServerDetailRow(
                                    label: 'Memory:',
                                    value:
                                        '${_continentMarkersData[index].memory}GB',
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                      // onWillZoom: (details) {
                      //   try {
                      //     // details.newZoomLevel.printInfo();

                      //     // // Keep the existing logic for zooming in (as it works correctly)
                      //     // if (details.newZoomLevel! > 2 &&
                      //     //     details.newZoomLevel! <= 3) {
                      //     //   _worldMapMarkersData.clear();
                      //     //   final regions = context
                      //     //       .read<ServerDataProvider>()
                      //     //       .getRegionList();
                      //     //   final serversInARegion = <ServerModel>[];
                      //     //   for (final region in regions) {
                      //     //     final servers = context
                      //     //         .read<ServerDataProvider>()
                      //     //         .findRegion(region);
                      //     //     serversInARegion.addAll(servers);
                      //     //   }
                      //     //   _worldMapMarkersData.addAll(serversInARegion);
                      //     //   _worldMapShapeController.clearMarkers();
                      //     //   for (var i = 0;
                      //     //       i < _worldMapMarkersData.length;
                      //     //       i++) {
                      //     //     _worldMapShapeController.insertMarker(i);
                      //     //   }
                      //     // } else

                      //     if (details.newZoomLevel! >= 4) {
                      //       _worldMapMarkersData.clear();
                      //       final countries = context
                      //           .read<ServerDataProvider>()
                      //           .getCountryList();
                      //       for (final country in countries) {
                      //         final serversInACountry = context
                      //             .read<ServerDataProvider>()
                      //             .findCountry(country);
                      //         _worldMapMarkersData
                      //             .addAll(serversInACountry);
                      //       }
                      //       _worldMapShapeController.clearMarkers();
                      //       for (var i = 0;
                      //           i < _worldMapMarkersData.length;
                      //           i++) {
                      //         _worldMapShapeController.insertMarker(i);
                      //       }
                      //     }

                      //     // Handle zoom out logic correctly by reverting to continents
                      //     if (details.newZoomLevel! < 4 &&
                      //         details.previousZoomLevel! >= 4) {
                      //       // Zooming out from level 4+ (countries) to 3 or below (regions or continents)
                      //       _worldMapMarkersData.clear();
                      //       final regions = context
                      //           .read<ServerDataProvider>()
                      //           .getRegionList();
                      //       final serversInARegion = <ServerModel>[];
                      //       for (final region in regions) {
                      //         final servers = context
                      //             .read<ServerDataProvider>()
                      //             .findRegion(region);
                      //         serversInARegion.addAll(servers);
                      //       }
                      //       _worldMapMarkersData.addAll(serversInARegion);
                      //       _worldMapShapeController.clearMarkers();
                      //       for (var i = 0;
                      //           i < _worldMapMarkersData.length;
                      //           i++) {
                      //         _worldMapShapeController.insertMarker(i);
                      //       }
                      //     } else if (details.newZoomLevel! <= 2 &&
                      //         details.previousZoomLevel! > 2) {
                      //       // Zooming out further to continent-level markers (reset to the initial state)
                      //       _worldMapMarkersData
                      //           .clear(); // Clear current markers
                      //       final continents = context
                      //           .read<ServerDataProvider>()
                      //           .getContinentList();
                      //       for (final continent in continents) {
                      //         final serversInAContinent = context
                      //             .read<ServerDataProvider>()
                      //             .findContinentServer(continent);
                      //         for (final continent in continents) {
                      //           final serverInAContinent = context
                      //               .read<ServerDataProvider>()
                      //               .findContinentServer(continent);
                      //           _worldMapMarkersData.add(
                      //             serverInAContinent,
                      //           ); // Use `add` for a single server
                      //         }
                      //         // Add continent-level markers
                      //       }
                      //       _worldMapShapeController.clearMarkers();
                      //       for (var i = 0;
                      //           i < _worldMapMarkersData.length;
                      //           i++) {
                      //         _worldMapShapeController.insertMarker(i);
                      //       }
                      //     }
                      //   } catch (e) {
                      //     e.printError();
                      //   }
                      //   return true;
                      // },
                      // markerBuilder: (context, index) {
                      //   // double markerSize;

                      //   // // Define marker size based on the number of markers
                      //   // if (_continentMarkersData.length <= 10) {
                      //   //   // Fewer markers, larger size
                      //   //   markerSize = 18.0;
                      //   // } else if (_worldMapMarkersData.length <= 50) {
                      //   //   // Moderate number of markers, medium size
                      //   //   markerSize = 15.0;
                      //   // } else {
                      //   //   // More markers, smaller size
                      //   //   markerSize = 10.0;
                      //   // }
                      //   return MapMarker(
                      //     latitude: _continentMarkersData[index].latitude,
                      //     longitude:
                      //         _continentMarkersData[index].longitude,
                      //     // size: Size(markerSize, markerSize),
                      //     iconColor: graphlinecolor2.withOpacity(0.8),
                      //     child: ZoomIn(
                      //       child: Container(
                      //         // height: markerSize,
                      //         // width: markerSize,
                      //         decoration: BoxDecoration(
                      //           shape: BoxShape.circle,
                      //           color: graphlinecolor2.withOpacity(0.8),
                      //         ),
                      //       ),
                      //     ),
                      //   );
                      // },
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
