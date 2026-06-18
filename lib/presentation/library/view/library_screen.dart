import 'package:flutter/material.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({super.key});

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  bool isHistorySelected = true;

  final List<Map<String, dynamic>> scans = [
    {
      "icon": Icons.biotech,
      "title": "Quantum Mechanics ...",
      "subject": "Physics",
      "time": "2 min ago",
      "isFavorite": false,
    },
    {
      "icon": Icons.trending_up,
      "title": "Keynesian Economic T...",
      "subject": "Economics",
      "time": "1h ago",
      "isFavorite": true,
    },
    {
      "icon": Icons.account_balance,
      "title": "French Revolution ...",
      "subject": "History",
      "time": "3h ago",
      "isFavorite": false,
    },
    {
      "icon": Icons.science,
      "title": "Organic Chemistry Re...",
      "subject": "Chemistry",
      "time": "Yesterday",
      "isFavorite": true,
    },
    {
      "icon": Icons.functions,
      "title": "Calculus — Integration ...",
      "subject": "Math",
      "time": "2 days ago",
      "isFavorite": false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    const Color darkBg = Color(0xFF10111F);
    const Color cardColor = Color(0xFF1E2139);
    const Color primary = Color(0xFF6B5BFB);
    const Color textSecondary = Color(0xFFB0B0B0);

    // filter logic
    final displayedList = isHistorySelected
        ? scans
        : scans.where((e) => e["isFavorite"] == true).toList();

    return Scaffold(
      backgroundColor: darkBg,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              /// 🔹 HEADER
              Row(
                children: [
                  const Text(
                    "Library",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    "${scans.length} scans · ${scans.where((e) => e["isFavorite"]).length} favorites",
                    style: const TextStyle(color: textSecondary),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              /// 🔹 SEARCH
              Container(
                height: 50,
                decoration: BoxDecoration(
                  color: cardColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: const Row(
                  children: [
                    Icon(Icons.search, color: textSecondary),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Search...",
                          hintStyle: TextStyle(color: textSecondary),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              /// 🔹 TOGGLE BUTTON
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() => isHistorySelected = true);
                      },
                      child: Container(
                        height: 48,
                        decoration: BoxDecoration(
                          color: isHistorySelected
                              ? primary
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(12),
                          border: isHistorySelected
                              ? null
                              : Border.all(color: cardColor),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.history,
                              color: isHistorySelected
                                  ? Colors.white
                                  : textSecondary,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              "History",
                              style: TextStyle(
                                color: isHistorySelected
                                    ? Colors.white
                                    : textSecondary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() => isHistorySelected = false);
                      },
                      child: Container(
                        height: 48,
                        decoration: BoxDecoration(
                          color: !isHistorySelected
                              ? primary
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(12),
                          border: !isHistorySelected
                              ? null
                              : Border.all(color: cardColor),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.star,
                              color: !isHistorySelected
                                  ? Colors.white
                                  : textSecondary,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              "Favorites",
                              style: TextStyle(
                                color: !isHistorySelected
                                    ? Colors.white
                                    : textSecondary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              /// 🔹 LIST
              Expanded(
                child: displayedList.isEmpty
                    ? const Center(
                        child: Text(
                          "No favorites yet",
                          style: TextStyle(color: Colors.white54),
                        ),
                      )
                    : ListView.builder(
                        itemCount: displayedList.length,
                        itemBuilder: (context, index) {
                          final item = displayedList[index];

                          return Container(
                            margin: const EdgeInsets.only(bottom: 15),
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: cardColor,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Row(
                              children: [
                                /// ICON
                                Container(
                                  height: 45,
                                  width: 45,
                                  decoration: BoxDecoration(
                                    color: darkBg,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Icon(item["icon"], color: primary),
                                ),

                                const SizedBox(width: 15),

                                /// TEXT
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      /// 🔹 TITLE + TIME ROW
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              item["title"],
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ],
                                      ),

                                      const SizedBox(height: 6),

                                      /// 🔹 SUBJECT
                                      Row(
                                        children: [
                                          Text(
                                            item["subject"],
                                            style: const TextStyle(
                                              color: Colors.white54,
                                            ),
                                          ),
                                          const SizedBox(width: 10),

                                          /// ⏱ TIME
                                          const Icon(
                                            Icons.access_time,
                                            size: 14,
                                            color: Colors.white54,
                                          ),
                                          const SizedBox(width: 5),
                                          Text(
                                            item["time"],
                                            style: const TextStyle(
                                              color: Colors.white54,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),

                                /// ⭐ FAVORITE BUTTON
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      item["isFavorite"] = !item["isFavorite"];
                                    });
                                  },
                                  child: Icon(
                                    item["isFavorite"]
                                        ? Icons.star
                                        : Icons.star_border,
                                    color: item["isFavorite"]
                                        ? Colors.amber
                                        : textSecondary,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
