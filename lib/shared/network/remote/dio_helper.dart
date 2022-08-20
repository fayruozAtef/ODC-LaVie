import 'package:dio/dio.dart';
class DioHelper{
  static Dio? dio ;
  static init(){
    dio=Dio(
      BaseOptions(
        baseUrl: 'https://lavie.orangedigitalcenteregypt.com',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String token='',
  }) async
  {
    dio!.options.headers =
    {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    };

    return await dio!.get(
      url,
      queryParameters: query,
    );
  }

  static Future<Response> postData({
    required String url,
    required Map<String, dynamic> data,
    String? token,
  })async{
    //Add More For the specified dio  baseOptions
    dio!.options.headers= {
      'Content-Type':'application/json',
      'Authorization': token??'',
    };
    return dio!.post(
      url,
      data: data,
    );
  }
}