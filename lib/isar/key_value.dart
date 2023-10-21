// import 'package:depths/depths.dart';
// import 'package:isar/isar.dart';
//
// part 'key_value.g.dart';

// @collection
// class DepthsKeyValue {
//   @Id()
//   final String key;
//   final dynamic value;
//
//   DepthsKeyValue({required this.key, required this.value});
//
//   static void put(DepthsKeyValue keyValue) {
//     DepthsInjection.isar.write((i) {
//       i.depthsKeyValues.put(keyValue);
//     });
//   }
//
//   static DepthsKeyValue? get(String key) {
//     return DepthsInjection.isar.read((i) => i.depthsKeyValues.get(key));
//   }
//
//   static void delete(String key) {
//     DepthsInjection.isar.write((i) {
//       i.depthsKeyValues.delete(key);
//     });
//   }
//
//   static void clear() {
//     DepthsInjection.isar.write((i) {
//       i.depthsKeyValues.clear();
//     });
//   }
// }
