import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:nike_app/animations/shake_transition.dart';
import 'package:nike_app/controllers/carousel_controller.dart';
import 'package:nike_app/models/nike_product_model.dart';
import 'package:nike_app/widgets/build_carousel.dart';
import 'package:nike_app/widgets/custom_fba.dart';
import 'package:nike_app/widgets/title_product.dart';

// ignore: must_be_immutable
class DetailsScreen extends StatelessWidget {
  final NikeProduct shoes;
  final ValueNotifier<bool> notifierButtomVisible = ValueNotifier(false);
  int selectedPage = 0;
  List shorsSize = [
    '6',
    '7',
    '9',
    '9.5',
    '10',
  ];

  String description =
      'Loremipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.';

  final CarouselController controller = Get.put(CarouselController());

  DetailsScreen({Key? key, required this.shoes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      notifierButtomVisible.value = true;
    });
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: SizedBox(
            height: size.height * 0.07,
            child: Image.asset('assets/images/nike_logo.png'),
          ),
          leading: const BackButton(
            color: Colors.black,
          ),
        ),
        body: Stack(
          fit: StackFit.expand,
          children: [
            Positioned.fill(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    BuildCarousel(
                      size: size,
                      shoes: shoes,
                      controller: controller,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.05,
                        vertical: size.height * 0.015,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          ShakeTransition(
                            duration: const Duration(milliseconds: 1200),
                            child:
                                TitleProductAndPrice(shoes: shoes, size: size),
                          ),
                          SizedBox(height: size.height * 0.03),
                          ShakeTransition(
                            duration: const Duration(milliseconds: 1200),
                            child: titleDes(size, 'available sizes'),
                          ),
                          SizedBox(height: size.height * 0.03),
                          ShakeTransition(
                            duration: const Duration(milliseconds: 1400),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: List.generate(
                                shorsSize.length,
                                (index) => Text(
                                  'US ${shorsSize[index]}',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: size.width * 0.045,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: size.height * 0.03),
                          ShakeTransition(
                            duration: const Duration(milliseconds: 1600),
                            child: titleDes(size, 'description'),
                          ),
                          SizedBox(height: size.height * 0.03),
                          ShakeTransition(
                            duration: const Duration(milliseconds: 1800),
                            child: Text(
                              description,
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: size.width * 0.04,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ValueListenableBuilder<bool>(
              valueListenable: notifierButtomVisible,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  CustomFBA(
                    icon: FeatherIcons.heart,
                    backgroundColor: Colors.white,
                    iconColor: Colors.black,
                  ),
                  CustomFBA(
                    icon: FeatherIcons.shoppingBag,
                    backgroundColor: Colors.black,
                    iconColor: Colors.white,
                  ),
                ],
              ),
              builder: (context, value, dynamic child) {
                return AnimatedPositioned(
                  duration: const Duration(milliseconds: 200),
                  bottom: value ? 25 : -5,
                  left: 15,
                  right: 15,
                  child: child,
                );
              },
            )
          ],
        ),
      ),
    );
  }

  Text titleDes(Size size, title) {
    return Text(
      title.toUpperCase(),
      style: TextStyle(
        fontSize: size.width * 0.04,
        fontWeight: FontWeight.w600,
        color: Colors.grey.shade600,
      ),
    );
  }
}
