import 'package:flutter/material.dart';
import '../constants.dart';
import 'package:dashboard_app/responsive_layout.dart';

int _selectedSection = 0;

class DrawerPage extends StatefulWidget {
  const DrawerPage({super.key});

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class ButtonsInfo {
  String title;
  IconData icon;

  ButtonsInfo({required this.title, required this.icon});
}

List<ButtonsInfo> _buttonNames = [
  ButtonsInfo(title: "Home", icon: Icons.home),
  ButtonsInfo(title: "Setting", icon: Icons.settings),
  ButtonsInfo(title: "Notifications", icon: Icons.notifications),
  ButtonsInfo(title: "Contacts", icon: Icons.contact_phone_rounded),
  ButtonsInfo(title: "Sales", icon: Icons.sell),
  ButtonsInfo(title: "Marketing", icon: Icons.mark_email_read),
  ButtonsInfo(title: "Security", icon: Icons.verified_user),
  ButtonsInfo(title: "Users", icon: Icons.supervised_user_circle_rounded),
];

class _DrawerPageState extends State<DrawerPage> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
      color: Constants.purpleDark,
      child: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(Constants.kPadding),
              child: Column(
                children: [
                  ListTile(
                    title: const Text("Admin Menu",
                        style: TextStyle(color: Colors.white)),
                    trailing: !ResponsiveLayout.isComputer(context)
                        ? IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(Icons.close, color: Colors.black),
                          )
                        : null,
                  ),
                  ...List.generate(
                      _buttonNames.length,
                      (index) => Column(
                            children: [
                              Container(
                                  decoration: index == _selectedSection
                                      ? BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          gradient: LinearGradient(colors: [
                                            Constants.red.withOpacity(0.9),
                                            Constants.orange.withOpacity(0.9)
                                          ]))
                                      : null,
                                  child: ListTile(
                                    title: Text(
                                      _buttonNames[index].title,
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    leading: Padding(
                                        padding: const EdgeInsets.all(
                                            Constants.kPadding),
                                        child: Icon(
                                          _buttonNames[index].icon,
                                          color: Colors.white,
                                        )),
                                    onTap: () {
                                      setState(() {
                                        _selectedSection = index;
                                      });
                                    },
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  )),
                              const Divider(
                                color: Colors.white,
                                thickness: 0.1,
                              ),
                            ],
                          ))
                ],
              ))),
    ));
  }
}
