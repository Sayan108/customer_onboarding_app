import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:customer_onboarding_app/component/projectDetailPage.dart';

class HomePage extends StatelessWidget {
  final List<Map<String, dynamic>> projects = [
    {
      'title': 'E-Commerce App',
      'type': 'Mobile App',
      'icon': Icons.phone_android,
      'startDate': '2024-01-10',
      'endDate': '2024-06-20',
      'progress': 0.75,
    },
    {
      'title': 'Marketing Website',
      'type': 'Web App',
      'icon': Icons.language,
      'startDate': '2024-02-01',
      'endDate': '2024-07-15',
      'progress': 0.5,
    },
    {
      'title': 'CRM Dashboard',
      'type': 'Dashboard',
      'icon': Icons.dashboard,
      'startDate': '2024-03-15',
      'endDate': '2024-09-30',
      'progress': 0.3,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Projects')),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
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
            child: Card(
              margin: EdgeInsets.only(bottom: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 4,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Row(
                  children: [
                    // Left Section
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                project['icon'],
                                size: 24,
                                color: Colors.blue,
                              ),
                              SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  project['title'],
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          Text("Type: ${project['type']}"),
                          Text("Start: ${project['startDate']}"),
                          Text("End: ${project['endDate']}"),
                        ],
                      ),
                    ),

                    // Right Section - Circular Progress
                    CircularPercentIndicator(
                      radius: 40.0,
                      lineWidth: 6.0,
                      percent: project['progress'],
                      center: Text('${(project['progress'] * 100).toInt()}%'),
                      progressColor: Colors.green,
                      backgroundColor: Colors.grey[200]!,
                      circularStrokeCap: CircularStrokeCap.round,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
