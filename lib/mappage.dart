import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  const MapPage({ Key? key }) : super(key: key);

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: ListView(
        children: [
          TextField(

          ),
          Container(height: 300,
          child: GoogleMap(
            initialCameraPosition: CameraPosition(target: LatLng(41.8781,-87.6298)),
            mapType: MapType.normal,
            myLocationButtonEnabled: true,
          ),),

          SizedBox(height: 50,),
          ElevatedButton(onPressed: (){}, child: Text('Confirm Location'))
        ],
      ),
      
    );
  }
}