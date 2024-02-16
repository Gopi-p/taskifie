// ignore_for_file: avoid_print

class GeneralService {
  // late BuildContext _context;
  // final FToast _fToast = FToast();

  // BuildContext get context => _context;
  // FToast get fToast => _fToast;

  // late final GraphQLClient qlClient;

  // /// This shouldn't be called if user is not logged in.
  // /// So make sure this function is called in proper workflow.
  // /// Use @StartUpService.o.initAppAfterAuth() for proper flow.
  // Future<void> configGraphQLClient() async {
  //   try {
  //     final HttpLink httpLink = HttpLink(Env.graphQlEndPoint);

  //     final AuthLink authLink = AuthLink(
  //       getToken: () async =>
  //           'Bearer ${await FirebaseAuth.instance.currentUser!.getIdToken()}',
  //     );

  //     final Link link = authLink.concat(httpLink);

  //     qlClient = GraphQLClient(
  //       link: link,
  //       cache: GraphQLCache(),
  //       defaultPolicies: DefaultPolicies(
  //         query: Policies(
  //           fetch: FetchPolicy.networkOnly,
  //         ),
  //         mutate: Policies(
  //           fetch: FetchPolicy.networkOnly,
  //         ),
  //       ),
  //     );
  //   } catch (e) {
  //     print('configGraphQLClient [ERR] : $e');
  //   }
  // }

  // void setInitialContext(BuildContext ctx) {
  //   _context = ctx;
  //   _fToast.init(context);
  // }

  GeneralService._();
  static final GeneralService _o = GeneralService._();
  static GeneralService get o => _o;
}
