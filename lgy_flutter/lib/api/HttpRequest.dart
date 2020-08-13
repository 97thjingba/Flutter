/*
future是Future<T>类的对象，其表示一个T类型的异步操作结果。如果异步操作不需要结果，则future的
类型可为Future<void>。当一个返回future对象的函数被调用时，会发生两件事:
1:将函数操作列入队列等待执行并返回一个未完成的Future对象。
2:不久后当函数操作执行完成，Future对象变为完成并携带一个值或一个错误。

当自己的代码依赖于future对象时，可以使用两种实现方式：
1: 使用关键字async 和await
2: 使用Future API

* Future 表示一个不会立即完成的计算过程。与普通函数直接返回结果不同的是异步函数返回一个将会包含结果的 Future。
该 Future 会在结果准备好时通知调用者。

* Stream 是一系列异步事件的序列。其类似于一个异步的 Iterable，
不同的是当你向 Iterable 获取下一个事件时它会立即给你，但是 Stream 则不会立即给你而是在它准备好时告诉你。
*/

import 'package:dio/dio.dart';

class HttpRequest {
  static Future getAccessToken(url, data) async {
    try {
      print(url);
      print(data);
      Response response = await Dio().post(
        url,
        data: data,
      );
      return response.toString();
    } catch (error) {
      print(error);
    }
  }

  static Future getRequest(url) async {
    try {
      Response response = await Dio().get(url);
      return response;
    } catch (error) {
      print(error);
    }
  }

  static Future postRequest(url, data, accessToken) async {
    try {
      Response response = await Dio().post(url,
          data: data,
          options: Options(headers: {'authorization': 'Bearer $accessToken'}));
      return response.toString();
    } catch (error) {
      print(error);
    }
  }

  static Future putRequest(url, data, accessToken) async {
    try {
      Response response = await Dio().post(url,
          data: data,
          options: Options(headers: {'authorization': 'Bearer $accessToken'}));
      return response.toString();
    } catch (error) {
      print(error);
    }
  }

  static Future deleteRequest(url) async {
    // 待封装
    try {
      Response response = await Dio().delete(url);
      return response;
    } catch (error) {
      print(error);
    }
  }

  static Future patchRequest(url) async {
    // 待封装
    try {
      Response response = await Dio().get(url);
      return response;
    } catch (error) {
      print(error);
    }
  }
}
