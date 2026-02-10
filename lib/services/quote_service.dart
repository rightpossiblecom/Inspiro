import 'dart:math';
import '../models/quote.dart';
import '../data/quotes_data.dart';

class QuoteService {
  static final Random _random = Random();

  static Quote getRandomQuote() {
    return QuotesData.quotes[_random.nextInt(QuotesData.quotes.length)];
  }

  // Future feature: Get valid quote for a specific day
  // static Quote getDailyQuote() {
  //   // Logic to seed random with today's date
  // }
}
