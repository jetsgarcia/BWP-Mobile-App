import 'package:bwp/main.dart';
import 'package:flutter/material.dart';

class ResourcesScreen extends StatelessWidget {
  const ResourcesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: AppTopBar(title: "Resources"),
      ),
      drawer: const BurgerMenu(activeRoute: '/resources'),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Center(child: Text("How to plant a bamboo")),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                color: Colors.green,
                width: double.infinity,
                height: 350,
              ),
              const SizedBox(height: 20),
              const Text("Bamboo Applications"),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                      color: Colors.green,
                      height: 80,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                      color: Colors.green,
                      height: 80,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(0, 12, 0, 0),
                      color: Colors.green,
                      height: 80,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(0, 12, 0, 0),
                      color: Colors.green,
                      height: 80,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(0, 12, 0, 0),
                      color: Colors.green,
                      height: 80,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(0, 12, 0, 0),
                      color: Colors.green,
                      height: 80,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text("Ebooks"),
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 16, 0, 12),
                    color: Colors.green,
                    width: double.infinity,
                    height: 400,
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 0, 12),
                    color: Colors.green,
                    width: double.infinity,
                    height: 400,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
