import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/cubit/cubit/weather_fetch_cubit.dart';
import 'package:flutter_application_1/validators/form_validators.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/cubit/email_text_field_cubit.dart';
import '../cubit/cubit/name_text_field_cubit.dart';

class Form_Widget extends StatelessWidget {
  const Form_Widget({
    Key? key,
    required this.formKey,
    required this.name_controller,
    required this.email_controller,
  }) : super(key: key);

  final GlobalKey<FormState> formKey;
  final TextEditingController name_controller;
  final TextEditingController email_controller;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          BlocBuilder<WeatherFetchCubit, WeatherFetchState>(
            builder: (context, state) {
              if (state is WeatherFetchLoading) {
                return Text('loading');
              } else if (state is WeatherFetchLoaded) {
                return Text(state.weather.location!.country);
              } else {
                return Text('no weather');
              }
            },
          ),
          BlocBuilder<NameTextFieldCubit, NameTextFieldState>(
            builder: (context, state) {
              name_controller.value = TextEditingValue(
                  text: state.value,
                  selection: TextSelection.fromPosition(
                      TextPosition(offset: name_controller.text.length)));
              return CustomTextField(name_controller: name_controller);
            },
          ),
          BlocBuilder<EmailTextFieldCubit, EmailTextFieldState>(
            builder: (context, state) {
              email_controller.value = TextEditingValue(
                  text: state.value,
                  selection: TextSelection.fromPosition(
                      TextPosition(offset: email_controller.text.length)));
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  controller: email_controller,
                  validator: (val) {
                    if (!val!.isValidEmail) {
                      return 'Enter Valid Email';
                    }
                  },
                  decoration: InputDecoration(
                      hintText: 'Email',
                      border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.purple, width: 2.0))),
                  onChanged: (value) {
                    BlocProvider.of<EmailTextFieldCubit>(context)
                        .change_value(value);
                  },
                ),
              );
            },
          ),
          ElevatedButton(
              onPressed: () {
                formKey.currentState!.validate();
              },
              child: Text('Press')),
        ],
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.name_controller,
  }) : super(key: key);

  final TextEditingController name_controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: TextFormField(
        controller: name_controller,
        validator: (val) {
          if (!val!.isValidName) {
            return 'Enter Valid Name';
          }
        },
        decoration: InputDecoration(
            hintText: 'Name',
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.purple, width: 2.0))),
        onChanged: (value) {
          BlocProvider.of<NameTextFieldCubit>(context).change_value(value);
        },
      ),
    );
  }
}
