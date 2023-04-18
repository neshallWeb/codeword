import 'package:flutter/cupertino.dart';

Widget backGround1 ( Size display ) {

  // Size display = MediaQuery.of(context).size;

  return Container(
    width: display.width,
    height: display.height,
    child: Stack(
      children: [
        //clouds
        Clouds(display: display),

        //tree
        Tree(display: display),

        //branch
        Branch(display),

        //left root
        LeftRoot(display),

        //grass
        // Grass(display: display),
        Grass1(width: display.width-10, height: display.height*0.8,),

        //right root
        RightRoot(display: display,),
      ],
    ),
  );
}


Widget backGround ( Size display ) {

  // Size display = MediaQuery.of(context).size;

  const mockupWidth = 390;
  // const mockupHeight = 844;

  double width = display.width;
  // double height = display.height;

  // final scale = mockupWidth / width;
  // final divide = mockupWidth * width;

  // double initScale = 4.5;

  return Container(
    width: display.width,
    height: display.height,
    child: Stack(
      children: [
        //clouds
        Clouds(display: display),

        //tree
        Tree(display: display),

        //branch
        Branch(display),

        //left root
        LeftRoot(display),

        //grass
        Grass(display: display),

        //right root
        RightRoot(display: display,),
      ],
    ),
  );
}

Positioned LeftRoot(Size display) {
  const mockupWidth = 390;
  const mockupHeight = 844;

  double width = display.width;
  double height = display.height;

  final scale = mockupWidth / width;
  // final divide = mockupWidth * width;

  return Positioned(
    // top: 378,
    // // left: -5,
    // left: 0,
    top: 378 / mockupHeight * height,
    left: -5 / mockupWidth * width,
    child: Container(
      // height: 487.45,
      alignment: Alignment.bottomCenter,
      child: Image.asset(
        "assets/images/roots left.png",
        fit: BoxFit.fill,
        scale: 4 * scale,
      ),
    ),
  );
}

Positioned Branch(Size display) {

  const mockupWidth = 390;
  const mockupHeight = 844;

  double width = display.width;
  double height = display.height;

  final scale = mockupWidth / width;
  // final divide = mockupWidth * width;


  return Positioned(
    // top: 114,
    // left: -1,
    top: 114 / mockupHeight * height,
    left: -1 / mockupWidth * width,
    child: Container(
      // height: 388.82,
      // width: 561.02,
      // width: display.width,
      alignment: Alignment.bottomCenter,
      child: Image.asset(
        "assets/images/branch.png",
        fit: BoxFit.fill,
        scale: 4 * scale,
      ),
    ),
  );
}

class RightRoot extends StatelessWidget {
  const RightRoot({
    Key? key,
    required this.display,
  }) : super(key: key);

  final Size display;

  @override
  Widget build(BuildContext context) {

    const mockupWidth = 390;
    const mockupHeight = 844;

    double width = display.width;
    double height = display.height;

    final scale = mockupWidth / width;
    // final divide = mockupWidth * width;


    return Positioned(
      // top: 452,
      // // left: 240,
      // right: 0,
      top: 452 / mockupHeight * height,
      // right: -1,
      left: 240 / mockupWidth * width,
      child: Container(
        // height: 481.68,
        alignment: Alignment.bottomCenter,
        child: Image.asset(
          "assets/images/roots right.png",
          fit: BoxFit.fill,
          scale: 4 * scale,
        ),
      ),
    );
  }
}

class Grass extends StatelessWidget {
  const Grass({
    Key? key,
    required this.display,
  }) : super(key: key);

  final Size display;

  @override
  Widget build(BuildContext context) {

    const mockupWidth = 390;
    const mockupHeight = 844;

    double width = display.width;
    double height = display.height;

    final scale = mockupWidth / width;
    // final divide = mockupWidth * width;


    return Positioned(
      // top: 733,
      top: 733 / mockupHeight * height,
      child: Container(
        // height: display.height,
        // width: display.width*0.95,
        // height: 138.49,
        //width: 357.35,
        // width: display.width-10,
        // width: display.width.isInfinite?display.width: display.width-10,
        // alignment: Alignment.bottomCenter,
        child: Image.asset(
          "assets/images/grass.png",
          fit: BoxFit.cover,
          scale: 4 * scale,
        ),
      ),
    );
  }
}
class Grass1 extends StatelessWidget {
  const Grass1({
    Key? key,
    // required this.display,
    required this.width,
    required this.height,
  }) : super(key: key);

  final width;
  final height;

  @override
  Widget build(BuildContext context) {

    const mockupWidth = 390;
    const mockupHeight = 844;

    //double width = display.width;
    //double height = display.height;

    final scale = mockupWidth / width;
    // final divide = mockupWidth * width;


    return Positioned(
      // top: 733,
      top: 733 / mockupHeight * height,
      child: Container(
        // height: display.height,
        // width: display.width*0.95,
        // height: 138.49,
        //width: 357.35,
        //width: display.width-10,
        // width: width,
        // alignment: Alignment.bottomCenter,
        child: Image.asset(
          "assets/images/grass.png",
          fit: BoxFit.cover,
          scale: 4 * scale,
        ),
      ),
    );
  }
}


class Tree extends StatelessWidget {
  const Tree({
    Key? key,
    required this.display,
  }) : super(key: key);

  final Size display;

  @override
  Widget build(BuildContext context) {

    const mockupWidth = 390;
    const mockupHeight = 844;

    double width = display.width;
    double height = display.height;

    final scale = mockupWidth / width;
    // final divide = mockupWidth * width;


    return Positioned(
      // top: 127,
      top: 127 / mockupHeight * height,
      // left: -6,
      child: Container(
        // height: 388.82,
        // width: 561.02,
        // width: display.width,
        alignment: Alignment.bottomCenter,
        child: Image.asset(
          "assets/images/tree.png",
          fit: BoxFit.fill,
          scale: 4 * scale,
        ),
      ),
    );
  }
}

class Clouds extends StatelessWidget {
  const Clouds({
    Key? key,
    required this.display,
  }) : super(key: key);

  final Size display;

  @override
  Widget build(BuildContext context) {

    // late double sW;
    // late double sH;
    //
    //
    // if(display.width > 786){
    //
    // }else{
    //   sw = display.width*0.95;
    // }

    const mockupWidth = 390;
    const mockupHeight = 844;

    double width = display.width;
    double height = display.height;

    final scale = mockupWidth / width;
    // final divide = mockupWidth * width;

    double initScale = 4;

    /*print('scale $scale');
    print('scale 1 ${17/(mockupWidth * width)}');
    print('scale 2 ${17/(mockupHeight * height)}');

    print("width * height ${width} x ${height}");*/

    return Positioned(
      // top: 17,
      // // left: -29,
      // left: -19,
      top: 17 / mockupHeight * height,
      // top: (17 / mockupHeight * height) * scale,
      // left: -29 / mockupWidth * width,
      // left: -0 / mockupWidth * width,
      child: Container(
        // height: 209.34,
        // width: 372,
        // width: display.width*0.95,
        // width: sW,
        // width: display.width>786?display.height*2:display.width*0.95,
        // height: 96.78,
        // alignment: Alignment.bottomCenter,
        // child: Expanded(
          child: Image.asset(
            "assets/images/clouds.png",
            // fit: BoxFit.fill,
            fit: BoxFit.cover,
            // scale: 4 * scale,
            scale: initScale * scale,
            // scale: 3.6 * scale,
          ),
        // ),
      ),
    );
  }
}
