import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_base/configs/app_configs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

import 'blocs/app_cubit.dart';
import 'blocs/setting/app_setting_cubit.dart';
import 'common/app_themes.dart';
import 'generated/l10n.dart';
import 'router/route_config.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //Setup PortraitUp only
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppCubit>(create: (context) {
          return AppCubit();
        }),
        BlocProvider<AppSettingCubit>(create: (context) {
          return AppSettingCubit();
        }),
      ],
      child: BlocBuilder<AppSettingCubit, AppSettingState>(
        builder: (context, state) {
          return GetMaterialApp(
            title: AppConfigs.appName,
            theme: AppThemes(
              isDarkMode: false,
              primaryColor: state.primaryColor,
            ).theme,
            darkTheme: AppThemes(
              isDarkMode: true,
              primaryColor: state.primaryColor,
            ).theme,
            themeMode: state.themeMode,
            initialRoute: RouteConfig.splash,
            getPages: RouteConfig.getPages,
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              S.delegate,
            ],
            locale: state.locale,
            supportedLocales: S.delegate.supportedLocales,
          );
        },
      ),
    );
  }
}
