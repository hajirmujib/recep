// import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapUtils {
  // Future<String> getAddressFromLatLong(LatLng position) async {
  //   print("get address : " +
  //       position.latitude.toString() +
  //       ":" +
  //       position.longitude.toString());
  //   List<Placemark> placemarks =
  //       await placemarkFromCoordinates(position.latitude, position.longitude);
  //   Placemark place = placemarks[0];
  //   return '${place.street}, ${place.subLocality}, ${place.locality}, ${place.administrativeArea}';
  // }

  Future<String> getAddressFromLatLong(LatLng position) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark place = placemarks[0];
    return '${place.name}, ${place.street}, ${place.subLocality}, ${place.locality}, ${place.administrativeArea}';
  }

  // Future<Map<PolylineId, Polyline>> getPolyline(
  //     LatLng position, LatLng positionCustomer) async {
  //   PolylinePoints polylinePoints = PolylinePoints();
  //   List<LatLng> polylineCoordinates = [];

  //   PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
  //     'AIzaSyBDAee46sNdqiJ51_6MEgT7l97ErJoDxR0',
  //     PointLatLng(positionCustomer.latitude, positionCustomer.longitude),
  //     PointLatLng(position.latitude, position.longitude),
  //     travelMode: TravelMode.driving,
  //     // wayPoints: [PolylineWayPoint(location: "Sabo, Yaba Lagos Nigeria")],
  //   );
  //   if (result.points.isNotEmpty) {
  //     for (var point in result.points) {
  //       polylineCoordinates.add(LatLng(point.latitude, point.longitude));
  //     }
  //   }

  //   Random random = Random();
  //   int polyID = random.nextInt(100);

  //   Map<PolylineId, Polyline> polylines = {};
  //   PolylineId id = PolylineId("$polyID");
  //   Polyline polyline = Polyline(
  //       visible: true,
  //       polylineId: id,
  //       width: 5,
  //       color: Palette.flushOrange,
  //       points: polylineCoordinates);
  //   polylines[id] = polyline;

  //   return polylines;
  // }

  // Future<Marker> createMarkers(
  //     double lat, double long, String markerIdVal, String assetName) async {
  //   final Uint8List customIcon = await getBytesFromAsset(assetName, 70);

  //   final MarkerId markerId = MarkerId(markerIdVal);

  //   final Marker marker = Marker(
  //     markerId: markerId,
  //     icon: BitmapDescriptor.fromBytes(customIcon),
  //     position: LatLng(
  //       lat,
  //       long,
  //     ),
  //     // infoWindow: InfoWindow(title: markerIdVal.toString(), snippet: '*'),
  //     // onTap: () {
  //     //   _onMarkerTapped(markerId);
  //     // },
  //   );
  //   return marker;
  // }

  Future<Position> determinePosition() async {
    //  bool serviceEnabled;
    LocationPermission permission;
    // serviceEnabled = await Geolocator.isLocationServiceEnabled();
    // if (!serviceEnabled) {
    //   return Future.error('Layanan Lokasi dimatikan.');
    // }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Izin akses lokasi ditolak');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Izin akses lokasi ditolak secara permanen, kami tidak dapat meminta izin.');
    }

    // pref.setDouble("lat", detailAlamat.latitude);
    // pref.setDouble("long", detailAlamat.longitude);

    return await Geolocator.getCurrentPosition();
  }

  // Future<Uint8List> getBytesFromAsset(String path, int width) async {
  //   ByteData data = await rootBundle.load(path);
  //   ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
  //       targetWidth: width);
  //   ui.FrameInfo fi = await codec.getNextFrame();
  //   return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
  //       .buffer
  //       .asUint8List();
  // }
}
