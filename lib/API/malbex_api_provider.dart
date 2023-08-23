import 'package:api_food/API/api_provider.dart';
import 'package:api_food/models/malbex_api_model.dart';

class MalbexApiProvider extends ApiProvider {
  @override
  String get apiUrl =>
      'food/wine/dishes?apiKey=50e281b0f50e4478b96df542fe2d7c36&wine=malbec  ';

  Future<Malbex> fetchMalbex() async {
    Map<String, dynamic> malbecMap = await fetch();
    return Malbex.fromMap(malbecMap);
  }
}
