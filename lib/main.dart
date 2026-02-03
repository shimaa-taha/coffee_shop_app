import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'screens/home_screen.dart';
import 'blocs/coffee_bloc.dart';
import 'blocs/coffee_event.dart';
import 'blocs/cart_bloc.dart';
import 'blocs/favorite_bloc.dart';
import 'blocs/favorite_event.dart';
import 'blocs/notification_bloc.dart';
import 'blocs/notification_event.dart';

void main() {
  runApp(const CoffeeShopApp());
}

class CoffeeShopApp extends StatelessWidget {
  const CoffeeShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CoffeeBloc()..add(LoadCoffees()),
        ),
        BlocProvider(
          create: (context) => CartBloc(),
        ),
        BlocProvider(
          create: (context) => FavoriteBloc()..add(LoadFavorites()),
        ),
        BlocProvider(
          create: (context) => NotificationBloc()..add(LoadNotifications()),
        ),
      ],
      child: MaterialApp(
        title: 'Coffee Shop',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
          scaffoldBackgroundColor: const Color(0xFF0D0D0D),
          primaryColor: const Color(0xFFC67C4E),
          colorScheme: const ColorScheme.dark(
            primary: Color(0xFFC67C4E),
            secondary: Color(0xFFEDD6C8),
            surface: Color(0xFF1A1A1A),
          ),
          fontFamily: 'Sora',
          textTheme: const TextTheme(
            displayLarge: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            bodyLarge: TextStyle(
              fontSize: 16,
              color: Color(0xFFB7B7B7),
            ),
          ),
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
