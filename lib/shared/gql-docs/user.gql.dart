import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:taskifie/shared/interfaces/user.interface.dart';

QueryOptions fetchUserDetailsGQL({
  List<String>? userIds,
  List<String>? emails,
}) {
  return QueryOptions(
    document: gql(
      """ 
      query GetUser(\$userIds: [String], \$emails: [String]) {
        getUser(userIds: \$userIds, emails: \$emails) {
          payload {
            userId
            userDetails {
              data {
                firstName
                lastName
                designation
                department
                city
                state
                country
                mobileNumber
                zipCode
                email
              }
              metadata {
                modifiedBy
                modifiedStatus
                modifiedAt
              }
            }
            onBoardingDetails {
              isUserAddedFromSignUp
              isSignedUpAtLeastOnce
              isPublic
              onBoardingStatus
              onBoardingStepIndex
              agreementStatus
              createdAt
              createdBy
            }
            appDetails {
              swift {
                isUsedAtLeastOnce
              }
              surge {
                isUsedAtLeastOnce
              }
              zonebooks {
                isUsedAtLeastOnce
              }
              zoneSuite {
                isUsedAtLeastOnce
              }
              minutes {
                isUsedAtLeastOnce
              }
              insights {
                isUsedAtLeastOnce
              }
            }
            files {
              avatar
            }
            emailConfiguration {
              configurationType
              incomingMailServer {
                port
                server
                emailAddress
                password
                userName
              }
              outgoingMailServer {
                port
                server
                emailAddress
                password
                userName
              }
              sharing_type
              userAcceptsUntrustedCertificates
            }
          }
          status
          msg
          resKey
        }
      }
      """,
    ),
    variables: {
      "userIds": userIds,
      "emails": emails,
    },
  );
}

MutationOptions updateUserDetailsGQL({
  required String userId,
  required UserDetails input,
}) {
  return MutationOptions(
    document: gql(
      """ 
      query GetUser(\$userIds: [String], \$emails: [String]) {
        getUser(userIds: \$userIds, emails: \$emails) {
          payload {
            userId
            userDetails {
            }
          }
          status
          msg
          resKey
        }
      }
      """,
    ),
    variables: {
      "userId": userId,
      "input": input,
    },
  );
}
