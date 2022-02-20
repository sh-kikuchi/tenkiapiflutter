//stfulを打ってEnterを押すと雛形登場
//class名を記述
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tenkiapiflutter/weather.dart';

class TopPage extends StatefulWidget {
  const TopPage({Key? key}) : super(key: key);

  @override
  _TopPageState createState() => _TopPageState();
}

class _TopPageState extends State<TopPage> {
  //手打ちのデータ
  Weather currentWeather = Weather(
      temp: 15,
      description: '晴れ',
      tempMax: 18,
      tempMin: 14,
      time: DateTime(2021, 10, 1, 10));
  List<Weather> hourlyWeather = [
    Weather(
        temp: 20,
        description: '晴れ',
        time: DateTime(2021, 10, 1, 10),
        rainyPercent: 0),
    Weather(
        temp: 18,
        description: '雨',
        time: DateTime(2021, 10, 1, 11),
        rainyPercent: 90),
    Weather(
        temp: 17,
        description: '曇り',
        time: DateTime(2021, 10, 1, 12),
        rainyPercent: 10),
    Weather(
        temp: 15,
        description: '晴れ',
        time: DateTime(2021, 10, 1, 13),
        rainyPercent: 0),
    Weather(
        temp: 20,
        description: '晴れ',
        time: DateTime(2021, 10, 1, 10),
        rainyPercent: 0),
    Weather(
        temp: 18,
        description: '雨',
        time: DateTime(2021, 10, 1, 11),
        rainyPercent: 90),
    Weather(
        temp: 17,
        description: '曇り',
        time: DateTime(2021, 10, 1, 12),
        rainyPercent: 10),
    Weather(
        temp: 15,
        description: '晴れ',
        time: DateTime(2021, 10, 1, 13),
        rainyPercent: 0),
    Weather(
        temp: 20,
        description: '晴れ',
        time: DateTime(2021, 10, 1, 10),
        rainyPercent: 0),
    Weather(
        temp: 18,
        description: '雨',
        time: DateTime(2021, 10, 1, 11),
        rainyPercent: 90),
    Weather(
        temp: 17,
        description: '曇り',
        time: DateTime(2021, 10, 1, 12),
        rainyPercent: 10),
    Weather(
        temp: 15,
        description: '晴れ',
        time: DateTime(2021, 10, 1, 13),
        rainyPercent: 0),
  ];
  List<Weather> dairyWeather = [
    Weather(
        tempMax: 28, tempMin: 18, rainyPercent: 0, time: DateTime(2021, 10, 1)),
    Weather(
        tempMax: 18, tempMin: 26, rainyPercent: 0, time: DateTime(2021, 10, 2)),
    Weather(
        tempMax: 26, tempMin: 20, rainyPercent: 0, time: DateTime(2021, 10, 3)),
    Weather(
        tempMax: 28, tempMin: 18, rainyPercent: 0, time: DateTime(2021, 10, 1)),
    Weather(
        tempMax: 18, tempMin: 26, rainyPercent: 0, time: DateTime(2021, 10, 2)),
    Weather(
        tempMax: 26, tempMin: 20, rainyPercent: 0, time: DateTime(2021, 10, 3)),
    Weather(
        tempMax: 28, tempMin: 18, rainyPercent: 0, time: DateTime(2021, 10, 1)),
    Weather(
        tempMax: 18, tempMin: 26, rainyPercent: 0, time: DateTime(2021, 10, 2)),
    Weather(
        tempMax: 26, tempMin: 20, rainyPercent: 0, time: DateTime(2021, 10, 3)),
  ];
  List<String> weekDay = ["月", "火", "水", "木", "金", "土", "日"];

  @override
  Widget build(BuildContext context) {
    //SafeArea　スマホ画面の最上ヘッダーより下に表示
    return Scaffold(
      body: SafeArea(
        child: Column(
          //Columnの性質：要素の最大幅に対しての中央配置
          children: [
            Container(
              width: 200,
              child: TextField(
                onSubmitted: (value) {
                  print(value);
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(hintText: '郵便番号を入力'),
              ),
            ),
            const SizedBox(height: 50),
            const Text(
              '大阪市',
              style: TextStyle(fontSize: 25),
            ),
            Text('${currentWeather.description}'), //'${変数名}'の形で文字列化
            Text('${currentWeather.temp}°',
                style: const TextStyle(fontSize: 80)),
            Row(
              //横いっぱいに配置（divみたい）縦に対して中央配置
              mainAxisAlignment: MainAxisAlignment.center, //要素の中央配置
              children: [
                Padding(
                  //alt+Enter 余白
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Text('最高: ${currentWeather.tempMax}°'),
                ),
                Text('最低: ${currentWeather.tempMin}°'),
              ],
            ),

            const SizedBox(height: 50),
            const Divider(
              height: 8,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                  children: hourlyWeather.map((weather) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 8.0),
                  child: Column(
                    children: [
                      Text('${DateFormat('H').format(weather.time)}時',
                          style: const TextStyle(color: Colors.lightBlue)),
                      Text('${weather.rainyPercent}%'),
                      const Icon(Icons.wb_sunny_sharp),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          '${weather.temp}',
                          style: const TextStyle(fontSize: 10),
                        ),
                      )
                    ],
                  ),
                );
              }).toList()),
            ),
            const Divider(
              height: 8,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    children: dairyWeather.map((weather) {
                      return Container(
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                width: 50,
                                child: Text(
                                    weekDay[weather.time.weekday - 1] + "曜日")),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Row(
                                children: [
                                  const Icon(Icons.wb_sunny_sharp),
                                  Text(
                                    '${weather.rainyPercent}%',
                                    style: const TextStyle(
                                        color: Colors.lightBlueAccent),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 50,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('${weather.tempMax}',
                                      style: const TextStyle(fontSize: 16)),
                                  Text('${weather.tempMin}',
                                      style: const TextStyle(fontSize: 16))
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
