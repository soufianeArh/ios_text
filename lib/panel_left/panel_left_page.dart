import 'package:flutter/material.dart';

class PanelLeftPage extends StatefulWidget {
  const PanelLeftPage({super.key});

  @override
  State<PanelLeftPage> createState() => _PanelLeftPageState();
}

class _PanelLeftPageState extends State<PanelLeftPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
      ),
    );
  }
}