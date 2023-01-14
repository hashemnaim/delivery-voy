import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../utils/export.dart';

class MyLocation extends StatefulWidget {
  final int page;
  final String? locationLong, locationLat;
  final Function? saveAddress;

  const MyLocation(
      {Key? key,
      this.page = 0,
      this.saveAddress,
      this.locationLong,
      this.locationLat})
      : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return LocationCollecterState();
  }
}

class LocationCollecterState extends State<MyLocation> {
  late GoogleMapController mapController;
  GlobalKey<ScaffoldState> scaffolState = GlobalKey();
  String? addrees = "";

  AppController appController = Get.find();

  final LatLng _center = const LatLng(24.4539, 54.3773);
  Position? position;
  Future<Position?> getCurrentLocation() async {
    position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(double.parse(widget.locationLong!),
            double.parse(widget.locationLat!)),
        zoom: 15)));

    getLoction(LatLng(position!.latitude, position!.longitude));
    return position;
  }

  Future<String?> getLoction(LatLng postion) async {
    try {
      // List<Address> address = await Geocoder.local.findAddressesFromCoordinates(
      //     Coordinates(postion.latitude, postion.longitude));

      // addrees = address.first.addressLine;
      // setState(() {});

      return addrees;
    } catch (e) {
      return null;
    }
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    getCurrentLocation().then((position) {
      markerPosition = position;
      _markers.clear();
      _markers.add(Marker(
          markerId: MarkerId('userSelection'),
          position: LatLng(position!.latitude, position.longitude)));
      setState(() {});
    });
  }

  Set<Marker> _markers = {};
  Position? markerPosition;

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          key: scaffolState,
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: AppColors.blackDark,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: CustomText(
              text: "Adresseidentifikasjon",
              color: AppColors.blackDark,
              fontSize: 20,
            ),
            centerTitle: true,
            backgroundColor: AppColors.primary,
          ),
          body: Stack(
            children: <Widget>[
              GoogleMap(
                zoomControlsEnabled: false,
                markers: _markers,
                onTap: widget.page == 1
                    ? null
                    : (piclerLocation) async {
                        _markers.clear();
                        _markers.add(Marker(
                            markerId: MarkerId('userSelection'),
                            position: LatLng(piclerLocation.latitude,
                                piclerLocation.longitude)));
                        position = markerPosition;
                        addrees = await getLoction(piclerLocation);
                        // AppController.address.value = addrees;
                        // print(AppController.address.value);

                        setState(() {});
                      },
                onMapCreated: _onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: _center,
                  zoom: 5.0,
                ),
              ),
              widget.page == 1
                  ? Container()
                  : Positioned(
                      bottom: 30,
                      right: 15,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            elevation: 0.4,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          onPressed: () async {
                            // AppController.latitude.value = position.latitude;
                            // AppController.longitude.value = position.longitude;

                            // AppController.textEditingController.value.text = addrees;
                            // setToast("Adressen er bestemt", AppColors.primary);
                            // widget.saveAddress(addrees);
                            setState(() {});
                            // widget.page == 0
                            //     ? Get.off(() => AddProductSheet())
                            //     : Get.off(() => RegestrationScreen());

                            Get.back();
                          },
                          child: CircleAvatar(
                              radius: 25,
                              backgroundColor: AppColors.primary,
                              child: Icon(Icons.done,
                                  color: AppColors.blackLight))),
                    )
            ],
          ),
        ));
  }
}
