import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'widget/grid_view.dart';

// ignore: must_be_immutable
class AgentScreens extends StatefulWidget {
  AgentScreens({super.key, required this.agentDataOriginal});

  List agentDataOriginal;

  @override
  State<AgentScreens> createState() => _AgentScreensState();
}

class _AgentScreensState extends State<AgentScreens> {
  late List agent = widget.agentDataOriginal;
  final TextEditingController _searchController = TextEditingController();

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
                      agent = searchAgent(value);
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
              GridAgentView(dataAgent: agent),
            ],
          ),
        ),
      ),
    );
  }

  // search function
  List searchAgent(String query) {
    if (query.isNotEmpty) {
      agent = widget.agentDataOriginal
          .where((element) => element['displayName']
              .toLowerCase()
              .contains(query.toLowerCase()))
          .toList();
      return agent;
    } else {
      agent = widget.agentDataOriginal;
      return agent;
    }
  }
}
