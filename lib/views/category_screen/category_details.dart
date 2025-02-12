import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/controllers/product_controller.dart';
import 'package:emart_app/views/category_screen/item_details.dart';
import 'package:emart_app/widgets_common/bg_widget.dart';
import 'package:get/get.dart';

class CategoryDetails extends StatelessWidget {
  final String? title;

  const CategoryDetails({super.key, required this.title});

  @override
  Widget build(BuildContext context) {

    var controller = Get.find<ProductController>();

    return bgWidget(
      child: Scaffold(
        appBar: AppBar(
          // iconTheme: const IconThemeData(color: lightGrey),
          title: title!.text.fontFamily(bold).white.make(),
        ),
        body: Container(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    controller.subcat.length, 
                    (index) => "${controller.subcat[index]}"
                    .text.size(12).fontFamily(semibold)
                    .color(darkFontGrey)
                    .makeCentered().box.white
                    .size(150, 60)
                    .margin(const EdgeInsets.symmetric(horizontal: 4.0))
                    .rounded
                    .make()
                  ),
                ),
              ),
              
              20.heightBox,

              // items container
              Expanded(
                child: GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 6,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, 
                    mainAxisExtent: 250, 
                    mainAxisSpacing: 8.0, 
                    crossAxisSpacing: 8.0
                  ), 
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          imgP5,
                          height: 150,
                          width: 200,
                          fit: BoxFit.cover,
                        ),
                        "Laptop 4GB/64GB"
                            .text
                            .fontFamily(semibold)
                            .color(darkFontGrey)
                            .make(),
                        10.heightBox,
                        "\$600"
                            .text
                            .color(redColor)
                            .fontFamily(bold)
                            .size(16.0)
                            .make()
                      ],
                    ).box.white.margin(const EdgeInsets
                    .symmetric(horizontal: 4.0))
                    .roundedSM.
                    outerShadowSm
                    .padding(const EdgeInsets.all(12.0))
                    .make().onTap(() => Get.to(() => const ItemDetails(title: "Dummy items")) );
                  }
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}