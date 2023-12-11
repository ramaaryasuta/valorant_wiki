import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;

import 'widget/grid_view.dart';
import 'widget/text_field.dart';

class AgentScreens extends StatefulWidget {
  AgentScreens({super.key});

  @override
  State<AgentScreens> createState() => _AgentScreensState();
}

class _AgentScreensState extends State<AgentScreens> {
  final TextEditingController _searchController = TextEditingController();

  late List searchData;

  List searchAgent(String query) {
    query = query.toLowerCase();
    return searchData
        .where((agent) => agent['displayName'].toLowerCase().contain(query))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade900,
        elevation: 1,
        leading: Hero(
          tag: 'logo',
          child: SvgPicture.asset('assets/svg/Valorant.svg'),
        ),
        title: const Text('Valorant Wiki'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: _searchController,
                  onChanged: (value) {
                    setState(() {
                      searchAgent(value);
                    });
                  },
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    fillColor: Colors.blueGrey.shade900,
                    filled: true,
                    prefixIconColor: Colors.grey,
                    hintText: 'Search Agent...',
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.all(20),
                  ),
                ),
              ),
              listAgentBuilder()
            ],
          ),
        ),
      ),
    );
  }

  FutureBuilder<dynamic> listAgentBuilder() {
    return FutureBuilder(
      future: getAgentData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          searchData = snapshot.data as List;

          return GridAgentView(
            dataAgent: _searchController.value.text.isEmpty
                ? searchData
                : snapshot.data,
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
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
