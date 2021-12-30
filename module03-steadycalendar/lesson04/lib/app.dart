import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as flutter;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '/repositories/cal_repo.dart';
import '/repositories/cal_repo_interface.dart';
import '/screens/splash/splash.dart';
import '/screens/cal_edit/cal_bg_picker.dart';
import '/screens/cal_edit/cal_color_picker.dart';
import '/screens/cal_edit/cal_edit.dart';
import '/screens/cal_pager/cal_pager.dart';
import '/screens/cal_list/cal_list.dart';
import '/screens/intro/intro.dart';
import '/screens/login_options/login_options.dart';
import '/screens/menu/menu.dart';
import 'providers/session_provider.dart';

class App extends StatelessWidget {
  final State<Splash> splashState;

  const App(this.splashState, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Steady Calendar',
      initialRoute: Splash.routeName,
      routes: {
        Splash.routeName: (context) => Splash(splashState),
        CalPager.routeName: (context) => const CalPager(),
        Intro.routeName: (context) => const Intro(),
        LoginOptions.routeName: (context) => const LoginOptions(),
        CalList.routeName: (context) => const CalList(),
        CalEdit.routeName: (context) => const CalEdit(),
        CalBGPicker.routeName: (context) => const CalBGPicker(),
        CalColorPicker.routeName: (context) => const CalColorPicker(),
        Menu.routeName: (context) => const Menu()
      },
    );
  }
}

/// Performs initialization steps and then runs our app.
Future<void> runAppWithOptions(
    {String envFileName = '.env',
    CalRepoInterface calendarRepository = const CalendarRepository(),
    required State<Splash> splashState}) async {
  flutter.WidgetsFlutterBinding.ensureInitialized();

  await load(fileName: envFileName);

  await Supabase.initialize(
      url: 'https://${env['SUPABASE_PROJECT_ID']!}.supabase.co',
      anonKey: env['SUPABASE_ANON_KEY']!,
      debug: false);

  flutter.runApp(ChangeNotifierProvider(
      create: (context) => SessionProvider(calendarRepository),
      child: App(splashState)));
}
