import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:widgets_example/widgets/neon_button_widget.dart';

class LiquidSwipeExample extends StatefulWidget {
  const LiquidSwipeExample({Key? key}) : super(key: key);

  @override
  State<LiquidSwipeExample> createState() => _LiquidSwipeExampleState();
}

class _LiquidSwipeExampleState extends State<LiquidSwipeExample> {
  LiquidController controller = LiquidController();
  TextStyle textStyle = const TextStyle(color: Colors.white, fontSize: 20);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          LiquidSwipe(
            onPageChangeCallback: (index) {
              if(index > 3){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NoenButtonWidget(),
                    ));
              }


              // setState(() {});
            },
            liquidController: controller,
            // enableSideReveal: true,
            // slideIconWidget:
            //     const Icon(Icons.arrow_back_ios, color: Colors.white),
            pages: [
              Container(
                color: Colors.black,
                child: Center(child: Text('Page1', style: textStyle)),
              ),
              Container(
                color: Colors.red,
                child: Center(child: Text('Page2', style: textStyle)),
              ),
              Container(
                color: Colors.green,
                child: Center(child: Text('Page3', style: textStyle)),
              ),
              Container(
                color: Colors.orange,
                child: Center(child: Text('Page4', style: textStyle)),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            left: 16,
            right: 32,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    controller.jumpToPage(page: 3);
                  },
                  child: const Text('SKIP'),
                ),
                AnimatedSmoothIndicator(
                  activeIndex: controller.currentPage,
                  count: 4,
                  effect: const WormEffect(
                      spacing: 16,
                      dotColor: Colors.white54,
                      activeDotColor: Colors.white),
                  onDotClicked: (index) {
                    controller.animateToPage(page: index);
                  },
                ),
                TextButton(
                  onPressed: () {
                    final page = controller.currentPage + 1;
                    controller.animateToPage(
                        page: page > 4 ? 0 : page, duration: 400);
                  },
                  child: const Text('NEXT'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
