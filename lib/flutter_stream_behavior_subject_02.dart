import 'package:rxdart/rxdart.dart';

void main(List<String> args) async {
  demoBehaviorSubject();
}

void demoBehaviorSubject() {
  var subject = BehaviorSubject<int>();

  // listener lan 1
  subject.listen((value) {
    print(value);
  });

  subject.add(0);
  subject.add(1);
  subject.add(2);

  subject.add(100);

  // listener lan 2
  subject.listen((value) {
    print("SECOND >>>> $value");
  });

  subject.add(3);
  subject.add(4);

  // Các sự kiện vẫn tiếp tục chạy trong event loop, dẫn đến thứ tự output khác biệt
}

// BehaviorSubject là một loại StreamController đặc biệt trong thư viện RxDart. 
// BehaviorSubject giữ giá trị gần nhất (last emitted value).
// Khi một subscriber mới (listener) được đăng ký, nó ngay lập tức nhận giá trị gần nhất đã được phát trước đó.
// Khi thêm giá trị mới bằng subject.add(value), tất cả subscribers hiện tại sẽ nhận được giá trị đó.