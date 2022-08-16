import 'package:flutter/material.dart';

import 'package:flutter_application_1/cubit/cubit/name_text_field_cubit.dart';
import 'package:flutter_application_1/cubit/cubit/weather_fetch_cubit.dart';
import 'package:flutter_application_1/repository/api_repository.dart';
import 'package:flutter_application_1/services/api_service.dart';
import 'package:flutter_application_1/widgets/form_widget.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/cubit/email_text_field_cubit.dart';
import 'packages.dart';
import 'package:flutter_application_1/functions/show_dialogue.dart';
import 'validators/form_validators.dart';

void main() {
  runApp(MyApp(apiService: ApiService()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.apiService}) : super(key: key);

  final ApiService apiService;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<WeatherFetchCubit>(
          create: (context) => WeatherFetchCubit(
              apiRepository: ApiRepository(apiService: apiService))
            ..fetchWeatherApi(),
        ),
        BlocProvider<NameTextFieldCubit>(
          create: (context) => NameTextFieldCubit(),
        ),
        BlocProvider<EmailTextFieldCubit>(
          create: (BuildContext context) => EmailTextFieldCubit(),
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            // This is the theme of your application.
            //
            // Try running your application with "flutter run". You'll see the
            // application has a blue toolbar. Then, without quitting the app, try
            // changing the primarySwatch below to Colors.green and then invoke
            // "hot reload" (press "r" in the console where you ran "flutter run",
            // or simply save your changes to "hot reload" in a Flutter IDE).
            // Notice that the counter didn't reset back to zero; the application
            // is not restarted.
            primarySwatch: Colors.blue,
          ),
          home: HomePage()),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

TextEditingController name_controller = TextEditingController();
TextEditingController email_controller = TextEditingController();

class _HomePageState extends State<HomePage> {
  @override
  final formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          elevation: 20.0,
          leading: IconButton(
              onPressed: (() {
                Show_dialogue.showMyDialog('day', context);
              }),
              icon: Icon(Icons.date_range)),
          actions: [
            IconButton(
                onPressed: () {
                  Show_dialogue.showMyDialog('date/time', context);
                },
                icon: Icon(Icons.punch_clock))
          ],
          title: Center(child: Text('Form')),
        ),
        body: Column(
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
            Form_Widget(
              formKey: formKey,
              name_controller: name_controller,
              email_controller: email_controller,
            ),
          ],
        ));
  }
}
