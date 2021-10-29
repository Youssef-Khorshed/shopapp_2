import 'package:dio/dio.dart';
import 'package:tst_new2/shared/endpoints/end.dart';

class DioHelper{

static Dio? dio;
static void intial()
{
  dio = Dio(
    BaseOptions(
      receiveDataWhenStatusError: false,
          baseUrl: baseurl
    )
  );
}

static Future<Response>getdata({required String path ,required dynamic map })
async {
return await  dio!.get(path,queryParameters:map );
}
static Future<Response>post({required String path ,required dynamic map })
async {

  return await  dio!.post(path,data:map );
}
static Future<Response>update({required String path ,required dynamic map })
async {

  return await  dio!.put(path,data:map );
}
static Future<Response>delete({required String path ,required dynamic map })
async {

  return await  dio!.delete(path,data:map );
}

}