

void main(List<String> arguments) async {
   var number = await makeLateNumber();
   Future<int> futureNumber = makeLateNumber();

   // cách đổi dạng dữ liệu : static & future 
   int number2 = await futureNumber;

   // then 
   futureNumber.then((value){
    print("Dữ liệu sau then là: $value");
   });

   //print("$number2");

   print("Chương trình kết thúc");


   Stream<int> firstStream = makeNumberStream();
   //listenStream(firstStream);
   Stream<int> secondStream = makeSecondNumberStream(maxNumber: 9);
   readStream(secondStream);

  
}


Future<int> makeLateNumber(){
  return Future.delayed(Duration(seconds: 2), (){
    return 9;
  });
}

// Stream 
// Cách tạo ra Stream 
// Cách 1
Stream<int> makeNumberStream(){
  return Stream<int>.periodic(Duration(seconds: 1), makeNumberUp);
}

// Cách 2 
Stream<int> makeSecondNumberStream({required int maxNumber}) async* {

  for(int i= 1; i<= maxNumber; i++)
  {
    yield i;
  }

}

// Cách lấy dữ liệu từ Stream 
// 2.1 Dùng listen 
void listenStream( Stream<int> numberStream){
 numberStream.listen((number) {
  print("$number");
  });

}

// 2.2 Dùng Await... for 
void readStream(Stream<int> numberStream) async
{
  await for(int number in  numberStream) 
  {
    print("Số lấy trong Stream là: $number");
  }
}




int makeNumberUp(int value)=> value + 1;