
import 'package:dio/dio.dart';

abstract class CoreService {
  Dio req = Dio();
  late Response response;
}
