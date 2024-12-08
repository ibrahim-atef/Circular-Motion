
import 'package:circular_motion/circular_motion.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [

          Positioned(
            top: -MediaQuery.of(context).size.height * 0.7,
            left: -MediaQuery.of(context).size.height * 0.27,
            child: Container(
              height: MediaQuery.of(context).size.height * .98,
              width: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                color: Colors.deepOrange,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(400),
                ),
              ),
              alignment: Alignment.topCenter,
            ),
          ),
          Positioned(
            top: -MediaQuery.of(context).size.height * 0.65,
            left: -MediaQuery.of(context).size.height * 0.27,
            child: Container(
              height: MediaQuery.of(context).size.height * .98,
              width: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(400),
                ),
              ),
              child: CircularMotion(
                speedRunEnabled: false,
                behavior: HitTestBehavior.translucent,
                centerWidget: SizedBox.shrink(),
                children: List.generate(
                  12,
                  (index) {
                    return Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(
                                  0, 3),
                            ),
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          radius: 25,
                          backgroundImage: AssetImage(
                              'assets/w.jpeg'),
                        ),
                      ),
                    );
                  },
                ),
              ),
              alignment: Alignment.topCenter,
            ),
          ),


          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header with avatar and notifications
                Padding(
                  padding:
                      const EdgeInsets.only(top: 40.0, left: 20.0, right: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage(
                            'assets/s (2).png'),
                      ),
                      const Text(
                        'Mustafa Ahmed',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          _buildIconButton(Icons.notifications),
                          const SizedBox(width: 7),
                          _buildIconButton(Icons.shopping_cart),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),
                // Category title
                const Center(
                  child: Text(
                    'Brake parts',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                // CircularMotion widget

                SizedBox(height: MediaQuery.of(context).size.height * 0.2),

                // Section title and view all

                // Horizontal product cards

                const SizedBox(height: 20),

                // Most popular section
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Helper to build a circular button
  Widget _buildIconButton(IconData icon) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: Icon(icon, color: Colors.black, size: 22),
        onPressed: () {},
      ),
    );
  }


}
