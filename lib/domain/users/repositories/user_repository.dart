import '../entities/user_list_item.dart';

abstract class UserRepository {
  Future<List<UserListItem>> getUsers({required int page});
}
