import 'dart:convert';

import 'package:fluttermytrip/generated/json/base/json_convert_content.dart';
import 'package:fluttermytrip/generated/json/home_model_entity_helper.dart';
import 'package:fluttermytrip/model/home_model_entity.dart';
import 'package:http/http.dart' as http;

const HOME_URL = 'http://www.devio.org/io/flutter_app/json/home_page.json';

///首页大接口
class HomeDao {
  static Future<HomeModelEntity> fetch() async {
    final response = await http.get(HOME_URL);
    if (response.statusCode == 200) {
      Utf8Decoder utf8decoder = Utf8Decoder(); // fix 中文乱码
      var result = json.decode(utf8decoder.convert(response.bodyBytes));
      return new HomeModelEntity().fromJson(result);
    } else {
      throw Exception('Failed to load home_page.json');
    }
  }
}
