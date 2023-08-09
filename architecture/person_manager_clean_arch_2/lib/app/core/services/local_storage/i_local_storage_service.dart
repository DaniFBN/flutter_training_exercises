import 'helpers/params.dart';

abstract interface class ILocalStorageService {
  Future<Map<String, dynamic>> write(WriteLocalStorageParam param);
  Future<List<Map<String, dynamic>>> read(String table);
  Future<Map<String, dynamic>?> retrieve(String table, String id);
}
