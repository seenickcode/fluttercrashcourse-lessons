import 'package:supabase_flutter/supabase_flutter.dart';
import '/models/calendar.dart';
import 'cal_repo_interface.dart';

class CalendarRepository implements CalRepoInterface {
  const CalendarRepository();

  @override
  Future<List<Calendar>> refreshCalendars() async {
    final resp = await Supabase.instance.client
        .from('calendars')
        .select('id, name, color, background_slug, calendar_dates (date)')
        .execute();
    if (resp.error != null) {
      throw (resp.error.toString());
    }

    return resp.data.map<Calendar>((e) => Calendar.fromJson(e)).toList();
  }
}
