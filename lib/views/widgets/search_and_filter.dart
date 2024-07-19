import 'package:flutter/material.dart';

class FilterWidget extends StatefulWidget {
  final Function(String) onSearch;
  final Function(String) onCategoryChanged;

  const FilterWidget(
      {super.key, required this.onSearch, required this.onCategoryChanged});

  @override
  FilterWidgetState createState() => FilterWidgetState();
}

class FilterWidgetState extends State<FilterWidget> {
  final TextEditingController _searchController = TextEditingController();
  String _selectedCategory = 'All';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: _searchController,
            decoration: InputDecoration(
              labelText: 'Search',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            onChanged: widget.onSearch,
          ),
          const SizedBox(height: 16.0),
          DropdownButtonFormField<String>(
            value: _selectedCategory,
            items: ['All', 'Government', 'Private']
                .map((category) => DropdownMenuItem(
                      value: category,
                      child: Text(category),
                    ))
                .toList(),
            decoration: InputDecoration(
              labelText: 'Category',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            onChanged: (value) {
              if (value != null) {
                setState(() {
                  _selectedCategory = value;
                });
                widget.onCategoryChanged(value);
              }
            },
          ),
        ],
      ),
    );
  }
}
