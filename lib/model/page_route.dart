
// import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';


class NavigateTo extends PageRouteBuilder {

  final Widget child;
  final AxisDirection direction;
  final duration;

  NavigateTo({
    required this.child,
    // this.duration = 600,
    this.duration = 200,
    this.direction = AxisDirection.right,
  }) : super(
    // transitionDuration: const Duration(seconds: 1),
    // transitionDuration: const Duration(milliseconds: 600),
    // reverseTransitionDuration: const Duration(milliseconds: 600),
      transitionDuration: Duration(milliseconds: duration),
      reverseTransitionDuration: Duration(milliseconds: duration),
    pageBuilder: (context, animation, secondaryAnimation) => child
  );

  // @override
  // Widget buildTransitions(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
  //   // TODO: implement buildTransitions
  //   return super.buildTransitions(context, animation, secondaryAnimation, child);
  // }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child)
   //=> ScaleTransition(scale: animation, child: child,);
    => SlideTransition(
      child: child,
      position: Tween<Offset>(
        // begin: const Offset(-1,0), end: Offset.zero, // left to right
        begin: getBeginOffset(direction),
        end: Offset.zero,
      ).animate(animation),
    );

  getBeginOffset(AxisDirection direction) {
    switch (direction) {
      case AxisDirection.up:
        return Offset(0,1);
      case AxisDirection.down:
        return Offset(1,0);
      case AxisDirection.right:
        return Offset(0,-1);
      case AxisDirection.left:
        return Offset(1,0);
    }
  }
}

class NavigateOpaque extends PageRoute<void> {

  NavigateOpaque({
    required this.builder,
    RouteSettings? settings,
  })  : assert(builder != null),
        super(settings: settings, fullscreenDialog: false);

  final WidgetBuilder builder;

  // @override
  // // TODO: implement barrierColor
  // Color? get barrierColor => throw UnimplementedError();
  //
  // @override
  // // TODO: implement barrierLabel
  // String? get barrierLabel => throw UnimplementedError();

  @override
  bool get opaque => false;

  @override
  Color? get barrierColor => null;

  @override
  String? get barrierLabel => null;

  @override
  bool get maintainState => true;

  @override
  // Duration get transitionDuration => Duration(milliseconds: 350);
  Duration get transitionDuration => Duration(milliseconds: 1000);

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    final result = builder(context);
    return FadeTransition(
      opacity: Tween<double>(
          begin: 0, end: 1
      ).animate(animation),
      child: Semantics(
        scopesRoute: true,
        explicitChildNodes: true,
        child: result,
      ),
    );
  }


}
/**/
class NavigateWithOpaque extends PageRouteBuilder {

  final Widget child;
  final AxisDirection direction;
  final duration;

  NavigateWithOpaque({
    required this.child,
    // this.duration = 350,
    this.duration = 200,
    this.direction = AxisDirection.right,
  }) : super(
      transitionDuration: Duration(milliseconds: duration),
      reverseTransitionDuration: Duration(milliseconds: duration),
      pageBuilder: (context, animation, secondaryAnimation) => child
  );

  @override
  bool get opaque => false;

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child)
  => SlideTransition(
    child: child,
    // child: Semantics(
    //   scopesRoute: true,
    //   explicitChildNodes: true,
    //   child: child,
    // ),
    position: Tween<Offset>(
      begin: getBeginOffset(direction),
      end: Offset.zero,
    ).animate(animation),
  );

  Offset getBeginOffset(AxisDirection direction) {
    switch (direction) { //x, y
      case AxisDirection.up:
        return Offset(0,-1);
      case AxisDirection.down:
        return Offset(0,1);
      case AxisDirection.right:
        return Offset(-1,0);
      case AxisDirection.left://
        return Offset(1,0);
    }
  }
}

class NavigateLeft extends PageRouteBuilder {

  final Widget child;
  final AxisDirection direction;
  final duration;

  NavigateLeft({
    required this.child,
    // this.duration = 350,
    this.duration = 200,
    this.direction = AxisDirection.right,
  }) : super(
      transitionDuration: Duration(milliseconds: duration),
      // reverseTransitionDuration: Duration(milliseconds: duration),
      pageBuilder: (context, animation, secondaryAnimation) => child
  );

  @override
  bool get opaque => false;

  @override
  Color? get barrierColor => null;

  @override
  String? get barrierLabel => null;

  @override
  bool get maintainState => true;

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child)
  => SlideTransition(
    child: child,
    // child: Semantics(
    //   scopesRoute: true,
    //   explicitChildNodes: true,
    //   child: child,
    // ),
    position: Tween<Offset>(
      // begin: getBeginOffset(direction),
      begin: Offset(1,0),
      end: Offset.zero,
    ).animate(animation),
  );

  Offset getBeginOffset(AxisDirection direction) {
    switch (direction) { //x, y
      case AxisDirection.up:
        return Offset(0,-1);
      case AxisDirection.down:
        return Offset(0,1);
      case AxisDirection.right:
        return Offset(-1,0);
      case AxisDirection.left://
        return Offset(1,0);
    }
  }
}
class NavigateRight extends PageRouteBuilder {

  final Widget child;
  final AxisDirection direction;
  final duration;

  NavigateRight({
    required this.child,
    // this.duration = 350,
    this.duration = 200,
    this.direction = AxisDirection.right,
  }) : super(
      transitionDuration: Duration(milliseconds: duration),
      // reverseTransitionDuration: Duration(milliseconds: duration),
      pageBuilder: (context, animation, secondaryAnimation) => child
  );

  @override
  bool get opaque => false;

  @override
  Color? get barrierColor => null;

  @override
  String? get barrierLabel => null;

  @override
  bool get maintainState => true;

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child)
  => SlideTransition(
    child: child,
    // child: Semantics(
    //   scopesRoute: true,
    //   explicitChildNodes: true,
    //   child: child,
    // ),
    position: Tween<Offset>(
      // begin: getBeginOffset(direction),
      begin: Offset(-1,0),
      end: Offset.zero,
    ).animate(animation),
  );

  Offset getBeginOffset(AxisDirection direction) {
    switch (direction) { //x, y
      case AxisDirection.up:
        return Offset(0,-1);
      case AxisDirection.down:
        return Offset(0,1);
      case AxisDirection.right:
        return Offset(-1,0);
      case AxisDirection.left://
        return Offset(1,0);
    }
  }
}
class NavigateUp extends PageRouteBuilder {

  final Widget child;
  final AxisDirection direction;
  final duration;

  NavigateUp({
    required this.child,
    // this.duration = 350,
    this.duration = 200,
    this.direction = AxisDirection.right,
  }) : super(
      transitionDuration: Duration(milliseconds: duration),
      // reverseTransitionDuration: Duration(milliseconds: duration),
      pageBuilder: (context, animation, secondaryAnimation) => child
  );

  @override
  bool get opaque => false;

  @override
  Color? get barrierColor => null;

  @override
  String? get barrierLabel => null;

  @override
  bool get maintainState => true;

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child)
  => SlideTransition(
    child: child,
    // child: Semantics(
    //   scopesRoute: true,
    //   explicitChildNodes: true,
    //   child: child,
    // ),
    position: Tween<Offset>(
      // begin: getBeginOffset(direction),
      begin: Offset(0,-1),
      end: Offset.zero,
    ).animate(animation),
  );

  Offset getBeginOffset(AxisDirection direction) {
    switch (direction) { //x, y
      case AxisDirection.up:
        return Offset(0,-1);
      case AxisDirection.down:
        return Offset(0,1);
      case AxisDirection.right:
        return Offset(-1,0);
      case AxisDirection.left://
        return Offset(1,0);
    }
  }
}
class NavigateDown extends PageRouteBuilder {

  final Widget child;
  final AxisDirection direction;
  final duration;

  NavigateDown({
    required this.child,
    // this.duration = 350,
    this.duration = 200,
    this.direction = AxisDirection.right,
  }) : super(
      transitionDuration: Duration(milliseconds: duration),
      // reverseTransitionDuration: Duration(milliseconds: duration),
      pageBuilder: (context, animation, secondaryAnimation) => child
  );

  @override
  bool get opaque => false;

  @override
  Color? get barrierColor => null;

  @override
  String? get barrierLabel => null;

  @override
  bool get maintainState => true;

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child)
  => SlideTransition(
    child: child,
    // child: Semantics(
    //   scopesRoute: true,
    //   explicitChildNodes: true,
    //   child: child,
    // ),
    position: Tween<Offset>(
      // begin: getBeginOffset(direction),
      begin: Offset(0,1),
      end: Offset.zero,
    ).animate(animation),
  );

  Offset getBeginOffset(AxisDirection direction) {
    switch (direction) { //x, y
      case AxisDirection.up:
        return Offset(0,-1);
      case AxisDirection.down:
        return Offset(0,1);
      case AxisDirection.right:
        return Offset(-1,0);
      case AxisDirection.left://
        return Offset(1,0);
    }
  }
}


showTransitionDialog({required BuildContext context, required Widget child}){
  return showGeneralDialog(
      context: context,
      barrierLabel: '',
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      //transitionDuration: Duration(milliseconds: 600),
      transitionDuration: const Duration(milliseconds: 200),

      // transitionBuilder: (context, a1, a2, widget) {
      //   return Transform.translate(
      //       offset: Offset(0,-1),
      //       child: dialogMenu(),
      //   );
      // },
      pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
        //return dialogMenu();
        return SlideTransition(
          child: child,
          position: Tween<Offset>(
            //begin: getBeginOffset(direction),
            begin: Offset(0,-1),
            end: Offset.zero,
          ).animate(animation),
        );
      }
  );
}