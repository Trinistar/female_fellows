import 'package:cloud_functions/cloud_functions.dart';

class CloudFunctions {
  factory CloudFunctions() {
    return _singleton;
  }

  CloudFunctions._internal();

  static final CloudFunctions _singleton = CloudFunctions._internal();

  final FirebaseFunctions firebaseFunctions = FirebaseFunctions.instanceFor(region: 'europe-west1');  
}