import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:bia_energy_prueba/src/models/characters/response_character.model.dart';
import 'package:bia_energy_prueba/src/models/characters/result.model.dart';
import '../../core/constants.dart';
import '../../services/logger/bia_logger.dart';
import '../base/service_base.api.dart';

class ApiCharacters extends BaseService {
  ApiCharacters();
  String message = '';
  Future<List<Result>> getCharacters() async {
    Future<List<Result>> callApiCharacters() async {
      final response = await get(
          '${Constants.urlBase}${Constants.characters}?ts=${Constants.timeStamp}&limit=${Constants.limit}&apikey=${Constants.apikey_public}&hash=${Constants.hash}',
          '',
          60);
      if (response.statusCode == HttpStatus.ok) {
        var rtaApi = ResponseCharacters.fromJson(json.decode(response.body));
        return rtaApi.data.results;
      } else {
        return [];
      }
    }

    try {
      return await callApiCharacters();
    } on SocketException {
      BiaEnergyLogger.error('ApiCharacters',
          'Error de conectividad, por favor verificá tu conexión!');
      return [];
    } on TimeoutException {
      BiaEnergyLogger.error('ApiCharacters', 'Error de conectividad, TO.');
      return [];
    } catch (e) {
      BiaEnergyLogger.error('ApiCharacters', 'Error $e');
      return [];
    }
  }
}
