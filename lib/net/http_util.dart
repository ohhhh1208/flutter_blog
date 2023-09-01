// ignore_for_file: avoid_print, prefer_typing_uninitialized_variables, constant_identifier_names

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'api.dart';
import 'base_result.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:cookie_jar/cookie_jar.dart';

class HttpUtil {
  static const DEBUG = !kReleaseMode;

  static const SUCCESS_CODE = 0;
  static HttpUtil? instance;
  late Dio dio;
  late BaseOptions options;

  CancelToken cancelToken = CancelToken();

  static HttpUtil? getInstance() {
    instance ??= HttpUtil();
    return instance;
  }

  HttpUtil([bool isJson = false]) {
    ///BaseOptions、Options、RequestOptions 都可以配置参数，优先级别依次递增，且可以根据优先级别覆盖参数
    options = BaseOptions(
      ///请求基地址,可以包含子路径
      baseUrl: DEBUG ? Api.TEST_URL : Api.BASE_URL,

      ///连接服务器超时时间，单位是毫秒.
      connectTimeout: const Duration(milliseconds: 15000),

      ///响应流上前后两次接受到数据的间隔，单位为毫秒。
      receiveTimeout: const Duration(milliseconds: 15000),

      ///Http请求头.
      // headers: {"version": "1.0.0"},

      ///提交方式：1.表单提交 2.JSON方式提交
      /// 请求的Content-Type，默认值是"application/json; charset=utf-8".
      /// 如果您想以"application/x-www-form-urlencoded"格式编码请求数据,
      /// 可以设置此选项为 `Headers.formUrlEncodedContentType`,  这样[Dio]就会自动编码请求体.
      contentType: isJson ? Headers.jsonContentType : Headers.formUrlEncodedContentType,

      ///表示期望以那种格式(方式)接受响应数据。接受四种类型 `json`, `stream`, `plain`, `bytes`. 默认值是 `json`,
      responseType: ResponseType.json,
    );

    dio = Dio(options);

    ///Cookie管理
    dio.interceptors.add(CookieManager(CookieJar()));

    ///添加拦截器
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
          debugPrint("请求之前");
          // Do something before request is sent
          handler.next(options);
        },
        onResponse: (Response response, ResponseInterceptorHandler handler) {
          debugPrint("响应之前");
          // Do something with response data
          // BaseResult base = BaseResult.fromJson(response.data);
          // if (base.code != Api.SUCCESS_CODE) {
          //   debugPrint("报错接口:${response.realUri}");
          // }
          // if (base.code == Api.TOKEN_INVALID_CODE) {
          //   SpUtils.deleteStaffInfo();
          //   SpUtils.deleteSeniorStaffInfo();
          //   DataManager.getInstance()?.staffJobPermissionsModel = null;
          //   DataManager.getInstance()?.institutionSwitchModel = null;
          //   Get.offAllNamed(AppRoutes.loginPage);
          // } else if (base.code == Api.INS_INVALID_CODE) {
          //   Get.snackbar("云龄社区", base.msg);
          // }
          handler.next(response);
        },
        onError: (DioException e, ErrorInterceptorHandler handler) {
          debugPrint("错误之前");
          handler.next(e);
        },
      ),
    );
  }

  /*
   * get请求
   */
  get(url, {data, options, cancelToken}) async {
    var jsonData;
    try {
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.none) {
        debugPrint('get 网络异常，请检查你的网络！');
        return;
      }
      Response response = await dio.get(url, queryParameters: data, options: options, cancelToken: cancelToken);
      debugPrint('get success---------${response.data}');
      jsonData = response.data;
    } on DioException catch (e) {
      debugPrint('get error---------$e');
      formatError(e);
    }
    return jsonData;
  }

  /*
   * post请求
   */
  post(url, {data, options, cancelToken}) async {
    var jsonData;
    try {
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.none) {
        debugPrint('post 网络异常，请检查你的网络！');
        return;
      }
      Response response = await dio.post(url, data: data, options: options, cancelToken: cancelToken);
      debugPrint('post success---------${response.data}');
      jsonData = response.data;
    } on DioException catch (e) {
      debugPrint('post error---------$e');
      formatError(e);
    }
    return jsonData;
  }

  uploadFile(url, params) async {
    var jsonData;
    try {
      FormData data = FormData.fromMap(params);
      Response response = await dio.post(url, data: data);
      jsonData = response.data;
    } on DioException catch (e) {
      debugPrint('post error---------$e');
      formatError(e);
    }
    return jsonData;
  }

  ///下载文件
  downloadFile(urlPath, savePath) async {
    Response? response;
    try {
      response = await dio.download(urlPath, savePath, onReceiveProgress: (int count, int total) {
        //进度
        debugPrint("$count $total");
      });
      debugPrint('downloadFile success---------${response.data}');
    } on DioException catch (e) {
      debugPrint('downloadFile error---------$e');
      formatError(e);
    }
    return response?.data;
  }

  /// error统一处理
  void formatError(DioException e) {
    if (e.type == DioExceptionType.connectionTimeout) {
      // It occurs when url is opened timeout.
      debugPrint("连接超时");
    } else if (e.type == DioExceptionType.sendTimeout) {
      // It occurs when url is sent timeout.
      debugPrint("请求超时");
    } else if (e.type == DioExceptionType.receiveTimeout) {
      //It occurs when receiving timeout
      debugPrint("响应超时");
    } else if (e.type == DioExceptionType.connectionError) {
      // When the server response, but with a incorrect status, such as 404, 503...
      debugPrint("出现异常");
    } else if (e.type == DioExceptionType.cancel) {
      // When the request is cancelled, dio will throw a error with this type.
      debugPrint("请求取消");
    } else {
      //DEFAULT Default error type, Some other Error. In this case, you can read the DioException.error if it is not null.
      debugPrint("未知错误");
    }
  }

  /// 取消请求
  /// 同一个cancel token 可以用于多个请求，当一个cancel token取消时，所有使用该cancel token的请求都会被取消。
  /// 所以参数可选
  void cancelRequests(CancelToken token) {
    token.cancel("cancelled");
  }
}

/// 请求时添加cookie
Map<String, dynamic>? _headerToken() {
  /// 自定义Header,如需要添加token信息请调用此参数
  // UserEntity? info = SpUtil.getUserInfo();
  var info;
  if (info == null) {
    return null;
  }
  Map<String, dynamic> httpHeaders = {
    'Cookie': 'loginUserName=${info.username};loginUserPassword=${info.password}',
  };
  return httpHeaders;
}
