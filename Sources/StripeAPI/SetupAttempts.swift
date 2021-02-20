
/// Returns a list of SetupAttempts associated with a provided SetupIntent.
public struct GetSetupAttempts: StripeAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = PaymentFlowsSetupIntentSetupAttemptList
	public typealias paramType = Params
	public struct Params {
		let ending_before: String
		let limit: Int
		let setup_intent: String
		let starting_after: String

		public init(ending_before: String, limit: Int, setup_intent: String, starting_after: String) {
			self.ending_before = ending_before
			self.limit = limit
			self.setup_intent = setup_intent
			self.starting_after = starting_after
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/setup_attempts?ending_before=\(inputs.ending_before.urlEncoded))&limit=\(inputs.limit.urlEncoded))&setup_intent=\(inputs.setup_intent.urlEncoded))&starting_after=\(inputs.starting_after.urlEncoded))"
	}
	public static var method: HTTPMethod { return .GET }

	public final class PaymentFlowsSetupIntentSetupAttemptList: Codable {
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
