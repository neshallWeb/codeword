// import 'package:f2f_puzzlegame/widgets/vector_widget.dart';
import '../widgets/vector_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../model/svg.dart';
import '../model/transform.dart';

showToast({String text=""}){
  Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Color(0xffffffff),
      textColor: Color(0xff74C171),
      fontSize: 20
  );
}

class BackgroundWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 390.0,
      height: 844.0,
      child: SvgWidget(painters: [
        SvgPathPainter.fill()
          ..addPath('M390 0L0 0L0 844L390 844L390 0Z')
          ..setLinearGradient(
            startX: 0.0,
            startY: 422.0,
            endX: 390.0,
            endY: 422.0,
            colors: [
              Color.fromARGB(255, 83, 230, 242),
              Color.fromARGB(255, 51, 217, 235),
              Color.fromARGB(255, 0, 197, 225)
            ],
            colorStops: [0.0, 0.38999998569488525, 0.9399999976158142],
          ),
      ]),
    );
  }
}

class CloudsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.zero,
      child: Container(
        width: 355.2200012207031,
        height: 97.05000305175781,
        child: Stack(
            fit: StackFit.expand,
            alignment: Alignment.center,
            // overflow: Overflow.visible,
            children: [
              Positioned(
                left: 0.0,
                top: 0.0,
                right: 0.0,
                bottom: 0.0,
                width: null,
                height: null,
                child: LayoutBuilder(builder:
                    (BuildContext context, BoxConstraints constraints) {
                  final double width =
                      constraints.maxWidth * 0.9985553936309655;

                  final double height =
                      constraints.maxHeight * 0.9972178849668151;

                  return Stack(children: [
                    TransformHelper.translate(
                        x: constraints.maxWidth * 0.001407569168476756,
                        y: constraints.maxHeight * 0.003091190133821384,
                        z: 0,
                        child: Container(
                          width: width,
                          height: height,
                          // child: GeneratedBACKGROUNDWidget(),
                          child: BackgroundWidget(),
                        ))
                  ]);
                }),
              )
            ]),
      ),
    );
  }
}

class TreeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.zero,
      child: Container(
        width: 561.02001953125,
        height: 388.82000732421875,
        child: Stack(
            fit: StackFit.expand,
            alignment: Alignment.center,
            // overflow: Overflow.visible,
            children: [
              Positioned(
                left: 0.0,
                top: 0.0,
                right: 0.0,
                bottom: 0.0,
                width: null,
                height: null,
                child: LayoutBuilder(builder:
                    (BuildContext context, BoxConstraints constraints) {
                  double percentWidth = 0.664012801911975;
                  double scaleX = (constraints.maxWidth * percentWidth) /
                      372.52447509765625;

                  double percentHeight = 1.000135312750621;
                  double scaleY = (constraints.maxHeight * percentHeight) /
                      388.87261962890625;

                  return Stack(children: [
                    TransformHelper.translateAndScale(
                        translateX: constraints.maxWidth * 0.33602277346038056,
                        translateY:
                        constraints.maxHeight * 0.00000854887734911218,
                        translateZ: 0,
                        scaleX: scaleX,
                        scaleY: scaleY,
                        scaleZ: 1,
                        child: VectorWidget129())
                  ]);
                }),
              ),
              Positioned(
                left: 0.0,
                top: 0.0,
                right: 0.0,
                bottom: 0.0,
                width: null,
                height: null,
                child: LayoutBuilder(builder:
                    (BuildContext context, BoxConstraints constraints) {
                  double percentWidth = 0.29260246033617965;
                  double scaleX =
                      (constraints.maxWidth * percentWidth) / 164.1558380126953;

                  double percentHeight = 0.7534348953374711;
                  double scaleY = (constraints.maxHeight * percentHeight) /
                      292.9505615234375;

                  return Stack(children: [
                    TransformHelper.translateAndScale(
                        translateX: 0,
                        translateY:
                        constraints.maxHeight * 0.059923470396882346,
                        translateZ: 0,
                        scaleX: scaleX,
                        scaleY: scaleY,
                        scaleZ: 1,
                        child: VectorWidget130())
                  ]);
                }),
              )
            ]),
      ),
    );
  }
}

class RootsleftWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.zero,
      child: Container(
        width: 104.66999816894531,
        height: 487.45001220703125,
        child: Stack(
            fit: StackFit.expand,
            alignment: Alignment.center,
            // overflow: Overflow.visible,
            children: [
              Positioned(
                left: 0.0,
                top: 0.0,
                right: 0.0,
                bottom: 0.0,
                width: null,
                height: null,
                child: LayoutBuilder(builder:
                    (BuildContext context, BoxConstraints constraints) {
                  double percentWidth = 0.9530907029845387;
                  double scaleX =
                      (constraints.maxWidth * percentWidth) / 99.76000213623047;

                  double percentHeight = 0.9986870148068318;
                  double scaleY = (constraints.maxHeight * percentHeight) /
                      486.80999755859375;

                  return Stack(children: [
                    TransformHelper.translateAndScale(
                        translateX: constraints.maxWidth * 0.046909333460453465,
                        translateY: 0,
                        translateZ: 0,
                        scaleX: scaleX,
                        scaleY: scaleY,
                        scaleZ: 1,
                        child: VectorWidget131())
                  ]);
                }),
              ),
              Positioned(
                left: 0.0,
                top: 0.0,
                right: 0.0,
                bottom: 0.0,
                width: null,
                height: null,
                child: LayoutBuilder(builder:
                    (BuildContext context, BoxConstraints constraints) {
                  double percentWidth = 0.30261404986520457;
                  double scaleX = (constraints.maxWidth * percentWidth) /
                      31.674612045288086;

                  double percentHeight = 0.7662529498655273;
                  double scaleY = (constraints.maxHeight * percentHeight) /
                      373.510009765625;

                  return Stack(children: [
                    TransformHelper.translateAndScale(
                        translateX: constraints.maxWidth * 0.046909333460453465,
                        translateY: constraints.maxHeight * 0.0738537267380557,
                        translateZ: 0,
                        scaleX: scaleX,
                        scaleY: scaleY,
                        scaleZ: 1,
                        child: VectorWidget132())
                  ]);
                }),
              ),
              Positioned(
                left: 0.0,
                top: 0.0,
                right: 0.0,
                bottom: 0.0,
                width: null,
                height: null,
                child: LayoutBuilder(builder:
                    (BuildContext context, BoxConstraints constraints) {
                  double percentWidth = 0.25826173350168;
                  double scaleX = (constraints.maxWidth * percentWidth) /
                      27.032255172729492;

                  double percentHeight = 0.6281498465950973;
                  double scaleY = (constraints.maxHeight * percentHeight) /
                      306.191650390625;

                  return Stack(children: [
                    TransformHelper.translateAndScale(
                        translateX: constraints.maxWidth * 0.06862029865067519,
                        translateY: constraints.maxHeight * 0.11746071217989726,
                        translateZ: 0,
                        scaleX: scaleX,
                        scaleY: scaleY,
                        scaleZ: 1,
                        child: VectorWidget133())
                  ]);
                }),
              ),
              Positioned(
                left: 0.0,
                top: 0.0,
                right: 0.0,
                bottom: 0.0,
                width: null,
                height: null,
                child: LayoutBuilder(builder:
                    (BuildContext context, BoxConstraints constraints) {
                  double percentWidth = 0.44943377602336443;
                  double scaleX = (constraints.maxWidth * percentWidth) /
                      47.042232513427734;

                  double percentHeight = 0.6061220344984793;
                  double scaleY = (constraints.maxHeight * percentHeight) /
                      295.4541931152344;

                  return Stack(children: [
                    TransformHelper.translateAndScale(
                        translateX:
                        constraints.maxWidth * 1.4577996549508527e-9,
                        translateY: constraints.maxHeight * 0.39392761251936265,
                        translateZ: 0,
                        scaleX: scaleX,
                        scaleY: scaleY,
                        scaleZ: 1,
                        child: VectorWidget134())
                  ]);
                }),
              )
            ]),
      ),
    );
  }
}

class GrassWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.zero,
      child: Container(
        width: 357.3500061035156,
        height: 138.49000549316406,
        child: Stack(
            fit: StackFit.expand,
            alignment: Alignment.center,
            // overflow: Overflow.visible,
            children: [
              Positioned(
                left: 0.0,
                top: 0.0,
                right: 0.0,
                bottom: 0.0,
                width: null,
                height: null,
                child: LayoutBuilder(builder:
                    (BuildContext context, BoxConstraints constraints) {
                  final double width =
                      constraints.maxWidth * 1.0000619147719678;

                  final double height =
                      constraints.maxHeight * 0.9999273915691145;

                  return Stack(children: [
                    TransformHelper.translate(
                        x: 0,
                        y: 0,
                        z: 0,
                        child: Container(
                          width: width,
                          height: height,
                          child: GroupWidget3(),
                        ))
                  ]);
                }),
              )
            ]),
      ),
    );
  }
}
class GroupWidget3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 357.37213134765625,
      height: 138.47994995117188,
      child: Stack(
          fit: StackFit.expand,
          alignment: Alignment.center,
          // overflow: Overflow.visible,
          children: [
            Positioned(
              left: 0.0,
              top: 0.0,
              right: 0.0,
              bottom: 0.0,
              width: null,
              height: null,
              child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    final double width = constraints.maxWidth;

                    final double height = constraints.maxHeight;

                    return Stack(children: [
                      TransformHelper.translate(
                          x: 0,
                          y: 0,
                          z: 0,
                          child: Container(
                            width: width,
                            height: height,
                            child: BACKGROUNDWidget1(),
                          ))
                    ]);
                  }),
            )
          ]),
    );
  }
}
class BACKGROUNDWidget1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 357.37213134765625,
      height: 138.47994995117188,
      child: Stack(
          fit: StackFit.expand,
          alignment: Alignment.center,
          // overflow: Overflow.visible,
          children: [
            Positioned(
              left: 0.0,
              top: 0.0,
              right: 0.0,
              bottom: 0.0,
              width: null,
              height: null,
              child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    double percentWidth = 0.759606485533762;
                    double scaleX =
                        (constraints.maxWidth * percentWidth) / 271.4621887207031;

                    double percentHeight = 0.8205223404487416;
                    double scaleY = (constraints.maxHeight * percentHeight) /
                        113.62589263916016;

                    return Stack(children: [
                      TransformHelper.translateAndScale(
                          translateX: constraints.maxWidth * 0.2403935358148376,
                          translateY: constraints.maxHeight * 0.08914015238079287,
                          translateZ: 0,
                          scaleX: scaleX,
                          scaleY: scaleY,
                          scaleZ: 1,
                          child: VectorWidget135())
                    ]);
                  }),
            ),
            Positioned(
              left: 0.0,
              top: 0.0,
              right: 0.0,
              bottom: 0.0,
              width: null,
              height: null,
              child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    double percentWidth = 0.8414862211868626;
                    double scaleX =
                        (constraints.maxWidth * percentWidth) / 300.7237243652344;

                    double percentHeight = 0.7882856576807117;
                    double scaleY = (constraints.maxHeight * percentHeight) /
                        109.16175842285156;

                    return Stack(children: [
                      TransformHelper.translateAndScale(
                          translateX: constraints.maxWidth * 0.08307866766805831,
                          translateY: constraints.maxHeight * 0.05660215786659838,
                          translateZ: 0,
                          scaleX: scaleX,
                          scaleY: scaleY,
                          scaleZ: 1,
                          child: VectorWidget136())
                    ]);
                  }),
            ),
            Positioned(
              left: 0.0,
              top: 0.0,
              right: 0.0,
              bottom: 0.0,
              width: null,
              height: null,
              child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    double percentWidth = 0.13383036787052843;
                    double scaleX =
                        (constraints.maxWidth * percentWidth) / 47.82724380493164;

                    double percentHeight = 0.2764537285428711;
                    double scaleY =
                        (constraints.maxHeight * percentHeight) / 38.28329849243164;

                    return Stack(children: [
                      TransformHelper.translateAndScale(
                          translateX: constraints.maxWidth * 0.31001298421826123,
                          translateY: constraints.maxHeight * 0.5214233013076417,
                          translateZ: 0,
                          scaleX: scaleX,
                          scaleY: scaleY,
                          scaleZ: 1,
                          child: VectorWidget137())
                    ]);
                  }),
            ),
            Positioned(
              left: 0.0,
              top: 0.0,
              right: 0.0,
              bottom: 0.0,
              width: null,
              height: null,
              child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    double percentWidth = 0.12138492421674123;
                    double scaleX =
                        (constraints.maxWidth * percentWidth) / 43.37958908081055;

                    double percentHeight = 0.1666770289028984;
                    double scaleY =
                        (constraints.maxHeight * percentHeight) / 23.0814266204834;

                    return Stack(children: [
                      TransformHelper.translateAndScale(
                          translateX: constraints.maxWidth * 0.4321545775240236,
                          translateY: constraints.maxHeight * 0.6313448013767293,
                          translateZ: 0,
                          scaleX: scaleX,
                          scaleY: scaleY,
                          scaleZ: 1,
                          child: VectorWidget138())
                    ]);
                  }),
            ),
            Positioned(
              left: 0.0,
              top: 0.0,
              right: 0.0,
              bottom: 0.0,
              width: null,
              height: null,
              child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    double percentWidth = 0.1191085764156043;
                    double scaleX =
                        (constraints.maxWidth * percentWidth) / 42.56608581542969;

                    double percentHeight = 0.21380677945334112;
                    double scaleY = (constraints.maxHeight * percentHeight) /
                        29.607952117919922;

                    return Stack(children: [
                      TransformHelper.translateAndScale(
                          translateX: constraints.maxWidth * 0.5681752583394034,
                          translateY: constraints.maxHeight * 0.5842148717712521,
                          translateZ: 0,
                          scaleX: scaleX,
                          scaleY: scaleY,
                          scaleZ: 1,
                          child: VectorWidget139())
                    ]);
                  }),
            ),
            Positioned(
              left: 0.0,
              top: 0.0,
              right: 0.0,
              bottom: 0.0,
              width: null,
              height: null,
              child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    double percentWidth = 0.1723968478365756;
                    double scaleX =
                        (constraints.maxWidth * percentWidth) / 61.60982894897461;

                    double percentHeight = 0.5370927103995825;
                    double scaleY =
                        (constraints.maxHeight * percentHeight) / 74.37657165527344;

                    return Stack(children: [
                      TransformHelper.translateAndScale(
                          translateX: constraints.maxWidth * 0.8034766621379171,
                          translateY: constraints.maxHeight * 0.2607844020917154,
                          translateZ: 0,
                          scaleX: scaleX,
                          scaleY: scaleY,
                          scaleZ: 1,
                          child: VectorWidget140())
                    ]);
                  }),
            ),
            Positioned(
              left: 0.0,
              top: 0.0,
              right: 0.0,
              bottom: 0.0,
              width: null,
              height: null,
              child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    double percentWidth = 0.1007157971951356;
                    double scaleX =
                        (constraints.maxWidth * percentWidth) / 35.993019104003906;

                    double percentHeight = 0.43496795520913517;
                    double scaleY =
                        (constraints.maxHeight * percentHeight) / 60.23434066772461;

                    return Stack(children: [
                      TransformHelper.translateAndScale(
                          translateX: constraints.maxWidth * 0.8751577448022565,
                          translateY: constraints.maxHeight * 0.36305402657859875,
                          translateZ: 0,
                          scaleX: scaleX,
                          scaleY: scaleY,
                          scaleZ: 1,
                          child: VectorWidget141())
                    ]);
                  }),
            ),
            Positioned(
              left: 0.0,
              top: 0.0,
              right: 0.0,
              bottom: 0.0,
              width: null,
              height: null,
              child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    double percentWidth = 0.07795431527782641;
                    double scaleX =
                        (constraints.maxWidth * percentWidth) / 27.858699798583984;

                    double percentHeight = 0.17750608456554418;
                    double scaleY =
                        (constraints.maxHeight * percentHeight) / 24.58103370666504;

                    return Stack(children: [
                      TransformHelper.translateAndScale(
                          translateX: constraints.maxWidth * 0.8232351326217703,
                          translateY: constraints.maxHeight * 0.6205155528855848,
                          translateZ: 0,
                          scaleX: scaleX,
                          scaleY: scaleY,
                          scaleZ: 1,
                          child: VectorWidget142())
                    ]);
                  }),
            ),
            Positioned(
              left: 0.0,
              top: 0.0,
              right: 0.0,
              bottom: 0.0,
              width: null,
              height: null,
              child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    double percentWidth = 0.11047790334549634;
                    double scaleX =
                        (constraints.maxWidth * percentWidth) / 39.48172378540039;

                    double percentHeight = 0.569250113107688;
                    double scaleY =
                        (constraints.maxHeight * percentHeight) / 78.82972717285156;

                    return Stack(children: [
                      TransformHelper.translateAndScale(
                          translateX: constraints.maxWidth * 0.8757490156160737,
                          translateY: constraints.maxHeight * 0.34597272721863515,
                          translateZ: 0,
                          scaleX: scaleX,
                          scaleY: scaleY,
                          scaleZ: 1,
                          child: VectorWidget143())
                    ]);
                  }),
            ),
            Positioned(
              left: 0.0,
              top: 0.0,
              right: 0.0,
              bottom: 0.0,
              width: null,
              height: null,
              child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    double percentWidth = 0.007623105898874246;
                    double scaleX =
                        (constraints.maxWidth * percentWidth) / 2.72428560256958;

                    double percentHeight = 0.15960785349706053;
                    double scaleY = (constraints.maxHeight * percentHeight) /
                        22.102487564086914;

                    return Stack(children: [
                      TransformHelper.translateAndScale(
                          translateX: constraints.maxWidth * 0.9213805370795286,
                          translateY: constraints.maxHeight * 0.36200195428928816,
                          translateZ: 0,
                          scaleX: scaleX,
                          scaleY: scaleY,
                          scaleZ: 1,
                          child: VectorWidget144())
                    ]);
                  }),
            ),
            Positioned(
              left: 0.0,
              top: 0.0,
              right: 0.0,
              bottom: 0.0,
              width: null,
              height: null,
              child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    double percentWidth = 0.07233856615973705;
                    double scaleX =
                        (constraints.maxWidth * percentWidth) / 25.851787567138672;

                    double percentHeight = 0.0706464118142385;
                    double scaleY =
                        (constraints.maxHeight * percentHeight) / 9.783111572265625;

                    return Stack(children: [
                      TransformHelper.translateAndScale(
                          translateX: constraints.maxWidth * 0.8641387932234421,
                          translateY: constraints.maxHeight * 0.5130728356213078,
                          translateZ: 0,
                          scaleX: scaleX,
                          scaleY: scaleY,
                          scaleZ: 1,
                          child: VectorWidget145())
                    ]);
                  }),
            ),
            Positioned(
              left: 0.0,
              top: 0.0,
              right: 0.0,
              bottom: 0.0,
              width: null,
              height: null,
              child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    double percentWidth = 0.015785884380681396;
                    double scaleX =
                        (constraints.maxWidth * percentWidth) / 5.641435146331787;

                    double percentHeight = 0.1451711556773889;
                    double scaleY = (constraints.maxHeight * percentHeight) /
                        20.103294372558594;

                    return Stack(children: [
                      TransformHelper.translateAndScale(
                          translateX: constraints.maxWidth * 0.9506876383922968,
                          translateY: constraints.maxHeight * 0.5099175002550845,
                          translateZ: 0,
                          scaleX: scaleX,
                          scaleY: scaleY,
                          scaleZ: 1,
                          child: VectorWidget146())
                    ]);
                  }),
            ),
            Positioned(
              left: 0.0,
              top: 0.0,
              right: 0.0,
              bottom: 0.0,
              width: null,
              height: null,
              child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    double percentWidth = 0.1302563774671509;
                    double scaleX =
                        (constraints.maxWidth * percentWidth) / 46.54999923706055;

                    double percentHeight = 0.7980217338653783;
                    double scaleY =
                        (constraints.maxHeight * percentHeight) / 110.510009765625;

                    return Stack(children: [
                      TransformHelper.translateAndScale(
                          translateX: 0,
                          translateY: constraints.maxHeight * 5.289010133866656e-8,
                          translateZ: 0,
                          scaleX: scaleX,
                          scaleY: scaleY,
                          scaleZ: 1,
                          child: VectorWidget147())
                    ]);
                  }),
            ),
            Positioned(
              left: 0.0,
              top: 0.0,
              right: 0.0,
              bottom: 0.0,
              width: null,
              height: null,
              child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    double percentWidth = 0.13028436548119315;
                    double scaleX =
                        (constraints.maxWidth * percentWidth) / 46.560001373291016;

                    double percentHeight = 0.5831891894393451;
                    double scaleY =
                        (constraints.maxHeight * percentHeight) / 80.760009765625;

                    return Stack(children: [
                      TransformHelper.translateAndScale(
                          translateX: 0,
                          translateY: constraints.maxHeight * 0.2148325995198901,
                          translateZ: 0,
                          scaleX: scaleX,
                          scaleY: scaleY,
                          scaleZ: 1,
                          child: VectorWidget148())
                    ]);
                  }),
            ),
            Positioned(
              left: 0.0,
              top: 0.0,
              right: 0.0,
              bottom: 0.0,
              width: null,
              height: null,
              child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    double percentWidth = 0.11404911843092917;
                    double scaleX =
                        (constraints.maxWidth * percentWidth) / 40.75797653198242;

                    double percentHeight = 0.5507083306980105;
                    double scaleY =
                        (constraints.maxHeight * percentHeight) / 76.2620620727539;

                    return Stack(children: [
                      TransformHelper.translateAndScale(
                          translateX: constraints.maxWidth * 0.1315155712415577,
                          translateY: constraints.maxHeight * 0.2473132929796543,
                          translateZ: 0,
                          scaleX: scaleX,
                          scaleY: scaleY,
                          scaleZ: 1,
                          child: VectorWidget149())
                    ]);
                  }),
            ),
            Positioned(
              left: 0.0,
              top: 0.0,
              right: 0.0,
              bottom: 0.0,
              width: null,
              height: null,
              child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    double percentWidth = 0.06797037582928635;
                    double scaleX =
                        (constraints.maxWidth * percentWidth) / 24.29071807861328;

                    double percentHeight = 0.16639616042096997;
                    double scaleY = (constraints.maxHeight * percentHeight) /
                        23.042531967163086;

                    return Stack(children: [
                      TransformHelper.translateAndScale(
                          translateX: constraints.maxWidth * 0.2350491060487414,
                          translateY: constraints.maxHeight * 0.6314087102506087,
                          translateZ: 0,
                          scaleX: scaleX,
                          scaleY: scaleY,
                          scaleZ: 1,
                          child: VectorWidget150())
                    ]);
                  }),
            ),
            Positioned(
              left: 0.0,
              top: 0.0,
              right: 0.0,
              bottom: 0.0,
              width: null,
              height: null,
              child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    double percentWidth = 0.1920031561769611;
                    double scaleX =
                        (constraints.maxWidth * percentWidth) / 68.6165771484375;

                    double percentHeight = 0.6886080338743477;
                    double scaleY =
                        (constraints.maxHeight * percentHeight) / 95.35840606689453;

                    return Stack(children: [
                      TransformHelper.translateAndScale(
                          translateX: 0,
                          translateY: constraints.maxHeight * 0.10941381017874431,
                          translateZ: 0,
                          scaleX: scaleX,
                          scaleY: scaleY,
                          scaleZ: 1,
                          child: VectorWidget151())
                    ]);
                  }),
            ),
            Positioned(
              left: 0.0,
              top: 0.0,
              right: 0.0,
              bottom: 0.0,
              width: null,
              height: null,
              child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    double percentWidth = 0.023036371822581184;
                    double scaleX =
                        (constraints.maxWidth * percentWidth) / 8.23255729675293;

                    double percentHeight = 0.2533758485280354;
                    double scaleY =
                        (constraints.maxHeight * percentHeight) / 35.08747482299805;

                    return Stack(children: [
                      TransformHelper.translateAndScale(
                          translateX: constraints.maxWidth * 0.07333342691136147,
                          translateY: constraints.maxHeight * 0.33136492165323,
                          translateZ: 0,
                          scaleX: scaleX,
                          scaleY: scaleY,
                          scaleZ: 1,
                          child: VectorWidget152())
                    ]);
                  }),
            ),
            Positioned(
              left: 0.0,
              top: 0.0,
              right: 0.0,
              bottom: 0.0,
              width: null,
              height: null,
              child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    double percentWidth = 0.10161108274119435;
                    double scaleX =
                        (constraints.maxWidth * percentWidth) / 36.31296920776367;

                    double percentHeight = 0.18655764712649175;
                    double scaleY =
                        (constraints.maxHeight * percentHeight) / 25.83449363708496;

                    return Stack(children: [
                      TransformHelper.translateAndScale(
                          translateX: constraints.maxWidth * 0.07150014794579505,
                          translateY: constraints.maxHeight * 0.5942080158917128,
                          translateZ: 0,
                          scaleX: scaleX,
                          scaleY: scaleY,
                          scaleZ: 1,
                          child: VectorWidget153())
                    ]);
                  }),
            ),
            Positioned(
              left: 0.0,
              top: 0.0,
              right: 0.0,
              bottom: 0.0,
              width: null,
              height: null,
              child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    double percentWidth = 0.09540147962873931;
                    double scaleX =
                        (constraints.maxWidth * percentWidth) / 34.09383010864258;

                    double percentHeight = 0.8386173116798316;
                    double scaleY = (constraints.maxHeight * percentHeight) /
                        116.13168334960938;

                    return Stack(children: [
                      TransformHelper.translateAndScale(
                          translateX: constraints.maxWidth * 0.05445304033945981,
                          translateY: constraints.maxHeight * 0.16138274341402525,
                          translateZ: 0,
                          scaleX: scaleX,
                          scaleY: scaleY,
                          scaleZ: 1,
                          child: VectorWidget154())
                    ]);
                  }),
            ),
            Positioned(
              left: 0.0,
              top: 0.0,
              right: 0.0,
              bottom: 0.0,
              width: null,
              height: null,
              child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    double percentWidth = 0.06422214349333112;
                    double scaleX =
                        (constraints.maxWidth * percentWidth) / 22.951204299926758;

                    double percentHeight = 0.2677345196730246;
                    double scaleY = (constraints.maxHeight * percentHeight) /
                        37.075862884521484;

                    return Stack(children: [
                      TransformHelper.translateAndScale(
                          translateX: constraints.maxWidth * 0.34781533375973606,
                          translateY: constraints.maxHeight * 0.5982964208165747,
                          translateZ: 0,
                          scaleX: scaleX,
                          scaleY: scaleY,
                          scaleZ: 1,
                          child: VectorWidget155())
                    ]);
                  }),
            ),
            Positioned(
              left: 0.0,
              top: 0.0,
              right: 0.0,
              bottom: 0.0,
              width: null,
              height: null,
              child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    double percentWidth = 0.059533942992407586;
                    double scaleX =
                        (constraints.maxWidth * percentWidth) / 21.275772094726562;

                    double percentHeight = 0.06726789123414867;
                    double scaleY =
                        (constraints.maxHeight * percentHeight) / 9.315254211425781;

                    return Stack(children: [
                      TransformHelper.translateAndScale(
                          translateX: constraints.maxWidth * 0.3713919372317015,
                          translateY: constraints.maxHeight * 0.686413976121441,
                          translateZ: 0,
                          scaleX: scaleX,
                          scaleY: scaleY,
                          scaleZ: 1,
                          child: VectorWidget156())
                    ]);
                  }),
            ),
            Positioned(
              left: 0.0,
              top: 0.0,
              right: 0.0,
              bottom: 0.0,
              width: null,
              height: null,
              child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    double percentWidth = 0.006413921218970878;
                    double scaleX =
                        (constraints.maxWidth * percentWidth) / 2.29215669631958;

                    double percentHeight = 0.13085801960503876;
                    double scaleY = (constraints.maxHeight * percentHeight) /
                        18.121212005615234;

                    return Stack(children: [
                      TransformHelper.translateAndScale(
                          translateX: constraints.maxWidth * 0.37750263228232755,
                          translateY: constraints.maxHeight * 0.5792987367419389,
                          translateZ: 0,
                          scaleX: scaleX,
                          scaleY: scaleY,
                          scaleZ: 1,
                          child: VectorWidget157())
                    ]);
                  }),
            ),
            Positioned(
              left: 0.0,
              top: 0.0,
              right: 0.0,
              bottom: 0.0,
              width: null,
              height: null,
              child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    double percentWidth = 0.0652058762874273;
                    double scaleX =
                        (constraints.maxWidth * percentWidth) / 23.302762985229492;

                    double percentHeight = 0.10462192556996247;
                    double scaleY = (constraints.maxHeight * percentHeight) /
                        14.488039016723633;

                    return Stack(children: [
                      TransformHelper.translateAndScale(
                          translateX: constraints.maxWidth * 0.11325693594651579,
                          translateY: constraints.maxHeight * 0.273146582054256,
                          translateZ: 0,
                          scaleX: scaleX,
                          scaleY: scaleY,
                          scaleZ: 1,
                          child: VectorWidget158())
                    ]);
                  }),
            )
          ]),
    );
  }
}

class RootsrightWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.zero,
      child: Container(
        width: 149.72000122070312,
        height: 481.67999267578125,
        child: Stack(
            fit: StackFit.expand,
            alignment: Alignment.center,
            // overflow: Overflow.visible,
            children: [
              Positioned(
                left: 0.0,
                top: 0.0,
                right: 0.0,
                bottom: 0.0,
                width: null,
                height: null,
                child: LayoutBuilder(builder:
                    (BuildContext context, BoxConstraints constraints) {
                  double percentWidth = 0.9888457559837139;
                  double scaleX = (constraints.maxWidth * percentWidth) /
                      148.04998779296875;

                  double percentHeight = 1.000000063356541;
                  double scaleY = (constraints.maxHeight * percentHeight) /
                      481.6800231933594;

                  return Stack(children: [
                    TransformHelper.translateAndScale(
                        translateX: constraints.maxWidth * 0.013358271844313879,
                        translateY:
                        constraints.maxHeight * -1.267130835566539e-8,
                        translateZ: 0,
                        scaleX: scaleX,
                        scaleY: scaleY,
                        scaleZ: 1,
                        child: VectorWidget159())
                  ]);
                }),
              ),
              Positioned(
                left: 0.0,
                top: 0.0,
                right: 0.0,
                bottom: 0.0,
                width: null,
                height: null,
                child: LayoutBuilder(builder:
                    (BuildContext context, BoxConstraints constraints) {
                  double percentWidth = 0.3649477937841735;
                  double scaleX = (constraints.maxWidth * percentWidth) /
                      54.639984130859375;

                  double percentHeight = 0.6934066748650031;
                  double scaleY = (constraints.maxHeight * percentHeight) /
                      334.0001220703125;

                  return Stack(children: [
                    TransformHelper.translateAndScale(
                        translateX: constraints.maxWidth * 0.6345177613240862,
                        translateY:
                        constraints.maxHeight * -1.267130835566539e-8,
                        translateZ: 0,
                        scaleX: scaleX,
                        scaleY: scaleY,
                        scaleZ: 1,
                        child: VectorWidget160())
                  ]);
                }),
              ),
              Positioned(
                left: 0.0,
                top: 0.0,
                right: 0.0,
                bottom: 0.0,
                width: null,
                height: null,
                child: LayoutBuilder(builder:
                    (BuildContext context, BoxConstraints constraints) {
                  double percentWidth = 0.2415986720410108;
                  double scaleX =
                      (constraints.maxWidth * percentWidth) / 36.17215347290039;

                  double percentHeight = 0.5177711929213004;
                  double scaleY = (constraints.maxHeight * percentHeight) /
                      249.4000244140625;

                  return Stack(children: [
                    TransformHelper.translateAndScale(
                        translateX: constraints.maxWidth * 0.7614213135889034,
                        translateY: constraints.maxHeight * 0.13639755659164618,
                        translateZ: 0,
                        scaleX: scaleX,
                        scaleY: scaleY,
                        scaleZ: 1,
                        child: VectorWidget161())
                  ]);
                }),
              ),
              Positioned(
                left: 0.0,
                top: 0.0,
                right: 0.0,
                bottom: 0.0,
                width: null,
                height: null,
                child: LayoutBuilder(builder:
                    (BuildContext context, BoxConstraints constraints) {
                  double percentWidth = 0.3200287146926483;
                  double scaleX =
                      (constraints.maxWidth * percentWidth) / 47.91469955444336;

                  double percentHeight = 0.6662065714671284;
                  double scaleY = (constraints.maxHeight * percentHeight) /
                      320.89837646484375;

                  return Stack(children: [
                    TransformHelper.translateAndScale(
                        translateX: constraints.maxWidth * 0.6812717016321768,
                        translateY: constraints.maxHeight * 0.05569349198444724,
                        translateZ: 0,
                        scaleX: scaleX,
                        scaleY: scaleY,
                        scaleZ: 1,
                        child: VectorWidget162())
                  ]);
                }),
              ),
              Positioned(
                left: 0.0,
                top: 0.0,
                right: 0.0,
                bottom: 0.0,
                width: null,
                height: null,
                child: LayoutBuilder(builder:
                    (BuildContext context, BoxConstraints constraints) {
                  double percentWidth = 0.17880292599405834;
                  double scaleX = (constraints.maxWidth * percentWidth) /
                      26.770374298095703;

                  double percentHeight = 0.42365086998034046;
                  double scaleY = (constraints.maxHeight * percentHeight) /
                      204.06414794921875;

                  return Stack(children: [
                    TransformHelper.translateAndScale(
                        translateX: constraints.maxWidth * 0.8215335225564484,
                        translateY: constraints.maxHeight * 0.22834665087821668,
                        translateZ: 0,
                        scaleX: scaleX,
                        scaleY: scaleY,
                        scaleZ: 1,
                        child: VectorWidget163())
                  ]);
                }),
              )
            ]),
      ),
    );
  }
}

class BranchWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.zero,
      child: Container(
        width: 429.989990234375,
        height: 255.8800048828125,
        child: Stack(
            fit: StackFit.expand,
            alignment: Alignment.center,
            // overflow: Overflow.visible,
            children: [
              Positioned(
                left: 0.0,
                top: 0.0,
                right: 0.0,
                bottom: 0.0,
                width: null,
                height: null,
                child: LayoutBuilder(builder:
                    (BuildContext context, BoxConstraints constraints) {
                  double percentWidth = 0.32671683825988407;
                  double scaleX = (constraints.maxWidth * percentWidth) /
                      140.48497009277344;

                  double percentHeight = 0.22919063897042652;
                  double scaleY = (constraints.maxHeight * percentHeight) /
                      58.645301818847656;

                  return Stack(children: [
                    TransformHelper.translateAndScale(
                        translateX:
                        constraints.maxWidth * -0.000010762398701308537,
                        translateY: constraints.maxHeight * 0.5422089058658915,
                        translateZ: 0,
                        scaleX: scaleX,
                        scaleY: scaleY,
                        scaleZ: 1,
                        child: VectorWidget164())
                  ]);
                }),
              ),
              Positioned(
                left: 0.0,
                top: 0.0,
                right: 0.0,
                bottom: 0.0,
                width: null,
                height: null,
                child: LayoutBuilder(builder:
                    (BuildContext context, BoxConstraints constraints) {
                  double percentWidth = 0.05315253210949791;
                  double scaleX = (constraints.maxWidth * percentWidth) /
                      22.855056762695312;

                  double percentHeight = 0.09847112756652732;
                  double scaleY = (constraints.maxHeight * percentHeight) /
                      25.196792602539062;

                  return Stack(children: [
                    TransformHelper.translateAndScale(
                        translateX: constraints.maxWidth * 0.06046050003718973,
                        translateY: constraints.maxHeight * 0.7736049073333304,
                        translateZ: 0,
                        scaleX: scaleX,
                        scaleY: scaleY,
                        scaleZ: 1,
                        child: VectorWidget165())
                  ]);
                }),
              ),
              Positioned(
                left: 0.0,
                top: 0.0,
                right: 0.0,
                bottom: 0.0,
                width: null,
                height: null,
                child: LayoutBuilder(builder:
                    (BuildContext context, BoxConstraints constraints) {
                  double percentWidth = 0.05115617027984277;
                  double scaleX = (constraints.maxWidth * percentWidth) /
                      21.996641159057617;

                  double percentHeight = 0.08789188007980273;
                  double scaleY = (constraints.maxHeight * percentHeight) /
                      22.489774703979492;

                  return Stack(children: [
                    TransformHelper.translateAndScale(
                        translateX: constraints.maxWidth * 0.05079893774354304,
                        translateY: constraints.maxHeight * 0.7608279079597112,
                        translateZ: 0,
                        scaleX: scaleX,
                        scaleY: scaleY,
                        scaleZ: 1,
                        child: VectorWidget166())
                  ]);
                }),
              ),
              Positioned(
                left: 0.0,
                top: 0.0,
                right: 0.0,
                bottom: 0.0,
                width: null,
                height: null,
                child: LayoutBuilder(builder:
                    (BuildContext context, BoxConstraints constraints) {
                  double percentWidth = 0.030578930336825384;
                  double scaleX =
                      (constraints.maxWidth * percentWidth) / 13.14863395690918;

                  double percentHeight = 0.06546352387379072;
                  double scaleY = (constraints.maxHeight * percentHeight) /
                      16.75080680847168;

                  return Stack(children: [
                    TransformHelper.translateAndScale(
                        translateX: constraints.maxWidth * 0.11535939685073973,
                        translateY: constraints.maxHeight * 0.6560923165069229,
                        translateZ: 0,
                        scaleX: scaleX,
                        scaleY: scaleY,
                        scaleZ: 1,
                        child: VectorWidget167())
                  ]);
                }),
              ),
              Positioned(
                left: 0.0,
                top: 0.0,
                right: 0.0,
                bottom: 0.0,
                width: null,
                height: null,
                child: LayoutBuilder(builder:
                    (BuildContext context, BoxConstraints constraints) {
                  double percentWidth = 0.02850516161846859;
                  double scaleX =
                      (constraints.maxWidth * percentWidth) / 12.25693416595459;

                  double percentHeight = 0.06526570018925001;
                  double scaleY = (constraints.maxHeight * percentHeight) /
                      16.70018768310547;

                  return Stack(children: [
                    TransformHelper.translateAndScale(
                        translateX: constraints.maxWidth * 0.11049815286284258,
                        translateY: constraints.maxHeight * 0.6685426485173667,
                        translateZ: 0,
                        scaleX: scaleX,
                        scaleY: scaleY,
                        scaleZ: 1,
                        child: VectorWidget168())
                  ]);
                }),
              ),
              Positioned(
                left: 0.0,
                top: 0.0,
                right: 0.0,
                bottom: 0.0,
                width: null,
                height: null,
                child: LayoutBuilder(builder:
                    (BuildContext context, BoxConstraints constraints) {
                  double percentWidth = 0.43721948015005346;
                  double scaleX = (constraints.maxWidth * percentWidth) / 188.0;

                  double percentHeight = 0.24620915584573572;
                  double scaleY =
                      (constraints.maxHeight * percentHeight) / 63.0;

                  return Stack(children: [
                    TransformHelper.translateAndScale(
                        translateX: constraints.maxWidth * 0.49303473293516664,
                        translateY: constraints.maxHeight * 0.6917304854713527,
                        translateZ: 0,
                        scaleX: scaleX,
                        scaleY: scaleY,
                        scaleZ: 1,
                        child: VectorWidget169())
                  ]);
                }),
              ),
              Positioned(
                left: 0.0,
                top: 0.0,
                right: 0.0,
                bottom: 0.0,
                width: null,
                height: null,
                child: LayoutBuilder(builder:
                    (BuildContext context, BoxConstraints constraints) {
                  double percentWidth = 0.034585367264891365;
                  double scaleX =
                      (constraints.maxWidth * percentWidth) / 14.87136173248291;

                  double percentHeight = 0.07085277505058037;
                  double scaleY = (constraints.maxHeight * percentHeight) /
                      18.12980842590332;

                  return Stack(children: [
                    TransformHelper.translateAndScale(
                        translateX: constraints.maxWidth * 0.7643852566289981,
                        translateY: constraints.maxHeight * 0.8397397227990682,
                        translateZ: 0,
                        scaleX: scaleX,
                        scaleY: scaleY,
                        scaleZ: 1,
                        child: VectorWidget170())
                  ]);
                }),
              ),
              Positioned(
                left: 0.0,
                top: 0.0,
                right: 0.0,
                bottom: 0.0,
                width: null,
                height: null,
                child: LayoutBuilder(builder:
                    (BuildContext context, BoxConstraints constraints) {
                  double percentWidth = 0.03660224909495531;
                  double scaleX = (constraints.maxWidth * percentWidth) /
                      15.738600730895996;

                  double percentHeight = 0.06912180476621875;
                  double scaleY = (constraints.maxHeight * percentHeight) /
                      17.686887741088867;

                  return Stack(children: [
                    TransformHelper.translateAndScale(
                        translateX: constraints.maxWidth * 0.773714697437429,
                        translateY: constraints.maxHeight * 0.8543231127833681,
                        translateZ: 0,
                        scaleX: scaleX,
                        scaleY: scaleY,
                        scaleZ: 1,
                        child: VectorWidget171())
                  ]);
                }),
              ),
              Positioned(
                left: 0.0,
                top: 0.0,
                right: 0.0,
                bottom: 0.0,
                width: null,
                height: null,
                child: LayoutBuilder(builder:
                    (BuildContext context, BoxConstraints constraints) {
                  double percentWidth = 0.04001197807339038;
                  double scaleX = (constraints.maxWidth * percentWidth) /
                      17.204750061035156;

                  double percentHeight = 0.061585090616500866;
                  double scaleY = (constraints.maxHeight * percentHeight) /
                      15.758393287658691;

                  return Stack(children: [
                    TransformHelper.translateAndScale(
                        translateX: constraints.maxWidth * 0.8199080306534207,
                        translateY: constraints.maxHeight * 0.9384022113674995,
                        translateZ: 0,
                        scaleX: scaleX,
                        scaleY: scaleY,
                        scaleZ: 1,
                        child: VectorWidget172())
                  ]);
                }),
              ),
              Positioned(
                left: 0.0,
                top: 0.0,
                right: 0.0,
                bottom: 0.0,
                width: null,
                height: null,
                child: LayoutBuilder(builder:
                    (BuildContext context, BoxConstraints constraints) {
                  double percentWidth = 0.04924836915234105;
                  double scaleX = (constraints.maxWidth * percentWidth) /
                      21.176305770874023;

                  double percentHeight = 0.05793736469363873;
                  double scaleY = (constraints.maxHeight * percentHeight) /
                      14.825013160705566;

                  return Stack(children: [
                    TransformHelper.translateAndScale(
                        translateX: constraints.maxWidth * 0.8316765924442964,
                        translateY: constraints.maxHeight * 0.9218783766957721,
                        translateZ: 0,
                        scaleX: scaleX,
                        scaleY: scaleY,
                        scaleZ: 1,
                        child: VectorWidget173())
                  ]);
                }),
              ),
              Positioned(
                left: 0.0,
                top: 0.0,
                right: 0.0,
                bottom: 0.0,
                width: null,
                height: null,
                child: LayoutBuilder(builder:
                    (BuildContext context, BoxConstraints constraints) {
                  double percentWidth = 0.18301448582503568;
                  double scaleX =
                      (constraints.maxWidth * percentWidth) / 78.69439697265625;

                  double percentHeight = 0.32576640409241814;
                  double scaleY = (constraints.maxHeight * percentHeight) /
                      83.35710906982422;

                  return Stack(children: [
                    TransformHelper.translateAndScale(
                        translateX: constraints.maxWidth * 0.8157994883147602,
                        translateY:
                        constraints.maxHeight * 0.007911771501367494,
                        translateZ: 0,
                        scaleX: scaleX,
                        scaleY: scaleY,
                        scaleZ: 1,
                        child: VectorWidget174())
                  ]);
                }),
              ),
              Positioned(
                left: 0.0,
                top: 0.0,
                right: 0.0,
                bottom: 0.0,
                width: null,
                height: null,
                child: LayoutBuilder(builder:
                    (BuildContext context, BoxConstraints constraints) {
                  double percentWidth = 0.034585367264891365;
                  double scaleX =
                      (constraints.maxWidth * percentWidth) / 14.87136173248291;

                  double percentHeight = 0.07083815015630897;
                  double scaleY = (constraints.maxHeight * percentHeight) /
                      18.126066207885742;

                  return Stack(children: [
                    TransformHelper.translateAndScale(
                        translateX: constraints.maxWidth * 0.781408925761921,
                        translateY: constraints.maxHeight * 0.1398022863375997,
                        translateZ: 0,
                        scaleX: scaleX,
                        scaleY: scaleY,
                        scaleZ: 1,
                        child: VectorWidget175())
                  ]);
                }),
              ),
              Positioned(
                left: 0.0,
                top: 0.0,
                right: 0.0,
                bottom: 0.0,
                width: null,
                height: null,
                child: LayoutBuilder(builder:
                    (BuildContext context, BoxConstraints constraints) {
                  double percentWidth = 0.03660224909495531;
                  double scaleX = (constraints.maxWidth * percentWidth) /
                      15.738600730895996;

                  double percentHeight = 0.06909918910402739;
                  double scaleY = (constraints.maxHeight * percentHeight) /
                      17.681100845336914;

                  return Stack(children: [
                    TransformHelper.translateAndScale(
                        translateX: constraints.maxWidth * 0.7907383665703519,
                        translateY: constraints.maxHeight * 0.15439590331218522,
                        translateZ: 0,
                        scaleX: scaleX,
                        scaleY: scaleY,
                        scaleZ: 1,
                        child: VectorWidget176())
                  ]);
                }),
              ),
              Positioned(
                left: 0.0,
                top: 0.0,
                right: 0.0,
                bottom: 0.0,
                width: null,
                height: null,
                child: LayoutBuilder(builder:
                    (BuildContext context, BoxConstraints constraints) {
                  double percentWidth = 0.04001672881278464;
                  double scaleX =
                      (constraints.maxWidth * percentWidth) / 17.2067928314209;

                  double percentHeight = 0.06158390169160979;
                  double scaleY = (constraints.maxHeight * percentHeight) /
                      15.758089065551758;

                  return Stack(children: [
                    TransformHelper.translateAndScale(
                        translateX: constraints.maxWidth * 0.8811902444812998,
                        translateY: constraints.maxHeight * 0.19853088240976755,
                        translateZ: 0,
                        scaleX: scaleX,
                        scaleY: scaleY,
                        scaleZ: 1,
                        child: VectorWidget177())
                  ]);
                }),
              ),
              Positioned(
                left: 0.0,
                top: 0.0,
                right: 0.0,
                bottom: 0.0,
                width: null,
                height: null,
                child: LayoutBuilder(builder:
                    (BuildContext context, BoxConstraints constraints) {
                  double percentWidth = 0.04923241358782084;
                  double scaleX = (constraints.maxWidth * percentWidth) /
                      21.169445037841797;

                  double percentHeight = 0.057959842455450876;
                  double scaleY = (constraints.maxHeight * percentHeight) /
                      14.830764770507812;

                  return Stack(children: [
                    TransformHelper.translateAndScale(
                        translateX: constraints.maxWidth * 0.8602013979931173,
                        translateY: constraints.maxHeight * 0.2186643377752462,
                        translateZ: 0,
                        scaleX: scaleX,
                        scaleY: scaleY,
                        scaleZ: 1,
                        child: VectorWidget178())
                  ]);
                }),
              )
            ]),
      ),
    );
  }
}

class Rectangle1Widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 390.0,
      height: 844.0,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.0, -1.0),
          end: Alignment(0.0, 0.9999999999999998),
          stops: [0.0, 1.0],
          colors: [
            Color.fromARGB(178, 255, 255, 255),
            Color.fromARGB(255, 255, 255, 255)
          ],
        ),
      ),
    );
  }
}

class Group4Widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 230.0,
      height: 190.0,
      child: Stack(
          fit: StackFit.expand,
          alignment: Alignment.center,
          // overflow: Overflow.visible,
          children: [
            Positioned(
              left: 0.0,
              top: 0.0,
              right: 0.0,
              bottom: 0.0,
              width: null,
              height: null,
              child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    final double width = constraints.maxWidth;

                    final double height =
                        constraints.maxHeight * 0.2631578947368421;

                    return Stack(children: [
                      TransformHelper.translate(
                          x: 0,
                          y: 0,
                          z: 0,
                          child: Container(
                            width: width,
                            height: height,
                            child: Group1Widget(),
                          ))
                    ]);
                  }),
            ),
            Positioned(
              left: 0.0,
              top: 0.0,
              right: 0.0,
              bottom: 0.0,
              width: null,
              height: null,
              child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    final double width = constraints.maxWidth;

                    final double height =
                        constraints.maxHeight * 0.2631578947368421;

                    return Stack(children: [
                      TransformHelper.translate(
                          x: 0,
                          y: constraints.maxHeight * 0.3684210526315789,
                          z: 0,
                          child: Container(
                            width: width,
                            height: height,
                            child: Group2Widget(),
                          ))
                    ]);
                  }),
            ),
            Positioned(
              left: 0.0,
              top: 0.0,
              right: 0.0,
              bottom: 0.0,
              width: null,
              height: null,
              child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    final double width = constraints.maxWidth;

                    final double height =
                        constraints.maxHeight * 0.2631578947368421;

                    return Stack(children: [
                      TransformHelper.translate(
                          x: 0,
                          y: constraints.maxHeight * 0.7368421052631579,
                          z: 0,
                          child: Container(
                            width: width,
                            height: height,
                            child: Group3Widget(),
                          ))
                    ]);
                  }),
            )
          ]),
    );
  }
}
class Group1Widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 230.0,
      height: 50.0,
      child: Stack(
          fit: StackFit.expand,
          alignment: Alignment.center,
          // overflow: Overflow.visible,
          children: [
            Positioned(
              left: 0.0,
              top: 0.0,
              right: 0.0,
              bottom: 0.0,
              width: null,
              height: null,
              child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    final double width = constraints.maxWidth;

                    final double height = constraints.maxHeight;

                    return Stack(children: [
                      TransformHelper.translate(
                          x: 0,
                          y: 0,
                          z: 0,
                          child: Container(
                            width: width,
                            height: height,
                            child: LoginasaguestWidget(),
                          ))
                    ]);
                  }),
            ),
            Positioned(
              left: 0.0,
              top: 0.0,
              right: 0.0,
              bottom: 0.0,
              width: null,
              height: null,
              child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    final double width = constraints.maxWidth * 0.45217391304347826;

                    final double height = constraints.maxHeight * 0.4;

                    return Stack(children: [
                      TransformHelper.translate(
                          x: constraints.maxWidth * 0.2782608695652174,
                          y: constraints.maxHeight * 0.32,
                          z: 0,
                          child: Container(
                            width: width,
                            height: height,
                            child: PlayasaguestWidget(),
                          ))
                    ]);
                  }),
            )
          ]),
    );
  }
}
class LoginasaguestWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 230.0,
      height: 50.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.0),
        boxShadow: kIsWeb
            ? []
            : [
          BoxShadow(
            color: Color.fromARGB(38, 0, 0, 0),
            offset: Offset(2.0, 6.0),
            blurRadius: 14.0,
          )
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100.0),
        child: Container(
          color: Color.fromARGB(255, 255, 255, 255),
        ),
      ),
    );
  }
}
class PlayasaguestWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      '''Play as a guest''',
      overflow: TextOverflow.visible,
      textAlign: TextAlign.center,
      style: TextStyle(
        height: 1.171875,
        fontSize: 15.0,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w600,
        color: Color.fromARGB(255, 151, 151, 151),

        /* letterSpacing: 0.0, */
      ),
    );
  }
}
class Group2Widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          Navigator.pushNamed(context, '/GeneratedIPhone1313Pro2Widget'),
      child: Container(
        width: 230.0,
        height: 50.0,
        child: Stack(
            fit: StackFit.expand,
            alignment: Alignment.center,
            // overflow: Overflow.visible,
            children: [
              Positioned(
                left: 0.0,
                top: 0.0,
                right: 0.0,
                bottom: 0.0,
                width: null,
                height: null,
                child: LayoutBuilder(builder:
                    (BuildContext context, BoxConstraints constraints) {
                  final double width = constraints.maxWidth;

                  final double height = constraints.maxHeight;

                  return Stack(children: [
                    TransformHelper.translate(
                        x: 0,
                        y: 0,
                        z: 0,
                        child: Container(
                          width: width,
                          height: height,
                          child: SignupWidget(),
                        ))
                  ]);
                }),
              ),
              Positioned(
                left: 0.0,
                top: 0.0,
                right: 0.0,
                bottom: 0.0,
                width: null,
                height: null,
                child: LayoutBuilder(builder:
                    (BuildContext context, BoxConstraints constraints) {
                  final double width =
                      constraints.maxWidth * 0.23043478260869565;

                  final double height = constraints.maxHeight * 0.4;

                  return Stack(children: [
                    TransformHelper.translate(
                        x: constraints.maxWidth * 0.391304347826087,
                        y: constraints.maxHeight * 0.32,
                        z: 0,
                        child: Container(
                          width: width,
                          height: height,
                          child: SignupWidget1(),
                        ))
                  ]);
                }),
              )
            ]),
      ),
    );
  }
}
class SignupWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 230.0,
      height: 50.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.0),
        boxShadow: kIsWeb
            ? []
            : [
          BoxShadow(
            color: Color.fromARGB(38, 0, 0, 0),
            offset: Offset(2.0, 6.0),
            blurRadius: 14.0,
          )
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100.0),
        child: Container(
          color: Color.fromARGB(255, 255, 255, 255),
        ),
      ),
    );
  }
}
class SignupWidget1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      '''Sign up''',
      overflow: TextOverflow.visible,
      textAlign: TextAlign.center,
      style: TextStyle(
        height: 1.171875,
        fontSize: 15.0,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w600,
        color: Color.fromARGB(255, 30, 119, 87),

        /* letterSpacing: 0.0, */
      ),
    );
  }
}
class Group3Widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          Navigator.pushNamed(context, '/GeneratedIPhone1313Pro3Widget'),
      child: Container(
        width: 230.0,
        height: 50.0,
        child: Stack(
            fit: StackFit.expand,
            alignment: Alignment.center,
            // overflow: Overflow.visible,
            children: [
              Positioned(
                left: 0.0,
                top: 0.0,
                right: 0.0,
                bottom: 0.0,
                width: null,
                height: null,
                child: LayoutBuilder(builder:
                    (BuildContext context, BoxConstraints constraints) {
                  final double width = constraints.maxWidth;

                  final double height = constraints.maxHeight;

                  return Stack(children: [
                    TransformHelper.translate(
                        x: 0,
                        y: 0,
                        z: 0,
                        child: Container(
                          width: width,
                          height: height,
                          child: LoginWidget(),
                        ))
                  ]);
                }),
              ),
              Positioned(
                left: 0.0,
                top: 0.0,
                right: 0.0,
                bottom: 0.0,
                width: null,
                height: null,
                child: LayoutBuilder(builder:
                    (BuildContext context, BoxConstraints constraints) {
                  final double width =
                      constraints.maxWidth * 0.18695652173913044;

                  final double height = constraints.maxHeight * 0.46;

                  return Stack(children: [
                    TransformHelper.translate(
                        x: constraints.maxWidth * 0.41739130434782606,
                        y: constraints.maxHeight * 0.32,
                        z: 0,
                        child: Container(
                          width: width,
                          height: height,
                          child: LoginWidget1(),
                        ))
                  ]);
                }),
              )
            ]),
      ),
    );
  }
}
class LoginWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 230.0,
      height: 50.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.0),
        boxShadow: kIsWeb
            ? []
            : [
          BoxShadow(
            color: Color.fromARGB(38, 0, 0, 0),
            offset: Offset(2.0, 6.0),
            blurRadius: 14.0,
          )
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100.0),
        child: Container(
          color: Color.fromARGB(255, 30, 119, 87),
        ),
      ),
    );
  }
}
class LoginWidget1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      '''Login''',
      overflow: TextOverflow.visible,
      textAlign: TextAlign.center,
      style: TextStyle(
        height: 1.171875,
        fontSize: 15.0,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w600,
        color: Color.fromARGB(255, 255, 255, 255),

        /* letterSpacing: 0.0, */
      ),
    );
  }
}

class NAmeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 230.0,
      height: 50.0,
      child: Stack(
          fit: StackFit.expand,
          alignment: Alignment.center,
          // overflow: Overflow.visible,
          children: [
            Positioned(
              left: 0.0,
              top: 0.0,
              right: 0.0,
              bottom: 0.0,
              width: null,
              height: null,
              child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    final double width = constraints.maxWidth;

                    final double height = constraints.maxHeight;

                    return Stack(children: [
                      TransformHelper.translate(
                          x: 0,
                          y: 0,
                          z: 0,
                          child: Container(
                            width: width,
                            height: height,
                            child: LoginasaguestWidget1(),
                          ))
                    ]);
                  }),
            ),
            Positioned(
              left: 0.0,
              top: 0.0,
              right: 0.0,
              bottom: 0.0,
              width: null,
              height: null,
              child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    final double width = constraints.maxWidth * 0.1956521739130435;

                    final double height = constraints.maxHeight * 0.46;

                    return Stack(children: [
                      TransformHelper.translate(
                          x: constraints.maxWidth * 0.41304347826086957,
                          y: constraints.maxHeight * 0.32,
                          z: 0,
                          child: Container(
                            width: width,
                            height: height,
                            // child: NameWidget(),
                          ))
                    ]);
                  }),
            )
          ]),
    );
  }
}
class LoginasaguestWidget1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 230.0,
      height: 50.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.0),
        boxShadow: kIsWeb
            ? []
            : [
          BoxShadow(
            color: Color.fromARGB(38, 0, 0, 0),
            offset: Offset(2.0, 6.0),
            blurRadius: 14.0,
          )
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100.0),
        child: Container(
          color: Color.fromARGB(255, 255, 255, 255),
        ),
      ),
    );
  }
}

class EmailWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 230.0,
      height: 50.0,
      child: Stack(
          fit: StackFit.expand,
          alignment: Alignment.center,
          // overflow: Overflow.visible,
          children: [
            Positioned(
              left: 0.0,
              top: 0.0,
              right: 0.0,
              bottom: 0.0,
              width: null,
              height: null,
              child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    final double width = constraints.maxWidth;

                    final double height = constraints.maxHeight;

                    return Stack(children: [
                      TransformHelper.translate(
                          x: 0,
                          y: 0,
                          z: 0,
                          child: Container(
                            width: width,
                            height: height,
                            child: SignupWidget2(),
                          ))
                    ]);
                  }),
            ),
            Positioned(
              left: 0.0,
              top: 0.0,
              right: 0.0,
              bottom: 0.0,
              width: null,
              height: null,
              child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    final double width = constraints.maxWidth * 0.18695652173913044;

                    final double height = constraints.maxHeight * 0.46;

                    return Stack(children: [
                      TransformHelper.translate(
                          x: constraints.maxWidth * 0.41739130434782606,
                          y: constraints.maxHeight * 0.32,
                          z: 0,
                          child: Container(
                            width: width,
                            height: height,
                            child: EmailWidget1(),
                          ))
                    ]);
                  }),
            )
          ]),
    );
  }
}
class SignupWidget2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 230.0,
      height: 50.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.0),
        boxShadow: kIsWeb
            ? []
            : [
          BoxShadow(
            color: Color.fromARGB(38, 0, 0, 0),
            offset: Offset(2.0, 6.0),
            blurRadius: 14.0,
          )
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100.0),
        child: Container(
          color: Color.fromARGB(255, 255, 255, 255),
        ),
      ),
    );
  }
}
class EmailWidget1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      '''Email''',
      overflow: TextOverflow.visible,
      textAlign: TextAlign.center,
      style: TextStyle(
        height: 1.171875,
        fontSize: 15.0,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w600,
        color: Color.fromARGB(255, 151, 151, 151),

        /* letterSpacing: 0.0, */
      ),
    );
  }
}

class PasswordWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 230.0,
      height: 50.0,
      child: Stack(
          fit: StackFit.expand,
          alignment: Alignment.center,
          // overflow: Overflow.visible,
          children: [
            Positioned(
              left: 0.0,
              top: 0.0,
              right: 0.0,
              bottom: 0.0,
              width: null,
              height: null,
              child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    final double width = constraints.maxWidth;

                    final double height = constraints.maxHeight;

                    return Stack(children: [
                      TransformHelper.translate(
                          x: 0,
                          y: 0,
                          z: 0,
                          child: Container(
                            width: width,
                            height: height,
                            child: LoginWidget2(),
                          ))
                    ]);
                  }),
            ),
            Positioned(
              left: 0.0,
              top: 0.0,
              right: 0.0,
              bottom: 0.0,
              width: null,
              height: null,
              child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    final double width = constraints.maxWidth * 0.3130434782608696;

                    final double height = constraints.maxHeight * 0.46;

                    return Stack(children: [
                      TransformHelper.translate(
                          x: constraints.maxWidth * 0.3565217391304348,
                          y: constraints.maxHeight * 0.32,
                          z: 0,
                          child: Container(
                            width: width,
                            height: height,
                            child: PasswordWidget1(),
                          ))
                    ]);
                  }),
            )
          ]),
    );
  }
}
class LoginWidget2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 230.0,
      height: 50.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.0),
        boxShadow: kIsWeb
            ? []
            : [
          BoxShadow(
            color: Color.fromARGB(38, 0, 0, 0),
            offset: Offset(2.0, 6.0),
            blurRadius: 14.0,
          )
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100.0),
        child: Container(
          color: Color.fromARGB(255, 255, 255, 255),
        ),
      ),
    );
  }
}
class PasswordWidget1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      '''Password''',
      overflow: TextOverflow.visible,
      textAlign: TextAlign.center,
      style: TextStyle(
        height: 1.171875,
        fontSize: 15.0,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w600,
        color: Color.fromARGB(255, 151, 151, 151),

        /* letterSpacing: 0.0, */
      ),
    );
  }
}

class ConfirmWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 156.0,
      height: 50.0,
      child: Stack(
          fit: StackFit.expand,
          alignment: Alignment.center,
          // overflow: Overflow.visible,
          children: [
            Positioned(
              left: 0.0,
              top: 0.0,
              right: 0.0,
              bottom: 0.0,
              width: null,
              height: null,
              child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    final double width = constraints.maxWidth;

                    final double height = constraints.maxHeight;

                    return Stack(children: [
                      TransformHelper.translate(
                          x: 0,
                          y: 0,
                          z: 0,
                          child: Container(
                            width: width,
                            height: height,
                            child: LoginWidget3(),
                          ))
                    ]);
                  }),
            ),
            Positioned(
              left: 0.0,
              top: 0.0,
              right: 0.0,
              bottom: 0.0,
              width: null,
              height: null,
              child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    final double width = constraints.maxWidth * 0.38461538461538464;

                    final double height = constraints.maxHeight * 0.46;

                    return Stack(children: [
                      TransformHelper.translate(
                          x: constraints.maxWidth * 0.3269230769230769,
                          y: constraints.maxHeight * 0.32,
                          z: 0,
                          child: Container(
                            width: width,
                            height: height,
                            child: ConfirmWidget1(),
                          ))
                    ]);
                  }),
            )
          ]),
    );
  }
}
class LoginWidget3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 156.0,
      height: 50.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.0),
        boxShadow: kIsWeb
            ? []
            : [
          BoxShadow(
            color: Color.fromARGB(38, 0, 0, 0),
            offset: Offset(2.0, 6.0),
            blurRadius: 14.0,
          )
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100.0),
        child: Container(
          color: Color.fromARGB(255, 30, 119, 87),
        ),
      ),
    );
  }
}
class ConfirmWidget1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      '''Confirm''',
      overflow: TextOverflow.visible,
      textAlign: TextAlign.center,
      style: TextStyle(
        height: 1.171875,
        fontSize: 15.0,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w600,
        color: Color.fromARGB(255, 255, 255, 255),

        /* letterSpacing: 0.0, */
      ),
    );
  }
}

class BackbuttonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50.0,
      height: 50.0,
      child: Stack(
          fit: StackFit.expand,
          alignment: Alignment.center,
          // overflow: Overflow.visible,
          children: [
            Positioned(
              left: 0.0,
              top: 0.0,
              right: null,
              bottom: null,
              width: 50.0,
              height: 50.0,
              child: Ellipse1Widget(),
            ),
            Positioned(
              left: 19.0,
              top: 19.0,
              right: null,
              bottom: null,
              width: 12.0,
              height: 11.0,
              child: Group5Widget(),
            )
          ]),
    );
  }
}
class Ellipse1Widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50.0,
      height: 50.0,
      decoration: BoxDecoration(
        boxShadow: kIsWeb
            ? []
            : [
          BoxShadow(
            color: Color.fromARGB(38, 0, 0, 0),
            offset: Offset(2.0, 6.0),
            blurRadius: 14.0,
          )
        ],
      ),
      child: SvgWidget(painters: [
        SvgPathPainter.fill()
          ..addPath(
              'M50 25C50 38.8071 38.8071 50 25 50C11.1929 50 0 38.8071 0 25C0 11.1929 11.1929 0 25 0C38.8071 0 50 11.1929 50 25Z')
          ..color = Color.fromARGB(255, 255, 255, 255),
      ]),
    );
  }
}
class Group5Widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 12.0,
      height: 11.0,
      child: Stack(
          fit: StackFit.expand,
          alignment: Alignment.center,
          // overflow: Overflow.visible,
          children: [
            Positioned(
              left: 0.0,
              top: 1.0543070061430626e-7,
              right: null,
              bottom: null,
              width: 15.556349754333496,
              height: 2.0,
              child: Line1Widget(),
            ),
            Positioned(
              left: 1.000000238418579,
              top: 11.0,
              right: null,
              bottom: null,
              width: 15.556349754333496,
              height: 2.0,
              child: Line2Widget(),
            )
          ]),
    );
  }
}

class Line1Widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TransformHelper.rotate(
        a: 0.71,
        b: -0.71,
        c: 0.71,
        d: 0.71,
        child: Container(
          width: 15.556349754333496,
          height: 2.0,
          child: SvgWidget(painters: [
            SvgPathPainter.stroke(
              2.0,
              strokeJoin: StrokeJoin.miter,
            )
              ..addPath('M0 0L15.5563 0L15.5563 -2L0 -2L0 0Z')
              ..color = Color.fromARGB(255, 130, 130, 130),
          ]),
        ));
  }
}
class Line2Widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TransformHelper.rotate(
        a: 0.71,
        b: 0.71,
        c: -0.71,
        d: 0.71,
        child: Container(
          width: 15.556349754333496,
          height: 2.0,
          child: SvgWidget(painters: [
            SvgPathPainter.stroke(
              2.0,
              strokeJoin: StrokeJoin.miter,
            )
              ..addPath('M0 0L15.5563 0L15.5563 -2L0 -2L0 0Z')
              ..color = Color.fromARGB(255, 130, 130, 130),
          ]),
        ));
  }
}

class Group5Widget1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 230.0,
      height: 190.0,
      child: Stack(
          fit: StackFit.expand,
          alignment: Alignment.center,
          // overflow: Overflow.visible,
          children: [
            Positioned(
              left: 0.0,
              top: 0.0,
              right: 0.0,
              bottom: 0.0,
              width: null,
              height: null,
              child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    final double width = constraints.maxWidth;

                    final double height =
                        constraints.maxHeight * 0.2631578947368421;

                    return Stack(children: [
                      TransformHelper.translate(
                          x: 0,
                          y: 0,
                          z: 0,
                          child: Container(
                            width: width,
                            height: height,
                            child: Group1Widget1(),
                          ))
                    ]);
                  }),
            ),
            Positioned(
              left: 0.0,
              top: 0.0,
              right: 0.0,
              bottom: 0.0,
              width: null,
              height: null,
              child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    final double width = constraints.maxWidth;

                    final double height =
                        constraints.maxHeight * 0.2631578947368421;

                    return Stack(children: [
                      TransformHelper.translate(
                          x: 0,
                          y: constraints.maxHeight * 0.3684210526315789,
                          z: 0,
                          child: Container(
                            width: width,
                            height: height,
                            child: Group2Widget1(),
                          ))
                    ]);
                  }),
            ),
            Positioned(
              left: 0.0,
              top: 0.0,
              right: 0.0,
              bottom: 0.0,
              width: null,
              height: null,
              child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    final double width = constraints.maxWidth * 0.6782608695652174;

                    final double height =
                        constraints.maxHeight * 0.2631578947368421;

                    return Stack(children: [
                      TransformHelper.translate(
                          x: constraints.maxWidth * 0.3217391304347826,
                          y: constraints.maxHeight * 0.7368421052631579,
                          z: 0,
                          child: Container(
                            width: width,
                            height: height,
                            child: Group3Widget1(),
                          ))
                    ]);
                  }),
            )
          ]),
    );
  }
}
class Group1Widget1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 230.0,
      height: 50.0,
      child: Stack(
          fit: StackFit.expand,
          alignment: Alignment.center,
          // overflow: Overflow.visible,
          children: [
            Positioned(
              left: 0.0,
              top: 0.0,
              right: 0.0,
              bottom: 0.0,
              width: null,
              height: null,
              child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    final double width = constraints.maxWidth;

                    final double height = constraints.maxHeight;

                    return Stack(children: [
                      TransformHelper.translate(
                          x: 0,
                          y: 0,
                          z: 0,
                          child: Container(
                            width: width,
                            height: height,
                            child: LoginasaguestWidget2(),
                          ))
                    ]);
                  }),
            ),
            Positioned(
              left: 0.0,
              top: 0.0,
              right: 0.0,
              bottom: 0.0,
              width: null,
              height: null,
              child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    final double width = constraints.maxWidth * 0.18695652173913044;

                    final double height = constraints.maxHeight * 0.46;

                    return Stack(children: [
                      TransformHelper.translate(
                          x: constraints.maxWidth * 0.41739130434782606,
                          y: constraints.maxHeight * 0.32,
                          z: 0,
                          child: Container(
                            width: width,
                            height: height,
                            child: EmailWidget2(),
                          ))
                    ]);
                  }),
            )
          ]),
    );
  }
}
class LoginasaguestWidget2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 230.0,
      height: 50.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.0),
        boxShadow: kIsWeb
            ? []
            : [
          BoxShadow(
            color: Color.fromARGB(38, 0, 0, 0),
            offset: Offset(2.0, 6.0),
            blurRadius: 14.0,
          )
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100.0),
        child: Container(
          color: Color.fromARGB(255, 255, 255, 255),
        ),
      ),
    );
  }
}
class EmailWidget2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      '''Email''',
      overflow: TextOverflow.visible,
      textAlign: TextAlign.center,
      style: TextStyle(
        height: 1.171875,
        fontSize: 15.0,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w600,
        color: Color.fromARGB(255, 151, 151, 151),

        /* letterSpacing: 0.0, */
      ),
    );
  }
}
class Group2Widget1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 230.0,
      height: 50.0,
      child: Stack(
          fit: StackFit.expand,
          alignment: Alignment.center,
          // overflow: Overflow.visible,
          children: [
            Positioned(
              left: 0.0,
              top: 0.0,
              right: 0.0,
              bottom: 0.0,
              width: null,
              height: null,
              child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    final double width = constraints.maxWidth;

                    final double height = constraints.maxHeight;

                    return Stack(children: [
                      TransformHelper.translate(
                          x: 0,
                          y: 0,
                          z: 0,
                          child: Container(
                            width: width,
                            height: height,
                            child: SignupWidget3(),
                          ))
                    ]);
                  }),
            ),
            Positioned(
              left: 0.0,
              top: 0.0,
              right: 0.0,
              bottom: 0.0,
              width: null,
              height: null,
              child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    final double width = constraints.maxWidth * 0.3130434782608696;

                    final double height = constraints.maxHeight * 0.46;

                    return Stack(children: [
                      TransformHelper.translate(
                          x: constraints.maxWidth * 0.3565217391304348,
                          y: constraints.maxHeight * 0.32,
                          z: 0,
                          child: Container(
                            width: width,
                            height: height,
                            child: PasswordWidget2(),
                          ))
                    ]);
                  }),
            )
          ]),
    );
  }
}
class SignupWidget3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 230.0,
      height: 50.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.0),
        boxShadow: kIsWeb
            ? []
            : [
          BoxShadow(
            color: Color.fromARGB(38, 0, 0, 0),
            offset: Offset(2.0, 6.0),
            blurRadius: 14.0,
          )
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100.0),
        child: Container(
          color: Color.fromARGB(255, 255, 255, 255),
        ),
      ),
    );
  }
}
class PasswordWidget2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      '''Password''',
      overflow: TextOverflow.visible,
      textAlign: TextAlign.center,
      style: TextStyle(
        height: 1.171875,
        fontSize: 15.0,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w600,
        color: Color.fromARGB(255, 151, 151, 151),

        /* letterSpacing: 0.0, */
      ),
    );
  }
}
class Group3Widget1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 156.0,
      height: 50.0,
      child: Stack(
          fit: StackFit.expand,
          alignment: Alignment.center,
          // overflow: Overflow.visible,
          children: [
            Positioned(
              left: 0.0,
              top: 0.0,
              right: 0.0,
              bottom: 0.0,
              width: null,
              height: null,
              child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    final double width = constraints.maxWidth;

                    final double height = constraints.maxHeight;

                    return Stack(children: [
                      TransformHelper.translate(
                          x: 0,
                          y: 0,
                          z: 0,
                          child: Container(
                            width: width,
                            height: height,
                            child: LoginWidget4(),
                          ))
                    ]);
                  }),
            ),
            Positioned(
              left: 0.0,
              top: 0.0,
              right: 0.0,
              bottom: 0.0,
              width: null,
              height: null,
              child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    final double width = constraints.maxWidth * 0.27564102564102566;

                    final double height = constraints.maxHeight * 0.46;

                    return Stack(children: [
                      TransformHelper.translate(
                          x: constraints.maxWidth * 0.3782051282051282,
                          y: constraints.maxHeight * 0.32,
                          z: 0,
                          child: Container(
                            width: width,
                            height: height,
                            child: LoginWidget5(),
                          ))
                    ]);
                  }),
            )
          ]),
    );
  }
}
class LoginWidget4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 156.0,
      height: 50.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.0),
        boxShadow: kIsWeb
            ? []
            : [
          BoxShadow(
            color: Color.fromARGB(38, 0, 0, 0),
            offset: Offset(2.0, 6.0),
            blurRadius: 14.0,
          )
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100.0),
        child: Container(
          color: Color.fromARGB(255, 30, 119, 87),
        ),
      ),
    );
  }
}
class LoginWidget5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      '''Login''',
      overflow: TextOverflow.visible,
      textAlign: TextAlign.center,
      style: TextStyle(
        height: 1.171875,
        fontSize: 15.0,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w600,
        color: Color.fromARGB(255, 255, 255, 255),

        /* letterSpacing: 0.0, */
      ),
    );
  }
}

class BackbuttonWidget1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50.0,
      height: 50.0,
      child: Stack(
          fit: StackFit.expand,
          alignment: Alignment.center,
          // overflow: Overflow.visible,
          children: [
            Positioned(
              left: 0.0,
              top: 0.0,
              right: null,
              bottom: null,
              width: 50.0,
              height: 50.0,
              child: Ellipse1Widget1(),
            ),
            Positioned(
              left: 19.0,
              top: 19.0,
              right: null,
              bottom: null,
              width: 12.0,
              height: 11.0,
              child: Group5Widget2(),
            )
          ]),
    );
  }
}
class Ellipse1Widget1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50.0,
      height: 50.0,
      decoration: BoxDecoration(
        boxShadow: kIsWeb
            ? []
            : [
          BoxShadow(
            color: Color.fromARGB(38, 0, 0, 0),
            offset: Offset(2.0, 6.0),
            blurRadius: 14.0,
          )
        ],
      ),
      child: SvgWidget(painters: [
        SvgPathPainter.fill()
          ..addPath(
              'M50 25C50 38.8071 38.8071 50 25 50C11.1929 50 0 38.8071 0 25C0 11.1929 11.1929 0 25 0C38.8071 0 50 11.1929 50 25Z')
          ..color = Color.fromARGB(255, 255, 255, 255),
      ]),
    );
  }
}
class Group5Widget2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 12.0,
      height: 11.0,
      child: Stack(
          fit: StackFit.expand,
          alignment: Alignment.center,
          // overflow: Overflow.visible,
          children: [
            Positioned(
              left: 0.0,
              top: 1.0543070061430626e-7,
              right: null,
              bottom: null,
              width: 15.556349754333496,
              height: 2.0,
              child: Line1Widget1(),
            ),
            Positioned(
              left: 1.000000238418579,
              top: 11.0,
              right: null,
              bottom: null,
              width: 15.556349754333496,
              height: 2.0,
              child: Line2Widget1(),
            )
          ]),
    );
  }
}
class Line1Widget1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TransformHelper.rotate(
        a: 0.71,
        b: -0.71,
        c: 0.71,
        d: 0.71,
        child: Container(
          width: 15.556349754333496,
          height: 2.0,
          child: SvgWidget(painters: [
            SvgPathPainter.stroke(
              2.0,
              strokeJoin: StrokeJoin.miter,
            )
              ..addPath('M0 0L15.5563 0L15.5563 -2L0 -2L0 0Z')
              ..color = Color.fromARGB(255, 130, 130, 130),
          ]),
        ));
  }
}
class Line2Widget1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TransformHelper.rotate(
        a: 0.71,
        b: 0.71,
        c: -0.71,
        d: 0.71,
        child: Container(
          width: 15.556349754333496,
          height: 2.0,
          child: SvgWidget(painters: [
            SvgPathPainter.stroke(
              2.0,
              strokeJoin: StrokeJoin.miter,
            )
              ..addPath('M0 0L15.5563 0L15.5563 -2L0 -2L0 0Z')
              ..color = Color.fromARGB(255, 130, 130, 130),
          ]),
        ));
  }
}

class Group6Widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 51.0,
      height: 51.0,
      child: Stack(
          fit: StackFit.expand,
          alignment: Alignment.center,
          // overflow: Overflow.visible,
          children: [
            Positioned(
              left: 0.0,
              top: 0.0,
              right: 0.0,
              bottom: 0.0,
              width: null,
              height: null,
              child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    final double width = constraints.maxWidth;

                    final double height = constraints.maxHeight;

                    return Stack(children: [
                      TransformHelper.translate(
                          x: 0,
                          y: 0,
                          z: 0,
                          child: Container(
                            width: width,
                            height: height,
                            child: Rectangle2Widget(),
                          ))
                    ]);
                  }),
            ),
            Positioned(
              left: 12.0,
              top: 11.0,
              right: null,
              bottom: null,
              width: 28.0,
              height: 28.0,
              child: Image1Widget(),
            )
          ]),
    );
  }
}
class Rectangle2Widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 51.0,
      height: 51.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: kIsWeb
            ? []
            : [
          BoxShadow(
            color: Color.fromARGB(63, 120, 120, 120),
            offset: Offset(2.0, 6.0),
            blurRadius: 14.0,
          )
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Container(
          color: Color.fromARGB(255, 255, 255, 255),
        ),
      ),
    );
  }
}
class Image1Widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 28.0,
      height: 28.0,
      child: ClipRRect(
        borderRadius: BorderRadius.zero,
        child: Image.asset(
          "assets/images/9305c8040cce1383e28fd7d6f42ddd244831657c.png",
          color: null,
          fit: BoxFit.cover,
          width: 28.0,
          height: 28.0,
          colorBlendMode: BlendMode.dstATop,
        ),
      ),
    );
  }
}

class Group7Widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 51.0,
      height: 51.0,
      child: Stack(
          fit: StackFit.expand,
          alignment: Alignment.center,
          // overflow: Overflow.visible,
          children: [
            Positioned(
              left: 0.0,
              top: 0.0,
              right: 0.0,
              bottom: 0.0,
              width: null,
              height: null,
              child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    final double width = constraints.maxWidth;

                    final double height = constraints.maxHeight;

                    return Stack(children: [
                      TransformHelper.translate(
                          x: 0,
                          y: 0,
                          z: 0,
                          child: Container(
                            width: width,
                            height: height,
                            child: Rectangle3Widget(),
                          ))
                    ]);
                  }),
            ),
            Positioned(
              left: 0.0,
              top: 0.0,
              right: 0.0,
              bottom: 0.0,
              width: null,
              height: null,
              child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    final double width = constraints.maxWidth * 0.43137254901960786;

                    final double height =
                        constraints.maxHeight * 0.43137254901960786;

                    return Stack(children: [
                      TransformHelper.translate(
                          x: constraints.maxWidth * 0.29411764705882354,
                          y: constraints.maxHeight * 0.27450980392156865,
                          z: 0,
                          child: Container(
                            width: width,
                            height: height,
                            child: Image2Widget(),
                          ))
                    ]);
                  }),
            )
          ]),
    );
  }
}
class Rectangle3Widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 51.0,
      height: 51.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: kIsWeb
            ? []
            : [
          BoxShadow(
            color: Color.fromARGB(63, 120, 120, 120),
            offset: Offset(2.0, 6.0),
            blurRadius: 14.0,
          )
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Container(
          color: Color.fromARGB(255, 255, 255, 255),
        ),
      ),
    );
  }
}
class Image2Widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 22.0,
      height: 22.0,
      child: ClipRRect(
        borderRadius: BorderRadius.zero,
        child: Image.asset(
          "assets/images/1ac64d57047e17be672b65799800f7d4bdd69d7c.png",
          color: null,
          fit: BoxFit.cover,
          width: 22.0,
          height: 22.0,
          colorBlendMode: BlendMode.dstATop,
        ),
      ),
    );
  }
}

class Group8Widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 51.0,
      height: 51.0,
      child: Stack(
          fit: StackFit.expand,
          alignment: Alignment.center,
          // overflow: Overflow.visible,
          children: [
            Positioned(
              left: 0.0,
              top: 0.0,
              right: 0.0,
              bottom: 0.0,
              width: null,
              height: null,
              child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    final double width = constraints.maxWidth;

                    final double height = constraints.maxHeight;

                    return Stack(children: [
                      TransformHelper.translate(
                          x: 0,
                          y: 0,
                          z: 0,
                          child: Container(
                            width: width,
                            height: height,
                            child: Rectangle4Widget(),
                          ))
                    ]);
                  }),
            ),
            Positioned(
              left: 0.0,
              top: 0.0,
              right: 0.0,
              bottom: 0.0,
              width: null,
              height: null,
              child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    final double width = constraints.maxWidth * 0.5490196078431373;

                    final double height =
                        constraints.maxHeight * 0.5490196078431373;

                    return Stack(children: [
                      TransformHelper.translate(
                          x: constraints.maxWidth * 0.23529411764705882,
                          y: constraints.maxHeight * 0.21568627450980393,
                          z: 0,
                          child: Container(
                            width: width,
                            height: height,
                            child: Image3Widget(),
                          ))
                    ]);
                  }),
            )
          ]),
    );
  }
}
class Rectangle4Widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 51.0,
      height: 51.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: kIsWeb
            ? []
            : [
          BoxShadow(
            color: Color.fromARGB(63, 120, 120, 120),
            offset: Offset(2.0, 6.0),
            blurRadius: 14.0,
          )
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Container(
          color: Color.fromARGB(255, 255, 255, 255),
        ),
      ),
    );
  }
}
class Image3Widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 28.0,
      height: 28.0,
      child: ClipRRect(
        borderRadius: BorderRadius.zero,
        child: Image.asset(
          "assets/images/df1eba82e069d53732472dec32243f91eca18eec.png",
          color: null,
          fit: BoxFit.cover,
          width: 28.0,
          height: 28.0,
          colorBlendMode: BlendMode.dstATop,
        ),
      ),
    );
  }
}

class Spooky_Text_Effect2Widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 478.0,
      height: 268.98858642578125,
      child: ClipRRect(
        borderRadius: BorderRadius.zero,
        child: Image.asset(
          // "assets/images/codeword.png",
          "assets/images/codeword.png",
          color: null,
          fit: BoxFit.cover,
          width: 478.0,
          height: 268.98858642578125,
          colorBlendMode: BlendMode.dstATop,
        ),
      ),
    );
  }
}




















