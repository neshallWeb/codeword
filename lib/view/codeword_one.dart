
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/transform.dart';
import '../widgets/widget.dart';

class CodeWordOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
        child: ClipRRect(
          borderRadius: BorderRadius.zero,
          child: Container(
            width: 390.0,
            height: 844.0,
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
                      double percentWidth = 1.0;
                      double scaleX = (constraints.maxWidth * percentWidth) / 390.0;

                      double percentHeight = 1.0;
                      double scaleY =
                          (constraints.maxHeight * percentHeight) / 844.0;

                      return Stack(children: [
                        TransformHelper.translateAndScale(
                            translateX: 0,
                            translateY: 0,
                            translateZ: 0,
                            scaleX: scaleX,
                            scaleY: scaleY,
                            scaleZ: 1,
                            child: BackgroundWidget())
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
                          constraints.maxWidth * 0.9108205159505208;

                      final double height =
                          constraints.maxHeight * 0.11498815527459456;

                      return Stack(children: [
                        TransformHelper.translate(
                            x: constraints.maxWidth * -0.07435897435897436,
                            y: constraints.maxHeight * 0.02014218009478673,
                            z: 0,
                            child: Container(
                              width: width,
                              height: height,
                              child: CloudsWidget(),
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
                          constraints.maxWidth * 1.4385128705929486;

                      final double height =
                          constraints.maxHeight * 0.4606872124694535;

                      return Stack(children: [
                        TransformHelper.translate(
                            x: constraints.maxWidth * -0.015384615384615385,
                            y: constraints.maxHeight * 0.1504739336492891,
                            z: 0,
                            child: Container(
                              width: width,
                              height: height,
                              child: TreeWidget(),
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
                          constraints.maxWidth * 0.26838461068960334;

                      final double height =
                          constraints.maxHeight * 0.5775474078282361;

                      return Stack(children: [
                        TransformHelper.translate(
                            x: constraints.maxWidth * -0.01282051282051282,
                            y: constraints.maxHeight * 0.44786729857819907,
                            z: 0,
                            child: Container(
                              width: width,
                              height: height,
                              child: RootsleftWidget(),
                            ))
                      ]);
                    }),
                  ),
                  Positioned(
                    left: 0.0,
                    top: 733.0,
                    right: null,
                    bottom: null,
                    width: 357.3500061035156,
                    height: 138.49000549316406,
                    child: GrassWidget(),
                  ),
                  Positioned(
                    left: 240.0,
                    top: 452.0,
                    right: null,
                    bottom: null,
                    width: 149.72000122070312,
                    height: 481.67999267578125,
                    child: RootsrightWidget(),
                  ),
                  Positioned(
                    left: -1.0,
                    top: 114.0,
                    right: null,
                    bottom: null,
                    width: 429.989990234375,
                    height: 255.8800048828125,
                    child: BranchWidget(),
                  ),
                  Positioned(
                    left: 0.0,
                    top: 0.0,
                    right: null,
                    bottom: null,
                    width: 390.0,
                    height: 844.0,
                    child: Rectangle1Widget(),
                  ),
                  Positioned(
                    left: 80.0,
                    top: 432.0,
                    right: null,
                    bottom: null,
                    width: 230.0,
                    height: 190.0,
                    child: Group4Widget(),
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
                          constraints.maxWidth * 0.5897435897435898;

                      final double height =
                          constraints.maxHeight * 0.05924170616113744;

                      return Stack(children: [
                        TransformHelper.translate(
                            x: constraints.maxWidth,
                            y: constraints.maxHeight * 0.5118483412322274,
                            z: 0,
                            child: Container(
                              width: width,
                              height: height,
                              child: NAmeWidget(),
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
                          constraints.maxWidth * 0.5897435897435898;

                      final double height =
                          constraints.maxHeight * 0.05924170616113744;

                      return Stack(children: [
                        TransformHelper.translate(
                            x: constraints.maxWidth,
                            y: constraints.maxHeight * 0.5947867298578199,
                            z: 0,
                            child: Container(
                              width: width,
                              height: height,
                              child: EmailWidget(),
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
                          constraints.maxWidth * 0.5897435897435898;

                      final double height =
                          constraints.maxHeight * 0.05924170616113744;

                      return Stack(children: [
                        TransformHelper.translate(
                            x: constraints.maxWidth,
                            y: constraints.maxHeight * 0.6777251184834123,
                            z: 0,
                            child: Container(
                              width: width,
                              height: height,
                              child: PasswordWidget(),
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
                      final double width = constraints.maxWidth * 0.4;

                      final double height =
                          constraints.maxHeight * 0.05924170616113744;

                      return Stack(children: [
                        TransformHelper.translate(
                            x: constraints.maxWidth * 1.1897435897435897,
                            y: constraints.maxHeight * 0.7606635071090048,
                            z: 0,
                            child: Container(
                              width: width,
                              height: height,
                              child: ConfirmWidget(),
                            ))
                      ]);
                    }),
                  ),
                  Positioned(
                    left: 390.0,
                    top: 642.0,
                    right: null,
                    bottom: null,
                    width: 50.0,
                    height: 50.0,
                    child: BackbuttonWidget(),
                  ),
                  Positioned(
                    left: 390.0,
                    top: 432.0,
                    right: null,
                    bottom: null,
                    width: 230.0,
                    height: 190.0,
                    child: Group5Widget1(),
                  ),
                  Positioned(
                    left: 390.0,
                    top: 572.0,
                    right: null,
                    bottom: null,
                    width: 50.0,
                    height: 50.0,
                    child: BackbuttonWidget1(),
                  ),
                  Positioned(
                    left: 390.0,
                    top: 641.0,
                    right: null,
                    bottom: null,
                    width: 51.0,
                    height: 51.0,
                    child: Group6Widget(),
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
                          constraints.maxWidth * 0.13076923076923078;

                      final double height =
                          constraints.maxHeight * 0.06042654028436019;

                      return Stack(children: [
                        TransformHelper.translate(
                            x: constraints.maxWidth * 1.2307692307692308,
                            y: constraints.maxHeight * 0.759478672985782,
                            z: 0,
                            child: Container(
                              width: width,
                              height: height,
                              child: Group7Widget(),
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
                          constraints.maxWidth * 0.13076923076923078;

                      final double height =
                          constraints.maxHeight * 0.06042654028436019;

                      return Stack(children: [
                        TransformHelper.translate(
                            x: constraints.maxWidth * 1.458974358974359,
                            y: constraints.maxHeight * 0.759478672985782,
                            z: 0,
                            child: Container(
                              width: width,
                              height: height,
                              child: Group8Widget(),
                            ))
                      ]);
                    }),
                  ),
                  Positioned(
                    left: -44.0,
                    top: 90.0,
                    right: null,
                    bottom: null,
                    width: 478.0,
                    height: 268.98858642578125,
                    child: Spooky_Text_Effect2Widget(),
                  )
                ]),
          ),
        ));
  }
}
