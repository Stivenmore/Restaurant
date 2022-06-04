import 'package:dio/dio.dart';
import 'package:restaurant/data/apis/api_utils.dart';

const apiKey = "AIzaSyBpoVYCKWDjIA30yxbrSF1g5lvELPx-KBw";
const baseUrl = "http://api.marketstack.com/v1";

ApiUtils apiUtils = ApiUtils(
    client: Dio(BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: 5000,
      receiveTimeout: 5000,
    )),
    host: baseUrl);
