import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
double _buttonRadius = 100;

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
    return Container(
      color: Colors.blue,
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
          height: _buttonRadius,
          width: _buttonRadius,
          decoration: BoxDecoration(color: Colors.purple,borderRadius: BorderRadius.circular(_buttonRadius)),
        ),
      ),
    );
  }
}
