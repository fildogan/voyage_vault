import 'package:injectable/injectable.dart';
import 'package:voyage_vault/data/data_sources/remote_data_sources/quotes_remote_data_source.dart';
import 'package:voyage_vault/domain/models/quote_model.dart';

@injectable
class QuotesRepository {
  QuotesRepository({required this.remoteDataSource});

  final QuotesRemoteRetroFitDataSource remoteDataSource;

  Future<List<QuoteModel>> getQuoteModels() async {
    return remoteDataSource.getQuotes();
  }
}
