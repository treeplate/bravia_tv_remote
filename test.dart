import 'dart:convert';
import 'dart:io';

void main() async {
  HttpClient client = HttpClient();
  HttpClientRequest request = await client.postUrl(
    Uri.http('tv', 'sony/guide'),
  );
  request.add(
    '''{
"method": "getSystemInformation",
"id": 33,
"params": [],
"version": "1.0"
}'''
        .codeUnits,
  );
  print((await (await request.close()).toList()).map((e) => utf8.decode(e)));
}
