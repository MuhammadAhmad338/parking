import 'dart:convert'; // For JSON decoding
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
// import 'package:http/http.dart' as http;
import 'package:parking/Helper/colors.dart';

// Model class for Ticket
class Ticket {
  final String id;
  final String employeeName;
  final String location;
  final String price;
  final String dateTime;

  Ticket({
    required this.id,
    required this.employeeName,
    required this.location,
    required this.price,
    required this.dateTime,
  });

  factory Ticket.fromJson(Map<String, dynamic> json) {
    return Ticket(
      id: json['id'],
      employeeName: json['employeeName'],
      location: json['location'],
      price: json['price'],
      dateTime: json['dateTime'],
    );
  }
}

class Searchticketscreen extends StatefulWidget {
  const Searchticketscreen({super.key});

  @override
  _SearchticketscreenState createState() => _SearchticketscreenState();
}

class _SearchticketscreenState extends State<Searchticketscreen> {
  late Future<List<Ticket>> futureTickets;

  @override
  void initState() {
    super.initState();
    // For now, use a local list instead of fetching from backend
    futureTickets = fetchLocalTickets();
  }

  // Function to fetch local tickets for testing
  Future<List<Ticket>> fetchLocalTickets() async {
    // Simulate a delay like a network request
    await Future.delayed(const Duration(seconds: 1));

    // Return a hardcoded list of tickets for testing purposes
    List<Ticket> localTickets = [
      Ticket(
        id: 'ABC-1-1001',
        employeeName: 'John Doe',
        location: 'Location A',
        price: '\$20',
        dateTime: '19 Sep, 2023 04:14 PM',
      ),
      Ticket(
        id: 'ABC-2-1002',
        employeeName: 'Jane Smith',
        location: 'Location B',
        price: '\$25',
        dateTime: '19 Sep, 2023 05:30 PM',
      ),
      Ticket(
        id: 'ABC-3-1003',
        employeeName: 'Mike Johnson',
        location: 'Location C',
        price: '\$15',
        dateTime: '19 Sep, 2023 06:00 PM',
      ),
    ];

    return localTickets;
  }

  // Original function to fetch tickets from backend (not used yet)
  // Future<List<Ticket>> fetchTickets() async {
  //   final response =
  //       await http.get(Uri.parse('https://example.com/api/tickets'));

  //   if (response.statusCode == 200) {
  //     List<dynamic> ticketsJson = json.decode(response.body);
  //     return ticketsJson.map((json) => Ticket.fromJson(json)).toList();
  //   } else {
  //     throw Exception('Failed to load tickets');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Gap(8),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: CColors.blackColor),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: CColors.blackColor),
                ),
                hintText: 'Search',
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder<List<Ticket>>(
              future: futureTickets,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('No tickets found'));
                } else {
                  final tickets = snapshot.data!;
                  return ListView.builder(
                    itemCount: tickets.length,
                    itemBuilder: (context, index) {
                      final ticket = tickets[index];
                      return Card(
                        margin: const EdgeInsets.all(8.0),
                        elevation: 1,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          side:
                              BorderSide(color: Colors.grey.shade300, width: 1),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      const Icon(Icons.shopping_cart),
                                      const Gap(8),
                                      Text(
                                        ticket.id,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    ticket.price,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              const Gap(12),
                              Text(
                                ticket.employeeName,
                                style: const TextStyle(
                                    fontSize: 16, color: Colors.grey),
                              ),
                              const Gap(8),
                              const Divider(
                                color: Colors.grey,
                                thickness: 1,
                              ),
                              const Gap(8),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    ticket.location,
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.grey[600]),
                                  ),
                                  Text(
                                    ticket.dateTime,
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.grey[600]),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
