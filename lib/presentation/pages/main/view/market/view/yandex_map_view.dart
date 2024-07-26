
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:test/config/contstants/app_colors.dart';
import 'package:test/config/contstants/app_text_styles.dart';
import 'package:test/generated/assets.dart';
import 'package:test/presentation/widgets/custom_common_button.dart';








// import 'package:flutter/material.dart';
// import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
// import 'package:geocoding/geocoding.dart';
//
// class YandexDeliveryMap extends StatefulWidget {
//   const YandexDeliveryMap({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   State<StatefulWidget> createState() {
//     return _YandexDeliveryMapState();
//   }
// }
//
// class _YandexDeliveryMapState extends State<YandexDeliveryMap> with OSMMixinObserver {
//   var mapCtrl = MapController(
//     initPosition: GeoPoint(
//       latitude: 51.831353,
//       longitude: 107.586060,
//     ),
//   );
//   String city = 'Улан-Удэ';
//   String street = '';
//
//   @override
//   void initState() {
//     super.initState();
//     mapCtrl.addObserver(this);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 350,
//       height: 250,
//       child: OSMFlutter(
//           controller: mapCtrl,
//           osmOption: const OSMOption(zoomOption: ZoomOption(initZoom: 14))),
//     );
//   }
//
//   @override
//   Future<void> mapIsReady(bool isReady) async {
//     mapCtrl.addMarker(
//       GeoPoint(latitude: 51.831353, longitude: 107.586060),
//       markerIcon: MarkerIcon(
//         iconWidget: Image.asset(
//           'assets/images/ic_location.png',
//           width: 30,
//           color: Colors.blue,
//         ),
//       ),
//     );
//     return;
//   }
//
//   Future<void> getAddressFromCoordinates(
//       double latitude, double longitude) async {
//     try {
//       List<Placemark> placemarks =
//           await placemarkFromCoordinates(latitude, longitude);
//       Placemark place = placemarks[0];
//       setState(() {
//         city = '${place.locality}';
//         street = '${place.street}';
//       });
//     } catch (e) {
//       print(e);
//     }
//     return;
//   }
// }
