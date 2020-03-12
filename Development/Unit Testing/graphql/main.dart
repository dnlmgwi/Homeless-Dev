import 'package:graphql/services/userrepo.dart';

void main() {

  UserRepo userRepo = UserRepo();

  userRepo.auth(user: 'admin',password: 'admin2');

   

// String token = '0ceb3d893ccd3b323855ef7810dad6';

//   final HttpLink httpLink = HttpLink(
//     uri: '/api/graphql/query?token=$token',
//   );

//   final Link link = authLink.concat(httpLink);

//   ValueNotifier<GraphQLClient> client = ValueNotifier(
//     GraphQLClient(
//       cache: InMemoryCache(),
//       link: link,
//     ),
//   );

}