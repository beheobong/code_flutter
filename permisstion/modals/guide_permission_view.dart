import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:schooly/app/const.dart';
import 'package:schooly/themes/icons_ios.dart';
import 'package:schooly/themes/styles.dart';

import 'row_step_permission.dart';

class GuidePermissionView extends StatelessWidget {
  final Permission permission;

  GuidePermissionView({this.permission});

  _closeGuide(context) {
    Navigator.pop(context);
  }

  _openSetting(context) {
    Navigator.pop(context);
    openAppSettings();
  }

  String _getText() {
    if(permission == Permission.location || permission == Permission.locationAlways){
       return 'Location';
    }else if(permission == Permission.photos){
      return 'Photos';
    }else if(permission == Permission.camera){
      return 'Camera';
    }else if(permission == Permission.microphone){
      return 'Microphone';
    }else if(permission == Permission.speech){
      return 'Speech Recognition';
    }
    return '';
  }

  String _getIcon() {
     if(permission == Permission.location || permission == Permission.locationAlways){
       return SCHIconIOS.iLocationPrivacy;
    }else if(permission == Permission.photos){
      return SCHIconIOS.iPhotosPrivacy;
    }else if(permission == Permission.camera){
      return SCHIconIOS.iCameraPrivacy;
    }else if(permission == Permission.microphone){
      return SCHIconIOS.icMicrophone;
    }else if(permission == Permission.speech){
      return SCHIconIOS.icMicrophone;
    }
    return '';
  }

  String _getTitle() {
    switch (permission) {
      case Permission.locationAlways:
        return '${Const.appName} cần quyền vị trí luôn luôn để hoạt động với tính năng thông báo camera phạt nguội chạy nền';
      default:
        return '${Const.appName} không có quyền truy cập vào "${_getText()}". Bật tính năng này để sử dụng ${_getText()}';
    }
  }

  String _getTitleEnd() {
    switch (permission) {
      case Permission.locationAlways:
        return '4. Chọn luôn luôn';
      default:
        return '4. Cho phép ứng dụng sử dụng "${_getText()}"';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  onPressed: () => _closeGuide(context),
                  child: Text('Đóng',
                      style: SCHStyles.copyStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w700)))),
          Padding(
              padding: EdgeInsets.fromLTRB(15, 0, 15, 15),
              child: Text(_getTitle(),
                  textAlign: TextAlign.center,
                  style: SCHStyles.copyStyle(fontSize: 16, color: Colors.white))),
          RowStep(icon: SCHIconIOS.iSetting, title: '1. Mở ứng dụng cài đặt'),
          RowStep(icon: SCHIconIOS.iPrivacy, title: '2. Chọn riêng tư'),
          RowStep(icon: _getIcon(), title: '3. Chọn "${_getText()}"'),
          RowStep(icon: SCHIconIOS.iSwitch, title: _getTitleEnd()),
          FlatButton(
              onPressed: () => _openSetting(context),
              child: Container(
                margin: EdgeInsets.only(top: 20),
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 60),
                decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.all(Radius.circular(40.0))),
                child: Text('Cho phép truy cập',
                    style: SCHStyles.copyStyle(fontSize: 16, color: Colors.white)),
              )),
        ])));
  }
}
