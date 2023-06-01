import 'dart:convert';

class ModelReminder {
  int? id;
  String? time;
  String? repeat;
  String? idList;
  String? ison;

  factory ModelReminder.fromMap(dynamic dynamicObj) {
    return ModelReminder(
        id: dynamicObj["id"],
        time: dynamicObj["time"],
        repeat: dynamicObj["repeat"],
        idList: dynamicObj["idList"],
        ison: dynamicObj["ison"]);
  }

  ModelReminder({
    this.id,
    this.time,
    this.repeat,
    this.ison,
    this.idList,
  });

  static Map<String, dynamic> toMap(ModelReminder music) => {
    'id': music.id,
    'repeat': music.repeat,
    'time': music.time,
    'idList': music.idList,
    'ison': music.ison,
  };


  static String encode(List<ModelReminder> musics) => json.encode(
        musics
            .map<Map<String, dynamic>>((music) => ModelReminder.toMap(music))
            .toList(),
      );

  static List<ModelReminder> decode(String musics) =>
      (json.decode(musics) as List<dynamic>)
          .map<ModelReminder>((item) => ModelReminder.fromMap(item))
          .toList();
}
