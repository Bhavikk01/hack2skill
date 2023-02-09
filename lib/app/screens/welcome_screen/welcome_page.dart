import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Getx_helper/library.dart';
import 'package:dots_indicator/dots_indicator.dart';

class WelcomePage extends GetView<WelcomeController> {
  WelcomePage({Key? key}) : super(key: key);

  PageController pageController = PageController(
      initialPage: 0,
      keepPage: false,
      viewportFraction: 1.0
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            PageView(
              controller: pageController,
              pageSnapping: true,
              physics: const ClampingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              reverse: false,
              children: [
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: const BoxDecoration(
                      color: Color(0xff00c2cb)
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: const BoxDecoration(
                      color: Color(0xff041c50)
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: const BoxDecoration(
                      color: Color(0xff00c2cb)
                  ),
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Positioned(
                        bottom: 130,
                        child: ElevatedButton(
                          onPressed: () {
                            controller.handleSignIn();
                          },
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all(
                              const EdgeInsets.symmetric(horizontal:  25, vertical: 5)
                            ),
                            backgroundColor: MaterialStateProperty.all(Colors.white),
                            foregroundColor: MaterialStateProperty.all(Colors.black),
                            shape: MaterialStateProperty
                                .all(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)
                            ))
                          ),
                          child: const Text('Login', style: TextStyle( fontSize: 20),),
                        ),
                      )
                    ],
                  ),
                )
              ],
              onPageChanged: (index){
                controller.changePage(index);
              },
            ),
            Positioned(
              bottom: 90,
              child: Obx(
                  () => DotsIndicator(
                    position: controller.state.index.value.toDouble(),
                    dotsCount: 3,
                    mainAxisAlignment: MainAxisAlignment.center,
                    reversed: false,
                    decorator: DotsDecorator(
                      size: const Size.square(9),
                      activeSize: const Size(18,9),
                      activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))
                    ),
                  ),
              )
            )
          ],
        ),
      ),
    );
  }
}
