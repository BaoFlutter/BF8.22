
import 'package:rxdart/rxdart.dart';
void main(List<String> arguments) {

//demoBehaviourSubject();
//demoPublishSubject();
demoReplaySubject();

}
// Lấy ra tất cả các dữ liệu thêm vào sau lần đặt lắng nghe và dữ liệu trong lần thêm gần nhất trước đó 

demoBehaviourSubject(){

 BehaviorSubject subject = BehaviorSubject<int>(); // tạo ra subject : có stream , có các phương thức đẩy dữ liệu  và xuất dl 
subject.listen((number) { 
   print("Lấy dữ liệu lần 1: $number");
});

subject.add(100);
subject.add(101);

subject.listen((number) { 
   print("Lấy dữ liệu lần 2: $number");
});

subject.add(200);
subject.add(201);


}

// Chỉ Lấy ra tất cả các dữ liệu thêm vào sau lần đặt lắng nghe

demoPublishSubject(){

 PublishSubject subject = PublishSubject<int>(); // tạo ra subject : có stream , có các phương thức đẩy dữ liệu  và xuất dl 
subject.listen((number) { 
   print("Lấy dữ liệu lần 1: $number");
});

subject.add(100);
subject.add(101);

subject.listen((number) { 
   print("Lấy dữ liệu lần 2: $number");
});

subject.add(200);
subject.add(201);


}
// Lấy tất cả các dữ liệu có trong Stream của Subject 
demoReplaySubject(){

 ReplaySubject subject = ReplaySubject<int>(); // tạo ra subject : có stream , có các phương thức đẩy dữ liệu  và xuất dl 
subject.listen((number) { 
   print("Lấy dữ liệu lần 1: $number");
});

subject.add(100);
subject.add(101);

subject.listen((number) { 
   print("Lấy dữ liệu lần 2: $number");
});

subject.add(200);
subject.add(201);


}
