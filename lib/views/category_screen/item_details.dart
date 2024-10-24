import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/consts/lists.dart';
import 'package:emart_app/widgets_common/our_button.dart';

class ItemDetails extends StatelessWidget {
  final String? title;
  const ItemDetails({super.key, required this.title});


  // Welcome to 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightGrey,
      appBar: AppBar(
        // iconTheme: const IconThemeData(color: lightGrey),
        title: title!.text.color(darkFontGrey).fontFamily(bold).make(),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.share)),
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.favorite_outline)),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Swipper section

                    VxSwiper.builder(
                      itemCount: 3, 
                      itemBuilder: (context, index) {
                        return VxSwiper.builder(
                          autoPlay: true,
                          height: 350,
                          itemCount: 3,
                          aspectRatio: 16 / 9,
                          itemBuilder: (context, index) {
                            return Image.asset(
                              imgFc5,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            );
                          }
                        );
                      }
                    ),
                    
                    10.heightBox,
                    title!.text.size(16).color(darkFontGrey).fontFamily(semibold).make(),
                    10.heightBox,

                    // rating
                    VxRating(
                      onRatingUpdate: (value) {},
                      normalColor: textfieldGrey,
                      selectionColor: golden,
                      count: 5,
                      size: 25,
                      stepInt: true,
                    ),

                    10.heightBox,
                    "\$30,000".text.color(redColor).fontFamily(bold).size(18.0).make(),
                    10.heightBox,

                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              "Seller".text.white.fontFamily(semibold).make(),
                              5.heightBox,
                              "In House Brands".text.fontFamily(semibold).color(darkFontGrey).size(16.0).make()
                            ],
                          ),
                        ),
                        const CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(Icons.message_rounded, color: darkFontGrey,),
                        )
                      ],
                    ).box.height(60).padding(const EdgeInsets.symmetric(horizontal: 16.0)).color(textfieldGrey).make(),

                    // Color section
                    10.heightBox,
                    Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 100,
                              child: "Color: ".text.color(textfieldGrey).make(),
                            ),
                            Row(
                              children: List.generate(
                                3, 
                                (index) => VxBox().size(40, 40).roundedFull
                                .color(Vx.randomPrimaryColor).margin(const EdgeInsets.symmetric(horizontal: 4.0)).make()
                              ),
                            )
                          ],
                        ).box.padding(const EdgeInsets.all(8.0)).make(),
                        
                        // quantity row
                        Row(
                          children: [
                            SizedBox(
                              width: 100,
                              child: "Color:".text.color(textfieldGrey).make(),
                            ),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: (){}, 
                                  icon: const Icon(Icons.remove),
                                ),
                                "0".text.size(16.0).color(darkFontGrey).make(),
                                IconButton(
                                  onPressed: (){}, 
                                  icon: const Icon(Icons.add),
                                ),

                                10.widthBox,
                                "(0 available)".text.color(textfieldGrey).make(),
                              ],
                            )
                          ],
                        ).box.padding(const EdgeInsets.all(8.0)).make(),


                        // Total row
                        Row(
                          children: [
                            SizedBox(
                              width: 100,
                              child: "Total: ".text.color(textfieldGrey).make(),
                            ),

                            "\$0.00".text.color(redColor).size(16.0).fontFamily(bold).make()
                          ],
                        ).box.padding(const EdgeInsets.all(8.0)).make(),

                      ],
                    ).box.white.shadowSm.make(),

                    // description section

                    10.heightBox,

                    "Description".text.color(darkFontGrey).fontFamily(semibold).make(),

                    "This is a dummy item and dummy description here...".text.color(darkFontGrey).make(),

                    // Buttons section
                    10.heightBox,
                    ListView(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: List.generate(
                        itemDetailButtonsList.length, 
                        (index) => ListTile(
                          title: itemDetailButtonsList[index].text.fontFamily(semibold).color(darkFontGrey).semiBold.make(),
                          trailing: const Icon(Icons.arrow_forward),
                        )
                      ),
                    ),

                    20.heightBox,
                    //Products my like section

                    productsyoumaylike.text.fontFamily(bold).size(16.0).color(darkFontGrey).make(),
                    10.heightBox,

                    //
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                            6,
                            (index) => Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Image.asset(
                                      imgP1,
                                      width: 130,
                                      fit: BoxFit.cover,
                                    ),
                                    10.heightBox,
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
                                )
                                    .box
                                    .white
                                    .margin(const EdgeInsets.symmetric(
                                        horizontal: 4.0))
                                    .roundedSM
                                    .padding(const EdgeInsets.all(8.0))
                                    .make()),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 60,
            child: ourButton(color: redColor, onPress: () {}, textColor: whiteColor, title: title),
          )
        ],
      ),
    );
  }
}
