// lib/src/endpoints/user_context_endpoint.dart
import 'package:serverpod/serverpod.dart';

import '../../generated/protocol.dart';
import '../shared/auth_context_mixin.dart';

// Определим роли в виде enum для удобства
enum UserRole { superAdmin, clientAdmin, unauthorized }

class UserContextEndpoint extends Endpoint with AuthContextMixin {
  static const List<int> _superAdminUserIds = [1]; // ⚠️ ЗАМЕНИТЕ НА ВАШ ID

  Future<UserRole> getMyRole(Session session) async {
    final authContext = await getAuthenticatedUserContext(session);
    final userId = authContext.userId;
    if (_superAdminUserIds.contains(userId)) {
      return UserRole.superAdmin;
    }
    // Если не супер-админ, проверяем, является ли он админом клиента
    // (можно добавить более сложную проверку на наличие прав, если нужно)
    final customerUser = await CustomerUser.db.findFirstRow(session, where: (cu) => cu.userId.equals(userId));
    if (customerUser != null) {
      return UserRole.clientAdmin;
    }
    return UserRole.unauthorized;
  }
}