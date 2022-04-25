

import 'package:note_app_service/menu/all_notes_menu.dart';
import 'package:note_app_service/menu/create_note_menu.dart';
import 'package:note_app_service/menu/edit_note_menu.dart';
import 'package:note_app_service/menu/home_menu.dart';
import 'package:note_app_service/menu/sellect_delate_menu.dart';
import 'package:note_app_service/menu/view_one_note_menu.dart';
import 'package:note_app_service/service/lang_service.dart';
import 'package:note_app_service/service/note_service.dart';

void main() async {

  MyApp(
    home: HomeMenu(),
    locale: await LangService.currentLanguage(),
    routes: {
      // key: value
      // /home_menu: HomeMenu()
      HomeMenu.id: HomeMenu(),
      CreateNoteMenu.id: CreateNoteMenu(),
      AllNotesMenu.id: AllNotesMenu(),
      ViewOneNoteMenu.id: ViewOneNoteMenu(),
      EditNoteMenu.id: EditNoteMenu(),
      SelectDeleteMenu.id: SelectDeleteMenu(),
    },
  );
}