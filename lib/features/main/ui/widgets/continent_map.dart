import 'package:animate_do/animate_do.dart';
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

      _continentDataSource = MapShapeSource.asset(
        widget.filePath,
        shapeDataField: 'country',
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
    return SizedBox(
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
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
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ServerDetailRow(
                              label: 'Uptime:',
                              value: '${_continentMarkersData[index].uptime}%',
                            ),
                            const Space.horizontal(24),
                            ServerDetailRow(
                              label: 'Uptime:',
                              value: '${_continentMarkersData[index].uptime}%',
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
                              value: '${_continentMarkersData[index].cores}',
                            ),
                            const Space.horizontal(24),
                            ServerDetailRow(
                              label: 'Cores:',
                              value: '${_continentMarkersData[index].cores}',
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ServerDetailRow(
                              label: 'Memory:',
                              value: '${_continentMarkersData[index].memory}GB',
                            ),
                            const Space.horizontal(24),
                            ServerDetailRow(
                              label: 'Memory:',
                              value: '${_continentMarkersData[index].memory}GB',
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
                markerBuilder: (context, index) {
                  double markerSize;

                  if (_continentMarkersData.length <= 10) {
                    markerSize = 18.0;
                  } else if (_continentMarkersData.length <= 50) {
                    markerSize = 15.0;
                  } else {
                    markerSize = 10.0;
                  }
                  return MapMarker(
                    latitude: _continentMarkersData[index].latitude,
                    longitude: _continentMarkersData[index].longitude,
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
    );
  }
}
