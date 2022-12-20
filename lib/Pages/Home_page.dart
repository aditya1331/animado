import 'package:flutter/material.dart';
import 'dart:math';

class HomePage extends StatefulWidget {


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
double _buttonRadius = 100;
final Tween<double> _backgroundScale = Tween<double>(begin: 0.0,end: 1.0);
AnimationController ? _starIconAnimationController;

@override
void initState(){
  super.initState();
  _starIconAnimationController = AnimationController(vsync: this,
      duration: const Duration(seconds: 4));// vsync reduces unecessary used of operations for animation
  _starIconAnimationController!.repeat();


}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            _pageBackground(),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _CircularANimationButton(),
                _starIcon(),
              ],
            )
          ],
        ),
      )
    );
  }
  Widget _pageBackground()
  {
    return TweenAnimationBuilder(
      tween: _backgroundScale,
      curve: Curves.easeOutQuad,
      duration: Duration(seconds: 2),
      builder: (_context,double _scale,child){
        return Transform.scale(scale: _scale,
          child: child,);

      },
      child: Container(
        color: Colors.blue,
      ),
    );
  }
  Widget _CircularANimationButton()
  {
    return Center(
      child: GestureDetector(
        onTap: (){
              setState(() {
            _buttonRadius+= _buttonRadius==200 ? -100:100;
          });
        },
        child: AnimatedContainer(
          duration: const Duration(seconds: 2),
          curve: Curves.bounceInOut,
          height: _buttonRadius,
          width: _buttonRadius,
          child: const Center(
            child: Text(
              "Basic",
              style: TextStyle(color: Colors.white),
            ),
          ),
          decoration: BoxDecoration(color: Colors.purple,borderRadius: BorderRadius.circular(_buttonRadius)),
        ),
      ),
    );
  }
  Widget _starIcon()
{
  return AnimatedBuilder(
    animation: _starIconAnimationController!.view,
      builder: (_buildcontext, _child){
      return Transform.rotate(
        angle: _starIconAnimationController!.value*2*pi,
      child: _child,
      );

      },
      child: const Icon(
        Icons.star,size: 100,
        color: Colors.white,));
}
}
