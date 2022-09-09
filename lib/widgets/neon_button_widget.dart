import 'package:flutter/material.dart';

class NoenButtonWidget extends StatefulWidget {
  const NoenButtonWidget({Key? key}) : super(key: key);

  @override
  State<NoenButtonWidget> createState() => _NoenButtonWidgetState();
}

class _NoenButtonWidgetState extends State<NoenButtonWidget> {
  Color shadowColor = Colors.red;
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Listener(
          onPointerDown: (_) => setState(() => isPressed = true),
          onPointerUp: (_) => setState(() => isPressed = false),
          child: TextButton(
            onHover: (hover) {
              isPressed = hover;
            },
            style: TextButton.styleFrom(
                side: const BorderSide(color: Colors.white, width: 3)),

            onPressed: () {},
            child: Text(
              'Neon Button',
              style: TextStyle(color: Colors.white, fontSize: 20, shadows: [
                for (double i = 0; i < (isPressed ? 8 : 4); i++)
                  Shadow(color: shadowColor, blurRadius: 3 * i),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
