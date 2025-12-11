class Prediction {
  final String label;
  final double confidence;

  Prediction({
    required this.label,
    required this.confidence,
  });

  factory Prediction.fromJson(Map<String, dynamic> json) {
    return Prediction(
      label: json['label'] as String,
      confidence: (json['confidence'] as num).toDouble(),
    );
  }

  String get formattedLabel {
    // Convert "golden-retriever" to "Golden Retriever"
    return label
        .split('-')
        .map((word) => word[0].toUpperCase() + word.substring(1))
        .join(' ');
  }

  String get confidencePercentage {
    return '${(confidence * 100).toStringAsFixed(1)}%';
  }
}

class PredictionResponse {
  final List<Prediction> predictions;

  PredictionResponse({required this.predictions});

  factory PredictionResponse.fromJson(Map<String, dynamic> json) {
    return PredictionResponse(
      predictions: (json['predictions'] as List)
          .map((p) => Prediction.fromJson(p as Map<String, dynamic>))
          .toList(),
    );
  }
}
