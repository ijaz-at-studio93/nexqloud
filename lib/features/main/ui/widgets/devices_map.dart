import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_maps/maps.dart';

import 'package:nexqloud/core/constants/colors.dart';
import 'package:nexqloud/core/constants/space.dart';
import 'package:nexqloud/core/extensions/size_ext.dart';
import 'package:nexqloud/core/extensions/theme_ext.dart';
import 'package:nexqloud/features/main/models/server_model.dart';
import 'package:nexqloud/features/main/providers/server_data_provider.dart';

class DevicesMap extends StatefulWidget {
  const DevicesMap({super.key});

  @override
  State<DevicesMap> createState() => _DevicesMapState();
}

class _DevicesMapState extends State<DevicesMap> {
  late List<ServerModel> _data;
  late MapShapeSource _dataSource;
  late MapZoomPanBehavior _zoomPanBehavior;
  late MapShapeLayerController _shapeController;

  @override
  void initState() {
    super.initState();
    context.read<ServerDataProvider>().setData();
    _data = context.read<ServerDataProvider>().data;

    _dataSource = MapShapeSource.asset(
      'world_map.json',
      shapeDataField: 'name',
      dataCount: _data.length,
      primaryValueMapper: (index) => _data[index].country,
    );

    _zoomPanBehavior = MapZoomPanBehavior(
      enableDoubleTapZooming: true,
      zoomLevel: 1.2,
      toolbarSettings: const MapToolbarSettings(
        itemBackgroundColor: graphlinecolor2,
        iconColor: kWhite,
        itemHoverColor: kPurpleColor,
        direction: Axis.vertical,
        position: MapToolbarPosition.bottomRight,
      ),
    );

    _shapeController = MapShapeLayerController();
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
                          source: _dataSource,
                          initialMarkersCount: 1,
                          color: kWhite.withOpacity(0.2),
                          strokeColor: kWhite.withOpacity(0.22),
                          controller: _shapeController,
                          zoomPanBehavior: _zoomPanBehavior,
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
                                            _data[index].serverName,
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
                                            _data[index].status,
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
                                        value: '${_data[index].uptime}%',
                                      ),
                                      const Space.horizontal(24),
                                      ServerDetailRow(
                                        label: 'Uptime:',
                                        value: '${_data[index].uptime}%',
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      ServerDetailRow(
                                        label: 'Region:',
                                        value: _data[index].region,
                                      ),
                                      const Space.horizontal(24),
                                      ServerDetailRow(
                                        label: 'Region:',
                                        value: _data[index].region,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      ServerDetailRow(
                                        label: 'Cores:',
                                        value: '${_data[index].cores}',
                                      ),
                                      const Space.horizontal(24),
                                      ServerDetailRow(
                                        label: 'Cores:',
                                        value: '${_data[index].cores}',
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      ServerDetailRow(
                                        label: 'Memory:',
                                        value: '${_data[index].memory}GB',
                                      ),
                                      const Space.horizontal(24),
                                      ServerDetailRow(
                                        label: 'Memory:',
                                        value: '${_data[index].memory}GB',
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                          onWillZoom: (details) {
                            _data.clear();
                            if (details.newZoomLevel! <= 3) {
                              _data.add(
                                const ServerModel(
                                  serverName: 'Server 1',
                                  country: 'India',
                                  region: 'IN',
                                  latitude: 20.5937,
                                  longitude: 78.9629,
                                  uptime: 99.9,
                                  cores: 32,
                                  memory: 64,
                                ),
                              );
                              _shapeController.clearMarkers();
                              _shapeController.insertMarker(0);
                            } else if (details.newZoomLevel! >= 4) {
                              _data.addAll([
                                const ServerModel(
                                  serverName: 'Server 2',
                                  country: 'India',
                                  region: 'IN',
                                  latitude: 11.1271,
                                  longitude: 78.6569,
                                  uptime: 98.5,
                                  cores: 32,
                                  memory: 64,
                                ),
                                const ServerModel(
                                  serverName: 'Server 3',
                                  country: 'India',
                                  region: 'IN',
                                  latitude: 17.3850,
                                  longitude: 78.4867,
                                  uptime: 98.9,
                                  cores: 32,
                                  memory: 64,
                                ),
                                const ServerModel(
                                  serverName: 'Server 4',
                                  country: 'India',
                                  region: 'IN',
                                  latitude: 19.0760,
                                  longitude: 72.8777,
                                  uptime: 99.2,
                                  cores: 64,
                                  memory: 128,
                                ),
                              ]);
                              _shapeController.clearMarkers();
                              for (var i = 0; i < _data.length; i++) {
                                _shapeController.insertMarker(i);
                              }
                            }
                            return true;
                          },
                          markerBuilder: (context, index) {
                            return MapMarker(
                              latitude: _data[index].latitude,
                              longitude: _data[index].longitude,
                              size: const Size(10, 10),
                              iconColor: graphlinecolor2.withOpacity(0.8),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
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
