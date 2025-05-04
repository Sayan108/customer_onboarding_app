import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:customer_onboarding_app/component/projectDetailPage.dart';
import 'package:customer_onboarding_app/component/layOut.dart';

class HomePage extends StatelessWidget {
  final List<Map<String, dynamic>> projects = [
    {
      'title': 'E-Commerce App',
      'type': 'Custom Software Development',
      'icon': Icons.phone_android,
      'orderId': 'OD-12324567890',
      'endDate': '9th May , 2025',
      'progress': 0.75,
    },
    {
      'title': 'Marketing Website',
      'type': 'Website Development',
      'icon': Icons.language,
      'orderId': 'OD-12324567890',
      'endDate': '9th May , 2025',
      'progress': 0.5,
    },
    {
      'title': 'CRM Dashboard',
      'type': 'Marketing',
      'icon': Icons.dashboard,
      'orderId': 'OD-12324567890',
      'endDate': '9th May , 2025',
      'progress': 0.3,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return CommonLayout(
      title: 'Projects',
      child: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: projects.length,
        itemBuilder: (context, index) {
          final project = projects[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ProjectDetailPage(project: project),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Row(
                children: [
                  // Left Section
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(project['icon'], size: 24, color: Colors.blue),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                project['title'],
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(project['type']),
                        Text("Order ID: ${project['orderId']}"),
                        Text("Delivery Date: ${project['endDate']}"),
                        const Divider(color: Colors.grey, thickness: 1.5),
                      ],
                    ),
                  ),

                  // Right Section - Circular Progress
                  CircularPercentIndicator(
                    radius: 35,
                    lineWidth: 6.0,
                    percent: project['progress'],
                    center: Text(
                      '${(project['progress'] * 100).toInt()}%',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    progressColor: Colors.green,
                    backgroundColor: const Color.fromARGB(255, 216, 238, 190),
                    circularStrokeCap: CircularStrokeCap.round,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
