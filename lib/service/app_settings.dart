import 'dart:io';

import 'package:note_app_service/service/ext_service.dart';

import '../menu/create_note_menu.dart';
import '../menu/sellect_delate_menu.dart';
import '../menu/view_one_note_menu.dart';
import '../models/menu_models.dart';
import 'file_service.dart';
import 'io_service.dart';
import 'lang_service.dart';

class AppSettings extends Menu {
  static const String id = "/app_settings";

  Future<void> viewNoteList() async {
    FileService fileService = FileService();
    await fileService.init();
    List<FileSystemEntity> files = fileService.directory.listSync();
    if (files.isEmpty) {
      for (int i = 0; i < files.length; i++) {
        writeln(
            "${i + 1}.${files[i].path.substring(files[0].path.lastIndexOf("//") + 1)}");
      }
      writeln("I." + "change_pas".tr);
      writeln("II." + "change_lang".tr);
      writeln("III." + "back_to_menu".tr);
      String selectMenu = read();
      await selectFunctionIf(selectMenu, files);
    } else {
      writeln("no_note".tr);
      writeln("I." + "create_note".tr);
      writeln("II." + "back_to_home".tr);
      String selectMenu = read();
      await selectFunctionElse(selectMenu);
    }
  }

  Future<void> chooseLang() async {
    FileService fileService = FileService();
    await fileService.init();
    List<FileSystemEntity> files = fileService.directory.listSync();
    if (files.isEmpty) {
      for (int i = 0; i < files.length; i++) {
        writeln(
            "${i + 1}.${files[i].path.substring(files[0].path.lastIndexOf("//") + 1)}");
      }
      writeln("I." + "change_pas".tr);
      writeln("II." + "change_lang".tr);
      writeln("III." + "back_to_menu".tr);
      String selectMenu = read();
      await selectLang(selectMenu, files);
    } else {
      writeln("no_note".tr);
      writeln("I." + "create_note".tr);
      writeln("II." + "back_to_home".tr);
      String selectMenu = read();
      await selectFunctionElse(selectMenu);
    }
  }

  Future<void> selectFunctionIf(
      String selectedMenu, List<FileSystemEntity> files) async {
    switch (selectedMenu) {
      case "I":
        {
          write("\n\n\n\n\n\n");
          await Navigator.push(ViewOneNoteMenu(list: files));
        }
        break;
      case "II":
        {
          write("\n\n\n\n\n");
          writeln("choose_lang".tr);
          await chooseLang();
        }
        break;
      case "III":
        {
          write("\n\n\n\n\n");
          // hali bor
          await Navigator.push(SelectDeleteMenu(list: files));
        }
        break;
      default:
        {
          writeln("error".tr);
        }
    }
  }

  Future<void> selectLang(
      String selectedMenu, List<FileSystemEntity> files) async {
    switch (selectedMenu) {
      case "I":
        {
          write("\n\n\n\n\n");
          write("Rus tiliga o'tkazildi!\n\n");
          LangService.language = Language.ru;
        }
        break;
      case "II":
        {
          write("\n\n\n\n\n");
          write("Uzbek tiliga o'tkazildi!");
          LangService.language = Language.uz;
        }
        break;
      case "III":
        {
          write("\n\n\n\n\n");
          write("Ingliz tiliga o'tkazildi!");
          LangService.language = Language.en;
        }
        break;
      default:
        {
          writeln("error".tr);
        }
    }
  }

  Future<void> selectFunctionElse(String selectedMenu) async {
    switch (selectedMenu) {
      case "I":
        {
          write("\n\n\n\n\n");
          await Navigator.pushReplacement(CreateNoteMenu());
        }
        break;
      case "II":
        {
          write("\n\n\n\n\n");
          await Navigator.pop();
        }
        break;
      default:
        {
          writeln("error".tr);
        }
    }
  }

  @override
  Future<void> build() async {
    await viewNoteList();
  }
}
