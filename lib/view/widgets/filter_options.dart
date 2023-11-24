import 'package:flutter/material.dart';

class FilterOption extends StatelessWidget {
  final String title;
  final dynamic option;
  final Set<String> selectedOptions;
  final Function(bool) onChanged;

  const FilterOption({
    super.key,
    required this.title,
    required this.option,
    required this.selectedOptions,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) {
        return ListTile(
          title: Text(
            title,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          onTap: () {
            setState(() {
              if (selectedOptions.contains(title)) {
                selectedOptions.remove(title);
              } else {
                selectedOptions.add(title);
              }
            });
          },
          leading: Checkbox(
            value: selectedOptions.contains(title),
            onChanged: (bool? value) {
              setState(() {
                if (selectedOptions.contains(title)) {
                  selectedOptions.remove(title);
                } else {
                  selectedOptions.add(title);
                }
              });
            },
          ),
        );
      },
    );
  }
}
