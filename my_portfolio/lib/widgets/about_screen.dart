import 'package:flutter/material.dart';
import 'dart:ui'; // for ImageFilter.blur
import 'dart:js' as js;
import 'package:my_portfolio/constants/sns_links.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  // Function to close the AboutScreen when tapping anywhere on the screen
  void _closeCard(BuildContext context) {
    Navigator.of(context).pop(); // Close the AboutScreen dialog
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _closeCard(context), // Close when tapping anywhere on the screen
      child: Scaffold(
        backgroundColor: Colors.transparent, // Make background transparent
        body: Stack(
          children: [
            // Blurred background overlay
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                child: Container(
                  color: Colors.transparent, // Keep this transparent
                ),
              ),
            ),

            // Card content in the center of the screen
            Center(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 35),
                padding: const EdgeInsets.all(34),
                decoration: BoxDecoration(
                  color: const Color(0xff333646), // Solid color for the card
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage('assets/profile.jpg'),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      "Aqsa Bashir",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      constraints: const BoxConstraints(maxWidth: 300),
                      child: const Text(
                        '''Bachelor's in Computer Science. Flutter Mobile Application Developer with 1 year of experience. Proficient in Dart and core Flutter concepts e.g. Firebase, APIs, Database, State Management, UI design etc. Built beautiful and performant crossplatform UIs. Delivered successful mobile apps e.g. Wallpaper App, School Management App etc.''',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 13.5,
                          color: Colors.white70,
                          height: 1.4,
                          letterSpacing: 0.3,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Divider(color: Colors.white24),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: const ImageIcon(
                            AssetImage('assets/github.png'),
                            color: Colors.white,
                            size: 28.0,
                          ),
                          onPressed: () {
                            js.context.callMethod('open', [SnsLinks.github]);
                          },
                        ),
                        IconButton(
                          icon: const ImageIcon(
                            AssetImage('assets/facebook.png'),
                            color: Colors.white,
                            size: 28.0,
                          ),
                          onPressed: () {
                            js.context.callMethod('open', [SnsLinks.facebook]);
                          },
                        ),
                        IconButton(
                          icon: const ImageIcon(
                            AssetImage('assets/linkedin.png'),
                            color: Colors.white,
                            size: 28.0,
                          ),
                          onPressed: () {
                            js.context.callMethod('open', [SnsLinks.linkedIn]);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
