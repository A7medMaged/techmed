import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:techmed/core/routing/router_generation_config.dart';
import 'package:techmed/core/styling/theme_data.dart';
import 'package:techmed/core/utils/dependency_injection.dart';
import 'package:techmed/features/translation/logic/cubit/local_cubit.dart';
import 'package:techmed/generated/l10n.dart';

void main() async {
  setupDependencyInjection();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LocaleCubit>(),
      child: BlocBuilder<LocaleCubit, Locale>(
        builder: (context, state) {
          return MaterialApp.router(
            theme: AppThemes.darkTheme,
            debugShowCheckedModeBanner: false,
            routerConfig: RouterGenerationConfig.goRouter,
            locale: Locale(state.languageCode),
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
          );
        },
      ),
    );
  }
}
