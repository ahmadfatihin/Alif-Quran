import 'package:alif_quran/features/navbar/presentation/ui/screens/home/ui/screens/home_screen.dart';
import 'package:go_router/go_router.dart';

import '../../features/navbar/presentation/ui/screens/book_mark/screens/book_mark_screen.dart';
import '../../features/navbar/presentation/ui/screens/prayer_time/screens/prayer_time_screen.dart';
import '../../features/navbar/presentation/ui/screens/profile/screens/profile_screen.dart';
import '../../features/navbar/presentation/ui/widgets/bottom_nav_widget.dart';

class RoutesConfig {
  static final GoRouter appRouter = GoRouter(
    initialLocation: '/navbar',
    routes: [
      GoRoute(
        path: '/navbar',
        builder: (context, state) => const BottomNavWidget(),
        routes: [
          GoRoute(
            path: 'home',
            builder: (context, state) => const HomeScreen(),
          ),
          GoRoute(
            path: 'bookmark',
            builder: (context, state) => const BookMarkScreen(),
          ),
          GoRoute(
            path: 'pryertime',
            builder: (context, state) => const PrayerTimeScreen(),
          ),
          GoRoute(
            path: 'profile',
            builder: (context, state) => const ProfileScreen(),
          ),
        ],
      ),
    ],
  );
}
