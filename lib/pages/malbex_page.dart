import 'package:api_food/API/malbex_api_provider.dart';
import 'package:flutter/material.dart';

class Malbec extends StatefulWidget {
  const Malbec({super.key});

  @override
  State<Malbec> createState() => _MalbecState();
}

class _MalbecState extends State<Malbec> {
  final _malbexApiProvider = MalbexApiProvider();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: _malbexApiProvider.fetchMalbex(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active ||
                snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else {
              var data = snapshot.data!;
              return Container(
                color: Colors.blueGrey.shade100,
                width: 300,
                height: 300,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(width: 100, child: Text(data.text)),
                    SizedBox(
                      width: 100,
                      height: 70,
                      child: ListView.builder(
                        itemCount: data.pairings.length,
                        itemBuilder: (context, index) {
                          String pairingData = data.pairings[index];
                          return ListTile(
                            title: Text(pairingData),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
