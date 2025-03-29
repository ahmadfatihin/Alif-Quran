import 'package:alif_quran/core/di/injector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

import 'core/routes/routes_config.dart';
import 'features/listquran/presentation/cubit/listquran_cubit.dart';
import 'features/navbar/presentation/cubit/bottomnav_cubit.dart';
import 'features/navbar/presentation/ui/screens/home/presentation/cubit/location_cubit.dart';
import 'features/prayer/presentation/cubit/prayer_cubit.dart';
import 'features/quran/presentation/cubit/quran_cubit.dart';

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
            create: (context) => GetIt.I<ListquranCubit>()..getListQuranData(),
          ),
          BlocProvider(
            create: (context) => GetIt.I<QuranCubit>(),
          ),
          BlocProvider(
            create: (context) => GetIt.I<LocationCubit>()..fetchLocation(),
          ),
          BlocProvider(
            create: (context) => GetIt.I<PrayerCubit>()..fetchPrayerTime(),
          ),
          BlocProvider(
            create: (context) => BottomNavCubit(),
          ),
        ],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: RoutesConfig.appRouter,
        ),
      ),
    );
  }
}
