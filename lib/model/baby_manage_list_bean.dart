import 'package:flutterdemo/generated/json/base/json_convert_content.dart';

class BabyManageListBean with JsonConvert<BabyManageListBean> {
  String? unionid;
  bool? isCreate;
  int? babyId;
  int? userId;
  String? babyAvatar;
  String? babyName;
  String? pregnancyDate;
  String? birthDay;
  String? birthTime;
  int? gender;
  int? identity = 0;
  String? bloodType;
  double? birthWeight;
  double? birthHeight;
  double? weightState;
  double? heightState;
  String? gestationAge;
  String? preBirthDate;
  double? visionLeft;
  double? visionRight;
  bool? birthStatus;
  bool? isBirth;
  String? babyPhoneNumber;
  double? age;
  String? createBy;
  double? role;
  bool? growthAlbum;
  bool? heightWeight;
  bool? healthRecords;
  bool? achievementRecord;
  bool? learningArchives;
  bool? schedule;
  bool? positioning;
  bool? phoneControl;
  bool? internetControl;
  bool? habitBuilding;
  bool? babyCourse;

  @override
  String toString() {
    return 'BabyManageListBean{unionid: $unionid, isCreate: $isCreate, babyId: $babyId, userId: $userId, babyAvatar: $babyAvatar, babyName: $babyName, pregnancyDate: $pregnancyDate, birthDay: $birthDay, birthTime: $birthTime, gender: $gender, identity: $identity, bloodType: $bloodType, birthWeight: $birthWeight, birthHeight: $birthHeight, weightState: $weightState, heightState: $heightState, gestationAge: $gestationAge, preBirthDate: $preBirthDate, visionLeft: $visionLeft, visionRight: $visionRight, birthStatus: $birthStatus, isBirth: $isBirth, babyPhoneNumber: $babyPhoneNumber, age: $age, createBy: $createBy, role: $role, growthAlbum: $growthAlbum, heightWeight: $heightWeight, healthRecords: $healthRecords, achievementRecord: $achievementRecord, learningArchives: $learningArchives, schedule: $schedule, positioning: $positioning, phoneControl: $phoneControl, internetControl: $internetControl, habitBuilding: $habitBuilding}';
  }
}
