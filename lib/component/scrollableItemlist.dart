import 'package:flutter/material.dart';
import 'package:customer_onboarding_app/component/serviceDetailsPage.dart';
import 'package:customer_onboarding_app/component/layOut.dart';

class ScrollableItemListPage extends StatelessWidget {
  final List<Map<String, String>> items = [
    {
      'title': 'Website Development',
      'image': 'assets/images/websiteDevelopment.png',
    },
    {
      'title': 'Custom Software Development',
      'image': 'assets/images/customSoftwareDevelopment.png',
    },
    {'title': 'Digital Marketing', 'image': 'assets/images/marketing.png'},
    {
      'title': 'Business Automation',
      'image': 'assets/images/businessAutomation.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return CommonLayout(
      title: 'Customer Onboarding',
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Sub-header
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Text(
                'Explore Our Services',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),

            // Clickable Items List
            ...items.map((item) {
              return Center(
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (_) => ServiceDetailPage(
                              title: item['title']!,
                              image: item['image']!,
                            ),
                      ),
                    );
                  },
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    margin: const EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.grey[200],
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          blurRadius: 5,
                          offset: Offset(2, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(12),
                          ),
                          child: Image.asset(
                            item['image']!,
                            height: 140,
                            width: 140,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            item['title']!,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
