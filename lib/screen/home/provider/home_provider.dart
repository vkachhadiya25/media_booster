import 'package:flutter/cupertino.dart';

class HomeProvider with ChangeNotifier
{
     int index = 0;

     void changeIndex(int i)
     {
       index = i;
       notifyListeners();
     }
}