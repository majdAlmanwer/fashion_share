import 'package:flutter/material.dart';

class SliderSelectRange extends StatefulWidget {
  const SliderSelectRange(
      {Key? key, required this.onRangeSelected, required this.values})
      : super(key: key);

  final RangeValues values;
  final Function(RangeValues) onRangeSelected;

  @override
  State<SliderSelectRange> createState() => _SliderExampleState();
}

class _SliderExampleState extends State<SliderSelectRange> {
  late RangeValues selectedRange;

  @override
  void initState() {
    super.initState();
    selectedRange = widget.values;
  }

  @override
  Widget build(BuildContext context) {
    return RangeSlider(
      values: selectedRange,
      onChanged: (range) {
        setState(() {
          selectedRange = range;
        });
        widget.onRangeSelected(range);
      },
      min: widget.values.start,
      max: widget.values.end,
      divisions: 100,
      labels: RangeLabels(
          "${selectedRange.start.round()}", "${selectedRange.end.round()}"),
    );
  }
}
