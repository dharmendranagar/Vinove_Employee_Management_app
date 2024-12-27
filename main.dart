import 'package:flutter/material.dart';
import 'map_sample.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          title: Text('WORKSTATUS'),
          backgroundColor: Colors.blue,
          bottom: TabBar(
            tabs: [
              Tab(text: 'Home'),
              Tab(text: 'Members'),
            ],
          ),
        ),
        drawer: AppDrawer(),
        body: TabBarView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(child: Text('Home Screen Content')),
                Container(
                  padding: EdgeInsets.all(16.0),
                  margin: EdgeInsets.only(top: 20.0),
                  decoration: BoxDecoration(
                    color: Colors.lightBlueAccent,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Text(
                    'This project was made by Deepanshu and Dharmendra',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 20.0), // Space between the two containers
                Container(
                  padding: EdgeInsets.all(16.0),
                  margin: EdgeInsets.symmetric(horizontal: 16.0),
                  decoration: BoxDecoration(
                    color: Colors.lightBlueAccent,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Text(
                    'This space can be used to add additional information about the organisation!',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            MembersScreen(),
          ],
        ),
      ),
    );
  }
}

class MembersScreen extends StatelessWidget {
  final List<Member> members = [
    Member(name: 'Mohit Malik', imageUrl: 'assets/space3.jpg'),
    Member(name: 'Nitesh Pandey', imageUrl: 'assets/space4.jpg'),
    Member(name: 'Vishad Sharma', imageUrl: 'assets/space5.jpg'),
    Member(name: 'Vinove Kumar Shukla', imageUrl: 'assets/space11.jpg'),
    Member(name: 'Maneesh Malhotra', imageUrl: 'assets/space7.jpg'),
    Member(name: 'Elizabeth Swann', imageUrl: 'assets/space6.jpg'),
    Member(name: 'Robert Downey', imageUrl: 'assets/space8.jpg'),
    Member(name: 'Francis Diakowsky', imageUrl: 'assets/space10.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search',
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: members.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(members[index].imageUrl),
                ),
                title: Text(members[index].name),
              );
            },
          ),
        ),
      ],
    );
  }
}

class Member {
  final String name;
  final String imageUrl;

  Member({required this.name, required this.imageUrl});
}

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 30,
                  backgroundImage: AssetImage('assets/space9.jpg'),
                ),
                SizedBox(height: 10),
                Text(
                  "Cameron Williamson",
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  "cameronwilliamson@gmail.com",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.timer),
            title: Text('Timer'),
          ),
          ListTile(
            leading: Icon(Icons.calendar_today),
            title: Text('Attendance'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AttendanceScreen()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.access_alarm),
            title: Text('Activity'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => GoogleMapFlutter()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.assignment),
            title: Text('Timesheet'),
          ),
          ListTile(
            leading: Icon(Icons.report),
            title: Text('Report'),
          ),
          ListTile(
            leading: Icon(Icons.location_on),
            title: Text('Jobsite'),
          ),
          ListTile(
            leading: Icon(Icons.group),
            title: Text('Team'),
          ),
          ListTile(
            leading: Icon(Icons.time_to_leave),
            title: Text('Time off'),
          ),
          ListTile(
            leading: Icon(Icons.schedule),
            title: Text('Schedules'),
          ),
          ListTile(
            leading: Icon(Icons.request_page),
            title: Text('Request to join Organization'),
          ),
          ListTile(
            leading: Icon(Icons.lock),
            title: Text('Change Password'),
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
          ),
          ListTile(
            leading: Icon(Icons.help),
            title: Text('FAQ & Help'),
          ),
          ListTile(
            leading: Icon(Icons.privacy_tip),
            title: Text('Privacy Policy'),
          ),
          ListTile(
            title: Text('Version: 2.10(1)'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class AttendanceScreen extends StatelessWidget {
  final List<Member> members = [
    Member(name: 'Mohit Malik', imageUrl: 'assets/space3.jpg'),
    Member(name: 'Nitesh Pandey', imageUrl: 'assets/space4.jpg'),
    Member(name: 'Vishad Sharma', imageUrl: 'assets/space5.jpg'),
    Member(name: 'Vinove Kumar Shukla', imageUrl: 'assets/space11.jpg'),
    Member(name: 'Maneesh Malhotra', imageUrl: 'assets/space7.jpg'),
    Member(name: 'Elizabeth Swann', imageUrl: 'assets/space6.jpg'),
    Member(name: 'Robert Downey', imageUrl: 'assets/space8.jpg'),
    Member(name: 'Francis Diakowsky', imageUrl: 'assets/space10.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Attendance'),
      ),
      body: ListView.builder(
        itemCount: members.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(members[index].imageUrl),
            ),
            title: Text(members[index].name),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.location_on),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MemberDetailScreen(member: members[index]),
                      ),
                    );
                  },
                ),
                IconButton(
                  icon: Icon(Icons.route),
                  onPressed: () {
                    // Handle route check
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class MemberDetailScreen extends StatelessWidget {
  final Member member;

  MemberDetailScreen({required this.member});

  final List<LocationEntry> locations = [
    LocationEntry(time: '08:00 AM', location: 'Location A'),
    LocationEntry(time: '10:00 AM', location: 'Location B'),
    LocationEntry(time: '12:00 PM', location: 'Location C'),
    LocationEntry(time: '02:00 PM', location: 'Location D'),
    LocationEntry(time: '04:00 PM', location: 'Location E'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Current Location & Route'),
      ),
      body: Column(
        children:         [
          Expanded(
            flex: 2,
            child: Center(
              child: Icon(
                Icons.map,
                size: 100,
                color: Colors.purple,
              ),
              // Placeholder for map
            ),
          ),
          Expanded(
            flex: 1,
            child: ListView.builder(
              itemCount: locations.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(Icons.location_on),
                  title: Text(locations[index].location),
                  subtitle: Text(locations[index].time),
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
}
