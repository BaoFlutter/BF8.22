class HinhChuNhat {
  
  double? chieuDai;
  double? chieuRong;

  HinhChuNhat({required this.chieuDai, required this.chieuRong});

 double tinhDienTich(){
    return this.chieuDai!*this.chieuRong!;
  }

  double tinhChuVi(){
    return (this.chieuRong! + this.chieuDai!) * 2;
  }


}