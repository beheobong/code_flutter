import 'dart:async';
import 'dart:io' show Platform;
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:schooly/modals/guide_permission_view.dart';
import 'package:schooly/modals/permission_noti.dart';


class Utils {

 static Future navigatePageRoute(BuildContext context, Widget widget) {
    return Navigator.of(context).push(PageRouteBuilder(
        opaque: false, pageBuilder: (BuildContext context, _, __) => widget));
  }
  
  static Future _askPermission(
      {BuildContext context,
      Function handle,
      Permission permission,
      bool status}) async {
    if (Platform.isAndroid) {
      PermissionStatus value = await permission.status;
      if (value == PermissionStatus.denied ||
          value == PermissionStatus.undetermined) {
        if (status) {
          return false;
        } else {
          PermissionStatus value2 = await permission.request();
          if (value2 == PermissionStatus.granted) {
            handle();
          }
        }
      } else if (value == PermissionStatus.granted) {
        if (status)
          return true;
        else
          handle();
      }
    } else if (Platform.isIOS) {
      PermissionStatus value = await permission.status;
      if (value == PermissionStatus.undetermined) {
        if (status)
          return false;
        else {
          PermissionStatus value2 = await permission.request();
          if (value2 == PermissionStatus.granted) {
            handle();
          }
        }
      } else if (value == PermissionStatus.denied ||
              value == PermissionStatus.restricted
          // || value == PermissionStatus.disabled
          ) {
        if (status)
          return false;
        else {
          if (permission == Permission.notification) {
            navigatePageRoute(context, PermissionNotiView());
          } else
            navigatePageRoute(
                context, GuidePermissionView(permission: permission));
        }
      } else {
        if (status)
          return true;
        else
          handle();
      }
    }
  }

  static Future askPermissionGPS(BuildContext context, Function handle,
      {bool status = false}) {
    return _askPermission(
        context: context,
        handle: handle,
        permission: Permission.location,
        status: status);
  }

  static Future askPermissionPhotos(BuildContext context, Function handle,
      {bool status = false}) {
    return _askPermission(
        context: context,
        handle: handle,
        permission: Permission.photos,
        status: status);
  }

  static Future askPermissionCamera(BuildContext context, Function handle,
      {bool status = false}) {
    return _askPermission(
        context: context,
        handle: handle,
        permission: Permission.camera,
        status: status);
  }

  static Future askPermissionNoti(BuildContext context, Function handle,
      {bool status = false}) {
    return _askPermission(
        context: context,
        handle: handle,
        permission: Permission.notification,
        status: status);
  }


}
