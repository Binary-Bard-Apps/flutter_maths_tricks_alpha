import 'package:hive/hive.dart';
part 'progress.g.dart';

@HiveType(typeId: 1)
class Progress {
  @HiveField(0)
  final List<String> list;

  Progress(this.list);
}
