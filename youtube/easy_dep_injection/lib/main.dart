import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // NOTES:
  // - normally we'd use something like flutter_dotenv package vs hardcoding
  //   these values here.
  await Supabase.initialize(
      // we get this value from https://app.supabase.io/project/awdiqlnrisdiszrxxwmi/settings/api
      // in the 'Config' section such as 'https://YOURPROJECTID.supabase.co'
      url: 'https://awdiqlnrisdiszrxxwmi.supabase.co',

      // we get this value from https://app.supabase.io/project/awdiqlnrisdiszrxxwmi/settings/api
      // in the 'Project API Keys' section. again, in a real app we wouldn't
      // hardcode this in (see above). for this tutorial, it's fine to use this
      // value because it's an "anonymous" key and can be publically available
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJvbGUiOiJhbm9uIiwiaWF0IjoxNjQyMjcyMzkzLCJleHAiOjE5NTc4NDgzOTN9.aBWiDF-Css8CIVzGZjhuZ7JLzJ_Y69idEHgxV41hdyQ',
      debug: true);

  runApp(const App());
}
