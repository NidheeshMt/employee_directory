import 'package:employee_directory/model/address_model.dart';
import 'package:employee_directory/model/company_model.dart';
import "package:employee_directory/utilities/app_extensions.dart";
import 'package:employee_directory/utilities/app_generics.dart';
class EmployeeModel {
  final int id;
  final String name;
  final String username;
  final String email;
  final String? profileImage;
  final Address address;
  final String? phone;
  final String? website;
  final Company? company;

  EmployeeModel({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    this.profileImage,
    required this.address,
    this.phone,
    this.website,
    this.company,
  });

  factory EmployeeModel.fromJson(Json json) => EmployeeModel(
        id: json['id'],
        name: json['name'],
        username: json['username'],
        email: json['email'],
        profileImage: json['profile_image'],
        address: Address.fromJson(json['address']),
        phone: json['phone'],
        website: json['website'],
        // company: Company.fromJson(json.getObject('company')),
      );
}
