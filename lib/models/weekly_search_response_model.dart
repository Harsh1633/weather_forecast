import 'dart:convert';

WeeklyDataResponseModel weeklyDataResponseModelFromJson(String str) =>
    WeeklyDataResponseModel.fromJson(json.decode(str));

String weeklyDataResponseModelToJson(WeeklyDataResponseModel data) =>
    json.encode(data.toJson());

class WeeklyDataResponseModel {
  Location? location;
  Current? current;
  Forecast? forecast;

  WeeklyDataResponseModel({
    this.location,
    this.current,
    this.forecast,
  });

  factory WeeklyDataResponseModel.fromJson(Map<String, dynamic> json) {
    return WeeklyDataResponseModel(
      location:
      json["location"] != null ? Location.fromJson(json["location"]) : null,
      current:
      json["current"] != null ? Current.fromJson(json["current"]) : null,
      forecast:
      json["forecast"] != null ? Forecast.fromJson(json["forecast"]) : null,
    );
  }

  Map<String, dynamic> toJson() => {
    "location": location?.toJson(),
    "current": current?.toJson(),
    "forecast": forecast?.toJson(),
  };
}

class Current {
  int? lastUpdatedEpoch;
  String? lastUpdated;
  double? tempC;
  double? tempF;
  int? isDay;
  Condition? condition;

  Current({
    this.lastUpdatedEpoch,
    this.lastUpdated,
    this.tempC,
    this.tempF,
    this.isDay,
    this.condition,
  });

  factory Current.fromJson(Map<String, dynamic> json) {
    return Current(
      lastUpdatedEpoch: json["last_updated_epoch"],
      lastUpdated: json["last_updated"],
      tempC: (json["temp_c"] as num?)?.toDouble(),
      tempF: (json["temp_f"] as num?)?.toDouble(),
      isDay: json["is_day"],
      condition: json["condition"] != null
          ? Condition.fromJson(json["condition"])
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
    "last_updated_epoch": lastUpdatedEpoch,
    "last_updated": lastUpdated,
    "temp_c": tempC,
    "temp_f": tempF,
    "is_day": isDay,
    "condition": condition?.toJson(),
  };
}

class Condition {
  String? text;
  String? icon;
  int? code;

  Condition({
    this.text,
    this.icon,
    this.code,
  });

  factory Condition.fromJson(Map<String, dynamic> json) {
    return Condition(
      text: json["text"],
      icon: json["icon"],
      code: json["code"],
    );
  }

  Map<String, dynamic> toJson() => {
    "text": text,
    "icon": icon,
    "code": code,
  };
}

class Forecast {
  List<Forecastday>? forecastday;

  Forecast({this.forecastday});

  factory Forecast.fromJson(Map<String, dynamic> json) {
    return Forecast(
      forecastday: json["forecastday"] == null
          ? []
          : List<Forecastday>.from(
          json["forecastday"].map((x) => Forecastday.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "forecastday": forecastday?.map((e) => e.toJson()).toList(),
  };
}

class Forecastday {
  DateTime? date;
  int? dateEpoch;
  Day? day;
  Astro? astro;

  Forecastday({
    this.date,
    this.dateEpoch,
    this.day,
    this.astro,
  });

  factory Forecastday.fromJson(Map<String, dynamic> json) {
    return Forecastday(
      date: json["date"] != null ? DateTime.parse(json["date"]) : null,
      dateEpoch: json["date_epoch"],
      day: json["day"] != null ? Day.fromJson(json["day"]) : null,
      astro: json["astro"] != null ? Astro.fromJson(json["astro"]) : null,
    );
  }

  Map<String, dynamic> toJson() => {
    "date": date?.toIso8601String(),
    "date_epoch": dateEpoch,
    "day": day?.toJson(),
    "astro": astro?.toJson(),
  };
}

class Astro {
  String? sunrise;
  String? sunset;

  Astro({
    this.sunrise,
    this.sunset,
  });

  factory Astro.fromJson(Map<String, dynamic> json) {
    return Astro(
      sunrise: json["sunrise"],
      sunset: json["sunset"],
    );
  }

  Map<String, dynamic> toJson() => {
    "sunrise": sunrise,
    "sunset": sunset,
  };
}

class Day {
  double? maxtempC;
  double? mintempC;
  double? avgtempC;
  Condition? condition;

  Day({
    this.maxtempC,
    this.mintempC,
    this.avgtempC,
    this.condition,
  });

  factory Day.fromJson(Map<String, dynamic> json) {
    return Day(
      maxtempC: (json["maxtemp_c"] as num?)?.toDouble(),
      mintempC: (json["mintemp_c"] as num?)?.toDouble(),
      avgtempC: (json["avgtemp_c"] as num?)?.toDouble(),
      condition: json["condition"] != null
          ? Condition.fromJson(json["condition"])
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
    "maxtemp_c": maxtempC,
    "mintemp_c": mintempC,
    "avgtemp_c": avgtempC,
    "condition": condition?.toJson(),
  };
}

class Location {
  String? name;
  String? region;
  String? country;
  double? lat;
  double? lon;

  Location({
    this.name,
    this.region,
    this.country,
    this.lat,
    this.lon,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      name: json["name"],
      region: json["region"],
      country: json["country"],
      lat: (json["lat"] as num?)?.toDouble(),
      lon: (json["lon"] as num?)?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() => {
    "name": name,
    "region": region,
    "country": country,
    "lat": lat,
    "lon": lon,
  };
}
