import 'package:dio/dio.dart';

import '../../domain/entities/message.dart';
import '../../infraestructure/models/yes_no_model.dart';

class GetYesNoAsnwer {
  final _dio = Dio();

  Future<Message> getAnswer() async {
    final response = await _dio.get('https://yesno.wtf/api');

    final yesNoModel = YesNoModel.fromJsonMap(response.data);
    return yesNoModel.toMessageEntity();
  }
}
