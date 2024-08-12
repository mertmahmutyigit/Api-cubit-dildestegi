import 'package:cubit/CubitApi/cubit.dart';
import 'package:cubit/CubitApi/cubitapi.dart';
import 'package:cubit/constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
    child:  MyApp(),
    supportedLocales: [
      LocalConstants.enLocale,
      LocalConstants.trLocale,
    ],
    saveLocale: true,
    fallbackLocale: LocalConstants.trLocale, //Varasayılan Dil Türkçe
    path: LocalConstants.localePath,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CubitApiExample>(
          create: (BuildContext context) => CubitApiExample(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const CAExample(),
      ),
    );
  }
}
