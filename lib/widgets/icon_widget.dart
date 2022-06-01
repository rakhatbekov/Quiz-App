import 'package:flutter/material.dart';

class IconWidget extends StatelessWidget {
 IconWidget({ Key key, this.icon, this.iconColor }) : super(key: key);

final IconData icon;
final Color iconColor;

  @override
  Widget build(BuildContext context){
    return  Icon(
    icon,
    color: iconColor,
    size: 40.0,
  );
  }
}