import 'package:wideal_app_flutter/core/view_model/profile_view_model.dart';
import 'package:wideal_app_flutter/realtime_db/insert.dart';
import 'package:wideal_app_flutter/view/auth/login_view.dart';
import 'package:wideal_app_flutter/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileView extends StatelessWidget {
// set value
  var aaaa;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileViewModel>(
      init: ProfileViewModel(),
      builder: (controller) => controller.loading.value
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Scaffold(
              body: Container(
                  padding: EdgeInsets.only(top: 50),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: 120,
                                height: 120,
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(100),
                                  ),
                                  image: DecorationImage(
                                    image: controller.userModel == null
                                        ? AssetImage(
                                            'assets/images/chaire.png',
                                          )
                                        : controller.userModel.pic == 'default'
                                            ? AssetImage(
                                                'assets/images/chaire.png')
                                            : NetworkImage(
                                                controller.userModel.pic,
                                              ),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              /* FlatButton(
                                onPressed: () {
                                  print(controller.userModel.name);
                                  controller.signOut();
                                  Get.offAll(LoginView());
                                },
                                child: Text("sign out"),
                              ),*/
                              Column(
                                children: [
                                  CustomText(
                                    text: controller.userModel.name,
                                    color: Colors.black,
                                    fontSize: 32,
                                  ),
                                  CustomText(
                                    text: controller.userModel.email,
                                    color: Colors.black,
                                    fontSize: 24,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 100,
                        ),
                        Container(
                          child: FlatButton(
                            onPressed: () {},
                            child: ListTile(
                              title: CustomText(
                                text: 'Edit Profile',
                              ),
                              leading: Image.asset(
                                'assets/images/Icon_Cart.png',
                              ),
                              trailing: Icon(
                                Icons.navigate_next,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          child: FlatButton(
                            onPressed: () {
                              aaaa = controller.userModel.email;
                              Get.to(RealtimeDatabaseInsert());
                            },
                            child: ListTile(
                              title: CustomText(
                                text: 'Add Product',
                              ),
                              leading: Image.asset(
                                'assets/images/Icon_Cart.png',
                              ),
                              trailing: Icon(
                                Icons.navigate_next,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          child: FlatButton(
                            onPressed: () {},
                            child: ListTile(
                              title: CustomText(
                                text: 'Order History',
                              ),
                              leading: Image.asset(
                                'assets/images/Icon_Cart.png',
                              ),
                              trailing: Icon(
                                Icons.navigate_next,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          child: FlatButton(
                            onPressed: () {},
                            child: ListTile(
                              title: CustomText(
                                text: 'Cards',
                              ),
                              leading: Image.asset(
                                'assets/images/Icon_Cart.png',
                              ),
                              trailing: Icon(
                                Icons.navigate_next,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          child: FlatButton(
                            onPressed: () {},
                            child: ListTile(
                              title: CustomText(
                                text: 'Notifications',
                              ),
                              leading: Image.asset(
                                'assets/images/Icon_Cart.png',
                              ),
                              trailing: Icon(
                                Icons.navigate_next,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          child: FlatButton(
                            onPressed: () {
                              controller.signOut();
                              Get.offAll(LoginView());
                            },
                            child: ListTile(
                              title: CustomText(
                                text: 'Log Out',
                              ),
                              leading: Image.asset(
                                'assets/images/Icon_Cart.png',
                              ),
                              trailing: Icon(
                                Icons.navigate_next,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  )),
            ),
    );
  }

  void _loadCounter() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('userr', aaaa.toString());
    print(aaaa);
  }
}
