import 'dart:convert';
import 'package:http/http.dart' as http;

class SpotifyService {
  final String clientId;
  final String clientSecret;
  final String refreshToken; // Hardcoded refresh token

  late String accessToken;

  // Constructor
  SpotifyService(this.clientId, this.clientSecret, this.refreshToken);

  // Authenticate using the refresh token
  Future<void> authenticate() async {
    final response = await http.post(
      Uri.parse('https://accounts.spotify.com/api/token'),
      headers: {
        'Authorization': 'Basic ' +
            base64Encode(utf8.encode('$clientId:$clientSecret')),
      },
      body: {
        'grant_type': 'refresh_token',
        'refresh_token': refreshToken,
      },
    );

    final responseBody = json.decode(response.body);
    accessToken = responseBody['access_token'];
  }

// Other functions as before...
}
