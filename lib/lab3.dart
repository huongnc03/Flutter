import 'dart:async';
import 'dart:convert';

// Exercise 1: Product Model & Repository
class Product {
  final String id;
  final String name;
  final double price;
  Product({required this.id, required this.name, required this.price});
  @override
  String toString() => 'Product(id: $id, name: $name, price: \$$price)';
}

class ProductRepository {
  final StreamController<Product> _productStreamController = StreamController<Product>.broadcast();
  final List<Product> _database = [
    Product(id: 'P01', name: 'Laptop Dell', price: 1200.0),
    Product(id: 'P02', name: 'iPhone 15', price: 999.0),
  ];

  Future<List<Product>> getAll() async {
    await Future.delayed(Duration(seconds: 1));
    return List.from(_database);
  }
  Stream<Product> liveAdded() => _productStreamController.stream;
  void addProduct(Product product) {
    _database.add(product);
    _productStreamController.add(product);
  }
  void dispose() => _productStreamController.close();
}

// Exercise 2: User Repository with JSON
class User {
  final String name;
  final String email;
  User({required this.name, required this.email});
  factory User.fromJson(Map<String, dynamic> json) {
    return User(name: json['name'] as String, email: json['email'] as String);
  }
}

class UserRepository {
  final String _rawJsonResponse = '[{"name": "Nguyen Van A", "email": "a@gmail.com"}, {"name": "Tran Thi B", "email": "b@yahoo.com"}]';
  Future<List<User>> fetchUsers() async {
    await Future.delayed(Duration(milliseconds: 800)); 
    final List<dynamic> decodedData = jsonDecode(_rawJsonResponse);
    return decodedData.map((item) => User.fromJson(item as Map<String, dynamic>)).toList();
  }
}

// Exercise 5: Factory Constructors & Cache
class Settings {
  final String theme;
  final bool notificationsEnabled;
  static Settings? _instance;
  Settings._internal({required this.theme, required this.notificationsEnabled});
  factory Settings() {
    _instance ??= Settings._internal(theme: 'Dark Mode', notificationsEnabled: true);
    return _instance!;
  }
}

void main() async {
  // Exercise 1
  print('--- EXERCISE 1: Product Model & Repository ---');
  final repo = ProductRepository();
  repo.liveAdded().listen((newProduct) => print('[Stream Live] Sản phẩm mới: $newProduct'));
  print('Danh sách sản phẩm ban đầu');
  final initialProducts = await repo.getAll();
  print('Danh sách hiện tại từ Future: $initialProducts');
  await Future.delayed(Duration(seconds: 1));
  repo.addProduct(Product(id: 'P03', name: 'Sony Headphone', price: 250.0));
  await Future.delayed(Duration(milliseconds: 100));
  repo.dispose();

  // Exercise 2
  print('\n--- EXERCISE 2: User Repository with JSON ---');
  final userRepo = UserRepository();
  final users = await userRepo.fetchUsers();
  for (var user in users) {
    print('- ${user.name} (${user.email})');
  }

  // Exercise 3
  print('\n--- EXERCISE 3: Async + Microtask Debugging ---');
  print('1. Main Start'); 
  Future(() => print('4. Future (Event Queue Callback)'));
  scheduleMicrotask(() => print('3. Microtask Callback'));
  print('2. Main End'); 

  // Exercise 4
  print('\n--- EXERCISE 4: Stream Transformation ---');
  final Stream<int> numberStream = Stream.fromIterable([1, 2, 3, 4, 5]);
  await numberStream
      .map((number) => number * number) 
      .where((squaredNumber) => squaredNumber % 2 == 0) 
      .forEach((finalValue) => print('Stream số chẵn sau bình phương: $finalValue'));

  // Exercise 5
  print('\n--- EXERCISE 5: Factory Constructors & Cache ---');
  final settingsA = Settings();
  final settingsB = Settings();
  print('Kiểm tra toán tử identical(settingsA, settingsB): ${identical(settingsA, settingsB)}');
}