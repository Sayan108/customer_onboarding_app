import 'package:customer_onboarding_app/component/layOut.dart';
import 'package:flutter/material.dart';

class ProjectDetailPage extends StatelessWidget {
  final Map<String, dynamic> project;
  final bool paymentDue;

  const ProjectDetailPage({
    super.key,
    required this.project,
    this.paymentDue = true,
  });

  @override
  Widget build(BuildContext context) {
    return CommonLayout(
      title: project['title'] ?? 'Project Details',
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionTitle("Task List"),
              const SizedBox(height: 8),
              ..._buildTaskList(),
              const Divider(thickness: 1, height: 32),
              _buildSectionTitle("Change requests"),
              const SizedBox(height: 8),
              ..._buildChangeRequests(),
              const Divider(thickness: 1, height: 32),
              _buildSectionTitle("Documents"),
              const SizedBox(height: 8),
              _buildDocuments(),
              const Divider(thickness: 1, height: 32),
              _buildSectionTitle("Your team"),
              const SizedBox(height: 8),
              _buildTeamDetails(),
              const SizedBox(height: 32),
              if (paymentDue)
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 60,
                        vertical: 16,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      // Payment logic here
                    },
                    child: const Text(
                      "Pay \$1M",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    );
  }

  List<Widget> _buildTaskList() {
    final tasks = [
      {"title": "Admin panel login apis", "status": "on going"},
      {"title": "Admin panel Dashboard apis", "status": "completed"},
      {"title": "Admin panel Dashboard apis", "status": "Pending"},
      {"title": "Admin panel Dashboard apis", "status": "Pending"},
    ];
    return tasks.map((task) => _buildTaskItem(task)).toList();
  }

  List<Widget> _buildChangeRequests() {
    final requests = [
      {"title": "Admin panel login apis", "status": "on going"},
      {"title": "Admin panel Dashboard apis", "status": "completed"},
      {"title": "Admin panel Dashboard apis", "status": "Pending"},
    ];
    return requests.map((task) => _buildTaskItem(task)).toList();
  }

  Widget _buildTaskItem(Map<String, String> task) {
    final status = task["status"]!.toLowerCase();
    final color =
        {
          "on going": Colors.orange,
          "completed": Colors.green,
          "pending": Colors.red[300],
        }[status] ??
        Colors.grey;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: Text(task["title"] ?? '')),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: color.withOpacity(0.15),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              task["status"] ?? '',
              style: TextStyle(color: color, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDocuments() {
    final documents = ["Invoice", "NDA", "Requirement document", "Invoice"];

    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children:
          documents.map((doc) {
            return OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.insert_drive_file_outlined),
              label: Text(doc),
            );
          }).toList(),
    );
  }

  Widget _buildTeamDetails() {
    final team = [
      {"name": "Sakat Chattaraj", "role": "Team Lead"},
      {"name": "Jhon Doe", "role": "Developer"},
      {"name": "Jack Oliv", "role": "Developer"},
    ];

    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:
                team
                    .map(
                      (member) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Text(member['name']!),
                      ),
                    )
                    .toList(),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children:
                team
                    .map(
                      (member) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Text(
                          member['role']!,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                    .toList(),
          ),
        ),
      ],
    );
  }
}
