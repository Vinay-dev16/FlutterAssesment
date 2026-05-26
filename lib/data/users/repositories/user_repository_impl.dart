import '../../../domain/users/entities/user_list_item.dart';
import '../../../domain/users/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  static const int pageSize = 11;

  final List<UserListItem> _allUsers = List.generate(
    30,
    (index) {
      final id = index + 1;
      return UserListItem(
        id: id,
        email: 'user$id@example.com',
        firstName: 'First$id',
        lastName: 'Last$id',
        avatar:
            'https://ui-avatars.com/api/?name=First$id+Last$id&background=random',
      );
    },
  );

  UserRepositoryImpl();

  @override
  Future<List<UserListItem>> getUsers({required int page}) async {
    await Future.delayed(const Duration(milliseconds: 500));

    final startIndex = (page - 1) * pageSize;
    if (startIndex >= _allUsers.length) {
      return <UserListItem>[];
    }

    final endIndex = (startIndex + pageSize).clamp(0, _allUsers.length);
    return _allUsers.sublist(startIndex, endIndex);
  }
}
