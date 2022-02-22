


import 'package:url_launcher/url_launcher.dart';

class MapUtils {

  MapUtils._();
  static Future<void> openMap(double latitude, double longitude) async{
  String googleUrl = 'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';

  if(await canLaunch(googleUrl)) {
  await launch(googleUrl);
  } else {
  throw 'Could not open the map.';
  }
}}

// For call
// MapUtils.openMap(30.625168,131.751500);


























// import 'package:geolocator/geolocator.dart';
//
// class Location extends StatefulWidget {
//   const Location({Key? key}) : super(key: key);
//
//   @override
//   _LocationState createState() => _LocationState();
// }
//
// class _LocationState extends State<Location> {
//   String currentAddress='';
//   String currentpostion='';
//
//   // Future<Position>_mycurrentlocation()async{
//   //   bool serviceEnabled;
//   //   LocationPermission permission;
//   //   serviceEnabled=await Geolocator.isLocationServiceEnabled();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Current Location'),
//       ),
//       body: Center(
//         child: Column(
//           children: [
//             // Text(currentAddress,style: TextStyle(fontSize: 20),),
//             Text('Address'),
//             Text('Address'),
//             TextButton(
//               onPressed: () {},
//               child: Text('locate me'),
//             )
//           ],
//         ),
//       ),
//     );
//   }
//
