### I. Release Android:
 
Mở terminal project gõ lệnh : ```sh  flutter build apk ```
để lấy file apk
-> Vào thư mục project/build/app/outputs/flutter-apk/ : để lấy apk ```sh flutter build appbundle --target-platform android-arm,android-arm64,android-x64 ```
để lấy file appbundle
-> Vào thư mục project/build/app/outputs/bundle/release/ : để lấy appbundle

### II. Release Ios: 
Chạy lệnh lấy lib về: ```sh flutter package get ```
Đóng gói dart sang native: ```sh flutter build ios```
Mở xcode lên build và upstore như native


### A. IOS:
```sh
- 1 screen short: 
  1.1 6.5 inch (iPhone XS Max, iPhone XR) 
               2688 x 1242 pixels (19.5:9 aspect ratio)
  1.2 5.5 inch (iPhone 6s Plus, iPhone 7 Plus, iPhone 8 Plus) 
              2208 x 1242 pixels (Rendered Pixels)
              1920 x 1080 pixels (Physical Pixels)
  1.3 12.9 inch (iPad Pro (3rd generation)) 
              2732 x 2048 pixels (4:3 aspect ratio)
```
- Icon: tool icon: https://appiconmaker.co/
  
### B Android
- 1 screen short: đẹp là đc
- 2 icon: 512x512
- 3 image: 1024x500
- 4 onesignale icon http://romannurik.github.io/AndroidAssetStudio/icons-notification.html
- Tạo icon https://makeappicon.com/


#### * More

### C Up app:
- 1 kiểm tra config ads, debug, link appstore
- 2 kiểm tra firebase config
- 3 kiểm tra term, privacy
- 4 Thay server dev vs product
- 5 Kiểm tra inapp config appstore

### D Up store success:
- 1 Android Login fb: config sh1, hash key:
  + sh1: lấy trên store ch play
  + hash key: run git bash trên windown: 
  ```sh echo <sh1> | xxd -r -p | openssl base64 ```
- 2 Android Firebase auth: config sh1

### E May ảo 
- this copy of the install macos mojave application is damaged and can‘t be used to install macos: date 010101002018
- Resolving duplicate serial numbers for macOS Virtual Machines.:
https://support.watchmanmonitoring.com/hc/en-us/articles/213487906-Resolving-duplicate-serial-numbers-for-macOS-Virtual-Machines-

### F: Android: install .apk programmatically [duplicate]

- https://stackoverflow.com/a/4969421/10819917



##### *Note: Ảnh dùng theo 3 size: low: 100px, medium: 300px, high: 500px
