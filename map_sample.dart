import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapFlutter extends StatefulWidget {
  const GoogleMapFlutter({super.key});

  @override
  State<GoogleMapFlutter> createState() => _GoogleMapFlutterState();
}

class _GoogleMapFlutterState extends State<GoogleMapFlutter> {
  LatLng myCurrentLocation = LatLng(28.6139, 77.2088);

  // Dummy member data
  final List<Member> members = [
    Member(name: 'Mohit Malik', location: LatLng(28.7041, 77.1025)),
    Member(name: 'Nitesh Pandey', location: LatLng(28.6448, 77.2167)),
    Member(name: 'Vishad Sharma', location: LatLng(28.6145, 77.1996)),
    Member(name: 'Vinove Kumar Shukla', location: LatLng(28.6129, 77.2295)),
    Member(name: 'Maneesh Malhotra', location: LatLng(28.5273, 77.1387)),
  ];

  void _showBottomSheet(Member member) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return BottomSheetContent(member: member);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Map with Members'),
      ),
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: myCurrentLocation,
              zoom: 11,
            ),
            markers: Set.from(
              members.map((member) => Marker(
                markerId: MarkerId(member.location.toString()),
                position: member.location,
                infoWindow: InfoWindow(
                  title: member.name,
                  onTap: () {
                    _showBottomSheet(member);
                  },
                ),
              )),
            ),
          ),
        ],
      ),
    );
  }
}

class Member {
  final String name;
  final LatLng location;

  Member({required this.name, required this.location});
}

class BottomSheetContent extends StatelessWidget {
  final Member member;

  BottomSheetContent({required this.member});

  final List<LocationEntry> locations = [
    LocationEntry(time: '08:00 AM', location: 'Location A'),
    LocationEntry(time: '10:00 AM', location: 'Location B'),
    LocationEntry(time: '12:00 PM', location: 'Location C'),
    LocationEntry(time: '02:00 PM', location: 'Location D'),
    LocationEntry(time: '04:00 PM', location: 'Location E'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text('Member: ${member.name}', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: locations.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(Icons.location_on),
                  title: Text(locations[index].location),
                  subtitle: Text(locations[index].time),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RouteScreen(startLocation: member.location, endLocation: locations[index].toLatLng()),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class LocationEntry {
  final String time;
  final String location;

  LocationEntry({required this.time, required this.location});

  LatLng toLatLng() {
    // Convert dummy location names to LatLng (for simplicity, returning a fixed point)
    return LatLng(28.6139, 77.2090); // Replace with actual conversion logic
  }
}

class RouteScreen extends StatelessWidget {
  final LatLng startLocation;
  final LatLng endLocation;

  RouteScreen({required this.startLocation, required this.endLocation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Route Details'),
      ),
      body: Column(
        children: [
          Text('Start Location: (${startLocation.latitude}, ${startLocation.longitude})'),
          Text('End Location: (${endLocation.latitude}, ${endLocation.longitude})'),
          Text('Total KMs: 10'), // Dummy value, replace with actual calculation
          Text('Total Duration: 30 mins'), // Dummy value, replace with actual calculation
          Expanded(
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: startLocation,
                zoom: 13,
              ),
              markers: {
                Marker(markerId: MarkerId('start'), position: startLocation, infoWindow: InfoWindow(title: 'Start')),
                Marker(markerId: MarkerId('end'), position: endLocation, infoWindow: InfoWindow(title: 'End')),
              },
              polylines: {
                Polyline(
                  polylineId: PolylineId('route'),
                  points: [startLocation, endLocation],
                  color: Colors.blue,
                ),
              },
            ),
          ),
        ],
      ),
    );
  }
}
