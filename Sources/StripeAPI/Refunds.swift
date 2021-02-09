
/// Returns a list of all refunds you’ve previously created. The refunds are returned in sorted order, with the most recent refunds appearing first. For convenience, the 10 most recent refunds are always available by default on the charge object.
public struct GetRefunds: StripeAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = Output
	public typealias paramType = Params
	public struct Params {
		let charge: String
		let ending_before: String
		let limit: Int
		let payment_intent: String
		let starting_after: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/refunds?charge=\(inputs.charge.urlEncoded))&ending_before=\(inputs.ending_before.urlEncoded))&limit=\(inputs.limit.urlEncoded))&payment_intent=\(inputs.payment_intent.urlEncoded))&starting_after=\(inputs.starting_after.urlEncoded))"
	}
	public static var method: HTTPMethod { return .GET }

	public class Output: Codable {
		public var data: [Refund]
		/// True if this list has another page of items after this one that can be fetched.
		public var has_more: Bool
		/// String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
		public var object: ObjectValues
		/// The URL where this list can be accessed.
		public var url: String

		public init(data: [Refund], has_more: Bool, object: ObjectValues, url: String) {
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

/// Create a refund.
public struct PostRefunds: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = Refund
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v1/refunds"
	}

	public class FormInput: Codable {
		public var amount: Int?
		public var charge: String?
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?
		/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
		public var metadata: MESSED_UP?
		public var payment_intent: String?
		public var reason: ReasonValues?
		public var refund_application_fee: Bool?
		public var reverse_transfer: Bool?

		public init(amount: Int? = nil, charge: String? = nil, expand: [String]? = nil, metadata: MESSED_UP? = nil, payment_intent: String? = nil, reason: ReasonValues? = nil, refund_application_fee: Bool? = nil, reverse_transfer: Bool? = nil) {
			self.amount = amount
			self.charge = charge
			self.expand = expand
			self.metadata = metadata
			self.payment_intent = payment_intent
			self.reason = reason
			self.refund_application_fee = refund_application_fee
			self.reverse_transfer = reverse_transfer
		}

		public enum ReasonValues: String, Codable {
			case duplicate = "duplicate"
			case fraudulent = "fraudulent"
			case requestedByCustomer = "requested_by_customer"
		}
	}

}

/// Retrieves the details of an existing refund.
public struct GetRefundsRefund: StripeAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = Refund
	public typealias paramType = Params
	public struct Params {
		let refund: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/refunds/\(inputs.refund)"
	}
	public static var method: HTTPMethod { return .GET }

}

/// Updates the specified refund by setting the values of the parameters passed. Any parameters not provided will be left unchanged.  This request only accepts <code>metadata</code> as an argument.
public struct PostRefundsRefund: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = Refund
	public typealias paramType = Params
	public struct Params {
		let refund: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/refunds/\(inputs.refund)"
	}

	public class FormInput: Codable {
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?
		/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
		public var metadata: MESSED_UP?

		public init(expand: [String]? = nil, metadata: MESSED_UP? = nil) {
			self.expand = expand
			self.metadata = metadata
		}
	}

}
