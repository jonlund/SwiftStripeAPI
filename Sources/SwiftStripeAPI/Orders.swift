
/// Returns a list of your orders. The orders are returned sorted by creation date, with the most recently created orders appearing first.
public struct GetOrders: StripeAPIEndpoint {
	public typealias inputType = AnyCodable
	public typealias outputType = OrdersLegacyResourceOrderList
	public typealias paramType = Params
	
	public struct Params {
		let customer: String?
		let ending_before: String?
		let limit: Int?
		let starting_after: String?
		let status: String?

		/// Initialize the request parameters
		/// - Parameter customer: Only return orders for the given customer.
		/// - Parameter ending_before: A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list.
		/// - Parameter limit: A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10.
		/// - Parameter starting_after: A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list.
		/// - Parameter status: Only return orders that have the given status. One of `created`, `paid`, `fulfilled`, or `refunded`.
		public init(customer: String? = nil, ending_before: String? = nil, limit: Int? = nil, starting_after: String? = nil, status: String? = nil) {
			self.customer = customer
			self.ending_before = ending_before
			self.limit = limit
			self.starting_after = starting_after
			self.status = status
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		var params = [String]()
		if let a = inputs.customer?.urlEncoded { params.append("customer=\(a)") }
		if let a = inputs.ending_before?.urlEncoded { params.append("ending_before=\(a)") }
		if let a = inputs.limit?.urlEncoded { params.append("limit=\(a)") }
		if let a = inputs.starting_after?.urlEncoded { params.append("starting_after=\(a)") }
		if let a = inputs.status?.urlEncoded { params.append("status=\(a)") }
		let query = params.joined(separator: "&")
		return "/v1/orders?\(query)"
	}
	public static var method: HTTPMethod { return .GET }

	public final class OrdersLegacyResourceOrderList: Codable {
		public var data: [Order]
		/// True if this list has another page of items after this one that can be fetched.
		public var has_more: Bool
		/// String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
		public var object: ObjectValues
		/// The URL where this list can be accessed.
		public var url: String

		public init(data: [Order], has_more: Bool, object: ObjectValues, url: String) {
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

/// Creates a new order object.
public struct PostOrders: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = Order
	public typealias paramType = AnyCodable
	public static func endpoint(for inputs: AnyCodable) throws -> String {
		return "/v1/orders"
	}

	public final class FormInput: Codable {
		/// A coupon code that represents a discount to be applied to this order. Must be one-time duration and in same currency as the order. An order can have multiple coupons.
		public var coupon: String?
		/// Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
		public var currency: String
		/// The ID of an existing customer to use for this order. If provided, the customer email and shipping address will be used to create the order. Subsequently, the customer will also be charged to pay the order. If `email` or `shipping` are also provided, they will override the values retrieved from the customer object.
		public var customer: String?
		/// The email address of the customer placing the order.
		public var email: String?
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?
		/// List of items constituting the order. An order can have up to 25 items.
		public var items: AnyCodable?
		/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
		public var metadata: AnyCodable?
		/// Shipping address for the order. Required if any of the SKUs are for products that have `shippable` set to true.
		public var shipping: CustomerShipping?

		public init(currency: String, coupon: String? = nil, customer: String? = nil, email: String? = nil, expand: [String]? = nil, items: AnyCodable? = nil, metadata: AnyCodable? = nil, shipping: CustomerShipping? = nil) {
			self.currency = currency
			self.coupon = coupon
			self.customer = customer
			self.email = email
			self.expand = expand
			self.items = items
			self.metadata = metadata
			self.shipping = shipping
		}


		/// Shipping address for the order. Required if any of the SKUs are for products that have `shippable` set to true.
		public final class CustomerShipping: Codable {
			public var address: OptionalFieldsAddress
			public var name: String
			public var phone: String?

			/// Shipping address for the order. Required if any of the SKUs are for products that have `shippable` set to true.
			/// - Parameters:
			///   - address: 
			///   - name: 
			public init(address: OptionalFieldsAddress, name: String, phone: String? = nil) {
				self.address = address
				self.name = name
				self.phone = phone
			}


			public final class OptionalFieldsAddress: Codable {
				public var city: String?
				public var country: String?
				public var line1: String?
				public var line2: String?
				public var postal_code: String?
				public var state: String?

				public init(city: String? = nil, country: String? = nil, line1: String? = nil, line2: String? = nil, postal_code: String? = nil, state: String? = nil) {
					self.city = city
					self.country = country
					self.line1 = line1
					self.line2 = line2
					self.postal_code = postal_code
					self.state = state
				}
			}

		}

	}

}

/// Retrieves the details of an existing order. Supply the unique order ID from either an order creation request or the order list, and Stripe will return the corresponding order information.
public struct GetOrdersId: StripeAPIEndpoint {
	public typealias inputType = AnyCodable
	public typealias outputType = Order
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
		return "/v1/orders/\(inputs.id)"
	}
	public static var method: HTTPMethod { return .GET }

}

/// Updates the specific order by setting the values of the parameters passed. Any parameters not provided will be left unchanged.
public struct PostOrdersId: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = Order
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
		return "/v1/orders/\(inputs.id)"
	}

	public final class FormInput: Codable {
		/// A coupon code that represents a discount to be applied to this order. Must be one-time duration and in same currency as the order. An order can have multiple coupons.
		public var coupon: String?
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?
		/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
		public var metadata: AnyCodable?
		/// The shipping method to select for fulfilling this order. If specified, must be one of the `id`s of a shipping method in the `shipping_methods` array. If specified, will overwrite the existing selected shipping method, updating `items` as necessary.
		public var selected_shipping_method: String?
		/// Tracking information once the order has been fulfilled.
		public var shipping: ShippingTrackingParams?
		/// Current order status. One of `created`, `paid`, `canceled`, `fulfilled`, or `returned`. More detail in the [Orders Guide](https://stripe.com/docs/orders/guide#understanding-order-statuses).
		public var status: StatusValues?

		public init(coupon: String? = nil, expand: [String]? = nil, metadata: AnyCodable? = nil, selected_shipping_method: String? = nil, shipping: ShippingTrackingParams? = nil, status: StatusValues? = nil) {
			self.coupon = coupon
			self.expand = expand
			self.metadata = metadata
			self.selected_shipping_method = selected_shipping_method
			self.shipping = shipping
			self.status = status
		}


		/// Tracking information once the order has been fulfilled.
		public final class ShippingTrackingParams: Codable {
			public var carrier: String
			public var tracking_number: String

			/// Tracking information once the order has been fulfilled.
			/// - Parameters:
			///   - carrier: 
			///   - tracking_number: 
			public init(carrier: String, tracking_number: String) {
				self.carrier = carrier
				self.tracking_number = tracking_number
			}
		}


		public enum StatusValues: String, Codable {
			case canceled = "canceled"
			case created = "created"
			case fulfilled = "fulfilled"
			case paid = "paid"
			case returned = "returned"
		}
	}

}

/// Pay an order by providing a <code>source</code> to create a payment.
public struct PostOrdersIdPay: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = Order
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
		return "/v1/orders/\(inputs.id)/pay"
	}

	public final class FormInput: Codable {
		/// A fee in %s that will be applied to the order and transferred to the application owner's Stripe account. The request must be made with an OAuth key or the `Stripe-Account` header in order to take an application fee. For more information, see the application fees [documentation](https://stripe.com/docs/connect/direct-charges#collecting-fees).
		public var application_fee: Int?
		/// The ID of an existing customer that will be charged for this order. If no customer was attached to the order at creation, either `source` or `customer` is required. Otherwise, the specified customer will be charged instead of the one attached to the order.
		public var customer: String?
		/// The email address of the customer placing the order. Required if not previously specified for the order.
		public var email: String?
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?
		/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
		public var metadata: AnyCodable?
		/// A [Token](https://stripe.com/docs/api#tokens)'s or a [Source](https://stripe.com/docs/api#sources)'s ID, as returned by [Elements](https://stripe.com/docs/elements). If no customer was attached to the order at creation, either `source` or `customer` is required. Otherwise, the specified source will be charged intead of the customer attached to the order.
		public var source: String?

		public init(application_fee: Int? = nil, customer: String? = nil, email: String? = nil, expand: [String]? = nil, metadata: AnyCodable? = nil, source: String? = nil) {
			self.application_fee = application_fee
			self.customer = customer
			self.email = email
			self.expand = expand
			self.metadata = metadata
			self.source = source
		}
	}

}

/// Return all or part of an order. The order must have a status of <code>paid</code> or <code>fulfilled</code> before it can be returned. Once all items have been returned, the order will become <code>canceled</code> or <code>returned</code> depending on which status the order started in.
public struct PostOrdersIdReturns: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = OrderReturn
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
		return "/v1/orders/\(inputs.id)/returns"
	}

	public final class FormInput: Codable {
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?
		/// List of items to return.
		public var items: AnyCodable?

		public init(expand: [String]? = nil, items: AnyCodable? = nil) {
			self.expand = expand
			self.items = items
		}
	}

}
