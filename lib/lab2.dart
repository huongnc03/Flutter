import 'dart:async'; 

class Car {
  String brand;
  Car(this.brand);
  Car.luxury() : brand = "Rolls-Royce";

  void drive() {
    print("Xe $brand dang chay bang dong co xang.");
  }
}

class ElectricCar extends Car {
  ElectricCar(String brand) : super(brand);

  @override
  void drive() {
    print("Xe dien $brand dang chay bang pin.");
  }
}

// EX5: Hàm giả lập tải dữ liệu bất đồng bộ
Future<String> fetchData() async {
  print("\n[EX5] Dang tai du lieu tu server (vui long cho 2 giay)...");
  await Future.delayed(Duration(seconds: 2));
  return "Du lieu da tai xong thanh cong!";
}

// EX5: Hàm tạo Stream số nguyên
Stream<int> countStream(int max) async* {
  for (int i = 1; i <= max; i++) {
    await Future.delayed(Duration(milliseconds: 500)); 
    yield i;
  }
}

void main() async {
  int a = 6;
  double b = 9.4;
  String c = "Nguyen chi huong";
  bool d = true;
  List<int> num = [1, 2, 3, 4, 5];

  int sum = num[0] + num[1];
  int diff = num[0] - num[1];
  int multi = num[0] * num[1];
  double divi = num[0] / num[1];
  print("EX1:\n a= $a b= $b c= $c d= $d");

  bool isEqual = (num[3] == 4);
  bool checkAnd = (sum > 30 && diff < 20);
  bool checkOr = (sum > 2 || diff < 1);
  print(
    "EX2:\n sum= $sum diff= $diff multi= $multi divi= $divi,\n equal =$isEqual checkAnd = $checkAnd checkOr = $checkOr",
  );

  Set<int> age = {1, 2, 3, 3, 3};
  age.add(5);
  age.remove(1);
  print("Set age: $age");

  print("\nEX3:");
  if (a >= 5) {
    print("diem so tren trung binh");
  } else {
    print("diem so duoi trung binh");
  }

  String thu = "3";
  switch (thu) {
    case "2": print("nay la thu 2"); break;
    case "3": print("nay la thu 3"); break;
    case "4": print("nay la thu 4"); break;
    case "5": print("nay la thu 5"); break;
    case "6": print("nay la thu 6"); break;
    case "7": print("nay la thu 7"); break;
    case "chu nhat": print("nay la chu nhat"); break;
    default: print("khong hop le"); break;
  }

  print("\n Vong lap for");
  for (int i = 0; i < num.length; i++) {
    print("Phan tu thu $i la: ${num[i]}");
  }

  print("\n Vong lap for-in");
  for (var n in num) {
    print("Gia tri: $n");
  }

  print("\n Vong lap forEach()");
  num.forEach((n) => print("Gia tri tu forEach: $n"));

  print("\n Goi ham kiem tra (Functions)");

  double tinhBinhPhuong(double so) {
    return so * so;
  }

  void chaoXinChao(String ten) => print("Xin chao, $ten!");

  double ketQuaBinhPhuong = tinhBinhPhuong(4);
  print("Binh phuong cua 4 la: $ketQuaBinhPhuong");

  chaoXinChao("Huong");

  print("\nEX4:");

  Car myNormalCar = Car("Toyota");
  myNormalCar.drive();

  Car myLuxuryCar = Car.luxury();
  print("Xe sang vua mua thuoc hang: ${myLuxuryCar.brand}");
  myLuxuryCar.drive();

  print("------------------------------------------------");

  ElectricCar myTesla = ElectricCar("Tesla Model Y");
  myTesla.drive();

  // ===============================================================
  // EX5: Bất đồng bộ, Null Safety & Stream
  // ===============================================================
  print("\nEX5: Async, Future, Null Safety & Streams");

  // EX5.1 & EX5.2: Future + await + Future.delayed()
  String dataResult = await fetchData();
  print("Ket qua cho nhan duoc: $dataResult");

  // EX5.3: Toán tử Null-Safety (?, ??, !)
  print("\n Thuc hanh Null-Safety:");
  String? tenKhachHang; 
  print("Ten khoi tao: $tenKhachHang");

  String tenHienThi = tenKhachHang ?? "Khach hang an danh";
  print("Ten hien thi: $tenHienThi");

  tenKhachHang = "Nguyen Chi Huong";
  String tenChacChan = tenKhachHang!; 
  print("Ten sau khi dung !: $tenChacChan");

  // EX5.4: Lắng nghe Stream
  print("\n Lang nghe dong du lieu tu Stream:");
  Stream<int> myStream = countStream(5);

  myStream.listen(
    (value) {
      print("Stream cap nhat so: $value");
    },
    onDone: () {
      print("=> Stream hoan thanh truyen du lieu.");
    },
  );
}