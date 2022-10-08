class DataModel {
  int? id;

   String? tableName;

   String? type;

   int? level_no;

  DataModel(
      {this.tableName,
      this.type,
      this.id,
      this.level_no,
      this.isShow,
      this.score,
      this.highScore,
      this.progress});

   int? isShow;

   int? score;

   int? highScore;

   int? progress;


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['\"tableName\"'] = '\"${this.tableName}\"';
    data['\"id\"'] = '\"${this.id}\"';
    data['\"level_no\"'] = '\"${this.level_no}\"';
    data['\"type\"'] = '\"${this.type}\"';
    data['\"progress\"'] = '\"${this.progress}\"';
    data['\"isShow\"'] = '\"${this.isShow}\"';
    data['\"score\"'] = '\"${this.score}\"';
    data['\"highScore\"'] = '\"${this.highScore}\"';
    return data;
  }

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
    tableName: json["tableName"],
    id: int.parse(json["id"]),
    level_no: int.parse(json["level_no"]),
    isShow: int.parse(json["isShow"]),

    type: json["type"],
    progress: (json["progress"]==null)?0:int.parse(json["progress"]),
    score: (json["score"]==null)?0:int.parse(json["score"]),
    highScore: (json["highScore"]==null)?0:int.parse(json["highScore"]),

  );

}
