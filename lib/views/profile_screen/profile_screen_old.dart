import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/consts/lists.dart';
import 'package:emart_app/controllers/auth_controller.dart';
import 'package:emart_app/views/auth_screen/login_screen.dart';
import 'package:emart_app/views/profile_screen/components/details_card.dart';
import 'package:emart_app/views/profile_screen/edit_profile_screen.dart';
import 'package:emart_app/widgets_common/bg_widget.dart';
import 'package:get/get.dart';

import '../../controllers/profile_controller.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {

    var controller = Get.put(ProfileController());

    return bgWidget(
        child: Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            //Edit profile button
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: const Align(
                alignment: Alignment.topRight,
                child: Icon(
                  Icons.edit,
                  color: whiteColor,
                ),
              ).onTap(() {
                Get.to(() => const EditProfileScreen());
              }),
            ),

            //users details section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  Image.asset(
                    imgProfile2,
                    width: 80,
                    fit: BoxFit.cover,
                  ).box.roundedFull.clip(Clip.antiAlias).make(),
                  5.widthBox,
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      "Dummy User".text.fontFamily(semibold).white.make(),
                      "customer@example.com"
                          .text
                          .white
                          .overflow(TextOverflow.ellipsis)
                          .make(),
                    ],
                  )),
                  OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: whiteColor),
                          shape: const RoundedRectangleBorder(
                              side: BorderSide.none)),
                      onPressed: () async {
                        await Get.put(AuthController()).signoutMethod(context);
                        Get.offAll(() => const LoginScreen());
                      },
                      child: logout.text.fontFamily(semibold).white.make())
                ],
              ),
            ),

            20.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                detailsCard(
                    count: "00",
                    title: "in your cart",
                    width: context.screenWidth / 3.3),
                detailsCard(
                    count: "32",
                    title: "in your wishlist",
                    width: context.screenWidth / 3.3),
                detailsCard(
                    count: "675",
                    title: "in your orders",
                    width: context.screenWidth / 3.3),
              ],
            ),

            //buttons section
            //40.heightBox,
            ListView.separated(
              shrinkWrap: true,
              separatorBuilder: (context, index) {
                return const Divider(
                  color: lightGrey,
                );
              },
              itemCount: profileButtonsList.length,
              itemBuilder: (BuildContext context, index) {
                return ListTile(
                  leading: Image.asset(
                    profileButtonsIcon[index],
                    width: 22,
                  ),
                  title: profileButtonsList[index]
                      .text
                      .fontFamily(semibold)
                      .color(darkFontGrey)
                      .make(),
                );
              },
            )
                .box
                .white
                .rounded
                .margin(const EdgeInsets.all(12.0))
                .padding(const EdgeInsets.symmetric(horizontal: 16.0))
                .shadowSm
                .make()
                .box
                .color(redColor)
                .make()
          ],
        ),
      ),
    ));
  }
}
