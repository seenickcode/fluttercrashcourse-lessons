import 'app.dart';
import '/screens/splash/splash_state.dart';

void main() async {
  runAppWithOptions(envFileName: '.env', splashState: SplashState());
}
