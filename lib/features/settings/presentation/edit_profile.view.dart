import 'package:fit_food/common/viewmodels/user_view_model.dart';
import 'package:fit_food/features/settings/presentation/widgets/edit.data.dart';
import 'package:fit_food/features/settings/presentation/widgets/image_utils.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../../../components/shared/styles.dart';
import '../../../components/shared/app_colors.dart';
import '../../../components/widgets/app_button.dart';
import '../../../components/widgets/app_text_field.dart';
import '../data/setting.view_models.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  static const routeName = '/edit-profile';

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _updatePass = TextEditingController();
  final _password = TextEditingController();
  final TextFieldValidator _validators = TextFieldValidator();

  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  void dispose() {
    _password.dispose();
    _updatePass.dispose();
    super.dispose();
  }

  //Image file to be uploaded
  XFile? selectedImage;
  String path = ''; //path of the selectedImage

  bool _passwordVisible = true; //password
  bool _visibility = true; //confirm password

  @override
  Widget build(BuildContext context) {
    final uImage = ModalRoute.of(context)?.settings.arguments;
    var userData = ModalRoute.of(context)?.settings.arguments as UserEdit;

    var update = [
      userData.username,
      userData.email,
    ];

    path = uImage.toString();
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Consumer<UserViewModel>(builder: (context, state, widget) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: kcWhiteColor,
          centerTitle: true,
          leading: IconButton(
            onPressed: () => Navigator.pop(
              context,
              update,
            ),
            icon: const Icon(
              IconlyLight.arrow_left_2,
              color: kcTxtColorDark,
            ),
          ),
          elevation: 0,
          title: Text(
            'Profile',
            style: inputText,
          ),
        ),
        backgroundColor: kcWhiteColor,
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: width * 0.032,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: height * 0.02),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      CircleAvatar(
                        radius: 60,
                        backgroundImage: selectedImage != null
                            ? AssetImage(
                                '${XFile(selectedImage!.path)}',
                              )
                            : const AssetImage(userImage),
                      ),
                      Positioned(
                        left: width * 0.23,
                        top: height * 0.09,
                        child: GestureDetector(
                          onTap: () async {
                            selectImage(context);
                          },
                          child: Container(
                            width: 50,
                            height: 35,
                            decoration: const BoxDecoration(
                                color: kcBtnColor, shape: BoxShape.circle),
                            child: const Icon(
                              IconlyLight.edit,
                              color: kcWhiteColor,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: height * 0.02),
                  Text(
                    state.user?.name ?? 'Victor Benita D.',
                    style: btnText.copyWith(color: kcTxtColorDark),
                  ),
                  SizedBox(height: height * 0.03),
                  AppTXTField(
                    hint: userData.username ?? 'Victor Benita D.',
                    leading: const Icon(
                      IconlyLight.profile,
                      color: kcChatRcvdColor,
                    ),
                    onChanged: (userName) {
                      setState(() {
                        userData.username = userName;
                      });
                    },
                  ),
                  SizedBox(height: height * 0.035),
                  AppTXTField(
                    hint: userData.email ?? 'victorbenita3421@hngx.org',
                    leading: const Icon(
                      IconlyLight.message,
                      color: kcChatRcvdColor,
                    ),
                    onChanged: (userEmail) {
                      setState(() {
                        userData.email = userEmail;
                      });
                    },
                  ),
                  SizedBox(height: height * 0.035),
                  AppTXTField(
                    hint: '****************',
                    obscure: _passwordVisible,
                    leading: const Icon(
                      IconlyLight.lock,
                      color: kcChatRcvdColor,
                    ),
                    controller: _password,
                    validator: _validators.forPassword,
                    trailing: GestureDetector(
                      onTap: () {
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                      child: Icon(
                        _passwordVisible ? IconlyLight.hide : IconlyLight.show,
                        color: kcChatRcvdColor,
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.035),
                  AppTXTField(
                    hint: '****************',
                    obscure: _visibility,
                    leading: const Icon(
                      IconlyLight.lock,
                      color: kcChatRcvdColor,
                    ),
                    controller: _updatePass,
                    validator: _validators.forConfirmPassword,
                    trailing: GestureDetector(
                      onTap: () {
                        setState(() {
                          _visibility = !_visibility;
                        });
                      },
                      child: Icon(
                        _visibility ? IconlyLight.hide : IconlyLight.show,
                        color: kcChatRcvdColor,
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.06),
                  AppBTN(
                    title: 'SAVE NOW',
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.pop(
                          context,
                          update,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.green,
                            content: Center(
                              child: Text(
                                'Profile update successful',
                                style: nameText.copyWith(
                                  color: kcWhiteColor,
                                ),
                              ),
                            ),
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
