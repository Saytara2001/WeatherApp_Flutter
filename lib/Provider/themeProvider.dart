import 'package:flutter/cupertino.dart';

class ThemeProvider extends ChangeNotifier
{
  Color _color;
  set setColor(Color color)
  {
    print('color is this $color');
    this._color=color;
    notifyListeners();
  }
  Color get getColor => _color;
}