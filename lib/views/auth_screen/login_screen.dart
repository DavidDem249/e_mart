import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/consts/lists.dart';
import 'package:emart_app/controllers/auth_controller.dart';
import 'package:emart_app/views/auth_screen/signup_screen.dart';
import 'package:emart_app/views/home_screeen/home.dart';
import 'package:emart_app/widgets_common/applogo_widget.dart';
import 'package:emart_app/widgets_common/bg_widget.dart';
import 'package:emart_app/widgets_common/custom_textfield.dart';
import 'package:emart_app/widgets_common/our_button.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AuthController());

    return bgWidget(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: [
            (context.screenHeight * 0.1).heightBox,
            applogoWidget(),
            10.heightBox,
            "Log in to $appname".text.fontFamily(bold).white.size(18).make(),
            15.heightBox,
            Obx(
              () => Column(
                children: [
                  customTextField(title: email, hint: emailHint, controller: controller.emailController),
                  customTextField(
                    title: password, hint: passwordHint, isPass: true, controller: controller.passwordController
                  ),
              
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                        onPressed: () {}, child: forgetPass.text.make()),
                  ),
                  5.heightBox,
                  // ourButton().box.width(context.screenWidth - 50).make()
                  controller.isLoading.value ? const CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(redColor),
                  ) : ourButton(
                      color: redColor,
                      title: login,
                      textColor: whiteColor,
                      onPress: () async{
                        controller.isLoading(true);

                        await controller.loginMethod(context: context).then((value) {
                          if (value != null){
                            // ignore: use_build_context_synchronously
                            VxToast.show(context, msg: loggedin);
                            // Get.to(() => const Home());
                            Get.offAll(() => const Home());
                          }else{
                            controller.isLoading(false);
                          }
                        });
                      }).box.width(context.screenWidth - 50).make(),
              
                  5.heightBox,
                  createNewAccount.text.color(fontGrey).make(),
                  5.heightBox,
                  ourButton(
                      color: lightGrey,
                      title: signup,
                      textColor: redColor,
                      onPress: () {
                        Get.to(() => const SignupScreen());
                      }).box.width(context.screenWidth - 50).make(),
              
                  10.heightBox,
                  loginWith.text.color(fontGrey).make(),
                  5.heightBox,
              
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                        3,
                        (index) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CircleAvatar(
                                radius: 25,
                                backgroundColor: lightGrey,
                                child: Image.asset(
                                  socialIconList[index],
                                  width: 30,
                                ),
                              ),
                            )),
                  )
                ],
              )
                  .box
                  .white
                  .rounded
                  .padding(const EdgeInsets.all(16.0))
                  .width(context.screenWidth - 70)
                  .shadowSm
                  .make(),
            )
          ],
        ),
      ),
    ));
  }
}
