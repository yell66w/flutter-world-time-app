import 'package:flutter/material.dart';
import 'package:world_time_app_with_netninja/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
    WorldTime(url: 'Asia/Manila', location: 'Manila', flag: 'manila.png'),
  ];
  void updateTime(index) async {
    WorldTime instance = WorldTime(
        location: locations[index].location,
        flag: locations[index].flag,
        url: locations[index].url);
    await instance.getTime();
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Choose Location"),
          centerTitle: true,
          elevation: 0,
        ),
        body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 4, vertical: 1),
              child: Card(
                child: ListTile(
                  onTap: () {
                    updateTime(index);
                  },
                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                    backgroundColor: Colors.amber,
                  ),
                ),
              ),
            );
          },
        ));
  }
}
