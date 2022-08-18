abstract class Animal{
 // Lớp trừu tương là lớp có từ khoá abstract và có thể có hoặc không hàm trừu tương 

 String? name; 
 String? type; 

 String takeSound(); // hàm trừu tượng

 void printName(){
  print(this.name);
 }


}