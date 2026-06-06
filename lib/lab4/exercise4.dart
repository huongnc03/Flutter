import 'package:flutter/material.dart';

class AppStructureThemeDemo extends StatefulWidget {
  const AppStructureThemeDemo({super.key});
  @override
  State<AppStructureThemeDemo> createState() => _AppStructureThemeDemoState();
}

class _AppStructureThemeDemoState extends State<AppStructureThemeDemo> {
  bool _dark = false;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: _dark ? ThemeData.dark() : ThemeData.light(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Bài 4: Theme'),
          actions: [Switch(value: _dark, onChanged: (v) => setState(() => _dark = v))],
        ),
        body: const Center(child: Text('Bấm nút trên AppBar để đổi màu')),
        floatingActionButton: FloatingActionButton(onPressed: () {}, child: const Icon(Icons.add)),
      ),
    );
  }
}
