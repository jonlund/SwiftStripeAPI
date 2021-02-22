
/// Returns a list of your promotion codes.
public struct GetPromotionCodes: StripeAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = Output
	public typealias paramType = Params
	
	public struct Params {
		let active: Bool?
		let code: String?
		let coupon: String?
		let customer: String?
		let ending_before: String?
		let limit: Int?
		let starting_after: String?

		/// Initialize the request parameters
		/// - Parameter active: Filter promotion codes by whether they are active.
		/// - Parameter code: Only return promotion codes that have this case-insensitive code.
		/// - Parameter coupon: Only return promotion codes for this coupon.
		/// - Parameter customer: Only return promotion codes that are restricted to this customer.
		/// - Parameter ending_before: A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list.
		/// - Parameter limit: A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10.
		/// - Parameter starting_after: A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list.
		public init(active: Bool? = nil, code: String? = nil, coupon: String? = nil, customer: String? = nil, ending_before: String? = nil, limit: Int? = nil, starting_after: String? = nil) {
			self.active = active
			self.code = code
			self.coupon = coupon
			self.customer = customer
			self.ending_before = ending_before
			self.limit = limit
			self.starting_after = starting_after
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		var params = [String]()
		if let a = inputs.active?.urlEncoded { params.append("active=\(a)") }
		if let a = inputs.code?.urlEncoded { params.append("code=\(a)") }
		if let a = inputs.coupon?.urlEncoded { params.append("coupon=\(a)") }
		if let a = inputs.customer?.urlEncoded { params.append("customer=\(a)") }
		if let a = inputs.ending_before?.urlEncoded { params.append("ending_before=\(a)") }
		if let a = inputs.limit?.urlEncoded { params.append("limit=\(a)") }
		if let a = inputs.starting_after?.urlEncoded { params.append("starting_after=\(a)") }
		let query = params.joined(separator: "&")
		return "/v1/promotion_codes?\(query)"
	}
	public static var method: HTTPMethod { return .GET }

	public final class Output: Codable {
		public var data: [PromotionCode]
		/// True if this list has another page of items after this one that can be fetched.
		public var has_more: Bool
		/// String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
		public var object: ObjectValues
		/// The URL where this list can be accessed.
		public var url: String

		public init(data: [PromotionCode], has_more: Bool, object: ObjectValues, url: String) {
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

/// A promotion code points to a coupon. You can optionally restrict the code to a specific customer, redemption limit, and expiration date.
public struct PostPromotionCodes: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = PromotionCode
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v1/promotion_codes"
	}

	public final class FormInput: Codable {
		/// Whether the promotion code is currently active.
		public var active: Bool?
		/// The customer-facing code. Regardless of case, this code must be unique across all active promotion codes for a specific customer. If left blank, we will generate one automatically.
		public var code: String?
		/// The coupon for this promotion code.
		public var coupon: String
		/// The customer that this promotion code can be used by. If not set, the promotion code can be used by all customers.
		public var customer: String?
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?
		/// The timestamp at which this promotion code will expire. If the coupon has specified a `redeems_by`, then this value cannot be after the coupon's `redeems_by`.
		public var expires_at: Timestamp?
		/// A positive integer specifying the number of times the promotion code can be redeemed. If the coupon has specified a `max_redemptions`, then this value cannot be greater than the coupon's `max_redemptions`.
		public var max_redemptions: Int?
		/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
		public var metadata: Empty?
		/// Settings that restrict the redemption of the promotion code.
		public var restrictions: RestrictionsParams?

		public init(coupon: String, active: Bool? = nil, code: String? = nil, customer: String? = nil, expand: [String]? = nil, expires_at: Timestamp? = nil, max_redemptions: Int? = nil, metadata: Empty? = nil, restrictions: RestrictionsParams? = nil) {
			self.coupon = coupon
			self.active = active
			self.code = code
			self.customer = customer
			self.expand = expand
			self.expires_at = expires_at
			self.max_redemptions = max_redemptions
			self.metadata = metadata
			self.restrictions = restrictions
		}


		/// Settings that restrict the redemption of the promotion code.
		public final class RestrictionsParams: Codable {
			public var first_time_transaction: Bool?
			public var minimum_amount: Int?
			public var minimum_amount_currency: String?

			/// Settings that restrict the redemption of the promotion code.
			/// - Parameters:
			public init(first_time_transaction: Bool? = nil, minimum_amount: Int? = nil, minimum_amount_currency: String? = nil) {
				self.first_time_transaction = first_time_transaction
				self.minimum_amount = minimum_amount
				self.minimum_amount_currency = minimum_amount_currency
			}
		}

	}

}

/// Retrieves the promotion code with the given ID.
public struct GetPromotionCodesPromotionCode: StripeAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = PromotionCode
	public typealias paramType = Params
	
	public struct Params {
		let promotion_code: String

		/// Initialize the request parameters
		/// - Parameter promotion_code: 
		public init(promotion_code: String) {
			self.promotion_code = promotion_code
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/promotion_codes/\(inputs.promotion_code)"
	}
	public static var method: HTTPMethod { return .GET }

}

/// Updates the specified promotion code by setting the values of the parameters passed. Most fields are, by design, not editable.
public struct PostPromotionCodesPromotionCode: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = PromotionCode
	public typealias paramType = Params
	
	public struct Params {
		let promotion_code: String

		/// Initialize the request parameters
		/// - Parameter promotion_code: 
		public init(promotion_code: String) {
			self.promotion_code = promotion_code
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/promotion_codes/\(inputs.promotion_code)"
	}

	public final class FormInput: Codable {
		/// Whether the promotion code is currently active. A promotion code can only be reactivated when the coupon is still valid and the promotion code is otherwise redeemable.
		public var active: Bool?
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?
		/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
		public var metadata: AnyCodable?

		public init(active: Bool? = nil, expand: [String]? = nil, metadata: AnyCodable? = nil) {
			self.active = active
			self.expand = expand
			self.metadata = metadata
		}
	}

}
