class Xe {

  String? brand;
  int? productionYear;

  Xe({ required this.brand , required this.productionYear});


  int getVehicleAge(){
    return DateTime.now().year - this.productionYear! ;
  }
  
  void chuyenCho(){
    print("Xe chuyên chở");
  }

}