import 'dart:convert';

import 'package:flutter/foundation.dart';

class Booking {
  String closingTime;
  String day;
  bool isOpened;
  String openingTime;
  Booking({
    this.closingTime,
    this.day,
    this.isOpened,
    this.openingTime,
  });

  Map<String, dynamic> toMap() {
    return {
      'closingTime': closingTime,
      'day': day,
      'isOpened': isOpened,
      'openingTime': openingTime,
    };
  }

  factory Booking.fromMap(Map<String, dynamic> map) {
    return Booking(
      closingTime: map['closingTime'],
      day: map['day'],
      isOpened: map['isOpened'],
      openingTime: map['openingTime'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Booking.fromJson(String source) =>
      Booking.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Booking(closingTime: $closingTime, day: $day, isOpened: $isOpened, openingTime: $openingTime)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Booking &&
        other.closingTime == closingTime &&
        other.day == day &&
        other.isOpened == isOpened &&
        other.openingTime == openingTime;
  }

  @override
  int get hashCode {
    return closingTime.hashCode ^
        day.hashCode ^
        isOpened.hashCode ^
        openingTime.hashCode;
  }
}

class Clinic {
  bool approved;
  String serviceProviderCity;
  String serviceProviderEmail;
  String serviceProviderName;
  String serviceProviderPhone;
  String serviceProviderStreet;
  List<Booking> timing;
  Clinic({
    this.approved,
    this.serviceProviderCity,
    this.serviceProviderEmail,
    this.serviceProviderName,
    this.serviceProviderPhone,
    this.serviceProviderStreet,
    this.timing,
  });

  Map<String, dynamic> toMap() {
    return {
      'approved': approved,
      'serviceProviderCity': serviceProviderCity,
      'serviceProviderEmail': serviceProviderEmail,
      'serviceProviderName': serviceProviderName,
      'serviceProviderPhone': serviceProviderPhone,
      'serviceProviderStreet': serviceProviderStreet,
      'timing': timing?.map((x) => x.toMap())?.toList(),
    };
  }

  factory Clinic.fromMap(Map<String, dynamic> map) {
    return Clinic(
      approved: map['approved'],
      serviceProviderCity: map['serviceProviderCity'],
      serviceProviderEmail: map['serviceProviderEmail'],
      serviceProviderName: map['serviceProviderName'],
      serviceProviderPhone: map['serviceProviderPhone'],
      serviceProviderStreet: map['serviceProviderStreet'],
      timing: List<Booking>.from(map['timing']?.map((x) => Booking.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Clinic.fromJson(String source) => Clinic.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Clinic(approved: $approved, serviceProviderCity: $serviceProviderCity, serviceProviderEmail: $serviceProviderEmail, serviceProviderName: $serviceProviderName, serviceProviderPhone: $serviceProviderPhone, serviceProviderStreet: $serviceProviderStreet, timing: $timing)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Clinic &&
        other.approved == approved &&
        other.serviceProviderCity == serviceProviderCity &&
        other.serviceProviderEmail == serviceProviderEmail &&
        other.serviceProviderName == serviceProviderName &&
        other.serviceProviderPhone == serviceProviderPhone &&
        other.serviceProviderStreet == serviceProviderStreet &&
        listEquals(other.timing, timing);
  }

  @override
  int get hashCode {
    return approved.hashCode ^
        serviceProviderCity.hashCode ^
        serviceProviderEmail.hashCode ^
        serviceProviderName.hashCode ^
        serviceProviderPhone.hashCode ^
        serviceProviderStreet.hashCode ^
        timing.hashCode;
  }
}
