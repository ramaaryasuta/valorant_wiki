import 'package:flutter/material.dart';

class GridAgentView extends StatelessWidget {
  const GridAgentView({
    super.key,
    required this.dataAgent,
  });

  final List<dynamic> dataAgent;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 3 / 3,
      ),
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemCount: dataAgent.length,
      itemBuilder: (context, index) {
        return CardAgent(
          displayIcon: dataAgent[index]['displayIcon'],
          name: dataAgent[index]['displayName'],
          bgData: dataAgent[index]['background'],
          fullPotrait: dataAgent[index]['fullPortrait'],
          description: dataAgent[index]['description'],
          role: dataAgent[index]['role']['displayName'],
          abilities: dataAgent[index]['abilities'],
        );
      },
    );
  }
}

class CardAgent extends StatelessWidget {
  const CardAgent({
    super.key,
    required this.bgData,
    required this.displayIcon,
    required this.name,
    required this.fullPotrait,
    required this.description,
    required this.role,
    required this.abilities,
  });

  final String displayIcon;
  final String name;

  // for detail screen
  final String bgData;
  final String fullPotrait;
  final String description;
  final String role;
  final List abilities;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/detail-agent',
          arguments: [
            {
              'name': name,
              'bgData': bgData,
              'fullPotrait': fullPotrait,
              'description': description,
              'role': role,
              'abilities': abilities,
            },
          ],
        );
      },
      child: Card(
        child: Column(
          children: [
            Expanded(
              child: Image.network(displayIcon),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.redAccent,
                border: Border(
                  top: BorderSide(
                    color: Colors.grey.shade800,
                    width: 5,
                  ),
                ),
              ),
              child: Row(
                children: [
                  Text(
                    name.toUpperCase(),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
