import 'package:flutter/material.dart';

void main() {
  runApp(const CategoryFilterApp());
}

class CategoryFilterApp extends StatelessWidget {
  const CategoryFilterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const CategoryFilterScreen(),
    );
  }
}

class CategoryFilterScreen extends StatefulWidget {
  const CategoryFilterScreen({super.key});

  @override
  State<CategoryFilterScreen> createState() => _CategoryFilterScreenState();
}

class _CategoryFilterScreenState extends State<CategoryFilterScreen> {
  // متغيرات لكل فئة
  bool sportsSelected = false;
  bool politicsSelected = false;
  bool healthSelected = false;
  bool travelSelected = false;
  bool environmentSelected = false;
  bool technologySelected = false;
  bool educationSelected = false;
  bool entertainmentSelected = false;

  @override
  Widget build(BuildContext context) {
    // حساب عدد الفئات المختارة
    int selectedCount = 0;
    if (sportsSelected) selectedCount++;
    if (politicsSelected) selectedCount++;
    if (healthSelected) selectedCount++;
    if (travelSelected) selectedCount++;
    if (environmentSelected) selectedCount++;
    if (technologySelected) selectedCount++;
    if (educationSelected) selectedCount++;
    if (entertainmentSelected) selectedCount++;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "News",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
        centerTitle: true,
        actions: [
          if (selectedCount > 0)
            Container(
              margin: const EdgeInsets.only(right: 16),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                "$selectedCount selected",
                style: const TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 30),
          
          // العنوان
          const Text(
            "Pick your category of interest",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          
          const SizedBox(height: 10),
          
          // الوصف
          const Text(
            "Select one or more categories",
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          
          const SizedBox(height: 30),
          
          // الصف الأول
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildCategoryBox(
                "Sports",
                Icons.sports_soccer,
                Colors.green,
                sportsSelected,
                () {
                  setState(() {
                    sportsSelected = !sportsSelected;
                  });
                },
              ),
              buildCategoryBox(
                "Politics",
                Icons.balance,
                Colors.blue,
                politicsSelected,
                () {
                  setState(() {
                    politicsSelected = !politicsSelected;
                  });
                },
              ),
            ],
          ),
          
          const SizedBox(height: 20),
          
          // الصف الثاني
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildCategoryBox(
                "Health",
                Icons.health_and_safety,
                Colors.red,
                healthSelected,
                () {
                  setState(() {
                    healthSelected = !healthSelected;
                  });
                },
              ),
              buildCategoryBox(
                "Travel",
                Icons.travel_explore,
                Colors.orange,
                travelSelected,
                () {
                  setState(() {
                    travelSelected = !travelSelected;
                  });
                },
              ),
            ],
          ),
          
          const SizedBox(height: 20),
          
          // الصف الثالث
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildCategoryBox(
                "Environment",
                Icons.eco,
                Colors.teal,
                environmentSelected,
                () {
                  setState(() {
                    environmentSelected = !environmentSelected;
                  });
                },
              ),
              buildCategoryBox(
                "Technology",
                Icons.memory,
                Colors.purple,
                technologySelected,
                () {
                  setState(() {
                    technologySelected = !technologySelected;
                  });
                },
              ),
            ],
          ),
          
          const SizedBox(height: 20),
          
          // الصف الرابع
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildCategoryBox(
                "Education",
                Icons.school,
                Colors.deepOrange,
                educationSelected,
                () {
                  setState(() {
                    educationSelected = !educationSelected;
                  });
                },
              ),
              buildCategoryBox(
                "Entertainment",
                Icons.movie,
                Colors.pink,
                entertainmentSelected,
                () {
                  setState(() {
                    entertainmentSelected = !entertainmentSelected;
                  });
                },
              ),
            ],
          ),
          
          const Spacer(),
          
          // زر التطبيق
          Container(
            padding: const EdgeInsets.all(20),
            child: ElevatedButton(
              onPressed: selectedCount > 0
                  ? () {
                      // جمع الفئات المختارة
                      String selectedCategories = "";
                      if (sportsSelected) selectedCategories += "Sports, ";
                      if (politicsSelected) selectedCategories += "Politics, ";
                      if (healthSelected) selectedCategories += "Health, ";
                      if (travelSelected) selectedCategories += "Travel, ";
                      if (environmentSelected) selectedCategories += "Environment, ";
                      if (technologySelected) selectedCategories += "Technology, ";
                      if (educationSelected) selectedCategories += "Education, ";
                      if (entertainmentSelected) selectedCategories += "Entertainment, ";
                      
                      // إزالة الفاصلة الأخيرة
                      if (selectedCategories.isNotEmpty) {
                        selectedCategories = selectedCategories.substring(0, selectedCategories.length - 2);
                      }
                      
                      // عرض الرسالة
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Selected: $selectedCategories"),
                          backgroundColor: Colors.green,
                        ),
                      );
                    }
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                disabledBackgroundColor: Colors.grey,
                minimumSize: const Size(200, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                "Apply Filter",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // دالة لبناء صندوق الفئة
  Widget buildCategoryBox(String name, IconData icon, Color color, bool isSelected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 150,
        height: 150,
        decoration: BoxDecoration(
          color: isSelected ? color.withOpacity(0.2) : Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(12),
            topRight: const Radius.circular(12),
            bottomLeft: const Radius.circular(12),
          ),
          border: Border.all(
            color: isSelected ? color : Colors.grey.shade300,
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              blurRadius: 5,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 50,
              color: isSelected ? color : color.withOpacity(0.8),
            ),
            const SizedBox(height: 10),
            Text(
              name,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: isSelected ? color : Colors.black,
              ),
            ),
            if (isSelected)
              Container(
                margin: const EdgeInsets.only(top: 8),
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 16,
                ),
              ),
          ],
        ),
      ),
    );
  }
}