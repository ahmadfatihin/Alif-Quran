import 'package:alif_quran/features/home/ui/screens/home_screen.dart';
import 'package:go_router/go_router.dart';

import '../../features/listquran/presentation/ui/screens/list_quran_sccreen.dart';

class RoutesConfig {
  static String home = '/';
  static GoRouter appRouter = GoRouter(initialLocation: home, routes: <GoRoute>[
    GoRoute(
      path: home,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/listQuran',
      builder: (context, state) => const ListQuranScreen(),
    ),
  ]);
}
