import 'package:flutter/material.dart';

// Import widgets
import 'package:bwp/screens/widgets/universal_widgets.dart';

class UserDonate extends StatelessWidget {
  const UserDonate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: AppTopBar(title: "Donate"),
      ),
      drawer: const BurgerMenu(activeRoute: '/support'),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(12),
          child: Column(children: [
            Container(
              margin: const EdgeInsets.fromLTRB(0, 16, 0, 0),
              width: double.infinity,
              height: 350,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 10,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/qr.png',
                    height: 250,
                  ),
                  const SizedBox(height: 12),
                  const Text("Scan the GCash QR code to donate",
                      style: TextStyle(color: Colors.green))
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text(
                "We extend our deepest gratitude to all our generous supporters. Your contributions are a testament to your dedication to our cause – promoting the sustainable use of bamboo for the benefit of our environment and communities."),
            const SizedBox(height: 8),
            const Text(
                "Together, as advocates, we are creating a greener, more sustainable future. Your support fuels our mission, and we are truly thankful for your invaluable contribution.")
          ]),
        ),
      ),
    );
  }
}
