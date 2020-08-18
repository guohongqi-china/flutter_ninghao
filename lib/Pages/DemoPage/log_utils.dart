import 'package:flutter/foundation.dart';

/// 输出Log工具类
class LogUtils {
  static const String tag = 'DEER-LOG';

  //const bool isDebug = true;//是否是调试模式
  /// debug开关，上线需要关闭
  /// App运行在Release环境时，inProduction为true；当App运行在Debug和Profile环境时，inProduction为false
  static const bool inProduction = kReleaseMode;

  static void print_(String msg) {
    if (!inProduction) {
      print(msg);
    }
  }

  
}
