import 'package:flutter/material.dart';

class AnimatedReticle extends StatefulWidget {
  final double size;
  final Color colour;

  AnimatedReticle({@required this.size, @required this.colour})
      : assert(size != null),
        assert(colour != null);

  @override
  _AnimatedReticleState createState() => _AnimatedReticleState();
}

class _AnimatedReticleState extends State<AnimatedReticle>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> verticalPosition;

  @override
  void initState() {
    _configureAnimation();
    super.initState();
  }

  void _configureAnimation() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 4),
    )..addListener(() {
        setState(() {});
      });

    verticalPosition = Tween<double>(
      begin: 0.0,
      end: widget.size,
    ).animate(_controller);

    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: <Widget>[
          SizedBox(
            width: widget.size,
            height: widget.size,
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: widget.colour, width: 2.0)),
            ),
          ),
          Positioned(
            top: verticalPosition.value,
            child: Container(
              width: 300,
              height: 4.0,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: widget.colour,
                    blurRadius: 8,
                    spreadRadius: 0,
                  )
                ],
                color: widget.colour,
              ),
            ),
          )
        ],
      ),
    );
  }
}
