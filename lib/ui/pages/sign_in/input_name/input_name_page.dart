import 'package:flutter/material.dart';
import 'package:flutter_base/common/app_colors.dart';
import 'package:flutter_base/common/app_images.dart';
import 'package:flutter_base/common/app_text_styles.dart';
import 'package:flutter_base/ui/widgets/buttons/app_tint_button.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(30.0), // here the desired height
        child: AppBar(
          leading: const Icon(
            Icons.arrow_back_ios,
            size: 12,
            color: Colors.black,
          ),
          title: Text('Your Profile'),
          centerTitle: false,
          actions: [
            Container(
              padding: const EdgeInsets.only(right: 24),
              alignment: Alignment.center,
              child: const Icon(
                Icons.add,
                size: 24,
                color: Colors.black,
              ),
            )
          ],
          shadowColor: Colors.transparent,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(2.0),
            child: Container(
              color: Colors.transparent,
            ),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              const SizedBox(height: 59),
              Stack(
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: AppColors.textFieldBackground,
                    ),
                    child: Center(
                      child: Image.asset(
                        AppImages.icAccount,
                        width: 37,
                      ),
                    ),
                  ),
                  Container(
                    height: 95,
                    width: 95,
                    alignment: Alignment.bottomRight,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black,
                      ),
                      child: const Icon(
                        Icons.add,
                        size: 20,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 31),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: TextField(
                  textAlignVertical: TextAlignVertical.bottom,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    filled: true,
                    constraints:
                        const BoxConstraints(minHeight: 36, maxHeight: 36),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.all(
                        Radius.circular(4.0),
                      ),
                    ),
                    fillColor: AppColors.textFieldBackground,
                    hintText: 'First Name (Required)',
                    hintStyle: AppTextStyle.greyS14,
                    helperStyle: AppTextStyle.greyS14,
                    alignLabelWithHint: false,
                  ),
                  style: AppTextStyle.greyS14,
                  onTap: () => {},
                ),
              ),
              const SizedBox(height: 18),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: TextField(
                  textAlignVertical: TextAlignVertical.bottom,
                  decoration: InputDecoration(
                    filled: true,
                    border: InputBorder.none,
                    constraints:
                        const BoxConstraints(minHeight: 36, maxHeight: 36),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.all(
                        Radius.circular(4.0),
                      ),
                    ),
                    fillColor: AppColors.textFieldBackground,
                    hintText: 'Last Name (Optional)',
                    hintStyle: AppTextStyle.greyS14,
                    helperStyle: AppTextStyle.greyS14,
                    alignLabelWithHint: false,
                  ),
                  style: AppTextStyle.greyS14,
                  onTap: () => {},
                ),
              ),
              const SizedBox(height: 18),
            ],
          ),
          _buildSaveButton(),
        ],
      ),
    );
  }
}

Widget _buildSaveButton() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
    child: AppTintButton(
      title: 'Save',
      onPressed: () {
        // Get.to(() => InputCodePage());
      },
    ),
  );
}
