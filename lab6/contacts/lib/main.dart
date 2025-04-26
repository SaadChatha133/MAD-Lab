import 'package:flutter/material.dart';

void main() {
  runApp(ContactListApp());
}

class ContactListApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contact List',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        fontFamily: 'Roboto',
      ),
      home: ContactListPage(),
    );
  }
}

class Contact {
  final String name;
  final String phone;

  Contact({required this.name, required this.phone});
}

class ContactListPage extends StatelessWidget {
  final List<Contact> contacts = [
    Contact(name: 'Alice Johnson', phone: '123-456-7890'),
    Contact(name: 'Bob Smith', phone: '987-654-3210'),
    Contact(name: 'Charlie Brown', phone: '456-789-1230'),
    Contact(name: 'Diana Prince', phone: '321-654-9870'),
    Contact(name: 'Edward Cullen', phone: '654-321-0987'),
    Contact(name: 'Fiona Gallagher', phone: '789-123-4560'),
    Contact(name: 'George Michael', phone: '147-258-3690'),
  ];

  final List<IconData> icons = [
    Icons.person,
    Icons.face,
    Icons.person_outline,
    Icons.account_circle,
    Icons.emoji_people,
    Icons.tag_faces,
    Icons.sentiment_satisfied,
  ];

  IconData getRandomIcon(int index) {
    return icons[index % icons.length];
  }

  Color getRandomColor(int index) {
    final colors = [
      Colors.teal,
      Colors.indigo,
      Colors.purple,
      Colors.deepOrange,
      Colors.blueGrey,
      Colors.green,
      Colors.cyan,
    ];
    return colors[index % colors.length];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        elevation: 5,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.teal.shade100, Colors.teal.shade50],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView.builder(
          itemCount: contacts.length,
          padding: EdgeInsets.all(8),
          itemBuilder: (context, index) {
            final contact = contacts[index];
            return Card(
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
              elevation: 6,
              shadowColor: Colors.tealAccent,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                leading: CircleAvatar(
                  backgroundColor: getRandomColor(index),
                  child: Icon(
                    getRandomIcon(index),
                    color: Colors.white,
                  ),
                ),
                title: Text(
                  contact.name,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                subtitle: Text(
                  contact.phone,
                  style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
                ),
                trailing: Icon(Icons.phone, color: Colors.teal),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Calling ${contact.name}...'),
                      backgroundColor: Colors.teal,
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
