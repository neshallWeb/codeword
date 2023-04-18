import 'package:flutter/material.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget? mobile;
  final Widget? tab;
  final Widget? desktop;

  const ResponsiveWidget({
    Key? key, this.mobile, this.tab, this.desktop
  }):super (key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints) {
          if(constraints.maxWidth < 786){
            return Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: mobile,
            );
          }else{
            return Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: tab,
            );
          }
        });
  }

}