import 'package:flutterdemo/model/baby_manage_list_bean.dart';

babyManageListBeanFromJson(BabyManageListBean data, Map<String, dynamic> json) {
	if (json['unionid'] != null) {
		data.unionid = json['unionid'].toString();
	}
	if (json['isCreate'] != null) {
		data.isCreate = json['isCreate'];
	}
	if (json['babyId'] != null) {
		data.babyId = json['babyId'] is String
				? int.tryParse(json['babyId'])
				: json['babyId'].toInt();
	}
	if (json['userId'] != null) {
		data.userId = json['userId'] is String
				? int.tryParse(json['userId'])
				: json['userId'].toInt();
	}
	if (json['babyAvatar'] != null) {
		data.babyAvatar = json['babyAvatar'].toString();
	}
	if (json['babyName'] != null) {
		data.babyName = json['babyName'].toString();
	}
	if (json['pregnancyDate'] != null) {
		data.pregnancyDate = json['pregnancyDate'].toString();
	}
	if (json['birthDay'] != null) {
		data.birthDay = json['birthDay'].toString();
	}
	if (json['birthTime'] != null) {
		data.birthTime = json['birthTime'].toString();
	}
	if (json['gender'] != null) {
		data.gender = json['gender'] is String
				? int.tryParse(json['gender'])
				: json['gender'].toInt();
	}
	if (json['identity'] != null) {
		data.identity = json['identity'] is String
				? int.tryParse(json['identity'])
				: json['identity'].toInt();
	}
	if (json['bloodType'] != null) {
		data.bloodType = json['bloodType'].toString();
	}
	if (json['birthWeight'] != null) {
		data.birthWeight = json['birthWeight'] is String
				? double.tryParse(json['birthWeight'])
				: json['birthWeight'].toDouble();
	}
	if (json['birthHeight'] != null) {
		data.birthHeight = json['birthHeight'] is String
				? double.tryParse(json['birthHeight'])
				: json['birthHeight'].toDouble();
	}
	if (json['weightState'] != null) {
		data.weightState = json['weightState'] is String
				? double.tryParse(json['weightState'])
				: json['weightState'].toDouble();
	}
	if (json['heightState'] != null) {
		data.heightState = json['heightState'] is String
				? double.tryParse(json['heightState'])
				: json['heightState'].toDouble();
	}
	if (json['gestationAge'] != null) {
		data.gestationAge = json['gestationAge'].toString();
	}
	if (json['preBirthDate'] != null) {
		data.preBirthDate = json['preBirthDate'].toString();
	}
	if (json['visionLeft'] != null) {
		data.visionLeft = json['visionLeft'] is String
				? double.tryParse(json['visionLeft'])
				: json['visionLeft'].toDouble();
	}
	if (json['visionRight'] != null) {
		data.visionRight = json['visionRight'] is String
				? double.tryParse(json['visionRight'])
				: json['visionRight'].toDouble();
	}
	if (json['birthStatus'] != null) {
		data.birthStatus = json['birthStatus'];
	}
	if (json['isBirth'] != null) {
		data.isBirth = json['isBirth'];
	}
	if (json['babyPhoneNumber'] != null) {
		data.babyPhoneNumber = json['babyPhoneNumber'].toString();
	}
	if (json['age'] != null) {
		data.age = json['age'] is String
				? double.tryParse(json['age'])
				: json['age'].toDouble();
	}
	if (json['createBy'] != null) {
		data.createBy = json['createBy'].toString();
	}
	if (json['role'] != null) {
		data.role = json['role'] is String
				? double.tryParse(json['role'])
				: json['role'].toDouble();
	}
	if (json['growthAlbum'] != null) {
		data.growthAlbum = json['growthAlbum'];
	}
	if (json['heightWeight'] != null) {
		data.heightWeight = json['heightWeight'];
	}
	if (json['healthRecords'] != null) {
		data.healthRecords = json['healthRecords'];
	}
	if (json['achievementRecord'] != null) {
		data.achievementRecord = json['achievementRecord'];
	}
	if (json['learningArchives'] != null) {
		data.learningArchives = json['learningArchives'];
	}
	if (json['schedule'] != null) {
		data.schedule = json['schedule'];
	}
	if (json['positioning'] != null) {
		data.positioning = json['positioning'];
	}
	if (json['phoneControl'] != null) {
		data.phoneControl = json['phoneControl'];
	}
	if (json['internetControl'] != null) {
		data.internetControl = json['internetControl'];
	}
	if (json['habitBuilding'] != null) {
		data.habitBuilding = json['habitBuilding'];
	}
	if (json['babyCourse'] != null) {
		data.babyCourse = json['babyCourse'];
	}
	return data;
}

Map<String, dynamic> babyManageListBeanToJson(BabyManageListBean entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['unionid'] = entity.unionid;
	data['isCreate'] = entity.isCreate;
	data['babyId'] = entity.babyId;
	data['userId'] = entity.userId;
	data['babyAvatar'] = entity.babyAvatar;
	data['babyName'] = entity.babyName;
	data['pregnancyDate'] = entity.pregnancyDate;
	data['birthDay'] = entity.birthDay;
	data['birthTime'] = entity.birthTime;
	data['gender'] = entity.gender;
	data['identity'] = entity.identity;
	data['bloodType'] = entity.bloodType;
	data['birthWeight'] = entity.birthWeight;
	data['birthHeight'] = entity.birthHeight;
	data['weightState'] = entity.weightState;
	data['heightState'] = entity.heightState;
	data['gestationAge'] = entity.gestationAge;
	data['preBirthDate'] = entity.preBirthDate;
	data['visionLeft'] = entity.visionLeft;
	data['visionRight'] = entity.visionRight;
	data['birthStatus'] = entity.birthStatus;
	data['isBirth'] = entity.isBirth;
	data['babyPhoneNumber'] = entity.babyPhoneNumber;
	data['age'] = entity.age;
	data['createBy'] = entity.createBy;
	data['role'] = entity.role;
	data['growthAlbum'] = entity.growthAlbum;
	data['heightWeight'] = entity.heightWeight;
	data['healthRecords'] = entity.healthRecords;
	data['achievementRecord'] = entity.achievementRecord;
	data['learningArchives'] = entity.learningArchives;
	data['schedule'] = entity.schedule;
	data['positioning'] = entity.positioning;
	data['phoneControl'] = entity.phoneControl;
	data['internetControl'] = entity.internetControl;
	data['habitBuilding'] = entity.habitBuilding;
	data['babyCourse'] = entity.babyCourse;
	return data;
}