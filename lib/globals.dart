library my_project.globals;

import 'package:flutter/material.dart';

const int user_id = 1;

bool isLight = false;
Color card_color = Color.fromRGBO(220, 208, 208, 1);

Border border_color = Border.all(
  color: isLight ? Colors.white30 : Colors.black,
  width: 1.0,
);
