import 'package:easy_dep_injection/repositories/user_repo.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
      url: 'https://awdiqlnrisdiszrxxwmi.supabase.co',
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJvbGUiOiJhbm9uIiwiaWF0IjoxNjQyMjcyMzkzLCJleHAiOjE5NTc4NDgzOTN9.aBWiDF-Css8CIVzGZjhuZ7JLzJ_Y69idEHgxV41hdyQ',
      debug: true);

  runApp(const App(userRepo: UserRepo()));
}
