import 'package:flutter/material.dart';
import 'package:dashboard_app/constants.dart';
import 'package:dashboard_app/responsive_layout.dart';

List<String> _buttonNames = ["Overview", "Revenue", "Sales", "Control"];
int _selectedButtonIndex = 0;

class AppBarWidget extends StatefulWidget {
  const AppBarWidget({super.key});

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Constants.purpleDark,
      child: Row(children: [
        if (ResponsiveLayout.isComputer(context))
          Container(
              margin: const EdgeInsets.all(Constants.kPadding),
              height: double.infinity,
              decoration: const BoxDecoration(boxShadow: [
                BoxShadow(
                    color: Colors.black45,
                    offset: Offset(0, 0),
                    spreadRadius: 1,
                    blurRadius: 10)
              ], shape: BoxShape.circle),
              child: CircleAvatar(
                  backgroundColor: Colors.pink,
                  radius: 30,
                  child: Image.asset(
                    "images/mapp.png",
                  )))
        else
          IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            iconSize: 30,
            color: Colors.white,
            icon: const Icon(
              Icons.menu,
            ),
          ),
        const SizedBox(width: Constants.kPadding),
        if (ResponsiveLayout.isComputer(context))
          ...List.generate(
              _buttonNames.length,
              (index) => TextButton(
                  onPressed: () {
                    setState(() {
                      _selectedButtonIndex = index;
                    });
                  },
                  child: Padding(
                      padding: const EdgeInsets.all(Constants.kPadding * 2),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        //  crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            _buttonNames[index],
                            style: TextStyle(
                              color: _selectedButtonIndex == index
                                  ? Colors.white
                                  : Colors.white70,
                            ),
                          ),
                          Container(
                            margin:
                                const EdgeInsets.all(Constants.kPadding / 2),
                            width: 60,
                            height: 2,
                            decoration: BoxDecoration(
                              gradient: _selectedButtonIndex == index
                                  ? const LinearGradient(
                                      colors: [Constants.red, Constants.orange])
                                  : null,
                            ),
                          )
                        ],
                      ))))
        else
          Padding(
              padding: const EdgeInsets.all(Constants.kPadding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    _buttonNames[_selectedButtonIndex],
                    style: const TextStyle(color: Colors.white),
                  ),
                  Container(
                    margin: const EdgeInsets.all(Constants.kPadding / 2),
                    width: 60,
                    height: 2,
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Constants.red, Constants.orange])),
                  )
                ],
              )),
        const Spacer(),
        IconButton(
            color: Colors.white,
            iconSize: 30,
            onPressed: () {},
            icon: const Icon(Icons.search)),
        Stack(children: [
          IconButton(
            onPressed: () {},
            iconSize: 30,
            color: Colors.white,
            icon: const Icon(Icons.notifications_none_outlined),
          ),
        ])
      ]),
    );
  }
}
