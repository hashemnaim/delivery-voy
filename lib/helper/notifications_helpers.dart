// import 'dart:developer';

// import 'package:dio/dio.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';

// import 'shared_preferences_helpar.dart';

// class NotificationHelper {
//   initialNotification() async {
//     FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
//     String? fcmToken = await firebaseMessaging.getToken();
//     await SHelper.sHelper.setFcmToken(fcmToken!);
//     await firebaseMessaging.requestPermission(
//       alert: true,
//       announcement: false,
//       badge: true,
//       carPlay: false,
//       criticalAlert: false,
//       provisional: false,
//       sound: true,
//     );

//     FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
//       return print("onBackgroundMessage");
//     });
//     FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
//       return print("onBackgroundMessage");
//     });
//     // FirebaseMessaging.onBackgroundMessage((RemoteMessage message) async {
//     //   return print("onBackgroundMessage");
//     // });
//   }
// }

// Future sendNotificationToUser({
//   required String fcmToken,
// }) async {
//   try {
//     const url = "https://fcm.googleapis.com/fcm/send";

//     final headerMap = {
//       "Content-Type": "application/json",
//       "Accept": "application/json",
//       "Authorization":
//           "key=AAAA752iX5U:APA91bH8TTWc3cH4jtedzZDgZ5szTDdtnabYTCr3WPpB50f3oMpKwNLzyVDruda2im9cFcdiqM88603mNm6si0ZLtFEajC96CK8idKeyq-v_mwpYUdGSQPVXdPHBq-r8yBK8vR_LwkX4"
//     };

//     log("fcmToken $fcmToken");
//     Response response =
//         await Dio().post(url, options: Options(headers: headerMap), data: {
//       "to": fcmToken,
//       "notification": {"body": "تم تسليم الطلب بنجاح", "title": "كابوتشا"},
//       "priority": "high",
//       "data": {
//         "click_action": "FLUTTER_NOTIFICATION_CLICK",
//         "id": "1",
//         "chat_message": "1"
//       }
//     });
//     log(response.data.toString());
//     return true;
//   } on DioError {
//     return false;
//   }
// }
