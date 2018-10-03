import 'dart:async' show Future;
import 'dart:convert' show json;
import 'package:flutter/services.dart' show rootBundle;


class Secret {
  final String apikey;

  Secret({this.apikey=""});

  factory Secret.fromJson(Map<String, dynamic>places){
    return new Secret(apikey:places["api_key"]);
  }
}


class SecretLoader {
  final String secretPath;

  SecretLoader({this.secretPath});
  Future<Secret> load() {
    return rootBundle.loadStructuredData<Secret>(this.secretPath,
            (jsonStr) async {
          final secret = Secret.fromJson(json.decode(jsonStr));
          return secret;

        });
  }
}