import 'package:flutter/material.dart';

class BlockInfoPage extends StatefulWidget {
  const BlockInfoPage({super.key, required this.arguments});

  final List<String> arguments;
  @override
  State<BlockInfoPage> createState() => _BlockInfoPageState();
}

class _BlockInfoPageState extends State<BlockInfoPage> {
  late String remoteId;
  late String remoteName;
  late String remoteDescription;
  late String remoteHowto;
  late String remoteImg;

  @override
  void initState() {
    super.initState();

    remoteId = widget.arguments[0];
    remoteName = widget.arguments[1];
    remoteDescription = widget.arguments[2];
    remoteHowto = widget.arguments[3];
    remoteImg = widget.arguments[4];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(remoteName),
          centerTitle: true,
        ),
        body: Center(
          child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(image: NetworkImage(remoteImg)),
                  Text(remoteDescription, style: const TextStyle(fontSize: 18)),
                  const Text("¿Comó llegar?", style: TextStyle(fontSize: 30)),
                  Text(remoteHowto,
                      style: const TextStyle(fontSize: 20),
                      textAlign: TextAlign.center)
                ],
              )),
        ));
  }
}
