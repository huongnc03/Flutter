import 'package:flutter/material.dart';

class CommonUIFixes extends StatefulWidget {
  const CommonUIFixes({super.key});
  @override
  State<CommonUIFixes> createState() => _CommonUIFixesState();
}

class _CommonUIFixesState extends State<CommonUIFixes> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bài 5: Sửa lỗi')),
      body: SingleChildScrollView( // Sửa lỗi tràn màn hình (Overflow)
        child: Column(
          children: [
            const Text('Lỗi 1: ListView trong Column cần bọc trong SizedBox'),
            SizedBox(
              height: 100,
              child: ListView(children: const [ListTile(title: Text('Item 1'))]),
            ),
            const Divider(),
            Text('Lỗi 2: Quên setState - Giá trị: $_count'),
            ElevatedButton(onPressed: () => setState(() => _count++), child: const Text('Tăng')),
          ],
        ),
      ),
    );
  }
}
