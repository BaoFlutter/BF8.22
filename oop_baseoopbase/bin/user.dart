class User{
//I. thuộc tính : chính là những đặc điểm, được biểu diễn bởi các biến 
String? userName; 
int? birthYear; 
String? address;
String? _phoneNumber; // private 

// hàm và biến public & private là gì ? 
// khi là private thì chỉ sử dụng được trong class 

//II. phương thức : là các hàm mô tả các hành vi của đói tượng

// hàm khởi tạo 
// Khởi tạo mặc đinh : User();

User({ required this.userName, this.address, this.birthYear});

// Hàm setter 

void setPhoneNumber({required String phoneNumber})
{
  this._phoneNumber = phoneNumber;
}
// Hàm getter 
String getPhoneNumber(){
  return this._phoneNumber!;
}

String get phoneNumber => this._phoneNumber!;


int getAge(){
return DateTime.now().year - this.birthYear!;
}

void setBirthYear({ required int birthYear}){
  this.birthYear = birthYear;
}

int _getMoney(){
  return 10000000000;
}




} 