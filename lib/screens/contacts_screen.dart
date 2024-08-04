import 'package:flutter/material.dart';

import '../widgets/customappbar_widget.dart';
import '../widgets/customfloatingactionbutton_widget.dart';

class ContactsScreen extends StatelessWidget {
  const ContactsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> dummyContacts = List.generate(20, (index) => 'Person ${String.fromCharCode(65 + index)}');

    return Scaffold(
      appBar: const CustomAppBar(),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: [
          ListTile(
            leading: const Icon(Icons.person_add),
            title: const Text('Create new contact'),
            onTap: () {
              // Handle create new contact action
            },
          ),
          const Divider(),
          ...dummyContacts.map((contact) {
            return ListTile(
              leading: CircleAvatar(
                child: Text(contact[0]),
              ),
              title: Text(contact),
            );
          }),
        ],
      ),
      floatingActionButton: const CustomFloatingActionButton(),
    );
  }
}
