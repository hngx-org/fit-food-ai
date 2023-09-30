import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../../../components/shared/styles.dart';
import '../../../components/shared/app_colors.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kcWhiteColor,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            IconlyLight.arrow_left,
            color: kcTxtColorDark,
          ),
        ),
        elevation: 0,
        title: Text(
          'Settings',
          style: inputText,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.032,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(),
            SizedBox(height: height * 0.02),
            Text('data'),
          ],
        ),
      ),
    );
  }
}
