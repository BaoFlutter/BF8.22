


// biến toàn cục :  không nằm trong hàm nào 


int year = 2022; 


void main(List<String> arguments) {
  int number = 10;   
  number = number + 5;  // number = 15 
  print("Giá trị là: $number");

  // kiểu dữ liệu 
  // kiểu static :  int, double ,String,bool
  double mark = 9.6;
  String studentGrade = "Học lực giỏi";
  bool  isLogined = true; 
  mark = 6.8; 
  // Biến hằng const 
  const double pi = 3.142567; // PI 
 //  pi = 3.15; : Error 
  // Biến hằng Final 
  final age = number; 

  int sum = getSum(firstNumber: number, secondNumber: 9);
  print ("Tổng của $number và 9 là : $sum");
  //print ("Tổng của $number và 9 là : ${getSum(number, 9)}");

  // kiểu dynamic: dynamic , var 
  var number1 = 5; // int 
  number1 = 9; 
  //number = 8.4; // Error 
   var name = "Báo Flutter";

  final number2 = 8.8;  // double 


  dynamic scored = true; 
  printVietNamCapital();


  // Null Safety 
  int? number5 ;  // các ngôn ngữ khác nó gán : number5 = null; còn dart thì không làm thế 
                 // không gắng bằng null và không sử dụng được 
                 // Để dùng được thì biến đó gán là null, đặt dấu hỏi ngay sau kiểu dữ liệu 
  // int newSum = number5! + 4;   
   
   int secondNumber =    number5?? 2 + 6;   
   print("Gia tri secondNumber : $secondNumber");     

  // List : là tập hợp của nhiều phần tử có cùng kiểu dữ liệu 

  List<int>  markList =                   [5, 6, 8, 10, 50, 39, 80];
  // Chỉ số (index) phần tử trong List là : 0, 1, 2, 3,  4, 5,  6  
  // Độ dài của list : 7 - length

print("Độ dài của markList là: " + markList.length.toString());
print("Giá trị của phần tử số 5 là : ${markList[5]}");

  List list = [6, 9.5, true, false, "Yến"];

  getTypeNumbers(numberList:markList );
  

  bool result = 5> 3; // true 
  result = 6> 9;//  false 

  // == ; && ., ||
  result = ( 5 > 4) && (9>3);  // && : kết quả bằng true chỉ khi cả 2 là true 
         //   true  &&  true  = true 
  result = (9< 4)|| (8> 13);  // || : chỉ bằng false khi cả 2 là false 
            // false || false  : false 

  // if ... else 
  // if( biêu thưc ) {..tập lệnh 1..} else ....{tập lệnh 2..}

  findTypeNumber(number: 15);

  // return : Thoát hàm ; 
  // break : Thoát vòng lặp 

  // continue : vòng lặp đó sẽ ngưng lại và thực hiện vòng lặp mới


  Map<String , int>  map1 = {
     "age": 30,
     "year" : 2022 ,
    
  };

  Map<String, dynamic> map2 = {
    "name" : "BF",
    "place" : "Ha Noi",
    "birthYear" : 1991
  };

  print(map1["year"]);
  

}
// biến , hàm , class 

// Hàm : tạo hàm & sử dụng hàm 
// Tạo hàm : tạo ra 1 hàm không nằm trong hàm nào cả 


// 1. Kiểu dữ liệu đầu ra : giống kiểu dữ liệu biến 
// 2. tên hàm 
// 3. () : Biến truyền vào cảu hàm
// 4. thân hàm 
// 5. return // xuất hiện trong hàm khi tạo : khi gặp return thì hàm kết thúc 

// * Nên sử dụng biến cục bộ để có thể tái sử dung và sử dụng nhiều nơi 

int getSum({required int firstNumber, required int secondNumber } )
{
  int tempNumber = 12;  // biến cục bộ

return firstNumber + secondNumber;
}
// Sử dụng hàm : Sử dụng được trong hàm khác 

// void không trả về giá trị nào 

void printVietNamCapital(){
print ("Hà Nội");
}
// Viết tắt hàm 
int getNewSum({required int firstNumber, required int secondNumber } )
=> firstNumber + secondNumber;

// bỏ dynmic

getNewSecondSum({required int firstNumber, required int secondNumber } )
=> firstNumber + secondNumber;

// có thể bỏ dynamic , trình duỵet hiểu là dynamic 



// { return smth ; } - chuyển thành - => smth; 


void getTypeNumbers({ List<int>?  numberList  }){
   // for in 
   /*
   for (int number in numberList! )
   {
    if(number%2 == 0) print ("Số chẵn: $number");
    else print ("Số lẻ: $number");

   }
   */

   /*
   // for index 

   // i++ <> i = i+1; 
   // i--; i+= 3; <> i = i+ 3; i /= 5;<> i = i/5;

   for (int i = 0 ; i< numberList!.length ; i++)
   {
    if(numberList[i]%2 == 0) print ("Số chẵn: ${numberList[i]}");
    else print ("Số lẻ: ${numberList[i]}");

   }
   */
  /*
   // while 
   int count = 0; 
   while ( count < numberList!.length){

    if(numberList[count]%2 == 0) print ("Số chẵn: ${numberList[count]}");
    else print ("Số lẻ: ${numberList[count]}");
    count++;

   }
   */


   // do while 
  int count = 0; 
   do {
    if(numberList![count]%2 == 0) print ("Số chẵn: ${numberList[count]}");
    else print ("Số lẻ: ${numberList[count]}");
    count++;
    //if(numberList![count] == 6 ) break; 
    //if(numberList![count] == 6 ) continue; 
    print (" Tiếp đục đi ");
    

   } while (count < numberList!.length);


   



}

void findTypeNumber ({ required int number})
{
  switch(number%2){
    case 1:
    print("$number là số lẻ");
    break;   // thoát khỏi vòng lặp 

    case 0:
    print("$number là số chẵn");
    break; 

    default:
    print("số không hợp lệ");
    break;
  }

}

