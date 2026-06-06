import 'package:flutter/material.dart';

class InputControlsDemo extends StatefulWidget {
  const InputControlsDemo({super.key});
  @override
  State<InputControlsDemo> createState() => _InputControlsDemoState();
}

class _InputControlsDemoState extends State<InputControlsDemo> {
  double _value = 50;
  bool _isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bài 2: Nhập liệu')),
      body: Column(
        children: [
          Text('Giá trị: ${_value.round()}'),
          Slider(value: _value, min: 0, max: 100, onChanged: (v) => setState(() => _value = v)),
          SwitchListTile(
            title: const Text('Bật/Tắt'),
            value: _isSwitched,
            onChanged: (v) => setState(() => _isSwitched = v),
          ),
          ElevatedButton(
            onPressed: () => showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(2000), lastDate: DateTime(2100)),
            child: const Text('Chọn ngày'),
          ),
        ],
      ),
    );
  }
}
