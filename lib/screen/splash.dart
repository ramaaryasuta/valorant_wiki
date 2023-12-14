import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'agent.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getAgentData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Hero(
                tag: 'logo',
                child: SvgPicture.asset('assets/svg/Valorant.svg'),
              ),
            );
          } else if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  SvgPicture.asset('assets/svg/Valorant.svg'),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AgentScreens(
                                  agentDataOriginal: snapshot.data as List,
                                )),
                        (route) => false,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    child: const Text('Ready To Go'),
                  ),
                  const Spacer(),
                  const Text('Create by: Rama Arya')
                ],
              ),
            );
          } else {
            return const Center(
              child: Text('Error Server'),
            );
          }
        },
      ),
    );
  }

  Future getAgentData() async {
    final url = Uri.parse('https://valorant-api.com/v1/agents');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      var data = json.decode(response.body)['data'] as List;
      // from APi recommend use filterplayable Char
      var finalData = data
          .where((element) => element['isPlayableCharacter'] == true)
          .toList();
      return finalData;
    } else {
      return 'Error';
    }
  }
}
