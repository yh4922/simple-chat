import 'package:flutter/material.dart';

IconData getIcon(int data) {
  return IconData(data, fontFamily: 'iconfont');
}

class Iconfont {
  // xinxifill
  static IconData get xinxifill => getIcon(0xe762);

  // xinxi
  static IconData get xinxi => getIcon(0xe763);
}
