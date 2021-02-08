
/// Returns a list of SetupAttempts associated with a provided SetupIntent.
public struct GetSetupAttempts: StripeAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = PaymentFlowsSetupIntentSetupAttemptList
	public typealias paramType = Params
	public struct Params {
		let limit: Int
		let ending_before: String
		let setup_intent: String
		let starting_after: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/setup_attempts?ending_before=\(inputs.ending_before.urlEncoded))&starting_after=\(inputs.starting_after.urlEncoded))&setup_intent=\(inputs.setup_intent.urlEncoded))&limit=\(inputs.limit.urlEncoded))"
	}
	public static var method: HTTPMethod { return .GET }

	public class PaymentFlowsSetupIntentSetupAttemptList: Codable {
		public var data: [SetupAttempt]
		/// True if this list has another page of items after this one that can be fetched.
		public var has_more: Bool
		/// String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
		public var object: ObjectValues
		/// The URL where this list can be accessed.
		public var url: String

		public init(data: [SetupAttempt], has_more: Bool, object: ObjectValues, url: String) {
			self.data = data
			self.has_more = has_more
			self.object = object
			self.url = url
		}

		public enum ObjectValues: String, Codable {
			case list = "list"
		}
	}

}
