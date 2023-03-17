import 'package:flutter/widgets.dart';

class HomeProvider extends ChangeNotifier {
  int i = 0;
  String? gender;
  String dropdownvalue = '1';
  List<String> l1 = ['1', '2', '3', '4', '5'];
  void dropchange(String value)
  {
    dropdownvalue=value;
    notifyListeners();
  }
  void chagegender(var value)
  {
    gender=value;
    notifyListeners();
  }
  DateTime currentdate =DateTime.now();
  void setdate(DateTime date)
  {
    currentdate=date;
    notifyListeners();
  }
  void oncontinue() {
    if(i<10)
    {
      i++;
    }
    notifyListeners();
  }
  void oncancle() {
    if(i>0)
    {
      i--;
    }
    notifyListeners();
  }
  void change(int value)
  {
    i=value;
    notifyListeners();
  }
}
