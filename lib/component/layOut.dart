import 'package:flutter/material.dart';

class CommonLayout extends StatelessWidget {
  final String title;
  final Widget child;
  final String? subHeader;

  const CommonLayout({
    super.key,
    required this.title,
    required this.child,
    this.subHeader,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(), // Handles Navigator.pop automatically
        title: Text(title),
        centerTitle: true,
        // backgroundColor: Colors.deepPurple,
        actions: [
          PopupMenuButton<String>(
            icon: const CircleAvatar(
              backgroundColor: Color.fromARGB(31, 0, 0, 0),
              child: Text('SD', style: TextStyle(color: Colors.white)),
            ),
            onSelected: (value) {
              // You can handle navigation here
              switch (value) {
                case 'profile':
                  // Navigator.push(context, ...);
                  break;
                case 'transaction':
                  // Navigator.push(context, ...);
                  break;
                case 'logout':
                  // Show confirmation / log out
                  break;
              }
            },
            itemBuilder:
                (context) => [
                  const PopupMenuItem(
                    value: 'profile',
                    child: ListTile(
                      leading: Icon(Icons.person),
                      title: Text('Profile'),
                    ),
                  ),
                  const PopupMenuItem(
                    value: 'transaction',
                    child: ListTile(
                      leading: Icon(Icons.receipt_long),
                      title: Text('Transaction'),
                    ),
                  ),
                  const PopupMenuItem(
                    value: 'logout',
                    child: ListTile(
                      leading: Icon(Icons.logout),
                      title: Text('Logout'),
                    ),
                  ),
                ],
          ),
        ],
      ),
      body: SafeArea(child: child),
    );
  }
}
