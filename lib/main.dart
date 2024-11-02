import 'package:alif_quran/core/di/injector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

import 'core/routes/routes_config.dart';
import 'features/listquran/presentation/cubit/listquran_cubit.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
  await configureDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => GetIt.I<ListquranCubit>(),
          ),
        ],
        child: MaterialApp.router(
          routerConfig: RoutesConfig.appRouter,
        ),
      ),
    );
  }
}
