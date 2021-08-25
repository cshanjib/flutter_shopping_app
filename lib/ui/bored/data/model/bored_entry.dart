import 'package:json_annotation/json_annotation.dart';

part 'bored_entry.g.dart';

@JsonSerializable()
class BoredEntry {
  final String activity;
  final String type;
  final int participants;

  @JsonKey(fromJson: _safeDouble)
  final double price;
  final String link;
  final String key;

  @JsonKey(fromJson: _safeDouble)
  final double accessibility;

  static _safeDouble(value) {
    return value is int ? value.toDouble() : value;
  }

  BoredEntry(
      {this.activity,
      this.type,
      this.participants,
      this.price,
      this.link,
      this.key,
      this.accessibility});

  Map<String, dynamic> toJson() {
    return _$BoredEntryToJson(this);
  }

  factory BoredEntry.fromJson(Map<String, dynamic> json) {
    return _$BoredEntryFromJson(json);
  }

  @override
  String toString() {
    return "BoredEntry { activity: $activity }";
  }
}
