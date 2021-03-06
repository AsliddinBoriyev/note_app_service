
import 'dart:io';

import 'package:note_app_service/service/ext_service.dart';

import '../models/menu_models.dart';
import '../models/note_model.dart';
import '../service/file_service.dart';
import '../service/io_service.dart';
import 'edit_note_menu.dart';

class ViewOneNoteMenu extends Menu {
  static const String id = "/view_one_note_menu";
  List<FileSystemEntity>? list;

  ViewOneNoteMenu({this.list});

  Future<String> getFileFromPath(int id) async {
    FileSystemEntity fileSystemEntity = list![id - 1];
    String path = fileSystemEntity.path;
    Note note = await FileService().readFileFromPath(path);
    return note.toString();
  }

  Future<void> selectFunction(String selectedMenu, int id) async {
    FileSystemEntity fileSystemEntity = list![id - 1];
    String path = fileSystemEntity.path;
    switch(selectedMenu) {
      case "I": {
        write("\n\n\n\n\n\n");
        await Navigator.push(EditNoteMenu(path: path));
      } break;
      case "II": {
        write("\n\n\n\n\n\n");
        FileService fileService = FileService();
        await fileService.deleteFileFromPath(path);
        await Navigator.pop();
      } break;
      case "III": {
        write("\n\n\n\n\n\n");
        await Navigator.pop();
      } break;
      case "IV": {
        write("\n\n\n\n\n\n");
        await Navigator.popUntil();
      } break;
      default: {
        writeln("error".tr);
      }
    }
  }


  @override
  Future<void> build() async {
    write("enter_note_number".tr);
    int noteNumber = read().toInt;
    String note = await getFileFromPath(noteNumber);
    writeln(note + "\n");
    writeln("I. " + "update".tr);
    writeln("II. " + "delete".tr);
    writeln("III. " + "back_to".tr);
    writeln("IV. " + "back_to_home".tr);
    String selectedMenu = read();
    await selectFunction(selectedMenu, noteNumber);
  }
}