//import 'dart:async';


import 'package:alwafaa_task/datamodel.dart';
import 'package:alwafaa_task/mappage.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:http/http.dart' as http;
//import 'package:google_maps_flutter/google_maps_flutter.dart';

//import 'package:google_maps_flutter/google_maps_flutter.dart';

//import 'package:geocoder/geocoder.dart';

const kGoogleApiKey = "AIzaSyBDOMNCVC2eacCxKYuRxIwCz4w-QjV_l5Y";

TextEditingController ?citynameController;
TextEditingController ?areanameController;
TextEditingController ?streetnameController;
TextEditingController ?floornameController;
TextEditingController ?landmarknameController;

class AddrPage extends StatefulWidget {
  const AddrPage({ Key? key }) : super(key: key);

  @override
  _AddrPageState createState() => _AddrPageState();
}






class _AddrPageState extends State<AddrPage> {

  String googleApikey = "AIzaSyBDOMNCVC2eacCxKYuRxIwCz4w-QjV_l5Y";
  double latitude = 27.666994; //latitude
  double longitude = 85.309289; //longitude

  String address = "";

  //  final homeScaffoldKey = GlobalKey<ScaffoldState>();
  //Completer<GoogleMapController> _controller = Completer();


  double zoomVal = 5.0;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    convertToAddress(latitude, longitude, googleApikey); 
  }

  convertToAddress(double lat, double long, String apikey) async {
      Dio dio = Dio();  //initilize dio package
      String apiurl = "https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$long&key=$apikey";
    
      Response response = await dio.get(apiurl); //send get request to API URL

      if(response.statusCode == 200){ //if connection is successful
          Map data = response.data; //get response data
          if(data["status"] == "OK"){ //if status is "OK" returned from REST API
              if(data["results"].length > 0){ //if there is atleast one address
                 Map firstresult = data["results"][0]; //select the first address

                 address = firstresult["formatted_address"]; //get the address

                 //you can use the JSON data to get address in your own format
                 
                 setState(() {
                    //refresh UI
                 });
              }
          }else{
             print(data["error_message"]);
          }
      }else{
         print("error while fetching geoconding data");
      }  
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      resizeToAvoidBottomInset: false,

      appBar: AppBar(
        title: Text('New Address',),
        centerTitle: true,
      ),

      body: Container(

        child: Column(
          children: [
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.pink,onPrimary: Colors.white),
                onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> MapPage()));
              }, child: Text('Spot my location'),),
            ),

            SizedBox(height: 20,),

            ElevatedButton(onPressed: (){}, child: Text('Get location')),



            SizedBox(height: 50,),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white
              ),
              
              child: Column(
                children: [
                  Text("Address: $address"),
                  TextFormField(decoration: InputDecoration(hintText: 'City'),controller: citynameController,),
                  TextFormField(decoration: InputDecoration(hintText: 'Area/Locality'),controller: areanameController,),
                  TextFormField(decoration: InputDecoration(hintText: 'Street name'),controller: streetnameController,),
                  TextFormField(decoration: InputDecoration(hintText: 'Building name,Floor no'),),
                  TextFormField(decoration: InputDecoration(hintText: 'Near by landmark'),),
                  Container(
                    child: IntlPhoneField(
                      decoration: InputDecoration(
                        labelText: 'Phone Number',
                        border: OutlineInputBorder(
                          borderSide: BorderSide()
                        ),
                      ),
                      initialCountryCode: 'IN',
                      onChanged: (phone){
                        print(phone.completeNumber);
                        print(phone.countryCode);
                        print(phone.number);
                      },
                    ),
                  )
                ],
              ),
            ),

            SizedBox(height: 50,),

            ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.pink,onPrimary: Colors.white),
            onPressed: (){}, child: Text('Confirm')),

            
          ],
        ),
      ),
      
    );
  }

}