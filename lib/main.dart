import 'package:flutter/material.dart';
import 'package:kinyaana/config/routes.dart';
import 'package:kinyaana/features/profile/presentation/controller/profile_provider.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'features/auth/presentation/controller/auth_provider.dart';
import 'shared/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await Supabase.initialize(
    url: dotenv.env['API_KEY']!,
    anonKey: dotenv.env['API_ANON']!,
  );

  runApp(
    MultiProvider(
      providers: [

        // Auth provider
        ChangeNotifierProvider(
          create: (_) => AuthProvider(),
        ),

        ChangeNotifierProvider(
          create: (_) => ProfileProvider(),
        )

      ] ,
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      routes: AppRoutes.routes,

      initialRoute: AppRoutes.login,
    );
  }
}