import 'package:bwp/main.dart';
import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'About',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      drawer: const BurgerMenu(activeRoute: '/about'),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 12),
                height: 200,
                width: double.infinity,
                color: Colors.green,
              ),
              const SizedBox(height: 20),
              const Header(text: "Who We Are"),
              const Text(
                "We are advocates of the bamboo and its beneficial contribution to the preservation of the environment as well as its diverse industrial uses.",
                style: TextStyle(
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                "We strive to bring together various organizations that share our passion and vision to propagate bamboo plantations (kawayan) in as many regions as possible in the Philippines.",
                style: TextStyle(
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 20),
              const Header(text: "Our Mission"),
              const Text(
                "Bamboo Warriors Philippines (BWP) is singularly dedicated to the propagation of the bamboo all over the Philippine archipelago.",
                style: TextStyle(
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                "Its Mission is to establish as many KAWAYAN ng BAYAN to reforest our denuded mountains, plant bamboos in areas prone to erosion and to help make the bamboo industry flourish and provide jobs to our countrymen!",
                style: TextStyle(
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 20),
              const Header(text: "Our Vision"),
              const Text(
                "BWP is a consolidator of bamboo-related activities with a focus on propagation to ensure a progressive, dynamic, sustainable, and inclusive bamboo reforestation, and endorse innovative bamboo by-products as a downstream to ensure livelihood potentials for Filipinos.",
                style: TextStyle(
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 20),
              const Header(text: "Our Emblem"),
              Row(
                children: [
                  Container(
                    height: 140,
                    width: 140,
                    margin: const EdgeInsets.only(right: 8),
                    color: Colors.green,
                  ),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "The stylized design image depicts the KAWAYANAN ng BAYAN. This represents the mission of BWP to establish as many KAWAYANAN ng BAYAN as possible in the Philippine archipelago.",
                          style: TextStyle(
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Divider(
                color: Colors.green,
                thickness: 2,
              ),
              Center(
                child: Container(
                  margin: const EdgeInsets.all(12),
                  child: Column(children: [
                    const Text(
                      "Follow us at:",
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 16,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.facebook),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.facebook),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.facebook),
                        ),
                      ],
                    ),
                  ]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  final String text;

  const Header({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: Text(
        text,
        style: const TextStyle(
            fontWeight: FontWeight.bold, fontSize: 18, color: Colors.green),
      ),
    );
  }
}
