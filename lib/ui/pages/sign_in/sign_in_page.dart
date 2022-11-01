import 'package:flutter/material.dart';
import 'package:flutter_base/blocs/app_cubit.dart';
import 'package:flutter_base/common/app_colors.dart';
import 'package:flutter_base/common/app_text_styles.dart';
import 'package:flutter_base/models/enums/load_status.dart';
import 'package:flutter_base/ui/commons/phone_field/intl_phone_field.dart';
import 'package:flutter_base/ui/widgets/buttons/app_tint_button.dart';
import 'package:flutter_base/ui/widgets/input/app_password_input.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../repositories/auth_repository.dart';
import '../../../repositories/user_repository.dart';
import 'sign_in_cubit.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (con) {
        final authRepo = RepositoryProvider.of<AuthRepository>(context);
        final userRepo = RepositoryProvider.of<UserRepository>(context);
        final appCubit = RepositoryProvider.of<AppCubit>(context);
        return SignInCubit(
          authRepo: authRepo,
          userRepo: userRepo,
          appCubit: appCubit,
        );
      },
      child: const SignInChildPage(),
    );
  }
}

class SignInChildPage extends StatefulWidget {
  const SignInChildPage({Key? key}) : super(key: key);

  @override
  State<SignInChildPage> createState() => _SignInChildPageState();
}

class _SignInChildPageState extends State<SignInChildPage> {
  late TextEditingController usernameTextController;
  late TextEditingController passwordTextController;

  late ObscureTextController obscurePasswordController;

  late SignInCubit _cubit;

  @override
  void initState() {
    super.initState();
    usernameTextController = TextEditingController(text: 'mobile@newwave.com');
    passwordTextController = TextEditingController(text: "mobile");
    obscurePasswordController = ObscureTextController(obscureText: true);
    _cubit = BlocProvider.of<SignInCubit>(context);
    _cubit.changeUsername(username: usernameTextController.text);
    _cubit.changePassword(password: passwordTextController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBodyWidget(),
      resizeToAvoidBottomInset: false,
    );
  }

  Widget buildBodyWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Enter Your Phone Number',
          style: AppTextStyle.blackS24Bold,
        ),
        const SizedBox(height: 8),
        SizedBox(
          width: 295,
          child: Text(
            "Please confirm your country code and enter your phone number",
            style: AppTextStyle.blackS14,
            textAlign: TextAlign.center,
            maxLines: 2,
          ),
        ),
        const SizedBox(height: 48),
        Container(
          height: 36,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: IntlPhoneField(
            dropdownTextStyle: AppTextStyle.greyS14,
            showDropdownIcon: false,
            decoration: InputDecoration(
              hintText: 'Phone Number',
              hintStyle: AppTextStyle.greyS14,
              filled: true,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4.0),
                  borderSide: BorderSide.none),
              fillColor: AppColors.textFieldBackground,
              contentPadding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 10,
              ),
            ),
            initialCountryCode: 'VN',
            disableLengthCheck: true,
            onChanged: (phone) {
              print(phone.completeNumber);
            },
          ),
        ),
        _buildSignButton(),
      ],
    );
  }

  Widget _buildSignButton() {
    return BlocBuilder<SignInCubit, SignInState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: AppTintButton(
            title: 'Continue',
            onPressed: _signIn,
            isLoading: state.signInStatus == LoadStatus.loading,
          ),
        );
      },
    );
  }

  void _signIn() {
    _cubit.signIn();
  }
}
