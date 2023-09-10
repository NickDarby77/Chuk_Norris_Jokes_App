import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:home_practice/fonts/app_fonts.dart';
import 'package:home_practice/models/joke_model.dart';
import 'package:translator/translator.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String dataJoke = 'When Batman`s in trouble, he uses the Chuck Norris symbol';
  List<String> languages = ['en', 'ru', 'ky'];
  String selectedLanguage = 'en';

  @override
  void initState() {
    getJoke();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<bool> bools = languages.map((e) => e == selectedLanguage).toList();

    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        centerTitle: true,
        title: const Text('Chuk Norris Joke App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 350,
                child: SingleChildScrollView(
                  child: Text(
                    dataJoke,
                    style: AppFonts.jokeStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const SizedBox(height: 50),
              ElevatedButton(
                onPressed: () {
                  getJoke();
                },
                style: AppFonts.elevatedButtonStyle,
                child: const Text(
                  'Get Joke',
                  style: AppFonts.getJokeStyle,
                ),
              ),
              const SizedBox(height: 40),
              ToggleButtons(
                onPressed: (index) {
                  setState(() {});
                  selectedLanguage = languages[index];
                  translateJoke();
                },
                selectedColor: Colors.green,
                isSelected: bools,
                children: languages
                    .map(
                      (e) => Text(
                        e.toUpperCase(),
                        style: AppFonts.languagesStyle,
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> getJoke() async {
    final Dio dio = Dio();
    final Response response = await dio.get(
      'https://api.chucknorris.io/jokes/random',
    );
    dataJoke = JokeModel.fromJson(response.data).value ?? '';
    setState(() {
      selectedLanguage = 'en';
    });
  }

  Future<void> translateJoke() async {
    final translator = GoogleTranslator();
    var translation = await translator.translate(
      dataJoke,
      to: selectedLanguage,
    );
    dataJoke = translation.toString();
    setState(() {});
  }
}
