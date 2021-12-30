import 'package:supabase_flutter/supabase_flutter.dart';
import '/models/calendar.dart';
import 'package:postgrest/postgrest.dart';
import '/models/calendar_date.dart';
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

  @override
  saveCalendar(Calendar cal) async {
    _assignUserID(cal);

    PostgrestResponse resp;
    if (cal.id == null) {
      // create
      resp = await Supabase.instance.client
          .from('calendars')
          .insert(cal)
          .execute();
    } else {
      // update
      resp = await Supabase.instance.client
          .from('calendars')
          .update({
            'name': cal.name,
            'color': cal.colorHex,
            'background_slug': cal.backgroundSlug
          })
          .eq('id', cal.id)
          .execute();
    }

    if (resp.error != null) {
      throw (resp.error.toString());
    }
  }

  @override
  deleteCalendar(Calendar cal) async {
    _assignUserID(cal);

    final resp = await Supabase.instance.client
        .from('calendars')
        .delete()
        .eq('id', cal.id)
        .execute();
    if (resp.error != null) {
      throw (resp.error.toString());
    }
  }

  @override
  saveDate(Calendar cal, DateTime date) async {
    _assignUserID(cal);

    // NOTE we could instead submit a CalendarDate vs a Map here but at this
    // time would be overkill
    final resp = await Supabase.instance.client.from('calendar_dates').insert({
      'user_id': cal.userID,
      'calendar_id': cal.id,
      'date': calendarDateToString(date)
    }).execute();
    if (resp.error != null) {
      throw (resp.error.toString());
    }
  }

  @override
  deleteDate(Calendar cal, DateTime date) async {
    _assignUserID(cal);

    // NOTE another approach is to use a CalendarDate and delete via 'id' (pk) but
    // that would be overkill at this time
    final resp = await Supabase.instance.client
        .from('calendar_dates')
        .delete()
        .eq('calendar_id', cal.id)
        .eq('date', date)
        .execute();
    if (resp.error != null) {
      throw (resp.error.toString());
    }
  }

  _assignUserID(Calendar cal) {
    cal.userID = Supabase.instance.client.auth.user()?.id;
  }
}
