import 'dart:math';

import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:nexqloud/core/constants/colors.dart';
import 'package:nexqloud/core/constants/space.dart';
import 'package:nexqloud/core/extensions/size_ext.dart';
import 'package:nexqloud/core/extensions/theme_ext.dart';
import 'package:nexqloud/core/navigation/router.dart';
import 'package:nexqloud/core/ui/widgets/custom_gradient_button.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class TransparentDataGrid extends StatefulWidget {
  @override
  _TransparentDataGridState createState() => _TransparentDataGridState();
}

class _TransparentDataGridState extends State<TransparentDataGrid> {
  List<ProviderModel> originalProviderData = []; // Store the original data
  late List<ProviderModel> providerData;
  late ProviderDataSource _providerDataSource;
  int rowsPerPage = 10;
  int pageIndex = 0;
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    fetchAndGenerateProviderData();
    // providerData = getProviderData(); // Dummy data generation
  }

  List<String> locations = [
    'New York',
    'London',
    'Tokyo',
    'Berlin',
    'Paris',
    'Sydney',
    'San Francisco'
  ];

  Future<List<ProviderModel>> fetchAndGenerateProviderData() async {
    // Initialize the provider data source
    _providerDataSource = ProviderDataSource(providerData: []);

    // Load the Excel file from assets
    final data = await rootBundle.load("assets/servers_list.xlsx");
    final bytes = data.buffer.asUint8List();
    final excel = Excel.decodeBytes(bytes);

    final providers = <ProviderModel>[];
    final random = Random();

    // Assuming data is in the first sheet
    final sheet = excel.tables.keys.first;
    final table = excel.tables[sheet];

    if (table != null) {
      for (var i = 1; i < table.rows.length; i++) {
        final row = table.rows[i];

        // Check if row length matches expected structure
        if (row.length >= 8) {
          // Create a ProviderModel object for each row
          final provider = ProviderModel(
            name: row[0]!.value?.toString() ?? '', // Server Name
            model: row[1]?.value.toString() ?? '', // Model
            online: row[2]?.value.toString() == 'TRUE', // Online status
            uptime: row[3]?.value.toString() ?? '', // Uptime
            cpu: row[4]?.value.toString() ?? '', // CPU
            memory: row[5]?.value.toString() ?? '', // Memory
            disk: row[6]?.value.toString() ?? '', // Disk
            qloudscore: row[7]?.value.toString() ?? '', // Qloudscore
            location: locations[random.nextInt(locations.length)], gpu: '',
            audited: row[2]?.value.toString() ?? '',
            price: '', // Random location
          );

          providers.add(provider);
        }
      }
    }

    // Update the data source
    originalProviderData = providers;
    providerData = providers;
    _providerDataSource = ProviderDataSource(providerData: providerData);

    return providers;
  }

  ///For dummy data generation
  // List<ProviderModel> getProviderData() {
  //   return List.generate(
  //     50,
  //     (index) => ProviderModel(
  //       name: 'prov...server $index',
  //       location: 'US,UK',
  //       uptime: (79 + index % 10).toString() + '%',
  //       cpu: '${index % 5 + 1} CPU',
  //       gpu: '${index % 5 * 2} GB',
  //       memory: '${index % 8 + 1} GB',
  //       disk: '${index % 5 + 1} GB',
  //       audited: index % 2 == 0 ? 'Audited' : 'Not Audited',
  //       price: '\$${(index * 3.3).toStringAsFixed(2)}',
  //     ),
  //   );
  // }

  void _onSearch(String query) {
    setState(() {
      searchQuery = query.toLowerCase();

      if (searchQuery.isEmpty) {
        // Reset the list to the original data when the query is empty
        providerData = List.from(originalProviderData);
      } else {
        // Perform the search
        providerData = originalProviderData
            .where((element) =>
                element.name.toLowerCase().contains(searchQuery) ||
                element.location.toLowerCase().contains(searchQuery) ||
                element.model.toLowerCase().contains(searchQuery) ||
                element.uptime.toLowerCase().contains(searchQuery) ||
                element.cpu.toLowerCase().contains(searchQuery) ||
                element.disk.toLowerCase().contains(searchQuery))
            .toList();
      }

      _providerDataSource = ProviderDataSource(providerData: providerData);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          if (context.isMobile || context.isTablet) const Space.vertical(20),
          _buildSearchBar(),
          Expanded(
            child: SfDataGridTheme(
              data: SfDataGridThemeData(
                headerColor: gradientColorTwo.withOpacity(0.99),
                headerHoverColor: gradientColorTwo.withOpacity(0.8),
                rowHoverColor: gradientColorTwo.withOpacity(0.3),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: ColoredBox(
                  color: kWhite.withOpacity(0.04),
                  child: SfDataGrid(
                    source: _providerDataSource,
                    columnWidthMode: context.isMobile
                        ? ColumnWidthMode.auto
                        : ColumnWidthMode.fill,
                    columns: <GridColumn>[
                      _buildGridColumn('Name', 'name'),
                      _buildGridColumn('Model', 'model'),
                      _buildGridColumn('CPU', 'cpu'),
                      _buildGridColumn('Q-Score', 'qloudScore'),
                      _buildGridColumn('Memory', 'memory'),
                      _buildGridColumn('Disk', 'disk'),
                      _buildGridColumn('Audited', 'audited'),
                      _buildGridColumn('Location', 'location'),

                      // _buildGridColumn('Price', 'price'),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const Space.vertical(20),
          Divider(
            color: kWhite.withOpacity(0.2),
          ),
          const Space.vertical(10),
          _buildPagination(),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return context.isDesktop
        ? _buildDesktopSearchBar()
        : _buildMobileSearchBar();
  }

  Widget _buildMobileSearchBar() {
    return Container(
      decoration: BoxDecoration(
        color: kWhite.withOpacity(0.05),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      margin: const EdgeInsets.only(bottom: 25),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: context.width * 0.79,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Search',
                      style: context.normal!.copyWith(
                        color: kWhite,
                        fontSize: 16,
                      ),
                    ),
                    const Space.vertical(10),
                    TextField(
                      onChanged: _onSearch,
                      decoration: InputDecoration(
                        hintText: 'Search Providers',
                        hintStyle: const TextStyle(color: kWhite),
                        prefixIcon: const Icon(
                          Icons.search,
                          color: kWhite,
                        ),
                        border: GradientOutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          gradient: LinearGradient(
                            colors: [
                              kWhite.withOpacity(0.1),
                              gradientColorThree.withOpacity(0.1),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                      ),
                      style: const TextStyle(color: kWhite),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Space.vertical(20),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Rows',
                    style: context.normal!.copyWith(
                      color: kWhite,
                      fontSize: 16,
                    ),
                  ),
                  const Space.vertical(8),
                  Container(
                    height: 49,
                    width: context.width * 0.37,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    decoration: BoxDecoration(
                      color: kWhite.withOpacity(0.02),
                      borderRadius: BorderRadius.circular(8),
                      border: GradientBoxBorder(
                        gradient: LinearGradient(
                          colors: [
                            kWhite.withOpacity(0.1),
                            gradientColorThree.withOpacity(0.1),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                    child: DropdownButton<int>(
                      value: rowsPerPage,
                      isExpanded: true,
                      underline: const SizedBox(),
                      dropdownColor: kPurpleColor.withOpacity(0.7),
                      items: [10, 20, 30].map((value) {
                        return DropdownMenuItem<int>(
                          value: value,
                          child: Text(
                            '$value',
                            style: context.normal,
                          ),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          rowsPerPage = newValue!;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const Space.horizontal(20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sort by:',
                    style: context.normal!.copyWith(
                      color: kWhite,
                      fontSize: 16,
                    ),
                  ),
                  const Space.vertical(8),
                  Container(
                    height: 49,
                    width: context.width * 0.37,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    decoration: BoxDecoration(
                      color: kWhite.withOpacity(0.02),
                      borderRadius: BorderRadius.circular(8),
                      border: GradientBoxBorder(
                        gradient: LinearGradient(
                          colors: [
                            kWhite.withOpacity(0.1),
                            gradientColorThree.withOpacity(0.1),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                    child: DropdownButton<String>(
                      value: 'Active Lease',
                      isExpanded: true,
                      underline: const SizedBox(),
                      dropdownColor: kPurpleColor.withOpacity(0.7),
                      items: ['Active Lease', 'CPU Usage', 'Memory']
                          .map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: context.normal,
                          ),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        // Add sort logic here
                      },
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  Container _buildDesktopSearchBar() {
    return Container(
      decoration: BoxDecoration(
        color: kWhite.withOpacity(0.05),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      margin: const EdgeInsets.only(bottom: 25),
      child: Row(
        children: [
          SizedBox(
            width: context.width * 0.3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Search',
                  style: context.normal!.copyWith(
                    color: kWhite,
                    fontSize: 16,
                  ),
                ),
                const Space.vertical(10),
                TextField(
                  onChanged: _onSearch,
                  decoration: InputDecoration(
                    hintText: 'Search Providers',
                    hintStyle: const TextStyle(color: kWhite),
                    prefixIcon: const Icon(
                      Icons.search,
                      color: kWhite,
                    ),
                    border: GradientOutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      gradient: LinearGradient(
                        colors: [
                          kWhite.withOpacity(0.1),
                          gradientColorThree.withOpacity(0.1),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                  style: const TextStyle(color: kWhite),
                ),
              ],
            ),
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Rows',
                style: context.normal!.copyWith(
                  color: kWhite,
                  fontSize: 16,
                ),
              ),
              const Space.vertical(8),
              Container(
                height: 49,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                  color: kWhite.withOpacity(0.02),
                  borderRadius: BorderRadius.circular(8),
                  border: GradientBoxBorder(
                    gradient: LinearGradient(
                      colors: [
                        kWhite.withOpacity(0.1),
                        gradientColorThree.withOpacity(0.1),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
                child: DropdownButton<int>(
                  value: rowsPerPage,
                  underline: const SizedBox(),
                  dropdownColor: kWhite.withOpacity(0.4),
                  items: [10, 20, 30].map((value) {
                    return DropdownMenuItem<int>(
                      value: value,
                      child: Text(
                        '$value',
                        style: context.normal,
                      ),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      rowsPerPage = newValue!;
                    });
                  },
                ),
              ),
            ],
          ),
          const Space.horizontal(20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Sort by:',
                style: context.normal!.copyWith(
                  color: kWhite,
                  fontSize: 16,
                ),
              ),
              const Space.vertical(8),
              Container(
                height: 49,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                  color: kWhite.withOpacity(0.02),
                  borderRadius: BorderRadius.circular(8),
                  border: GradientBoxBorder(
                    gradient: LinearGradient(
                      colors: [
                        kWhite.withOpacity(0.1),
                        gradientColorThree.withOpacity(0.1),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
                child: DropdownButton<String>(
                  value: 'Active Lease',
                  underline: const SizedBox(),
                  dropdownColor: kWhite.withOpacity(0.4),
                  items: ['Active Lease', 'CPU Usage', 'Memory']
                      .map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: context.normal,
                      ),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    // Add sort logic here
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  GridColumn _buildGridColumn(String columnName, String fieldName) {
    return GridColumn(
      columnName: fieldName,
      width: context.isMobile ? context.width * 0.22 : double.nan,
      label: Container(
        padding: const EdgeInsets.all(8),
        alignment: Alignment.center,
        child: Text(
          columnName,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildPagination() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 104,
          height: 30,
          child: CustomGradientButton(
            title: 'Previous',
            addShadow: false,
            hideGlow: true,
            preFix: const Padding(
              padding: EdgeInsets.only(right: 7, left: 10),
              child: Icon(
                Icons.arrow_back_rounded,
                size: 14,
              ),
            ),
            onTap: () {
              setState(() {
                pageIndex = (pageIndex > 0) ? pageIndex - 1 : 0;
              });
            },
          ),
        ),
        // Row(
        //   children: List.generate(
        //     10,
        //     (index) => InkWell(
        //       onTap: () {
        //         setState(() {
        //           pageIndex = index;
        //         });
        //       },
        //       child: Container(
        //         margin: EdgeInsets.symmetric(horizontal: 4),
        //         padding: EdgeInsets.all(6),
        //         decoration: BoxDecoration(
        //           color: (index == pageIndex) ? Colors.blue : Colors.grey,
        //           shape: BoxShape.circle,
        //         ),
        //         child: Text('${index + 1}'),
        //       ),
        //     ),
        //   ),
        // ),
        SizedBox(
          width: 100,
          height: 30,
          child: CustomGradientButton(
            title: 'Next',
            addShadow: false,
            hideGlow: true,
            trailing: const Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Icon(
                Icons.arrow_forward_rounded,
                size: 14,
              ),
            ),
            onTap: () {
              setState(() {
                pageIndex = (pageIndex < 9) ? pageIndex + 1 : 9;
              });
            },
          ),
        ),
      ],
    );
  }
}

class ProviderModel {
  ProviderModel({
    required this.name,
    required this.location,
    required this.uptime,
    required this.cpu,
    required this.gpu,
    required this.memory,
    required this.disk,
    required this.audited,
    required this.price,
    required this.model, // Added field
    required this.online, // Added field
    required this.qloudscore, // Added field
  });

  final String name;
  final String location;
  final String uptime;
  final String cpu;
  final String gpu;
  final String memory;
  final String disk;
  final String audited;
  final String price;
  final String model; // Added
  final bool online; // Added
  final String qloudscore; // Added
}

class ProviderDataSource extends DataGridSource {
  ProviderDataSource({required List<ProviderModel> providerData}) {
    _providerData = providerData
        .map<DataGridRow>((data) => DataGridRow(cells: [
              DataGridCell<String>(columnName: 'name', value: data.name),
              DataGridCell<String>(columnName: 'model', value: data.model),
              DataGridCell<String>(columnName: 'cpu', value: data.cpu),
              DataGridCell<String>(
                  columnName: 'qloudScore', value: data.qloudscore),
              DataGridCell<String>(columnName: 'memory', value: data.memory),
              DataGridCell<String>(columnName: 'disk', value: data.disk),
              DataGridCell<String>(columnName: 'audited', value: data.audited),
              DataGridCell<String>(
                  columnName: 'location', value: data.location),
              // DataGridCell<String>(columnName: 'price', value: data.price),
            ]))
        .toList();
  }

  List<DataGridRow> _providerData = [];

  @override
  List<DataGridRow> get rows => _providerData;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    final index = _providerData.indexOf(row);

    // Alternating row colors
    Color backgroundColor;
    if (index % 2 == 0) {
      backgroundColor = Colors.white.withOpacity(0.04); // Even rows
    } else {
      backgroundColor = Colors.white.withOpacity(0.1); // Odd rows
    }

    return DataGridRowAdapter(
      color: backgroundColor, // Row background color
      cells: row.getCells().map<Widget>((cell) {
        if (cell.columnName == 'audited') {
          // Add an icon along with the text for the 'audited' column
          return Container(
            alignment: Alignment.center,
            // padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Space.horizontal(
                  navigatorKey.currentState!.context.width * 0.03,
                ),
                Image.asset(
                  cell.value == 'true'
                      ? 'assets/icons/png/secure_icon.png'
                      : 'assets/icons/png/warning_icon.png',
                  height: 16,
                  width: 16,
                ),
                const Space.horizontal(8),
                Text(
                  // cell.value.toString(),
                  cell.value == 'true' ? 'Online' : 'Offline',
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          );
        } else if (cell.columnName == 'disk') {
          return Container(
            alignment: Alignment.center,
            child: Row(
              // mainAxisSize: MainAxisSize.min,
              children: [
                Space.horizontal(
                  navigatorKey.currentState!.context.width * 0.02,
                ),
                SvgPicture.asset(
                  'assets/icons/svg/server.svg',
                  height: 16,
                  width: 16,
                ),
                const Space.horizontal(8),
                Text(
                  cell.value.toString(),
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          );
        } else if (cell.columnName == 'memory') {
          return Container(
            alignment: Alignment.center,
            child: Row(
              // mainAxisSize: MainAxisSize.min,
              children: [
                Space.horizontal(
                  navigatorKey.currentState!.context.width * 0.018,
                ),
                SvgPicture.asset(
                  'assets/icons/svg/server.svg',
                  height: 16,
                  width: 16,
                ),
                const Space.horizontal(8),
                Text(
                  cell.value.toString(),
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          );
        } else if (cell.columnName == 'qloudScore') {
          return Container(
            alignment: Alignment.center,
            child: Row(
              // mainAxisSize: MainAxisSize.min,
              children: [
                Space.horizontal(
                  navigatorKey.currentState!.context.width * 0.03,
                ),
                SvgPicture.asset(
                  'assets/icons/svg/gpu_icon.svg',
                  height: 16,
                  width: 16,
                ),
                const Space.horizontal(8),
                Text(
                  cell.value.toString(),
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          );
        } else if (cell.columnName == 'cpu') {
          return Container(
            alignment: Alignment.center,
            child: Row(
              // mainAxisSize: MainAxisSize.min,
              children: [
                Space.horizontal(
                  navigatorKey.currentState!.context.width * 0.03,
                ),
                SvgPicture.asset(
                  'assets/icons/svg/cpu_meter_icon.svg',
                  height: 16,
                  width: 16,
                ),
                const Space.horizontal(8),
                Text(
                  cell.value.toString(),
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          );
        } else {
          return Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8.0),
            child: Text(
              cell.value.toString(),
              style: const TextStyle(color: Colors.white), // Text color
            ),
          );
        }
      }).toList(),
    );
  }
}
