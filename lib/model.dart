import 'package:isar/isar.dart';

part 'model.g.dart';

@collection
class IsarModel {
  Id? id; // you can also use id = null to auto increment

  @Index(type: IndexType.value)
  String state;

  String sarvayCount;

  IsarModel({required this.sarvayCount, required this.state});
}

class IndianStates {
  IndianStates(
    this.state, {
    required this.sarvayCount,
  });

  final String state;

  String sarvayCount;
}




 List<IndianStates> indianStatesList = [
      IndianStates('Andhra Pradesh', sarvayCount: '0'),
      IndianStates('Arunachal Pradesh', sarvayCount: '1'),
      IndianStates('Assam', sarvayCount: '2'),
      IndianStates('Bihar', sarvayCount: '3'),
      IndianStates('Chhattisgarh', sarvayCount: '4'),
      IndianStates('Goa', sarvayCount: '0'),
      IndianStates('Gujarat', sarvayCount: '1'),
      IndianStates('Haryana', sarvayCount: '2'),
      IndianStates('Himachal Pradesh', sarvayCount: '3'),
      IndianStates('Jharkhand', sarvayCount: '4'),
      IndianStates('Karnataka', sarvayCount: '0'),
      IndianStates('Kerala', sarvayCount: '1'),
      IndianStates('Madhya Pradesh', sarvayCount: '2'),
      IndianStates('Maharashtra', sarvayCount: '3'),
      IndianStates('Manipur', sarvayCount: '4'),
      IndianStates('Meghalaya', sarvayCount: '0'),
      IndianStates('Mizoram', sarvayCount: '1'),
      IndianStates('Nagaland', sarvayCount: '2'),
      IndianStates('Orissa', sarvayCount: '3'),
      IndianStates('Punjab', sarvayCount: '4'),
      IndianStates('Rajasthan', sarvayCount: '0'),
      IndianStates('Sikkim', sarvayCount: '1'),
      IndianStates('Tamil Nadu', sarvayCount: '2'),
      IndianStates('Telangana', sarvayCount: '3'),
      IndianStates('Tripura', sarvayCount: '4'),
      IndianStates('Uttar Pradesh', sarvayCount: '0'),
      IndianStates('Uttaranchal', sarvayCount: '1'),
      IndianStates('West Bengal', sarvayCount: '2'),
      IndianStates('Jammu & Kashmir', sarvayCount: '3'),
      IndianStates('Delhi', sarvayCount: '4'),
      IndianStates('Lakshadweep', sarvayCount: '0'),
    ];