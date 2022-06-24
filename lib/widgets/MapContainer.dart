import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapContainer extends StatefulWidget {
  final Map<String, dynamic> location;
  const MapContainer({Key? key, required this.location}) : super(key: key);

  @override
  State<MapContainer> createState() => _MapState();
}

class _MapState extends State<MapContainer> {
  late GoogleMapController _googleMapController;
  late Marker _marker;
  CameraPosition _initialCameraPosition =
      CameraPosition(target: LatLng(45654, -784), zoom: 11.5);

  @override
  void initState() {
    super.initState();
    setState(() {
      _initialCameraPosition = CameraPosition(
          target: LatLng(widget.location['lat'].toDouble(),
              widget.location['lng'].toDouble()),
          zoom: 11.5);
      _marker = Marker(
        markerId: const MarkerId('origin'),
        infoWindow: const InfoWindow(title: 'Origin'),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet),
        position: LatLng(widget.location['lat'].toDouble(),
            widget.location['lng'].toDouble()),
      );
    });
  }

  @override
  void dispose() {
    _googleMapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
          width: 400,
          height: 400,
          child: GoogleMap(
              initialCameraPosition: _initialCameraPosition,
              zoomControlsEnabled: false,
              markers: {_marker},
              onMapCreated: (controller) => _googleMapController = controller,
              gestureRecognizers: Set()
                ..add(Factory<PanGestureRecognizer>(
                    () => PanGestureRecognizer())))),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.black,
        onPressed: () => _googleMapController.animateCamera(
          CameraUpdate.newCameraPosition(_initialCameraPosition),
        ),
        child: const Icon(Icons.center_focus_strong),
      ),
    );
  }
}
