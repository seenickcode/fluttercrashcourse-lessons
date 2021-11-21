import 'package:flutter/material.dart' as flutter;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '/screens/splash/splash.dart';
import 'app.dart';

void main() async {
  flutter.WidgetsFlutterBinding.ensureInitialized();

  await load(fileName: '.env');

  await Supabase.initialize(
      url: 'https://${env['SUPABASE_PROJECT_ID']!}.supabase.co',
      anonKey: env['SUPABASE_ANON_KEY']!,
      debug: false);

  flutter.runApp(App(SplashState()));
}
