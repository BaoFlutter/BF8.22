
import "xe.dart";

class XeTai extends Xe  {
// XeTải là class con có thể truy cập và sử dụng tất cả thuộc tính và phương thức của clas cha 
// Khi lớp cha có hàm khởi tạo thì sử dụng ở lớp con cũng phải khởi tạo cho lớp cha 
XeTai({String? brand, int? productionYear}):super(brand:brand, productionYear: productionYear );

void showAge(){
  int age = super.getVehicleAge();
  print("Tuổi của xe: ${super.brand} là: $age");
}

// Ghi đè phương thức 

@override
  void chuyenCho() {
    // TODO: implement chuyenCho
    print(" Xe này chuyên chở vật liệu xây dưng");
  }





}