import 'dart:io';

List<Normal> normalBus = [];
List<Vip> vipBus = [];
List<Travel> travelList = [];

void main() {
  while (true) {
    print('1 : تعریف اتوبوس');
    print('2 : تعریف سفر');
    print('3 : پیش نمایش سفر های موجود');
    print('4 : رزرو بلیط');
    print('5 : خرید بلیط');
    print('6 : لغو بلیط ');
    print('7 : گزارش یک سفر');
    print('8 : خروج');
    String? input = stdin.readLineSync();
    while (input != '1' &&
        input != '2' &&
        input != '3' &&
        input != '4' &&
        input != '5' &&
        input != '6' &&
        input != '7' &&
        input != '8') {
      print('لطفا عدد درست را وارد کنید');
      input = stdin.readLineSync();
    }
    switch (input) {
      case '1':
        {
          print('نام اتوبوس را وارد کنید\n0:انصراف');
          String? busName = stdin.readLineSync();
          while (busName == '') {
            print('نام اتوبوس را وارد کنید\n0:انصراف');
            busName = stdin.readLineSync();
          }
          if (busName == '0') {
            break;
          }
          print('نوع اتوبوس را انتخاب کنید:\n1:معمولی\n2:vip\n0:انصراف');
          String? kind = stdin.readLineSync();
          while (kind != '1' && kind != '2' && kind != '0') {
            print('نوع اتوبوس را انتخاب کنید:\n1:معمولی\n2:vip\n0:انصراف');
            kind = stdin.readLineSync();
          }
          if (kind == '0') {
            break;
          }
          if (kind == '1') {
            Normal normal = Normal(name: busName!);
            normalBus.add(normal);
            print('اتوبوس مد نظر ثبت شد');
          }
          if (kind == '2') {
            Vip vip = Vip(name: busName!);
            vipBus.add(vip);
            print('اتوبوس مد نظر ثبت شد');
          }
        }
        break;
      case '2':
        {
          print('نوع اتوبوس را انتخاب کنید:\n1:معمولی\n2:vip\n0:انصراف');
          String? kind = stdin.readLineSync();
          while (kind != '1' && kind != '2' && kind != '0') {
            print('نوع اتوبوس را انتخاب کنید:\n1:معمولی\n2:vip\n0:انصراف');
            kind = stdin.readLineSync();
          }
          if (kind == '0') {
            break;
          }
          if (kind == '1') {
            for (int i = 0; i < normalBus.length; i++) {
              print('${i + 1}:${normalBus[i].name}');
            }
            print('اتوبوس مورد نظر را انتخاب کنید');
            String? input1 = stdin.readLineSync();
            int input11 = int.parse(input1!);
            Bus bus = normalBus[input11 - 1];
            print('مبدا را واردکنید');
            String? input2 = stdin.readLineSync();
            print('مقصد را وارد کنید');
            String? input21 = stdin.readLineSync();
            print(' قیمت بلیط را وارد کنید');
            String? inputInt = stdin.readLineSync();
            double inputInt1 = double.parse(inputInt!);
            Travel travel =
            Travel(input2!, input21!, inputInt1, 0, bus, 44, 0, 0);
            travelList.add(travel);
          }
          if (kind == '2') {
            for (int i = 0; i < vipBus.length; i++) {
              print('${i + 1}:${vipBus[i].name}');
            }
            print('اتوبوس مورد نظر را انتخاب کنید');
            String? input4 = stdin.readLineSync();
            int input44 = int.parse(input4!);
            Bus bus = vipBus[input44 - 1];
            print('مبدا را واردکنید');
            String? input222 = stdin.readLineSync();
            print('مقصد را وارد کنید');
            String? input2111 = stdin.readLineSync();
            print(' قیمت بلیط را وارد کنید');
            String? inputInt = stdin.readLineSync();
            double inputInt1 = double.parse(inputInt!);
            Travel travel =
            Travel(input222!, input2111!, inputInt1, 0, bus, 30, 0, 0);
            travelList.add(travel);
          }
          print('سفر مورد نظر ثبت شد');
        }
        break;
      case '3':
        {
          for (int i = 0; i < travelList.length; i++) {
            print(
                '${i + 1}:${travelList[i].bus.name}_ ${travelList[i].origin}_ ${travelList[i].destination}}');
          }
          String? showInt = stdin.readLineSync();
          int showInt1 = int.parse(showInt!);
          travelList[showInt1 - 1].bus.DisplayInfo();
        }
        break;
      case '4':
        {
          for (int i = 0; i < travelList.length; i++) {
            print(
                '${i + 1}:${travelList[i].bus.name}_ ${travelList[i].origin}_ ${travelList[i].destination}}');
          }
          String? showInt = stdin.readLineSync();
          int showInt1 = int.parse(showInt!);
          travelList[showInt1 - 1].bus.DisplayInfo();
          print('0-انصراف');
          String? rzrv = stdin.readLineSync();
          int rzrv1 = int.parse(rzrv!);
          if(rzrv1 == 0){
            break;
          }
          while(travelList[showInt1 - 1].bus.seat[rzrv1 -1].situation != 'empty'){
            print('لطفا یک صندلی دیگر انتخاب کنید');
            rzrv = stdin.readLineSync();
            rzrv1 = int.parse(rzrv!);
          }
          travelList[showInt1 - 1].bus.seat[rzrv1 -1].situation = 'rr';
          travelList[showInt1 - 1].daramadSafar = (travelList[showInt1 - 1].daramadSafar) + ((travelList[showInt1 - 1].tiketpay)*30)/100;
          travelList[showInt1 - 1].emptySeat--;
        }
        break;
      case '5':
        {
          for (int i = 0; i < travelList.length; i++) {
            print(
                '${i + 1}:${travelList[i].bus.name}_ ${travelList[i].origin}_ ${travelList[i].destination}}');
          }
          String? showInt = stdin.readLineSync();
          int showInt1 = int.parse(showInt!);
          travelList[showInt1 - 1].bus.DisplayInfo();
          print('0-انصراف');
          String? rzrv = stdin.readLineSync();
          int rzrv1 = int.parse(rzrv!);
          if(rzrv1 == 0){
            break;
          }
          while(travelList[showInt1 - 1].bus.seat[rzrv1 -1].situation != 'empty'){
            print('لطفا یک صندلی دیگر انتخاب کنید');
            rzrv = stdin.readLineSync();
            rzrv1 = int.parse(rzrv!);
          }
          travelList[showInt1 - 1].bus.seat[rzrv1 -1].situation = 'bb';
          travelList[showInt1 - 1].daramadSafar = (travelList[showInt1 - 1].daramadSafar) + travelList[showInt1 - 1].tiketpay;
          travelList[showInt1 - 1].emptySeat--;
        }
        break;
      case '6':
        {
          for (int i = 0; i < travelList.length; i++) {
            print(
                '${i + 1}:${travelList[i].bus.name}_ ${travelList[i].origin}_ ${travelList[i].destination}}');
          }
          String? showInt = stdin.readLineSync();
          int showInt1 = int.parse(showInt!);
          travelList[showInt1 - 1].bus.DisplayInfo();
          print('0-انصراف');
          String? rzrv = stdin.readLineSync();
          int rzrv1 = int.parse(rzrv!);
          if(rzrv1 == 0){
            break;
          }
          while(travelList[showInt1 - 1].bus.seat[rzrv1 -1].situation == 'empty'){
            print('لطفا یک صندلی دیگر انتخاب کنید');
            rzrv = stdin.readLineSync();
            rzrv1 = int.parse(rzrv!);
          }
          if(travelList[showInt1 - 1].bus.seat[rzrv1 -1].situation == 'bb'){
            travelList[showInt1 - 1].cancelBuy++;
            travelList[showInt1 - 1].daramadSafar = travelList[showInt1 - 1].daramadSafar-(((travelList[showInt1 - 1].tiketpay)*90)/100);
          }
          else{
            travelList[showInt1 - 1].cancelRezerv++;
            travelList[showInt1 - 1].daramadSafar = travelList[showInt1 - 1].daramadSafar-(((travelList[showInt1 - 1].tiketpay)*24)/100);
          }
          travelList[showInt1 - 1].emptySeat++;
          print('صندلی خالی شد');
          travelList[showInt1 - 1].bus.seat[rzrv1 -1].situation = 'empty';
        }
        break;
      case '7':
        {
          for (int i = 0; i < travelList.length; i++) {
            print(
                '${i + 1}:${travelList[i].bus.name}_ ${travelList[i].origin}_ ${travelList[i].destination}}');
          }
          print('0-انصراف');
          String? showInt = stdin.readLineSync();
          int showInt1 = int.parse(showInt!);
          if(showInt1 == 0){
            break;
          }
          Travel newTravel = travelList[showInt1-1];
          print('درامد خالص:${newTravel.daramadSafar} - تعداد صندلی خالی:${newTravel.emptySeat}'
              ' - تعداد کنسلی رزروها:${newTravel.cancelRezerv} -'
              ' تعداد کنسلی خریدها:${newTravel.cancelBuy}');
        }
        break;
      case '8':
        {
          exit(0);
        }
    }
  }
}
class Bus {
  String name;
  int type;
  List<Seat> seat = [];
  Bus({required this.name , required this.type});
  void DisplayInfo(){
  }

}
class Vip extends Bus{

  Vip({required super.name , super.type = 1}){
    for(int i = 0 ; i < 30 ; i++){
      Seat newseat = Seat('empty');
      seat.add(newseat);
    }
  }
  @override void DisplayInfo() {
    for (int i = 0; i < 13; i = i + 3) {
      for (int j = 1; j < 4; j++) {
        if (seat[(i + j) - 1].situation == 'rr') {
          stdout.write('rr  ');
        }
        if (seat[(i + j) - 1].situation == 'bb') {
          stdout.write('bb  ');
        }
        if (seat[(i + j) - 1].situation == 'empty') {
          if (i + j < 10) {
            stdout.write('0${i + j}  ');
          }
          else {
            stdout.write('${i + j}  ');
          }
        }
      }
      print('\n');
    }
    for (int i = 16; i < 19; i++) {
      if (seat[i - 1].situation == 'rr') {
        print('rr  \n');
      }
      if (seat[i - 1].situation == 'bb') {
        print('bb  \n');
      }
      if (seat[i - 1].situation == 'empty') {
        print('$i  \n');
      }
    }
    for (int i = 18; i < 28; i = i + 3) {
      for (int j = 1; j < 4; j++) {
        if (seat[(i + j) - 1].situation == 'rr') {
          stdout.write('rr  ');
        }
        if (seat[(i + j) - 1].situation == 'bb') {
          stdout.write('bb  ');
        }
        if (seat[(i + j) - 1].situation == 'empty') {
          stdout.write('${i + j}  ');
        }
      }
      print('\n');
    }
  }
}
class Normal extends Bus {
  Normal({required super.name, super.type = 0}) {
    for (int i = 0; i < 44; i++) {
      Seat newseat = Seat('empty');
      seat.add(newseat);
    }
  }

  @override
  void DisplayInfo() {
    for (int i = 0; i < 17; i = i + 4) {
      for (int j = 1; j < 5; j++) {
        if (seat[(i + j) - 1].situation == 'rr') {
          stdout.write('rr  ');
        }
        if (seat[(i + j) - 1].situation == 'bb') {
          stdout.write('bb  ');
        }
        if (seat[(i + j) - 1].situation == 'empty') {
          if (i + j < 10) {
            stdout.write('0${i + j}  ');
          } else {
            stdout.write('${i + j}  ');
          }
        }
      }
      print('\n');
    }
    for (int i = 20; i < 23; i = i + 2) {
      for (int j = 1; j < 3; j++) {
        if (seat[(i + j) - 1].situation == 'rr') {
          stdout.write('rr  ');
        }
        if (seat[(i + j) - 1].situation == 'bb') {
          stdout.write('bb  ');
        }
        if (seat[(i + j) - 1].situation == 'empty') {
          stdout.write('${i + j}  ');
        }
      }
      print('\n');
    }
    for (int i = 24; i < 41; i = i + 4) {
      for (int j = 1; j < 5; j++) {
        if (seat[(i + j) - 1].situation == 'rr') {
          stdout.write('rr  ');
        }
        if (seat[(i + j) - 1].situation == 'bb') {
          stdout.write('bb  ');
        }
        if (seat[(i + j) - 1].situation == 'empty') {
          stdout.write('${i + j}  ');
        }
      }
      print('\n');
    }
  }
}
class Travel{
  String origin;
  String destination;
  double tiketpay;
  double daramadSafar;
  Bus bus;
  int emptySeat;
  int cancelBuy;
  int cancelRezerv;

  Travel(this.origin, this.destination, this.tiketpay, this.daramadSafar,
      this.bus, this.emptySeat, this.cancelBuy, this.cancelRezerv);
}
class Seat{
  String situation;
  Seat(this.situation);

}