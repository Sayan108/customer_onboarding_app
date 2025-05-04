import 'package:flutter/material.dart';
import 'package:customer_onboarding_app/component/homePage.dart';

class ServiceDetailPage extends StatefulWidget {
  final String title;
  final String image;

  const ServiceDetailPage({required this.title, required this.image});

  @override
  State<ServiceDetailPage> createState() => _ServiceDetailPageState();
}

class _ServiceDetailPageState extends State<ServiceDetailPage> {
  final List<Map<String, dynamic>> plans = [
    {
      'type': 'Silver',
      'price': '\$199',
      'color': Colors.grey[300],
      'details': {
        'Developers': 1,
        'Team Members': 2,
        'Pages': 5,
        "Support": "IST",
      },
    },
    {
      'type': 'Gold',
      'price': '\$399',
      'color': Colors.amber[300],
      'details': {
        'Developers': 2,
        'Team Members': 4,
        'Pages': 10,
        "Support": "IST",
      },
    },
    {
      'type': 'Platinum',
      'price': '\$599',
      'color': Colors.blueGrey[200],
      'details': {
        'Developers': 3,
        'Team Members': 6,
        'Pages': 20,
        "Support": "24/7",
      },
    },
  ];

  List<bool> isExpanded = [false, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            ...plans.asMap().entries.map((entry) {
              int index = entry.key;
              var plan = entry.value;

              return Container(
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: plan['color'],
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 4,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                plan['type'],
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                plan['price'],
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            isExpanded[index]
                                ? Icons.keyboard_arrow_up
                                : Icons.keyboard_arrow_down,
                          ),
                          onPressed: () {
                            setState(() {
                              isExpanded[index] = !isExpanded[index];
                            });
                          },
                        ),
                      ],
                    ),
                    if (isExpanded[index]) ...[
                      Divider(thickness: 1),
                      ...plan['details'].entries.map<Widget>((detail) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(detail.key),
                              Text('${detail.value}'),
                            ],
                          ),
                        );
                      }),
                      SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => HomePage()),
                          );
                        },
                        child: Text('Buy Now'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
