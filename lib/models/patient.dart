
import 'dart:convert';

Patient patientFromJson(String str) => Patient.fromJson(json.decode(str));

String patientToJson(Patient data) => json.encode(data.toJson());

class Patient {
  int? id;
  String? currDeliveryCount;
  String? prevChildAge;
  String? previousDeliveryType;
  String? sexPreviousChild;
  String? tt1switch;
  String? tt2switch;
  String? ttbswitch;
  String? counsDiet;
  String? name;
  String? husbandName;
  int? village_id;
  String? mobile;

  Patient(
      {
      this.id,
      this.currDeliveryCount,
      this.prevChildAge,
      this.previousDeliveryType,
      this.sexPreviousChild,
      this.tt1switch,
      this.tt2switch,
      this.ttbswitch,
      this.counsDiet,
      this.name,
      this.husbandName,
      this.village_id,
      this.mobile});

  Patient.fromJson(Map<String, dynamic> json) {
    currDeliveryCount = json['currDeliveryCount'];
    prevChildAge = json['prevChildAge'];
    previousDeliveryType = json['previousDeliveryType'];
    sexPreviousChild = json['sexPreviousChild'];
    tt1switch = json['tt1switch'];
    tt2switch = json['tt2switch'];
    ttbswitch = json['ttbswitch'];
    counsDiet = json['counsDiet'];
    name = json['name'];
    husbandName = json['husbandName'];
    village_id = json['village_id'];
    mobile = json['mobile'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['currDeliveryCount'] = this.currDeliveryCount;
    data['prevChildAge'] = this.prevChildAge;
    data['previousDeliveryType'] = this.previousDeliveryType;
    data['sexPreviousChild'] = this.sexPreviousChild;
    data['tt1switch'] = this.tt1switch;
    data['tt2switch'] = this.tt2switch;
    data['ttbswitch'] = this.ttbswitch;
    data['counsDiet'] = this.counsDiet;
    data['name'] = this.name;
    data['husbandName'] = this.husbandName;
    data['village_id'] = this.village_id;
    data['mobile'] = this.mobile;
    data['id'] = this.id;
    return data;
  }
}
