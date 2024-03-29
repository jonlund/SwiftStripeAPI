
/// Returns a list of all refunds you’ve previously created. The refunds are returned in sorted order, with the most recent refunds appearing first. For convenience, the 10 most recent refunds are always available by default on the charge object.
public struct GetRefunds: StripeAPIEndpoint {
	public typealias inputType = AnyCodable
	public typealias outputType = Output
	public typealias paramType = Params
	
	public struct Params {
		let charge: String?
		let ending_before: String?
		let limit: Int?
		let payment_intent: String?
		let starting_after: String?

		/// Initialize the request parameters
		/// - Parameter charge: Only return refunds for the charge specified by this charge ID.
		/// - Parameter ending_before: A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list.
		/// - Parameter limit: A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10.
		/// - Parameter payment_intent: Only return refunds for the PaymentIntent specified by this ID.
		/// - Parameter starting_after: A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list.
		public init(charge: String? = nil, ending_before: String? = nil, limit: Int? = nil, payment_intent: String? = nil, starting_after: String? = nil) {
			self.charge = charge
			self.ending_before = ending_before
			self.limit = limit
			self.payment_intent = payment_intent
			self.starting_after = starting_after
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		var params = [String]()
		if let a = inputs.charge?.urlEncoded { params.append("charge=\(a)") }
		if let a = inputs.ending_before?.urlEncoded { params.append("ending_before=\(a)") }
		if let a = inputs.limit?.urlEncoded { params.append("limit=\(a)") }
		if let a = inputs.payment_intent?.urlEncoded { params.append("payment_intent=\(a)") }
		if let a = inputs.starting_after?.urlEncoded { params.append("starting_after=\(a)") }
		let query = params.joined(separator: "&")
		return "/v1/refunds?\(query)"
	}
	public static var method: HTTPMethod { return .GET }

	public final class Output: Codable {
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
	public typealias paramType = AnyCodable
	public static func endpoint(for inputs: AnyCodable) throws -> String {
		return "/v1/refunds"
	}

	public final class FormInput: Codable {
		public var amount: Int?
		public var charge: String?
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?
		/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
		public var metadata: AnyCodable?
		public var payment_intent: String?
		public var reason: ReasonValues?
		public var refund_application_fee: Bool?
		public var reverse_transfer: Bool?

		public init(amount: Int? = nil, charge: String? = nil, expand: [String]? = nil, metadata: AnyCodable? = nil, payment_intent: String? = nil, reason: ReasonValues? = nil, refund_application_fee: Bool? = nil, reverse_transfer: Bool? = nil) {
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
	public typealias inputType = AnyCodable
	public typealias outputType = Refund
	public typealias paramType = Params
	
	public struct Params {
		let refund: String

		/// Initialize the request parameters
		/// - Parameter refund: 
		public init(refund: String) {
			self.refund = refund
		}
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

		/// Initialize the request parameters
		/// - Parameter refund: 
		public init(refund: String) {
			self.refund = refund
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/refunds/\(inputs.refund)"
	}

	public final class FormInput: Codable {
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?
		/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
		public var metadata: AnyCodable?

		public init(expand: [String]? = nil, metadata: AnyCodable? = nil) {
			self.expand = expand
			self.metadata = metadata
		}
	}

}
