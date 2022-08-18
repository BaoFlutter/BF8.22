
import '../lib/hinh/hinh_vuong.dart';
import '../lib/xe/xe_tai.dart';
import 'user.dart';

void main(List<String> arguments) {

  User binh = User(userName: "Tạ Hoà Bình", address:"Ha Noi", birthYear:1998 ); // Tạo 1 đối tượng tên là bình hay tạo 1 instance 
  User thai = User(userName: "Nguyễn Minh Thái", birthYear: 1975);
  User hoa = User(userName: "Lại Văn Hoà", birthYear: 1989, address:"Nam Định");

  thai.setPhoneNumber(phoneNumber: "0234848347");


  int number = 10 ;

  List<User> userList = [];
  userList.add(binh);
  userList.add(thai);
  userList.add(hoa);

  //binh.birthYear = 1989; 
  int binhAge = binh.getAge();
 

  print("${binh.userName} có tuổi là: $binhAge" );

  User oldestUser = findOldestUser(userList: userList );
  print("${oldestUser.userName} có số tuổi cao nhất là: ${oldestUser.getAge()} có số điện thoại là ${thai.getPhoneNumber()}");

 // 

 XeTai xeTaiHuynDai = XeTai(brand: "HuynDia", productionYear:1998);
 xeTaiHuynDai.chuyenCho();
 //print ("Tuổi thọ của xe là: ${xeTaiHuynDai.getVehicleAge()}");
 xeTaiHuynDai.showAge();

 HinhVuong vuong = HinhVuong(canh: 12.5);
 print("Diên tich hinh vuong là: ${vuong.tinhDienTich()}");




}

User findOldestUser( {required List<User> userList}){
  User? oldestUser; 
  int maxAge = 0; 
  for(User user in userList)
  {
    int ageUser = user.getAge();
    if(ageUser >= maxAge ) {
     maxAge = ageUser;
     oldestUser = user;
    }
  }
  return oldestUser!;

}
