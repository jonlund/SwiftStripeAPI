
/// Creates a short-lived API key for a given resource.
public struct PostEphemeralKeys: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = EphemeralKey
	public typealias paramType = AnyCodable
	public static func endpoint(for inputs: AnyCodable) throws -> String {
		return "/v1/ephemeral_keys"
	}

	public final class FormInput: Codable {
		/// The ID of the Customer you'd like to modify using the resulting ephemeral key.
		public var customer: String?
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?
		/// The ID of the Issuing Card you'd like to access using the resulting ephemeral key.
		public var issuing_card: String?

		public init(customer: String? = nil, expand: [String]? = nil, issuing_card: String? = nil) {
			self.customer = customer
			self.expand = expand
			self.issuing_card = issuing_card
		}
	}

}

/// Invalidates a short-lived API key for a given resource.
public struct DeleteEphemeralKeysKey: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = EphemeralKey
	public typealias paramType = Params
	
	public struct Params {
		let key: String

		/// Initialize the request parameters
		/// - Parameter key: 
		public init(key: String) {
			self.key = key
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/ephemeral_keys/\(inputs.key)"
	}
	public static var method: HTTPMethod { return .DELETE }

	public final class FormInput: Codable {
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?

		public init(expand: [String]? = nil) {
			self.expand = expand
		}
	}

}
