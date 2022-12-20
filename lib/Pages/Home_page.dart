import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
double _buttonRadius = 100;
final Tween<double> _backgroundScale = Tween<double>(begin: 0.0,end: 1.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            _pageBackground(),
            _CircularANimationButton(),
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
}
