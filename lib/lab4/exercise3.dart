import 'package:flutter/material.dart';

class LayoutDemo extends StatelessWidget {
  const LayoutDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bài 3: Bố cục')),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(10),
            child: Text('Danh sách phim hot', style: TextStyle(fontSize: 18)),
          ),
          Expanded( // Dùng Expanded để ListView chiếm hết phần còn lại
            child: ListView(
              children: const [
                ListTile(title: Text('Phim 1'), leading: Icon(Icons.movie)),
                ListTile(title: Text('Phim 2'), leading: Icon(Icons.movie)),
                ListTile(title: Text('Phim 3'), leading: Icon(Icons.movie)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
