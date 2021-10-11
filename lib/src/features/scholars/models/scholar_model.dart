import 'dart:convert';

class ScholarModel {
  final String name;
  final int trophies;
  final int ranking;
  final int todaySlp;
  final int meanSlp;
  final int totalSlp;

  ScholarModel(
      {required this.name,
      required this.trophies,
      required this.ranking,
      required this.todaySlp,
      required this.meanSlp,
      required this.totalSlp});

  factory ScholarModel.fromMap(Map<String, dynamic> map) {
    return ScholarModel(
      name: map['name'],
      trophies: map['trophies'],
      ranking: map['ranking'],
      todaySlp: map['today_slp'],
      meanSlp: map['mean_slp'],
      totalSlp: map['total_slp'],
    );
  }

  factory ScholarModel.fromJson(String source) =>
      ScholarModel.fromMap(json.decode(source));
}
