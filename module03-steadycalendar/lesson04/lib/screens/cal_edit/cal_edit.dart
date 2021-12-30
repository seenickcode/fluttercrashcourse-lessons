import 'package:flutter/material.dart';
import '/screens/cal_edit/cal_color_picker.dart';
import 'package:provider/provider.dart';
import '/util/alert.dart';
import '/models/calendar.dart';
import '../../providers/session_provider.dart';
import '/config/styles.dart';
import '/components/sc_list_container.dart';
import '/components/sc_nav_bar.dart';
import '/components/sc_footer_button.dart';
import '/components/sc_nav_text_button.dart';
import '/components/sc_list_divider.dart';
import 'cal_bg_picker.dart';
import 'cal_bg_tile.dart';
import 'cal_color_tile.dart';

class CalEditArguments {
  final Calendar? cal;

  CalEditArguments(this.cal);
}

class CalEdit extends StatefulWidget {
  static const String routeName = '/cal_edit';
  static const String nameKey = 'name';
  static const String bgTileKey = 'bg-tile';
  static const String colorTileKey = 'color-tile';
  static const String saveKey = 'save';

  const CalEdit({Key? key}) : super(key: key);

  @override
  _CalEditState createState() => _CalEditState();
}

class _CalEditState extends State<CalEdit> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late Calendar cal;

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as CalEditArguments;

    cal = args.cal ?? Calendar.blank();

    return SCNavBar(
      title: (cal.id == null ? 'Create' : 'Edit'),
      child: Form(
          key: _formKey,
          child: Stack(children: [
            SCListContainer([
              TextFormField(
                  key: const Key(CalEdit.nameKey),
                  initialValue: cal.name,
                  style:
                      const TextStyle(fontSize: Styles.primaryHeaderFontSize),
                  decoration: Styles.textFormFieldDecoration('Name'),
                  validator: (value) => (value == null || value.isEmpty
                      ? 'Name is required'
                      : null),
                  onSaved: (String? val) => cal.name = val.toString()),
              const SCListDivider(),
              CalBGTile(cal.backgroundSlug, key: const Key(CalEdit.bgTileKey), onTap: calBGTileTap),
              const SCListDivider(),
              CalColorTile(cal.color, key: const Key(CalEdit.colorTileKey), onTap: calColorTileTap),
              const SCListDivider(),
            ]),
            Positioned(
                width: MediaQuery.of(context).size.width,
                height: 50.0,
                bottom: 0.0,
                child: Container(
                    padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(255, 255, 255, 0.8),
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SCFooterButton(
                              'assets/icons/icons8-trash-can-100.png',
                              onTap: () => deleteTapped(context))
                        ]))),
          ])),
      rightActions: [
        SCNavBarTextButton(key: const Key(CalEdit.saveKey), title: 'Save', onTap: () => submit(context))
      ],
    );
  }

  calBGTileTap() async {
    final result =
        await Navigator.of(context).pushNamed(CalBGPicker.routeName) as String?;

    // NOTE result can be null if back button tapped
    if (result != null) {
      setState(() {
        cal.backgroundSlug = result;
      });
    }
  }

  calColorTileTap() async {
    final result = await Navigator.of(context)
        .pushNamed(CalColorPicker.routeName) as String?;

    // NOTE result can be null if back button tapped
    if (result != null) {
      setState(() {
        cal.colorHex = result;
      });
    }
  }

  deleteTapped(BuildContext context) async {
    await showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext builderContext) {
        return AlertDialog(
            title: const Text('Delete Permanently?'),
            content: SingleChildScrollView(
              child: ListBody(
                children: const <Widget>[
                  Text('This action cannot be undone.'),
                ],
              ),
            ),
            actions: [
              TextButton(
                child: const Text('Cancel'),
                onPressed: () {
                  Navigator.of(builderContext).pop();
                },
              ),
              TextButton(
                child: const Text('Yes, Delete Permanently'),
                onPressed: () {
                  delete(context);
                  Navigator.of(builderContext).pop();
                  Navigator.of(context).pop();
                },
              )
            ]);
      },
    );
  }

  delete(BuildContext context) async {
    final session = Provider.of<SessionProvider>(context, listen: false);

    await session
        .deleteCalendar(cal)
        .catchError((e) => showAlert(context, 'Error', e.toString()));

    await session.refreshCalendars();
  }

  submit(BuildContext context) async {
    final form = _formKey.currentState!;

    if (form.validate()) {
      form.save();

      final session = Provider.of<SessionProvider>(context, listen: false);

      await session
          .saveCalendar(cal)
          .catchError((e) => showAlert(context, 'Error', e.toString()));

      await session.refreshCalendars();

      // TODO show reload spinner when doing any supabase updates
      Navigator.of(context).pop();
    }
  }
}
