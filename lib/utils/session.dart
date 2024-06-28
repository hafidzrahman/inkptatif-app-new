import 'dart:convert';

import 'package:http/http.dart' as http;

class Session {
  Map<String, String> headers = {
    'Content-Type': 'application/json',
  };

  Future<Map> get(Uri url) async {
    http.Response response = await http.get(url, headers: headers).timeout(
      const Duration(seconds: 5),
      onTimeout: () {
        return http.Response("Something went Wrong", 405);
      },
    );

    final result = jsonDecode(response.body);
    // updateCookie(response); perlukah get memanggil fungsi updateCookie?
    return result[0] ?? result; // coba pakai json.decode kalau memang error
  }

  Future<List<dynamic>> getArray(Uri url) async {
    http.Response response = await http.get(url, headers: headers).timeout(
      const Duration(seconds: 5),
      onTimeout: () {
        return http.Response("Something went Wrong", 405);
      },
    );

    final result = jsonDecode(response.body).toList();
    // updateCookie(response); perlukah get memanggil fungsi updateCookie?
    return result; // coba pakai json.decode kalau memang error
  }

  Future<Map> post(Uri url, dynamic data) async {
    http.Response response = await http
        .post(
      url,
      headers: headers,
      body: jsonEncode(data),
    )
        .timeout(
      const Duration(seconds: 5),
      onTimeout: () {
        return http.Response('Something went Wrong.', 405);
      },
    );
    updateCookie(response);
    print(headers);
    final result = jsonDecode(response.body);
    return result[0] ?? result;
  }

  void updateCookie(http.Response response) {
    final result = jsonDecode(response.body);
    final String? rawCookie = 'Bearer ${result['token']}'; // coba print out dulu outputnya
    if (rawCookie != null) {
      int index = rawCookie
          .indexOf(';'); // tergantung format header yang dikirim oleh server
      headers['Authorization'] =
          (index == -1) ? rawCookie : rawCookie.substring(0, index);
    }
  }
}

final Session session = Session();
