import 'package:flutter/material.dart';
import 'package:csv/csv.dart';

class RestaurantPage extends StatefulWidget {
  final Function(int) changeMainPageIndex;
  const RestaurantPage({Key? key, required this.changeMainPageIndex})
      : super(key: key);

  @override
  State<RestaurantPage> createState() => _RestaurantPageState();
}

class _RestaurantPageState extends State<RestaurantPage> {
  List<List<dynamic>>? csvData;
  List<String>? headers;

  @override
  void initState() {
    super.initState();
    loadCsvData();
  }

  Future<void> loadCsvData() async {
    var result = await DefaultAssetBundle.of(context).loadString(
      "assets/restaurants.csv",
    );
    csvData = const CsvToListConverter().convert(result, eol: "\n");
    if (csvData != null && csvData!.isNotEmpty) {
      headers = List<String>.from(csvData![0]);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 48, 56, 65),
        title: const Text(
          "Restaurants",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        leading: BackButton(
          onPressed: () {
            widget.changeMainPageIndex(0);
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(children: [
          Center(
            child: csvData != null
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            ...csvData!.skip(1).map(
                              (csvrow) => Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.grey.shade200,
                                      ),
                                      color: Colors.grey.shade200,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Container(
                                          child: Text(
                                            '${csvrow[0]}',
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 30,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        Container(
                                          child: Text(
                                            '${csvrow[1]}',
                                            style: const TextStyle(fontSize: 20),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        Container(
                                          child: Text(
                                            'Ubicación: ${csvrow[2]}',
                                            style: const TextStyle(fontSize: 20),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 5), // Add a 10-pixel gap
                                ],
                              ),
                            ),
                            const SizedBox(height: 18),
                          ],
                        ),
                      ),
                    ],
                  )
                : const SizedBox(),
          )
        ]),
      ),
    );
  }
}
