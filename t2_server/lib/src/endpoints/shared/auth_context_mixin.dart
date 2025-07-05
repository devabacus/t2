import 'package:serverpod/serverpod.dart';
import '../../generated/protocol.dart';

mixin AuthContextMixin on Endpoint {
  Future<({int userId, UuidValue customerId})> getAuthenticatedUserContext(
    Session session,
  ) async {
    final authInfo = await session.authenticated;
    final userId = authInfo?.userId;

    if (userId == null) {
      throw Exception('Пользователь не авторизован.');
    }

    final customerUser = await CustomerUser.db.findFirstRow(
      session,
      where: (cu) => cu.userId.equals(userId),
    );

    if (customerUser == null) {
      session.log(
        '⚠️ ЗАГЛУШКА: User $userId не привязан к customer. Возвращаем тестовые данные.',
      );
      return (
        userId: userId,
        customerId: UuidValue.fromString('00000000-0000-0000-0000-000000000001'),
      );
    }

    return (
      userId: userId,
      customerId: customerUser.customerId,
    );
  }
}