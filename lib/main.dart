import 'package:di/di.dart';
import 'package:domain/common/refresh_token_exception_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:ibn_sina_flutter/core/di/injector.dart';
import 'package:ibn_sina_flutter/core/ui/theme/colors.dart';
import 'package:ibn_sina_flutter/features/app/business_logic/app_cubit.dart';
import 'package:ibn_sina_flutter/features/app/business_logic/app_states.dart';
import 'core/helper/refresh_token_exception_handler.dart';
import 'core/routing/app_router.dart';
import 'core/routing/app_routes.dart';
import 'core/translation_service/translation_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  diInjector.registerSingleton<IRefreshTokenExceptionHandler>(
    RefreshTokenExceptionHandler(),
  );
  await DI.registerDependencies();
  registerDependencies(diInjector);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<AppCubit>(),
        ),
      ],
      child: BlocBuilder<AppCubit, AppStates>(
        builder: (context, state) {
          AppCubit cubit = BlocProvider.of(context);
          return GestureDetector(
            onTap: () {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: GetMaterialApp(
              themeMode: ThemeMode.light,
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(
                  seedColor: orangeColor,
                ),
                useMaterial3: true,
              ),
              darkTheme: ThemeData(
                colorScheme: ColorScheme.fromSeed(
                  seedColor: orangeColor,
                ),
                useMaterial3: true,
              ),
              supportedLocales: const <Locale>[
                Locale('en'),
                Locale('ar'),
              ],
              translations: TranslationService(),
              title: 'Flutter Demo',
              debugShowCheckedModeBanner: false,
              onGenerateRoute: AppRouter().generateRouter,
              initialRoute: AppRoutes.home,
              locale: Locale(cubit.currentLocale),
              localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
            ),
          );
        },
      ),
    );
  }
}
