
/// Returns a list of application fees you’ve previously collected. The application fees are returned in sorted order, with the most recent fees appearing first.
public struct GetApplicationFees: StripeAPIEndpoint {
	public typealias inputType = AnyCodable
	public typealias outputType = Output
	public typealias paramType = Params
	
	public struct Params {
		let charge: String?
		let ending_before: String?
		let limit: Int?
		let starting_after: String?

		/// Initialize the request parameters
		/// - Parameter charge: Only return application fees for the charge specified by this charge ID.
		/// - Parameter ending_before: A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list.
		/// - Parameter limit: A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10.
		/// - Parameter starting_after: A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list.
		public init(charge: String? = nil, ending_before: String? = nil, limit: Int? = nil, starting_after: String? = nil) {
			self.charge = charge
			self.ending_before = ending_before
			self.limit = limit
			self.starting_after = starting_after
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		var params = [String]()
		if let a = inputs.charge?.urlEncoded { params.append("charge=\(a)") }
		if let a = inputs.ending_before?.urlEncoded { params.append("ending_before=\(a)") }
		if let a = inputs.limit?.urlEncoded { params.append("limit=\(a)") }
		if let a = inputs.starting_after?.urlEncoded { params.append("starting_after=\(a)") }
		let query = params.joined(separator: "&")
		return "/v1/application_fees?\(query)"
	}
	public static var method: HTTPMethod { return .GET }

	public final class Output: Codable {
		public var data: [ApplicationFee]
		/// True if this list has another page of items after this one that can be fetched.
		public var has_more: Bool
		/// String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
		public var object: ObjectValues
		/// The URL where this list can be accessed.
		public var url: String

		public init(data: [ApplicationFee], has_more: Bool, object: ObjectValues, url: String) {
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

/// By default, you can see the 10 most recent refunds stored directly on the application fee object, but you can also retrieve details about a specific refund stored on the application fee.
public struct GetApplicationFeesFeeRefundsId: StripeAPIEndpoint {
	public typealias inputType = AnyCodable
	public typealias outputType = FeeRefund
	public typealias paramType = Params
	
	public struct Params {
		let fee: String
		let id: String

		/// Initialize the request parameters
		/// - Parameter fee: 
		/// - Parameter id: 
		public init(fee: String, id: String) {
			self.fee = fee
			self.id = id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/application_fees/\(inputs.fee)/refunds/\(inputs.id)"
	}
	public static var method: HTTPMethod { return .GET }

}

/// Updates the specified application fee refund by setting the values of the parameters passed. Any parameters not provided will be left unchanged.  This request only accepts metadata as an argument.
public struct PostApplicationFeesFeeRefundsId: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = FeeRefund
	public typealias paramType = Params
	
	public struct Params {
		let fee: String
		let id: String

		/// Initialize the request parameters
		/// - Parameter fee: 
		/// - Parameter id: 
		public init(fee: String, id: String) {
			self.fee = fee
			self.id = id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/application_fees/\(inputs.fee)/refunds/\(inputs.id)"
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

/// Retrieves the details of an application fee that your account has collected. The same information is returned when refunding the application fee.
public struct GetApplicationFeesId: StripeAPIEndpoint {
	public typealias inputType = AnyCodable
	public typealias outputType = ApplicationFee
	public typealias paramType = Params
	
	public struct Params {
		let id: String

		/// Initialize the request parameters
		/// - Parameter id: 
		public init(id: String) {
			self.id = id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/application_fees/\(inputs.id)"
	}
	public static var method: HTTPMethod { return .GET }

}

public struct PostApplicationFeesIdRefund: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = ApplicationFee
	public typealias paramType = Params
	
	public struct Params {
		let id: String

		/// Initialize the request parameters
		/// - Parameter id: 
		public init(id: String) {
			self.id = id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/application_fees/\(inputs.id)/refund"
	}

	public final class FormInput: Codable {
		public var amount: Int?
		public var directive: String?
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?

		public init(amount: Int? = nil, directive: String? = nil, expand: [String]? = nil) {
			self.amount = amount
			self.directive = directive
			self.expand = expand
		}
	}

}

/// You can see a list of the refunds belonging to a specific application fee. Note that the 10 most recent refunds are always available by default on the application fee object. If you need more than those 10, you can use this API method and the <code>limit</code> and <code>starting_after</code> parameters to page through additional refunds.
public struct GetApplicationFeesIdRefunds: StripeAPIEndpoint {
	public typealias inputType = AnyCodable
	public typealias outputType = FeeRefundList
	public typealias paramType = Params
	
	public struct Params {
		let id: String
		let ending_before: String?
		let limit: Int?
		let starting_after: String?

		/// Initialize the request parameters
		/// - Parameter id: 
		/// - Parameter ending_before: A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list.
		/// - Parameter limit: A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10.
		/// - Parameter starting_after: A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list.
		public init(id: String, ending_before: String? = nil, limit: Int? = nil, starting_after: String? = nil) {
			self.id = id
			self.ending_before = ending_before
			self.limit = limit
			self.starting_after = starting_after
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		var params = [String]()
		if let a = inputs.ending_before?.urlEncoded { params.append("ending_before=\(a)") }
		if let a = inputs.limit?.urlEncoded { params.append("limit=\(a)") }
		if let a = inputs.starting_after?.urlEncoded { params.append("starting_after=\(a)") }
		let query = params.joined(separator: "&")
		return "/v1/application_fees/\(inputs.id)/refunds?\(query)"
	}
	public static var method: HTTPMethod { return .GET }

	public final class FeeRefundList: Codable {
		/// Details about each object.
		public var data: [FeeRefund]
		/// True if this list has another page of items after this one that can be fetched.
		public var has_more: Bool
		/// String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
		public var object: ObjectValues
		/// The URL where this list can be accessed.
		public var url: String

		public init(data: [FeeRefund], has_more: Bool, object: ObjectValues, url: String) {
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

/// Refunds an application fee that has previously been collected but not yet refunded. Funds will be refunded to the Stripe account from which the fee was originally collected.  You can optionally refund only part of an application fee. You can do so multiple times, until the entire fee has been refunded.  Once entirely refunded, an application fee can’t be refunded again. This method will raise an error when called on an already-refunded application fee, or when trying to refund more money than is left on an application fee.
public struct PostApplicationFeesIdRefunds: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = FeeRefund
	public typealias paramType = Params
	
	public struct Params {
		let id: String

		/// Initialize the request parameters
		/// - Parameter id: 
		public init(id: String) {
			self.id = id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/application_fees/\(inputs.id)/refunds"
	}

	public final class FormInput: Codable {
		/// A positive integer, in _%s_, representing how much of this fee to refund. Can refund only up to the remaining unrefunded amount of the fee.
		public var amount: Int?
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?
		/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
		public var metadata: AnyCodable?

		public init(amount: Int? = nil, expand: [String]? = nil, metadata: AnyCodable? = nil) {
			self.amount = amount
			self.expand = expand
			self.metadata = metadata
		}
	}

}
