import 'package:flutter/material.dart';

import '../widgets/customappbar_widget.dart';
import '../widgets/customfloatingactionbutton_widget.dart';

class RecentScreen extends StatelessWidget {
  const RecentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: const [
          Text(
            'Today',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          CallLogItem(
            name: 'John Doe',
            callType: CallType.incoming,
            dateTime: '10:30 AM',
            duration: '2 min',
          ),
          CallLogItem(
            name: 'Jane Smith',
            callType: CallType.outgoing,
            dateTime: '9:15 AM',
            duration: '5 min',
          ),
          CallLogItem(
            name: 'Emily Johnson',
            callType: CallType.missed,
            dateTime: '8:45 AM',
            duration: '',
          ),
          SizedBox(height: 16),
          Text(
            'Yesterday',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          CallLogItem(
            name: 'Michael Brown',
            callType: CallType.incoming,
            dateTime: '4:20 PM',
            duration: '3 min',
          ),
          CallLogItem(
            name: 'Sarah Davis',
            callType: CallType.outgoing,
            dateTime: '2:50 PM',
            duration: '7 min',
          ),
          CallLogItem(
            name: 'David Wilson',
            callType: CallType.missed,
            dateTime: '11:30 AM',
            duration: '',
          ),
          SizedBox(height: 16),
          Text(
            'Older',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          CallLogItem(
            name: 'Michael Brown',
            callType: CallType.incoming,
            dateTime: '4:20 PM',
            duration: '3 min',
          ),
          CallLogItem(
            name: 'Sarah Davis',
            callType: CallType.outgoing,
            dateTime: '2:50 PM',
            duration: '7 min',
          ),
          CallLogItem(
            name: 'David Wilson',
            callType: CallType.missed,
            dateTime: '11:30 AM',
            duration: '',
          ),
        ],
      ),
      floatingActionButton: const CustomFloatingActionButton(),
    );
  }
}

class CallLogItem extends StatelessWidget {
  final String name;
  final CallType callType;
  final String dateTime;
  final String duration;

  const CallLogItem({
    super.key,
    required this.name,
    required this.callType,
    required this.dateTime,
    required this.duration,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Text(name[0]),
      ),
      title: Text(name),
      subtitle: Text('$dateTime • $duration'),
      trailing: Icon(
        callType == CallType.incoming
            ? Icons.call_received
            : callType == CallType.outgoing
                ? Icons.call_made
                : Icons.call_missed,
        color: callType == CallType.missed ? Colors.red : Colors.green,
      ),
    );
  }
}

enum CallType { incoming, outgoing, missed }
