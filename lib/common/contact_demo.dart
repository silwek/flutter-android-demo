import 'package:flutter/material.dart';
import 'package:flutter_contact/contacts.dart';
import 'package:permission_handler/permission_handler.dart';

class ContactDemoScreen extends StatefulWidget {
  @override
  _ContactDemoScreenState createState() => _ContactDemoScreenState();
}

class _ContactDemoScreenState extends State<ContactDemoScreen> {
  var contactCount = -1;
  bool _hasPermission = false;
  bool _loading = true;
  Contact newContact = Contact(
      displayName: "Demo Flutter contact 3",
      familyName: "Demo flutter",
      givenName: "Contact 3",
      phones: [Item(label: 'mobile', value: '0123456789')]);

  @override
  void initState() {
    super.initState();
    onStart();
  }

  Future onStart() async {
    await checkPermission();
    loadContacts();
  }

  Future checkPermission() async {
    if (await Permission.contacts.request().isGranted) {
      // Either the permission was already granted before or the user just granted it.
      _hasPermission = true;
    } else {
      _hasPermission = false;
    }
  }

  Future loadContacts() async {
    if (_hasPermission) {
      setState(() {
        _loading = true;
      });
      final contacts = Contacts.listContacts();
      final total = await contacts.length;
      setState(() {
        _loading = false;
        contactCount = total;
      });
    }
  }

  Future addContact() async {
    if (_hasPermission) {
      await Contacts.openContactInsertForm(newContact);
      loadContacts();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Demo Example'),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
        children: [
          contactCount > -1
              ? Text("You've got $contactCount contact(s)")
              : Text(""),
          if (_loading) CircularProgressIndicator(),
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: addContact,
        tooltip: 'Add Contact',
        child: Icon(Icons.add),
      ),
    );
  }
}
