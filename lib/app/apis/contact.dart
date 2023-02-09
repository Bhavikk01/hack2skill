import 'package:chatty/app/entities/entities.dart';
import 'package:chatty/app/utils/utils.dart';

class ContactAPI {
  static Future<ContactResponseEntity> post_contact() async {
    var response = await HttpUtil().post(
      'api/contact',
    );
    return ContactResponseEntity.fromJson(response);
  }


}
