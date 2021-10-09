import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:nike_app/animations/shake_transition.dart';
import 'package:nike_app/controllers/carousel_controller.dart';
import 'package:nike_app/models/nike_product_model.dart';

class BuildCarousel extends StatelessWidget {
  const BuildCarousel({
    Key? key,
    required this.size,
    required this.shoes,
    required this.controller,
  }) : super(key: key);

  final Size size;
  final NikeProduct shoes;
  final CarouselController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * 0.45,
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              color: Color(shoes.color),
            ),
          ),
          Positioned(
            left: 70,
            right: 70,
            top: -10,
            child: Hero(
              tag: 'nimber_${shoes.modelNumber}',
              child: ShakeTransition(
                axis: Axis.vertical,
                duration: const Duration(milliseconds: 400),
                offset: 20,
                child: Material(
                  color: Colors.transparent,
                  child: FittedBox(
                    child: Text(
                      shoes.modelNumber.toString(),
                      style: TextStyle(
                        color: Colors.black.withOpacity(.04),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          PageView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: shoes.images.length,
            onPageChanged: controller.onPageChange,
            itemBuilder: (context, index) {
              return Container(
                alignment: Alignment.center,
                child: ShakeTransition(
                  duration: index ==0 ? const Duration(milliseconds: 1000): Duration.zero, 
                  axis: Axis.vertical,
                  child: Hero(
                    tag: 'image_${shoes.model}',
                    child: Image.asset(
                      shoes.images[index],
                      fit: BoxFit.cover,
                      width: size.width * 0.6,
                    ),
                  ),
                ),
              );
            },
          ),
          Obx(
            () => Positioned(
              left: 0,
              right: 0,
              bottom: 30,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    shoes.images.length,
                    (index) => AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.symmetric(
                        horizontal: 5,
                      ),
                      height: controller.selectedPage.value == index ? 5 : 4,
                      width: controller.selectedPage.value == index ? 5 : 4,
                      decoration: BoxDecoration(
                        color: controller.selectedPage.value == index
                            ? Colors.black
                            : Colors.grey,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
