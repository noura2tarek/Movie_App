import 'package:movie_app/core/network/error_message_model.dart';

//Exception occurred when data server is down or has a problem with data we send
class ServerException implements Exception{

  final ErrorMessageModel errorMessageModel;
  const ServerException({required this.errorMessageModel});



}

// If we deal with local database, we will make its exception
class LocalDatabaseException implements Exception{

  final String message;
  const LocalDatabaseException({required this.message});

}
