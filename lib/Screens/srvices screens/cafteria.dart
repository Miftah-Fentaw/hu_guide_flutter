import 'package:flutter/material.dart';

class CafeteriaScreen extends StatelessWidget {
  const CafeteriaScreen({super.key});

  final meals = const {
    "Monday": {
      "Breakfast": "Bread & Tea",
      "Lunch": "kk",
      "Dinner": "kk",
    },
    "Tuesday": {
      "Breakfast": "Fetira & Tea",
      "Lunch": "kk",
      "Dinner": "Therefore (meat)",
    },
    "Wednesday": {
      "Breakfast": "dabo be sls",
      "Lunch": "kk",
      "Dinner": "kk",
    },
    "Thursday": {
      "Breakfast": "Injera frfr",
      "Lunch": "kk",
      "Dinner": "kk",
    },
    "Friday": {
      "Breakfast": "Bread & Tea",
      "Lunch": "Therefore (meat)",
      "Dinner": "shiro",
    },
    "Saturday": {
      "Breakfast": "Mekoreni",
      "Lunch": "kk",
      "Dinner": "kk",
    },
    "Sunday": {
      "Breakfast": "Injera frfr",
      "Lunch": "Special Meal",
      "Dinner": "Injera with Shiro",
    },
  };

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.045,
            vertical: screenHeight * 0.01875,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(onPressed: (){
                Navigator.pop(context);
              }, icon: Icon(Icons.arrow_back)),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(screenWidth * 0.045),
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Cafeteria Meals",
                      style: TextStyle(
                        fontSize: screenWidth * 0.055,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    Text(
                      "Weekly meal schedule for students",
                      style: TextStyle(
                        fontSize: screenWidth * 0.035,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.03125),
              Expanded(
                child: ListView(
                  children: meals.entries.map((entry) {
                    final day = entry.key;
                    final mealData = entry.value;
                    return Container(
                      margin: EdgeInsets.only(bottom: screenHeight * 0.01875),
                      padding: EdgeInsets.all(screenWidth * 0.045),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.25),
                            blurRadius: 6,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            day,
                            style: TextStyle(
                              fontSize: screenWidth * 0.045,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.0125),
                          Row(
                            children: [
                              Icon(
                                Icons.free_breakfast,
                                color: Colors.orange,
                                size: screenWidth * 0.045,
                              ),
                              SizedBox(width: screenWidth * 0.02),
                              Text("Breakfast: ${mealData["Breakfast"]}"),
                            ],
                          ),
                          SizedBox(height: screenHeight * 0.0075),
                          Row(
                            children: [
                              Icon(
                                Icons.lunch_dining,
                                color: Colors.redAccent,
                                size: screenWidth * 0.045,
                              ),
                              SizedBox(width: screenWidth * 0.02),
                              Text("Lunch: ${mealData["Lunch"]}"),
                            ],
                          ),
                          SizedBox(height: screenHeight * 0.0075),
                          Row(
                            children: [
                              Icon(
                                Icons.dinner_dining,
                                color: Colors.green,
                                size: screenWidth * 0.045,
                              ),
                              SizedBox(width: screenWidth * 0.02),
                              Text("Dinner: ${mealData["Dinner"]}"),
                            ],
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
