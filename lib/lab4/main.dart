import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Quản lý trạng thái ThemeMode toàn cục
  ThemeMode _themeMode = ThemeMode.light;

  void toggleTheme(bool isDark) {
    setState(() {
      _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lab 4 - Flutter UI Fundamentals',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
      ),
      themeMode: _themeMode,
      home: MainMenuScreen(toggleTheme: toggleTheme, currentThemeMode: _themeMode),
    );
  }
}

// ==========================================
// MÀN HÌNH MENU CHÍNH
// ==========================================
class MainMenuScreen extends StatelessWidget {
  final Function(bool) toggleTheme;
  final ThemeMode currentThemeMode;

  const MainMenuScreen({
    super.key, 
    required this.toggleTheme, 
    required this.currentThemeMode
  });

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> exercises = [
      {'title': 'Exercise 1 – Core Widgets Demo', 'screen': const CoreWidgetsDemo()},
      {'title': 'Exercise 2 – Input Controls Demo', 'screen': const InputControlsDemo()},
      {'title': 'Exercise 3 – Layout Demo', 'screen': const LayoutDemo()},
      {'title': 'Exercise 4 – App Structure & Theme', 'screen': AppStructureTheme(toggleTheme: toggleTheme, currentThemeMode: currentThemeMode)},
      {'title': 'Exercise 5 – Common UI Fixes', 'screen': const CommonUiFixes()},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lab 4 – Flutter UI'),
        elevation: 2,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.separated(
          itemCount: exercises.length,
          separatorBuilder: (context, index) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text(exercises[index]['title']),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => exercises[index]['screen']),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

// ==========================================
// EXERCISE 1 – CORE WIDGETS
// ==========================================
class CoreWidgetsDemo extends StatelessWidget {
  const CoreWidgetsDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Exercise 1')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text('Welcome to Flutter UI', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            const Icon(Icons.movie, size: 80, color: Colors.blue),
            const SizedBox(height: 20),
            Image.network('https://picsum.photos/400/200'),
            const SizedBox(height: 20),
            const Card(
              child: ListTile(
                leading: Icon(Icons.star),
                title: Text('Movie Item'),
                subtitle: Text('Sample ListTile inside a Card.'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ==========================================
// EXERCISE 2 – INPUT CONTROLS
// ==========================================
class InputControlsDemo extends StatefulWidget {
  const InputControlsDemo({super.key});
  @override
  State<InputControlsDemo> createState() => _InputControlsDemoState();
}

class _InputControlsDemoState extends State<InputControlsDemo> {
  double _val = 50.0;
  bool _active = false;
  String _genre = 'None';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Exercise 2')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Slider(value: _val, min: 0, max: 100, onChanged: (v) => setState(() => _val = v)),
            SwitchListTile(title: const Text('Active?'), value: _active, onChanged: (v) => setState(() => _active = v)),
            RadioListTile(title: const Text('Action'), value: 'Action', groupValue: _genre, onChanged: (v) => setState(() => _genre = v.toString())),
            RadioListTile(title: const Text('Comedy'), value: 'Comedy', groupValue: _genre, onChanged: (v) => setState(() => _genre = v.toString())),
            ElevatedButton(
              onPressed: () => showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(2000), lastDate: DateTime(2100)),
              child: const Text('Open Date Picker'),
            ),
          ],
        ),
      ),
    );
  }
}

// ==========================================
// EXERCISE 3 – LAYOUT
// ==========================================
class LayoutDemo extends StatelessWidget {
  const LayoutDemo({super.key});
  @override
  Widget build(BuildContext context) {
    final movies = ['Avatar', 'Inception', 'Interstellar', 'Joker'];
    return Scaffold(
      appBar: AppBar(title: const Text('Exercise 3')),
      body: Column(
        children: [
          const Padding(padding: EdgeInsets.all(20), child: Text('Now Playing', style: TextStyle(fontSize: 24))),
          Expanded(
            child: ListView.builder(
              itemCount: movies.length,
              itemBuilder: (context, index) => Card(
                child: ListTile(
                  leading: CircleAvatar(child: Text(movies[index][0])),
                  title: Text(movies[index]),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ==========================================
// EXERCISE 4 – THEME
// ==========================================
class AppStructureTheme extends StatelessWidget {
  final Function(bool) toggleTheme;
  final ThemeMode currentThemeMode;

  const AppStructureTheme({super.key, required this.toggleTheme, required this.currentThemeMode});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercise 4'),
        actions: [
          Switch(value: currentThemeMode == ThemeMode.dark, onChanged: (v) => toggleTheme(v)),
        ],
      ),
      body: const Center(child: Text('Theme Toggle Demo')),
      floatingActionButton: FloatingActionButton(onPressed: () {}, child: const Icon(Icons.add)),
    );
  }
}

// ==========================================
// EXERCISE 5 – FIXES
// ==========================================
class CommonUiFixes extends StatefulWidget {
  const CommonUiFixes({super.key});
  @override
  State<CommonUiFixes> createState() => _CommonUiFixesState();
}

class _CommonUiFixesState extends State<CommonUiFixes> {
  int _counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Exercise 5')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 3,
              itemBuilder: (c, i) => ListTile(title: Text('Movie $i')),
            ),
            Text('Counter: $_counter'),
            ElevatedButton(onPressed: () => setState(() => _counter++), child: const Text('Increment')),
          ],
        ),
      ),
    );
  }
}
