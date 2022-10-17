// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

typedef IntValueSetter = void Function(int value);

class RangeSelectorForm extends StatelessWidget {
  const RangeSelectorForm({
    Key? key,
    required this.formKey,
    required this.minValueSetter,
    required this.maxValueSetter,
  }) : super(key: key);

  final GlobalKey<FormState> formKey;
  final IntValueSetter minValueSetter;
  final IntValueSetter maxValueSetter;


  @override
  Widget build(BuildContext context) {
    return Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            RangeSelectorTextForm(
              labelText: 'minimum',
              intValueSetter: minValueSetter,
            ),
            SizedBox(
              height: 12,
            ),
            RangeSelectorTextForm(
                labelText: 'maximum', intValueSetter: maxValueSetter,)
          ]),
        ));
  }
}

class RangeSelectorTextForm extends StatelessWidget {
  const RangeSelectorTextForm({
    Key? key,
    required this.labelText,
    required this.intValueSetter,
  }) : super(key: key);

  final String labelText;
  final IntValueSetter intValueSetter;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: labelText,
      ),
      keyboardType: TextInputType.numberWithOptions(
        decimal: false,
        signed: true,
      ),
      validator: (value) {
        if (value == null || int.tryParse(value) == null) {
          return 'must be an integer';
        } else {
          return null;
        }
      },
      onSaved: ((newValue) => intValueSetter(int.parse(newValue ?? ''))),
    );
  }
}
