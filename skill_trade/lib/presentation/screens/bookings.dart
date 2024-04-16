import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import "../widgets/info_label.dart";
import 'package:skill_trade/presentation/widgets/rating_stars.dart';

void main() {
  runApp(const MaterialApp(
    home: MyBookings(),
  ));
}

class MyBookings extends StatefulWidget {
  const MyBookings({super.key});

  @override
  State<MyBookings> createState() => _MyBookingsState();
}

class _MyBookingsState extends State<MyBookings> {
  late DateTime? _selectedDate = null;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(), // Initial date selected
      firstDate: DateTime(2010), // First selectable date
      lastDate: DateTime(2050), // Last selectable date
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  double _rating = 0;
  String _review = '';
  List<Review> _reviews = []; // List to store previous reviews
  TextEditingController _reviewController = TextEditingController();

  void _submitReview() {
    // Here you would typically send the review and rating data to your backend server
    // for storage and processing.
    _reviews.add(Review(rating: _rating, comment: _review, customer: "Abebe Kebede"));
    setState(() {
      _rating = 0;
      _review = '';
      _reviewController.clear();
    });
    // You can also update your UI or show a confirmation dialog here.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Technician",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Image.asset(
            "assets/technician.png",
            width: 125,
            height: 125,
          ),
          const SizedBox(
            height: 5,
          ),
          const Text(
            "Abenezer Seifu",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InfoLabel(label: "Email", data: "mysteryabe456@gmail.com"),
                const SizedBox(
                  height: 3,
                ),
                InfoLabel(label: "Phone", data: "0936120470"),
                const SizedBox(
                  height: 3,
                ),
                InfoLabel(label: "Skills", data: "Electrican, Dish technician"),
                const SizedBox(
                  height: 3,
                ),
                InfoLabel(
                    label: "Experience",
                    data: "15 years in ELPA, 3 amet did mastat"),
                const SizedBox(
                  height: 3,
                ),
                InfoLabel(
                    label: "Education Level",
                    data: "Bsc. in Electrical Engineering"),
                const SizedBox(
                  height: 3,
                ),
                InfoLabel(label: "Available Location", data: "Harar"),
                const SizedBox(
                  height: 3,
                ),
                InfoLabel(label: "Additional Bio", data: "Tiris yeneqelkubet"),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: const Divider(
              thickness: 1,
              color: Colors.black,
            ),
          ),
          const Text(
            "Book Service",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Service \nDate:",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          _selectedDate == null
                              ? 'No date selected'
                              : '${_selectedDate.toString().substring(0, 10)}',
                        ),
                        // SizedBox(height: 20),
                        TextButton(
                          onPressed: () => _selectDate(context),
                          child: const Text('Select Date'),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Service \nNeeded:",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(
                      width: 7,
                    ),
                    SizedBox(
                      width: 220,
                      height: 40,
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Service \nLocation:",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(
                      width: 7,
                    ),
                    SizedBox(
                      width: 220,
                      height: 40,
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Problem \nDescription:",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),),
                      SizedBox(width: 7,),
                      SizedBox(
                        width: 220,
                        height: 60,
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                          ), 
                        ),
                      )
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    width: 250,
                    child: TextButton(
                      onPressed: () {}, 
                      child: Text("Book", style: TextStyle(color: Colors.white),),
                      style: ButtonStyle(
                        backgroundColor:  MaterialStateProperty.all<Color>(Colors.blue),
                      ),
                      
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Divider(
                thickness: 1,
                color: Colors.black,
              ),
            ),

            // Review //

            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Previous reviews
                  Text(
                    'Reviews',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  _reviews.length > 0 ? Container(
                    height: _reviews.length * 110,
                    child: ListView.builder(
                        itemCount: _reviews.length,
                        itemBuilder: (context, index) {
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset("assets/profile.jpg", width: 40, height: 40,),
                                  SizedBox(width: 5 ,),
                                  Text(_reviews[index].customer, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),),
                                ],
                              ),
                              ListTile(
                                title: RatingStars(rating: _reviews[index].rating),
                                subtitle: Text(_reviews[index].comment),
                              ),
                            ],
                          );
                        },
                    ),
                  ) : Text("No reviews yet!",),
                  
                  SizedBox(height: 20),
                  Text(
                    'Leave a Review',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  // Star rating widget
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.star, color: _rating >= 1 ? Colors.orange : Colors.grey),
                        onPressed: () => setState(() => _rating = 1),
                      ),
                      IconButton(
                        icon: Icon(Icons.star, color: _rating >= 2 ? Colors.orange : Colors.grey),
                        onPressed: () => setState(() => _rating = 2),
                      ),
                      IconButton(
                        icon: Icon(Icons.star, color: _rating >= 3 ? Colors.orange : Colors.grey),
                        onPressed: () => setState(() => _rating = 3),
                      ),
                      IconButton(
                        icon: Icon(Icons.star, color: _rating >= 4 ? Colors.orange : Colors.grey),
                        onPressed: () => setState(() => _rating = 4),
                      ),
                      IconButton(
                        icon: Icon(Icons.star, color: _rating >= 5 ? Colors.orange : Colors.grey),
                        onPressed: () => setState(() => _rating = 5),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  // Text input for review
                  TextField(
                    controller: _reviewController,
                    onChanged: (value) => _review = value,
                    maxLines: 5,
                    decoration: InputDecoration(
                      hintText: 'Write your review here...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20),
                  // Submit button
                  ElevatedButton(
                    onPressed: _submitReview,
                    child: Text('Submit'),
                  ),            
                ],
              ),
            ),
          ],
        ),
      );
  }
}


class Review {
  final double rating;
  final String comment;
  final String customer;
  Review({required this.rating, required this.comment, required this.customer});
}