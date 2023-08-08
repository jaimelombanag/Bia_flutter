import 'dart:async';
import 'dart:io';

import 'package:bia_energy_prueba/src/models/characters/response_character.model.dart';
import '../../core/constants.dart';
import '../../services/logger/bia_logger.dart';
import '../base/service_base.api.dart';

class ApiCharacters extends BaseService {
  ApiCharacters();
  String message = '';
  Future<ResponseCharacters?> getCharacters() async {
    Future<ResponseCharacters?> callApiCharacters() async {
      final response = await get(
          '${Constants.urlBase}${Constants.characters}?ts=${Constants.timeStamp}&apikey=${Constants.apikey_public}&hash=${Constants.hash}',
          '',
          60);
      if (response.statusCode == HttpStatus.ok) {
      } else {}
    }

    try {
      return await callApiCharacters();
    } on SocketException {
      BiaEnergyLogger.error('ApiParametria',
          'Error de conectividad, por favor verificá tu conexión!');
    } on TimeoutException {
      BiaEnergyLogger.error('ApiParametria', 'Error de conectividad, TO.');
    } catch (e) {
      BiaEnergyLogger.error('ApiParametria', 'Error $e');
    }
  }
}
