import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../models/prediction.dart';

class PawRecognitionService {
  static const String baseUrl =
      'https://paw-recognition-c6208b7f2ea2.herokuapp.com';
  static const String apiKey = '3omOG2IlyO1LYO8PLXNoXXYv7zsx-CtK3rVau1DvcMM';

  Future<PredictionResponse> predictPawBreed(File imageFile) async {
    try {
      // Read image file and convert to base64
      final bytes = await imageFile.readAsBytes();
      final base64Image = base64Encode(bytes);
      
      // Determine image format
      final extension = imageFile.path.split('.').last.toLowerCase();
      String mimeType = 'image/jpeg';
      if (extension == 'png') {
        mimeType = 'image/png';
      } else if (extension == 'gif') {
        mimeType = 'image/gif';
      } else if (extension == 'webp') {
        mimeType = 'image/webp';
      }

      // Create data URI
      final dataUri = 'data:$mimeType;base64,$base64Image';

      // Make API request
      final response = await http.post(
        Uri.parse('$baseUrl/predict'),
        headers: {
          'Content-Type': 'application/json',
          'X-API-Key': apiKey,
        },
        body: jsonEncode({
          'image': dataUri,
        }),
      );

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
        return PredictionResponse.fromJson(jsonResponse);
      } else if (response.statusCode == 401) {
        throw Exception('Unauthorized: Invalid API key');
      } else if (response.statusCode == 429) {
        throw Exception('Rate limit exceeded. Please try again later.');
      } else if (response.statusCode == 400) {
        throw Exception('Invalid image. Please try another image.');
      } else {
        throw Exception('Failed to get prediction: ${response.statusCode}');
      }
    } catch (e) {
      if (e is Exception) {
        rethrow;
      }
      throw Exception('Error processing image: $e');
    }
  }

  Future<bool> checkHealth() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }
}
