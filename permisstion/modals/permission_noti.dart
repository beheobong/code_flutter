import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:schooly/app/const.dart';
import 'package:schooly/themes/icons.dart';
import 'package:schooly/themes/icons_ios.dart';
import 'package:schooly/themes/styles.dart';

import 'row_step_permission.dart';

class PermissionNotiView extends StatelessWidget {
  final Function action;

  PermissionNotiView({this.action});

  _closeGuide(context) {
    Navigator.of(context, rootNavigator: true).pop();
  }

  _openSetting(context) {
    action != null ? action() : _closeGuide(context);
//    Permission.openSettings();
    openAppSettings();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        //block swipe to back iOS
        onWillPop: () async {
          return false;
        },
        child: Scaffold(
            appBar: PreferredSize(
                preferredSize: Size.fromHeight(0), // here the desired height
                child: AppBar(
                    centerTitle: true,
                    backgroundColor: Colors.black.withOpacity(0.85),
                    brightness: Brightness.dark)),
            backgroundColor: Colors.black.withOpacity(0.85),
            body: Container(
                child: Column(children: <Widget>[
              Container(
                  alignment: Alignment.centerRight,
                  child: FlatButton(
                      onPressed:
                          action != null ? action : () => _closeGuide(context),
                      child: Text("Đóng",
                          style: SCHStyles.copyStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w700)))),
              Padding(
                  padding: EdgeInsets.fromLTRB(15, 0, 15, 15),
                  child: Text(
                      "${Const.appName} chưa có quyền truy cập 'Thông báo'. Cấp quyền truy cập thông báo giúp bạn biết ai đang bình luận, chia sẻ, thích bài viết của bạn hay ai đang bình luận, chia sẻ, tham gia chuyến đi của bạn hoặc ai đang cứu hộ.",
                      textAlign: TextAlign.center,
                      style: SCHStyles.copyStyle( color: Colors.white))),
              RowStep(icon: SCHIconIOS.iSetting, title: "Mở cài đặt"),
              RowStep(
                  icon: SCHIconIOS.iNotification, title: "Chọn 'Thông báo'"),
              RowStep(icon: SCHIcons.icLogoA, title: "Chọn '${Const.appName}'"),
              RowStep(
                  icon: SCHIconIOS.iSwitch,
                  title: "Cho phép ứng dụng truy cập 'Thông báo'"),
              FlatButton(
                  onPressed: () => _openSetting(context),
                  child: Container(
                    margin: EdgeInsets.only(top: 20),
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 60),
                    decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.all(Radius.circular(40.0))),
                    child: Text("Cho phép truy cập",
                        style: SCHStyles.copyStyle(fontSize: 16, color: Colors.white)),
                  )),
            ]))));
  }
}
