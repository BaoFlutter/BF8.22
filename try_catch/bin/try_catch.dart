

void main(List<String> arguments) {

  var input  = "Flutter" ;  // String 

// Xảy ra ngoại lệ : Exception : Làm chương trình dừng đột ngột 

 try {
  int number = int.parse(input) ;
 }

 on FormatException{
  print("Đây là Format Exception");
 }

 catch (e){
   print("Đoạn code đã xảy ra Exception");
   print(e.toString());
 }

// 1. Không dừng đột ngột nữa 
// 2. Chương trình vẫn chạy tiếp
// 3. Có thể biết kiểu Exception đó là gì 

finally{
print("Luôn luôn chạy các lệnh trong khối Finally");
}
print("Chương trình kết thúc");

try {
 //danhGiaTuoi(age: -10);
 danhGiaTuoi(age: 30);
}
catch(e){
  print(e.toString());
}

}

void danhGiaTuoi({ required int age})
{
  if(age <= 0) throw Exception("AgeException - Tuổi nhập vào không hợp lệ, hãy nhập một số nguyên dương");
  if(age< 45) print("Bạn còn trẻ");
  else print("Bạn có tuổi");
}
