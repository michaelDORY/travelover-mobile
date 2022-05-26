import 'package:flutter/material.dart';
import 'package:travelover_mobile/pages/menu_screen.dart';
import 'package:unicons/unicons.dart';

class MainSCreen extends StatelessWidget {
  const MainSCreen({Key? key}) : super(key: key);

  void _menuOpen(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => MenuScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () => _menuOpen(context),
              icon: const Icon(UniconsLine.bars))
        ],
        title: const Text('Исследовать мир'),
      ),
    );
  }
}
