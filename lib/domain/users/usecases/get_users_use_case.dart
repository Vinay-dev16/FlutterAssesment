import '../entities/user_list_item.dart';
import '../repositories/user_repository.dart';

class GetUsersUseCase {
  final UserRepository repository;

  GetUsersUseCase(this.repository);

  Future<List<UserListItem>> call(int page) {
    return repository.getUsers(page: page);
  }
}
