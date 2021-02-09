
/// Returns a list of your promotion codes.
public struct GetPromotionCodes: StripeAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = Output
	public typealias paramType = Params
	public struct Params {
		let active: Bool
		let code: String
		let coupon: String
		let customer: String
		let ending_before: String
		let limit: Int
		let starting_after: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/promotion_codes?active=\(inputs.active.urlEncoded))&code=\(inputs.code.urlEncoded))&coupon=\(inputs.coupon.urlEncoded))&customer=\(inputs.customer.urlEncoded))&ending_before=\(inputs.ending_before.urlEncoded))&limit=\(inputs.limit.urlEncoded))&starting_after=\(inputs.starting_after.urlEncoded))"
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
		public var metadata: String?
		/// Settings that restrict the redemption of the promotion code.
		public var restrictions: RestrictionsParams?

		public init(coupon: String, active: Bool? = nil, code: String? = nil, customer: String? = nil, expand: [String]? = nil, expires_at: Timestamp? = nil, max_redemptions: Int? = nil, metadata: String? = nil, restrictions: RestrictionsParams? = nil) {
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
		public var metadata: MESSED_UP?

		public init(active: Bool? = nil, expand: [String]? = nil, metadata: MESSED_UP? = nil) {
			self.active = active
			self.expand = expand
			self.metadata = metadata
		}
	}

}
