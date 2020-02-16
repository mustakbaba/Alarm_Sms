import 'package:alarm_sms/SetAlarmPage.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';
import 'SendSms.dart';

class AccessContacts extends StatefulWidget {
  String phone = 'see';
  String isim = 's';
  AccessContacts({this.phone});
  static const String id = 'first_page';
  @override
  _AccessContactsState createState() => _AccessContactsState();
}

class _AccessContactsState extends State<AccessContacts> {
  Iterable<Contact> _contacts;
  // Iterable<Item> phones = [];

  @override
  void initState() {
    getContacts();
    super.initState();
  }

  getContacts() async {
    PermissionStatus permissionStatus = await _getPermission();
    if (permissionStatus == PermissionStatus.granted) {
      var contacts = await ContactsService.getContacts();
      setState(() {
        _contacts = contacts;
      });
    } else {
      throw PlatformException(
        code: 'PERMISSION_DENIED',
        message: 'Access to location data denied',
        details: null,
      );
    }
  }

  Future<PermissionStatus> _getPermission() async {
    PermissionStatus permission = await PermissionHandler()
        .checkPermissionStatus(PermissionGroup.contacts);
    if (permission != PermissionStatus.granted &&
        permission != PermissionStatus.disabled) {
      Map<PermissionGroup, PermissionStatus> permisionStatus =
          await PermissionHandler()
              .requestPermissions([PermissionGroup.contacts]);
      return permisionStatus[PermissionGroup.contacts] ??
          PermissionStatus.unknown;
    } else {
      return permission;
    }
  }

  @override
  Widget build(BuildContext context) {
    AccessContacts s = new AccessContacts();

    return Scaffold(
      appBar: AppBar(title: Text('Alarm Sms ')),
      body: _contacts != null
          ? ListView.builder(
              itemCount: _contacts?.length ?? 0,
              itemBuilder: (context, index) {
                Contact c = _contacts?.elementAt(index);
                return ListTile(
                  leading: (c.avatar != null && c.avatar.length > 0)
                      ? CircleAvatar(
                          backgroundImage: MemoryImage(c.avatar),
                        )
                      : CircleAvatar(child: Text(c.initials())),
                  title: Text(c.displayName ?? ''),
                  trailing: IconButton(
                    icon: Icon(Icons.message),
                    onPressed: () {
                      s.phone = c.phones.first.value;
                      s.isim = c.displayName;
                      AccessContacts().phone = c.phones.first.value;
                      Navigator.pushNamed(context, SetAlarmPage.id);
                      name = s.isim;
                      telno = s.phone;
                      print(telno);
                    },
                  ),
                );
              },
            )
          : CircularProgressIndicator(),
    );
  }
}
