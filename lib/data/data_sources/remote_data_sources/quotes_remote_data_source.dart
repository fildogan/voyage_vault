import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:voyage_vault/domain/models/quote_model.dart';

part 'quotes_remote_data_source.g.dart';

@injectable
@RestApi()
abstract class QuotesRemoteRetroFitDataSource {
  @factoryMethod
  factory QuotesRemoteRetroFitDataSource(Dio dio) =
      _QuotesRemoteRetroFitDataSource;

  @GET('/quotes')
  Future<List<QuoteModel>> getQuotes();
}

// class QuotesRemoteDioDataSource {
//   Future<List<Map<String, dynamic>>?> getQuotes() async {
//     final response = await Dio().get<List<dynamic>>(
//         'https://my-json-server.typicode.com/fildogan/json-demo/quotes');
//     final listDynamic = response.data;
//     if (listDynamic == null) {
//       return null;
//     }
//     return listDynamic.map((e) => e as Map<String, dynamic>).toList();
//   }
// }
