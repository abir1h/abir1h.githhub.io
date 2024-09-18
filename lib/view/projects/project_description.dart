import 'package:flutter/material.dart';

class ProjectDescriptionPage extends StatelessWidget {
  const ProjectDescriptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: LayoutBuilder(
            builder: (context, constraints) {
              // Check screen width
              bool isMobile = constraints.maxWidth < 600;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/images/lms_1.png',
                    height: isMobile ? 100 : 400,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Project Title',
                    style: TextStyle(
                      fontSize: isMobile ? 24 : 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'This is a brief description of the project...',
                    style: TextStyle(fontSize: isMobile ? 16 : 18),
                  ),
                  const SizedBox(height: 20),
                  Image.asset(
                    'assets/images/lms_2.png',
                    height: isMobile ? 150 : 300,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Here is some more information about the project...',
                    style: TextStyle(fontSize: isMobile ? 16 : 18),
                  ),
                  const SizedBox(height: 20),
                  Image.asset(
                    'assets/images/lms_3.png',
                    height: isMobile ? 150 : 300,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Conclusion or summary of the project...',
                    style: TextStyle(fontSize: isMobile ? 16 : 18),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
