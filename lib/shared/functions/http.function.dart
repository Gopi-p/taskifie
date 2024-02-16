// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class HttpMethod {
//   static var client = http.Client();

//   static Future<APIResponse> post({
//     required String uri,
//     required dynamic body,
//     Map? headers,
//   }) async {
//     try {
//       var response = await client.post(
//         Uri.parse(uri),
//         body: jsonEncode(body),
//         headers: {
//           ...headers ?? {},
//           "Accept": "application/json",
//           "content-type": "application/json"
//         },
//       );
//       // debugPrint('response status code is ${response.statusCode}');
//       // debugPrint(response.body);
//       return APIResponse(
//         success: true,
//         responseStatusCode: response.statusCode,
//         responseBody: jsonDecode(response.body),
//       );
//     } catch (exception) {
//       debugPrint("Exception at $uri is $exception");
//       return APIResponse(success: false, exception: exception);
//     }
//   }

//   static get({required String uri, headers}) async {
//     try {
//       var response = await client.get(
//         Uri.parse(uri),
//         headers: headers ?? {},
//       );
//       // debugPrint('response status code is ${response.statusCode}');
//       // debugPrint(response.body);
//       return APIResponse(
//         success: true,
//         responseStatusCode: response.statusCode,
//         responseBody: jsonDecode(response.body),
//       );
//     } catch (exception) {
//       debugPrint("Exception at $uri is $exception");
//       return APIResponse(success: false, exception: exception);
//     }
//   }

//   static put({required String uri, dynamic body, headers}) async {
//     try {
//       // debugPrint(jsonEncode(body));
//       var response = await client.put(
//         Uri.parse(uri),
//         body: jsonEncode(body),
//         headers: {
//           ...headers ?? {},
//           "Accept": "application/json",
//           "content-type": "application/json",
//           'Charset': 'utf-8'
//         },
//       );
//       // debugPrint('response status code is ${response.statusCode}');
//       // debugPrint(response.body);
//       return APIResponse(
//         success: true,
//         responseStatusCode: response.statusCode,
//         responseBody: jsonDecode(response.body) ?? '',
//       );
//     } catch (exception) {
//       debugPrint("Exception at $uri is $exception");
//       return APIResponse(success: false, exception: exception);
//     }
//   }

//   static delete({required String uri, dynamic body, headers}) async {
//     try {
//       var response = await client.delete(
//         Uri.parse(uri),
//         body: jsonEncode(body),
//         headers: {
//           ...headers ?? {},
//           "Accept": "application/json",
//           "content-type": "application/json"
//         },
//       );
//       // debugPrint('response status code is ${response.statusCode}');
//       // debugPrint(response.body);
//       return APIResponse(
//         success: true,
//         responseStatusCode: response.statusCode,
//         responseBody: response.body,
//       );
//     } catch (exception) {
//       debugPrint("Exception at $uri is $exception");
//       return APIResponse(success: false, exception: exception);
//     }
//   }
// }
