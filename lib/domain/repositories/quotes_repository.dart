import 'package:injectable/injectable.dart';
import 'package:voyage_vault/data/data_sources/remote_data_sources/quotes_remote_data_source.dart';
import 'package:voyage_vault/domain/models/quote_model.dart';

@injectable
class QuotesRepository {
  QuotesRepository({required this.remoteDataSource});

  final QuotesRemoteDioDataSource remoteDataSource;

  Future<List<QuoteModel>> getQuoteModels() async {
    final json = await remoteDataSource.getQuotes();
    if (json == null) {
      return [];
    }
    return json.map((item) => QuoteModel.fromJson(item)).toList();
  }
}
