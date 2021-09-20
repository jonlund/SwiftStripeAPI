
/// Returns a list of your coupons.
public struct GetCoupons: StripeAPIEndpoint {
	public typealias inputType = AnyCodable
	public typealias outputType = Output
	public typealias paramType = Params
	
	public struct Params {
		let ending_before: String?
		let limit: Int?
		let starting_after: String?

		/// Initialize the request parameters
		/// - Parameter ending_before: A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list.
		/// - Parameter limit: A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10.
		/// - Parameter starting_after: A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list.
		public init(ending_before: String? = nil, limit: Int? = nil, starting_after: String? = nil) {
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
		return "/v1/coupons?\(query)"
	}
	public static var method: HTTPMethod { return .GET }

	public final class Output: Codable {
		public var data: [Coupon]
		/// True if this list has another page of items after this one that can be fetched.
		public var has_more: Bool
		/// String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
		public var object: ObjectValues
		/// The URL where this list can be accessed.
		public var url: String

		public init(data: [Coupon], has_more: Bool, object: ObjectValues, url: String) {
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

/// You can create coupons easily via the <a href="https://dashboard.stripe.com/coupons">coupon management</a> page of the Stripe dashboard. Coupon creation is also accessible via the API if you need to create coupons on the fly.  A coupon has either a <code>percent_off</code> or an <code>amount_off</code> and <code>currency</code>. If you set an <code>amount_off</code>, that amount will be subtracted from any invoice’s subtotal. For example, an invoice with a subtotal of <currency>100</currency> will have a final total of <currency>0</currency> if a coupon with an <code>amount_off</code> of <amount>200</amount> is applied to it and an invoice with a subtotal of <currency>300</currency> will have a final total of <currency>100</currency> if a coupon with an <code>amount_off</code> of <amount>200</amount> is applied to it.
public struct PostCoupons: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = Coupon
	public typealias paramType = AnyCodable
	public static func endpoint(for inputs: AnyCodable) throws -> String {
		return "/v1/coupons"
	}

	public final class FormInput: Codable {
		/// A positive integer representing the amount to subtract from an invoice total (required if `percent_off` is not passed).
		public var amount_off: Int?
		/// A hash containing directions for what this Coupon will apply discounts to.
		public var applies_to: AppliesToParams?
		/// Three-letter [ISO code for the currency](https://stripe.com/docs/currencies) of the `amount_off` parameter (required if `amount_off` is passed).
		public var currency: String?
		/// Specifies how long the discount will be in effect if used on a subscription. Can be `forever`, `once`, or `repeating`. Defaults to `once`.
		public var duration: DurationValues?
		/// Required only if `duration` is `repeating`, in which case it must be a positive integer that specifies the number of months the discount will be in effect.
		public var duration_in_months: Int?
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?
		/// Unique string of your choice that will be used to identify this coupon when applying it to a customer. If you don't want to specify a particular code, you can leave the ID blank and we'll generate a random code for you.
		public var id: String?
		/// A positive integer specifying the number of times the coupon can be redeemed before it's no longer valid. For example, you might have a 50% off coupon that the first 20 readers of your blog can use.
		public var max_redemptions: Int?
		/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
		public var metadata: AnyCodable?
		/// Name of the coupon displayed to customers on, for instance invoices, or receipts. By default the `id` is shown if `name` is not set.
		public var name: String?
		/// A positive float larger than 0, and smaller or equal to 100, that represents the discount the coupon will apply (required if `amount_off` is not passed).
		public var percent_off: StringNumber?
		/// Unix timestamp specifying the last time at which the coupon can be redeemed. After the redeem_by date, the coupon can no longer be applied to new customers.
		public var redeem_by: Timestamp?

		public init(amount_off: Int? = nil, applies_to: AppliesToParams? = nil, currency: String? = nil, duration: DurationValues? = nil, duration_in_months: Int? = nil, expand: [String]? = nil, id: String? = nil, max_redemptions: Int? = nil, metadata: AnyCodable? = nil, name: String? = nil, percent_off: StringNumber? = nil, redeem_by: Timestamp? = nil) {
			self.amount_off = amount_off
			self.applies_to = applies_to
			self.currency = currency
			self.duration = duration
			self.duration_in_months = duration_in_months
			self.expand = expand
			self.id = id
			self.max_redemptions = max_redemptions
			self.metadata = metadata
			self.name = name
			self.percent_off = percent_off
			self.redeem_by = redeem_by
		}


		/// A hash containing directions for what this Coupon will apply discounts to.
		public final class AppliesToParams: Codable {
			public var products: [String]?

			/// A hash containing directions for what this Coupon will apply discounts to.
			/// - Parameters:
			public init(products: [String]? = nil) {
				self.products = products
			}
		}


		public enum DurationValues: String, Codable {
			case forever = "forever"
			case once = "once"
			case repeating = "repeating"
		}
	}

}

/// Retrieves the coupon with the given ID.
public struct GetCouponsCoupon: StripeAPIEndpoint {
	public typealias inputType = AnyCodable
	public typealias outputType = Coupon
	public typealias paramType = Params
	
	public struct Params {
		let coupon: String

		/// Initialize the request parameters
		/// - Parameter coupon: 
		public init(coupon: String) {
			self.coupon = coupon
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/coupons/\(inputs.coupon)"
	}
	public static var method: HTTPMethod { return .GET }

}

/// Updates the metadata of a coupon. Other coupon details (currency, duration, amount_off) are, by design, not editable.
public struct PostCouponsCoupon: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = Coupon
	public typealias paramType = Params
	
	public struct Params {
		let coupon: String

		/// Initialize the request parameters
		/// - Parameter coupon: 
		public init(coupon: String) {
			self.coupon = coupon
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/coupons/\(inputs.coupon)"
	}

	public final class FormInput: Codable {
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?
		/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
		public var metadata: AnyCodable?
		/// Name of the coupon displayed to customers on, for instance invoices, or receipts. By default the `id` is shown if `name` is not set.
		public var name: String?

		public init(expand: [String]? = nil, metadata: AnyCodable? = nil, name: String? = nil) {
			self.expand = expand
			self.metadata = metadata
			self.name = name
		}
	}

}

/// You can delete coupons via the <a href="https://dashboard.stripe.com/coupons">coupon management</a> page of the Stripe dashboard. However, deleting a coupon does not affect any customers who have already applied the coupon; it means that new customers can’t redeem the coupon. You can also delete coupons via the API.
public struct DeleteCouponsCoupon: StripeAPIEndpoint {
	public typealias inputType = AnyCodable
	public typealias outputType = DeletedCoupon
	public typealias paramType = Params
	
	public struct Params {
		let coupon: String

		/// Initialize the request parameters
		/// - Parameter coupon: 
		public init(coupon: String) {
			self.coupon = coupon
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/coupons/\(inputs.coupon)"
	}
	public static var method: HTTPMethod { return .DELETE }

}
