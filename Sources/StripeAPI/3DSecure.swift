
/// Initiate 3D Secure authentication.
public struct Post3dSecure: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = ThreeDSecure
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v1/3d_secure"
	}

	public class FormInput: Codable {
		/// Amount of the charge that you will create when authentication completes.
		public var amount: Int
		/// The ID of a card token, or the ID of a card belonging to the given customer.
		public var card: String?
		/// Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
		public var currency: String
		/// The customer associated with this 3D secure authentication.
		public var customer: String?
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?
		/// The URL that the cardholder's browser will be returned to when authentication completes.
		public var return_url: String

		public init(amount: Int, currency: String, return_url: String, card: String? = nil, customer: String? = nil, expand: [String]? = nil) {
			self.amount = amount
			self.currency = currency
			self.return_url = return_url
			self.card = card
			self.customer = customer
			self.expand = expand
		}
	}

}

/// Retrieves a 3D Secure object.
public struct Get3dSecureThreeDSecure: StripeAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = ThreeDSecure
	public typealias paramType = Params
	public struct Params {
		let three_d_secure: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/3d_secure/\(inputs.three_d_secure)"
	}
	public static var method: HTTPMethod { return .GET }

}
