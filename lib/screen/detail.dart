import 'package:flutter/material.dart';

class DetailAgentScreen extends StatelessWidget {
  const DetailAgentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List detailChar = ModalRoute.of(context)!.settings.arguments as List;
    return Scaffold(
      appBar: AppBar(
        title: Text(detailChar[0]['name']),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 400,
              child: Stack(
                children: [
                  Opacity(
                    opacity: 0.4,
                    child: Image.network(
                      detailChar[0]['bgData'],
                    ),
                  ),
                  Image.network(
                    detailChar[0]['fullPotrait'],
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 40,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.white, width: 1),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Role ',
                    style: TextStyle(color: Colors.red, fontSize: 16),
                  ),
                  Text(
                    detailChar[0]['role'],
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.white, width: 1),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Description: ',
                    style: TextStyle(color: Colors.red, fontSize: 16),
                  ),
                  Text(
                    detailChar[0]['description'],
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 4,
                itemBuilder: (context, index) {
                  var indexs = index + 1;
                  return Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.white, width: 1),
                      ),
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Abilities $indexs : ',
                          style:
                              const TextStyle(color: Colors.red, fontSize: 16),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Image.network(
                            detailChar[0]['abilities'][index]['displayIcon'],
                            scale: 4,
                          ),
                        ),
                        Text(
                          detailChar[0]['abilities'][index]['displayName'],
                          style: const TextStyle(fontSize: 16),
                        ),
                        Text(
                          detailChar[0]['abilities'][index]['description'],
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
