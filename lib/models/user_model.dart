

class UserModel {
  String? uid,
      name,
      email,
      ageGroup,
      occupation,
      currentIncome,
      desiredOccupation,
      desiredIncome,
      debitAmount,
      debitType,
      savingGoals,
      deviceToken;
     DateTime ? startTime,endTime;

  // Constructor
  UserModel({
    this.uid,
    this.name,
    this.email,
    this.ageGroup,
    this.occupation,
    this.currentIncome,
    this.desiredOccupation,
    this.desiredIncome,
    this.debitAmount,
    this.debitType,
    this.savingGoals,
    this.deviceToken,
    this.startTime,
    this.endTime,
  });

  // Factory method to create a UserModel instance from JSON
  factory UserModel.fromMap(Map<String, dynamic> json) {
    return UserModel(
      uid: json['uid'],
      name: json['name'],
      email: json['email'],
      ageGroup: json['ageGroup'],
      occupation: json['occupation'],
      currentIncome: json['currentIncome'],
      desiredOccupation: json['desiredOccupation'],
      desiredIncome: json['desiredIncome'],
      debitAmount: json['debitAmount'],
      debitType: json['debitType'],
      savingGoals: json['savingGoals'],
      deviceToken: json['deviceToken'],

    );
  }

  // Method to convert UserModel instance to JSON
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = {};
    if (uid != null) data['uid'] = uid;
    if (name != null) data['name'] = name;
    if (email != null) data['email'] = email;
    if (ageGroup != null) data['ageGroup'] = ageGroup;
    if (occupation != null) data['occupation'] = occupation;
    if (currentIncome != null) data['currentIncome'] = currentIncome;
    if (desiredOccupation != null) data['desiredOccupation'] = desiredOccupation;
    if (desiredIncome != null) data['desiredIncome'] = desiredIncome;
    if (debitAmount != null) data['debitAmount'] = debitAmount;
    if (debitType != null) data['debitType'] = debitType;
    if (savingGoals != null) data['savingGoals'] = savingGoals;
    if (deviceToken != null) data['deviceToken'] = deviceToken;
    return data;
  }
}














/*class UserModel {
  final String uid;
  final String email;
  final String name;

  UserModel({required this.uid, required this.email, required this.name});

  factory UserModel.fromMap(Map<String, dynamic> data) {
    return UserModel(
      uid: data['uid'],
      email: data['email'],
      name: data['name'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'name': name,
    };
  }
}*/






