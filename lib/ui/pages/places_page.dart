import 'package:csv/csv.dart';
import 'package:flutter/material.dart';

class PlacesPage extends StatefulWidget {
  final Function(int) changeMainPageIndex;
  const PlacesPage({super.key, required this.changeMainPageIndex});
  @override
  State<PlacesPage> createState() => _PlacesPageState();
}

class _PlacesPageState extends State<PlacesPage> {
  List<List<dynamic>>? csvData;
  List<String>? headers;

  @override
  void initState() {
    super.initState();
    loadCsvData();
  }

  Future<void> loadCsvData() async {
    var result = await DefaultAssetBundle.of(context).loadString(
      "assets/places.csv",
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
          "Points of interest",
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
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            ...csvData!.skip(1).map(
                                  (csvrow) => Column(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                            color: Colors.grey.shade200,
                                          ),
                                          color: Colors.grey.shade400,
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Colors.black26,
                                              offset: Offset(0, 2),
                                              blurRadius: 4.0,
                                            ),
                                          ],
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            Text(
                                              '${csvrow[0]}',
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 30,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                            Text(
                                              '${csvrow[1]}',
                                              style:
                                                  const TextStyle(fontSize: 20),
                                              textAlign: TextAlign.center,
                                            ),
                                            Text(
                                              'Ubicación: ${csvrow[2]}',
                                              style:
                                                  const TextStyle(fontSize: 20),
                                              textAlign: TextAlign.center,
                                            ),
                                            Image.network((
                                                    '${csvrow[3]}'))
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                          height: 10), // Add a 10-pixel gap
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
