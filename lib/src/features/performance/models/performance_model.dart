import 'dart:convert';

class PerformanceModel {
    final int todaySlp;
    final int totalSlp;
    final int meanSlp;
    final int rank;
    final String winRate;
    final int trophies;
    final List<DailySlp> last15Days;

  PerformanceModel(this.todaySlp, this.totalSlp, this.meanSlp, this.rank, this.winRate, this.trophies, this.last15Days);

  Map<String, dynamic> toMap() {
    return {
      'today_slp': todaySlp,
      'total_slp': totalSlp,
      'mean_slp': meanSlp,
      'rank': rank,
      'win_rate': winRate,
      'trophies': trophies,
      'last_15_days': last15Days.map((x) => x.toMap()).toList(),
    };
  }

  factory PerformanceModel.fromMap(Map<String, dynamic> map) {
    return PerformanceModel(
      map['today_slp'],
      map['total_slp'],
      map['mean_slp'],
      map['rank'],
      map['win_rate'],
      map['trophies'],
      List<DailySlp>.from(map['last_15_days']?.map((x) => DailySlp.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory PerformanceModel.fromJson(String source) => PerformanceModel.fromMap(json.decode(source));
}


class DailySlp {
    final DateTime day;
    final int slp;

  DailySlp(this.day, this.slp);

  Map<String, dynamic> toMap() {
    return {
      'day': day.millisecondsSinceEpoch,
      'slp': slp,
    };
  }

  factory DailySlp.fromMap(Map<String, dynamic> map) {
    return DailySlp(
      DateTime.parse(map['day']),
      map['slp'],
    );
  }

  String toJson() => json.encode(toMap());

  factory DailySlp.fromJson(String source) => DailySlp.fromMap(json.decode(source));
}
