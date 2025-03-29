import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import '../../features/listquran/presentation/ui/screens/list_quran_sccreen.dart';
import '../../features/navbar/presentation/ui/screens/book_mark/screens/book_mark_screen.dart';
import '../../features/navbar/presentation/ui/screens/home/presentation/ui/screens/home_screen.dart';
import '../../features/navbar/presentation/ui/screens/prayer_time/screens/prayer_time_screen.dart';
import '../../features/navbar/presentation/ui/widgets/bottom_nav_widget.dart';
import '../../features/quran/presentation/ui/screens/quran_screen.dart';
import '../../features/navbar/presentation/ui/screens/profile/screens/profile_screen.dart';

class RoutesConfig {
  static final GoRouter appRouter = GoRouter(
    initialLocation: '/navbar/home',
    routes: [
      ShellRoute(
        navigatorKey: GlobalKey<NavigatorState>(),
        builder: (context, state, child) {
          return BottomNavWidget(child: child);
        },
        routes: [
          GoRoute(
            path: '/navbar',
            builder: (context, state) => const HomeScreen(),
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
      ),
      GoRoute(
        path: '/listQuran',
        builder: (context, state) => const ListQuranScreen(),
      ),
      GoRoute(
        path: '/quran/:id',
        builder: (context, state) {
          final id = int.tryParse(state.pathParameters['id'] ?? '0') ?? 0;
          return QuranScreen(surahId: id);
        },
      ),
    ],
  );
}
