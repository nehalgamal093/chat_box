import 'package:flutter_dotenv/flutter_dotenv.dart';

class Endpoints{
  static  String register = dotenv.env['REGISTER_ENDPOINT']!;

}