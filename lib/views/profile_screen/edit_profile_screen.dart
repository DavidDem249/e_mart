import 'dart:io';

import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/controllers/profile_controller.dart';
import 'package:emart_app/widgets_common/bg_widget.dart';
import 'package:emart_app/widgets_common/custom_textfield.dart';
import 'package:emart_app/widgets_common/our_button.dart';
import 'package:get/get.dart';

class EditProfileScreen extends StatelessWidget {
  final dynamic data;

  const EditProfileScreen({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProfileController>();

    // controller.nameController.text = data['name'];
    // controller.passController.text = data['password'];

    return bgWidget(
        child: Scaffold(
      appBar: AppBar(
          //iconTheme: const IconThemeData(color: lightGrey),
          ),
      body: Obx(
        () => SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              data['imageUrl'] == '' && controller.profileImgPath.isEmpty
                  ? Image.asset(
                      imgProfile2,
                      width: 80,
                      fit: BoxFit.cover,
                    ).box.roundedFull.clip(Clip.antiAlias).make()
                  : data['imageUrl'] != "" && controller.profileImgPath.isEmpty
                      ? Image.network(data['imageUrl'],
                              width: 100, fit: BoxFit.cover)
                          .box
                          .roundedFull
                          .clip(Clip.antiAlias)
                          .make()
                      : Image.file(
                          File(controller.profileImgPath.value),
                          width: 100,
                          fit: BoxFit.cover,
                        ).box.roundedFull.clip(Clip.antiAlias).make(),
              10.heightBox,
              ourButton(
                  color: redColor,
                  onPress: () {
                    controller.changeImage(context);
                  },
                  textColor: whiteColor,
                  title: "Change"),
              const Divider(),
              20.heightBox,
              customTextField(
                  hint: nameHint,
                  title: name,
                  isPass: false,
                  controller: controller.nameController),
              10.heightBox,
              customTextField(
                  hint: passwordHint,
                  title: oldpass,
                  isPass: true,
                  controller: controller.oldpassController),
              10.heightBox,
              customTextField(
                  hint: passwordHint,
                  title: newpass,
                  isPass: true,
                  controller: controller.newpassController),
              20.heightBox,
              controller.isLoading.value
                  ? const CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(redColor),
                    )
                  : SizedBox(
                      width: context.screenWidth - 60,
                      child: ourButton(
                          color: redColor,
                          onPress: () async {
                            controller.isLoading(true);

                            //if image is not selected
                            if (controller.profileImgPath.value.isNotEmpty) {
                              await controller.uploadProfileImage();
                            } else {
                              controller.profileImageLink = data['imageUrl'];
                            }

                            //if old password matches data base

                            if (data['password'] == controller.oldpassController.text) {
                              //Update password
                              await controller.changeAuthPassword(
                                email: data['email'],
                                password: controller.oldpassController.text,
                                newpassword: controller.newpassController.text
                              );

                              //Update detail profile
                              await controller.updateProfile(
                                imgUrl: controller.profileImageLink,
                                name: controller.nameController.text,
                                password: controller.newpassController.text,
                              );
                              // ignore: use_build_context_synchronously
                              VxToast.show(context, msg: "Updated");
                            } else {
                              // ignore: use_build_context_synchronously
                              VxToast.show(context, msg: "Wrong old password");
                              controller.isLoading(false);
                            }
                          },
                          textColor: whiteColor,
                          title: "Save"),
                    ),
            ],
          )
              .box
              .white
              .shadowSm
              .padding(const EdgeInsets.all(16.0))
              .margin(const EdgeInsets.only(top: 50, left: 12, right: 12))
              .rounded
              .make(),
        ),
      ),
    ));
  }
}
