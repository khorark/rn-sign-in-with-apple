import Foundation
import AuthenticationServices

@objc(RnSignInWithApple)
class RnSignInWithApple: NSObject {
  private var promiseResolve: RCTPromiseResolveBlock?
  private var promiseReject: RCTPromiseRejectBlock?
  private var defaultError = NSError(domain: "", code: 200, userInfo: nil)

  @objc
  func login(
    _ resolve: @escaping RCTPromiseResolveBlock,
    rejecter reject: @escaping RCTPromiseRejectBlock
  ) -> Void {
    if #available(iOS 13.0, *) {
      let appleIDProvider = ASAuthorizationAppleIDProvider()
      let request = appleIDProvider.createRequest()

      self.promiseResolve = resolve
      self.promiseReject = reject

      request.requestedScopes = [.fullName, .email]

      let authorizationController = ASAuthorizationController(authorizationRequests: [request])

      authorizationController.delegate = self

      authorizationController.performRequests()
    } else {
      reject("Error", "Can't login with apple", defaultError)
    }
  }
}

@available(iOS 13.0, *)
extension RnSignInWithApple: ASAuthorizationControllerDelegate {
  func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
    if let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential {
      if (self.promiseResolve != nil) {
        struct Payload: Codable {
          var fullName: String
          var email: String? = ""
          var user: String
          var identityToken: String
          var authorizationCode: String
          var state: String
        }

        let encoding = String.Encoding.utf8

        let data = Payload(
          fullName: appleIDCredential.fullName != nil ? String(describing: appleIDCredential.fullName!) : "",
          email: appleIDCredential.email,
          user: appleIDCredential.user,
          identityToken: appleIDCredential.identityToken != nil ? String(data: appleIDCredential.identityToken!, encoding: encoding)! : "",
          authorizationCode: appleIDCredential.authorizationCode != nil ? String(data: appleIDCredential.authorizationCode!, encoding: encoding)! : "",
          state: appleIDCredential.state ?? ""
        )

        let jsonEncoder = JSONEncoder()
        let jsonData = try! jsonEncoder.encode(data)
        let payload = String(data: jsonData, encoding: encoding)

        self.promiseResolve!(payload)
      }
    } else {
      self.promiseReject!("Error", "Can't login with apple", self.defaultError)
    }
  }

  @available(iOS 13.0, *)
  func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
    if (self.promiseReject != nil) {
        self.promiseReject!("Error", "Can't login with apple", error)
    }
  }
}
