
/// Returns a list of your invoice items. Invoice items are returned sorted by creation date, with the most recently created invoice items appearing first.
public struct GetInvoiceitems: StripeAPIEndpoint {
	public typealias inputType = AnyCodable
	public typealias outputType = Output
	public typealias paramType = Params
	
	public struct Params {
		let customer: String?
		let ending_before: String?
		let invoice: String?
		let limit: Int?
		let pending: Bool?
		let starting_after: String?

		/// Initialize the request parameters
		/// - Parameter customer: The identifier of the customer whose invoice items to return. If none is provided, all invoice items will be returned.
		/// - Parameter ending_before: A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list.
		/// - Parameter invoice: Only return invoice items belonging to this invoice. If none is provided, all invoice items will be returned. If specifying an invoice, no customer identifier is needed.
		/// - Parameter limit: A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10.
		/// - Parameter pending: Set to `true` to only show pending invoice items, which are not yet attached to any invoices. Set to `false` to only show invoice items already attached to invoices. If unspecified, no filter is applied.
		/// - Parameter starting_after: A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list.
		public init(customer: String? = nil, ending_before: String? = nil, invoice: String? = nil, limit: Int? = nil, pending: Bool? = nil, starting_after: String? = nil) {
			self.customer = customer
			self.ending_before = ending_before
			self.invoice = invoice
			self.limit = limit
			self.pending = pending
			self.starting_after = starting_after
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		var params = [String]()
		if let a = inputs.customer?.urlEncoded { params.append("customer=\(a)") }
		if let a = inputs.ending_before?.urlEncoded { params.append("ending_before=\(a)") }
		if let a = inputs.invoice?.urlEncoded { params.append("invoice=\(a)") }
		if let a = inputs.limit?.urlEncoded { params.append("limit=\(a)") }
		if let a = inputs.pending?.urlEncoded { params.append("pending=\(a)") }
		if let a = inputs.starting_after?.urlEncoded { params.append("starting_after=\(a)") }
		let query = params.joined(separator: "&")
		return "/v1/invoiceitems?\(query)"
	}
	public static var method: HTTPMethod { return .GET }

	public final class Output: Codable {
		public var data: [Invoiceitem]
		/// True if this list has another page of items after this one that can be fetched.
		public var has_more: Bool
		/// String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
		public var object: ObjectValues
		/// The URL where this list can be accessed.
		public var url: String

		public init(data: [Invoiceitem], has_more: Bool, object: ObjectValues, url: String) {
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

/// Creates an item to be added to a draft invoice (up to 250 items per invoice). If no invoice is specified, the item will be on the next invoice created for the customer specified.
public struct PostInvoiceitems: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = Invoiceitem
	public typealias paramType = AnyCodable
	public static func endpoint(for inputs: AnyCodable) throws -> String {
		return "/v1/invoiceitems"
	}

	public final class FormInput: Codable {
		/// The integer amount in %s of the charge to be applied to the upcoming invoice. Passing in a negative `amount` will reduce the `amount_due` on the invoice.
		public var amount: Int?
		/// Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
		public var currency: String?
		/// The ID of the customer who will be billed when this invoice item is billed.
		public var customer: String
		/// An arbitrary string which you can attach to the invoice item. The description is displayed in the invoice for easy tracking.
		public var description: String?
		/// Controls whether discounts apply to this invoice item. Defaults to false for prorations or negative invoice items, and true for all other invoice items.
		public var discountable: Bool?
		/// The coupons to redeem into discounts for the invoice item or invoice line item.
		public var discounts: AnyCodable?
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?
		/// The ID of an existing invoice to add this invoice item to. When left blank, the invoice item will be added to the next upcoming scheduled invoice. This is useful when adding invoice items in response to an invoice.created webhook. You can only add invoice items to draft invoices and there is a maximum of 250 items per invoice.
		public var invoice: String?
		/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
		public var metadata: AnyCodable?
		/// The period associated with this invoice item.
		public var period: Period?
		/// The ID of the price object.
		public var price: String?
		/// Data used to generate a new [Price](https://stripe.com/docs/api/prices) object inline.
		public var price_data: OneTimePriceData?
		/// Non-negative integer. The quantity of units for the invoice item.
		public var quantity: Int?
		/// The ID of a subscription to add this invoice item to. When left blank, the invoice item will be be added to the next upcoming scheduled invoice. When set, scheduled invoices for subscriptions other than the specified subscription will ignore the invoice item. Use this when you want to express that an invoice item has been accrued within the context of a particular subscription.
		public var subscription: String?
		/// The tax rates which apply to the invoice item. When set, the `default_tax_rates` on the invoice do not apply to this invoice item.
		public var tax_rates: [String]?
		/// The integer unit amount in %s of the charge to be applied to the upcoming invoice. This `unit_amount` will be multiplied by the quantity to get the full amount. Passing in a negative `unit_amount` will reduce the `amount_due` on the invoice.
		public var unit_amount: Int?
		/// Same as `unit_amount`, but accepts a decimal value in %s with at most 12 decimal places. Only one of `unit_amount` and `unit_amount_decimal` can be set.
		public var unit_amount_decimal: StringNumber?

		public init(customer: String, amount: Int? = nil, currency: String? = nil, description: String? = nil, discountable: Bool? = nil, discounts: AnyCodable? = nil, expand: [String]? = nil, invoice: String? = nil, metadata: AnyCodable? = nil, period: Period? = nil, price: String? = nil, price_data: OneTimePriceData? = nil, quantity: Int? = nil, subscription: String? = nil, tax_rates: [String]? = nil, unit_amount: Int? = nil, unit_amount_decimal: StringNumber? = nil) {
			self.customer = customer
			self.amount = amount
			self.currency = currency
			self.description = description
			self.discountable = discountable
			self.discounts = discounts
			self.expand = expand
			self.invoice = invoice
			self.metadata = metadata
			self.period = period
			self.price = price
			self.price_data = price_data
			self.quantity = quantity
			self.subscription = subscription
			self.tax_rates = tax_rates
			self.unit_amount = unit_amount
			self.unit_amount_decimal = unit_amount_decimal
		}


		/// Data used to generate a new [Price](https://stripe.com/docs/api/prices) object inline.
		public final class OneTimePriceData: Codable {
			public var currency: String
			public var product: String
			public var tax_behavior: TaxBehaviorValues?
			public var unit_amount: Int?
			public var unit_amount_decimal: StringNumber?

			/// Data used to generate a new [Price](https://stripe.com/docs/api/prices) object inline.
			/// - Parameters:
			///   - currency: 
			///   - product: 
			public init(currency: String, product: String, tax_behavior: TaxBehaviorValues? = nil, unit_amount: Int? = nil, unit_amount_decimal: StringNumber? = nil) {
				self.currency = currency
				self.product = product
				self.tax_behavior = tax_behavior
				self.unit_amount = unit_amount
				self.unit_amount_decimal = unit_amount_decimal
			}

			public enum TaxBehaviorValues: String, Codable {
				case exclusive = "exclusive"
				case inclusive = "inclusive"
				case unspecified = "unspecified"
			}
		}



		/// The period associated with this invoice item.
		public final class Period: Codable {
			public var end: Timestamp
			public var start: Timestamp

			/// The period associated with this invoice item.
			/// - Parameters:
			///   - end: 
			///   - start: 
			public init(end: Timestamp, start: Timestamp) {
				self.end = end
				self.start = start
			}
		}

	}

}

/// Retrieves the invoice item with the given ID.
public struct GetInvoiceitemsInvoiceitem: StripeAPIEndpoint {
	public typealias inputType = AnyCodable
	public typealias outputType = Invoiceitem
	public typealias paramType = Params
	
	public struct Params {
		let invoiceitem: String

		/// Initialize the request parameters
		/// - Parameter invoiceitem: 
		public init(invoiceitem: String) {
			self.invoiceitem = invoiceitem
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/invoiceitems/\(inputs.invoiceitem)"
	}
	public static var method: HTTPMethod { return .GET }

}

/// Updates the amount or description of an invoice item on an upcoming invoice. Updating an invoice item is only possible before the invoice it’s attached to is closed.
public struct PostInvoiceitemsInvoiceitem: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = Invoiceitem
	public typealias paramType = Params
	
	public struct Params {
		let invoiceitem: String

		/// Initialize the request parameters
		/// - Parameter invoiceitem: 
		public init(invoiceitem: String) {
			self.invoiceitem = invoiceitem
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/invoiceitems/\(inputs.invoiceitem)"
	}

	public final class FormInput: Codable {
		/// The integer amount in %s of the charge to be applied to the upcoming invoice. If you want to apply a credit to the customer's account, pass a negative amount.
		public var amount: Int?
		/// An arbitrary string which you can attach to the invoice item. The description is displayed in the invoice for easy tracking.
		public var description: String?
		/// Controls whether discounts apply to this invoice item. Defaults to false for prorations or negative invoice items, and true for all other invoice items. Cannot be set to true for prorations.
		public var discountable: Bool?
		/// The coupons & existing discounts which apply to the invoice item or invoice line item. Item discounts are applied before invoice discounts. Pass an empty string to remove previously-defined discounts.
		public var discounts: AnyCodable?
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?
		/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
		public var metadata: AnyCodable?
		/// The period associated with this invoice item.
		public var period: Period?
		/// The ID of the price object.
		public var price: String?
		/// Data used to generate a new [Price](https://stripe.com/docs/api/prices) object inline.
		public var price_data: OneTimePriceData?
		/// Non-negative integer. The quantity of units for the invoice item.
		public var quantity: Int?
		/// The tax rates which apply to the invoice item. When set, the `default_tax_rates` on the invoice do not apply to this invoice item. Pass an empty string to remove previously-defined tax rates.
		public var tax_rates: AnyCodable?
		/// The integer unit amount in %s of the charge to be applied to the upcoming invoice. This unit_amount will be multiplied by the quantity to get the full amount. If you want to apply a credit to the customer's account, pass a negative unit_amount.
		public var unit_amount: Int?
		/// Same as `unit_amount`, but accepts a decimal value in %s with at most 12 decimal places. Only one of `unit_amount` and `unit_amount_decimal` can be set.
		public var unit_amount_decimal: StringNumber?

		public init(amount: Int? = nil, description: String? = nil, discountable: Bool? = nil, discounts: AnyCodable? = nil, expand: [String]? = nil, metadata: AnyCodable? = nil, period: Period? = nil, price: String? = nil, price_data: OneTimePriceData? = nil, quantity: Int? = nil, tax_rates: AnyCodable? = nil, unit_amount: Int? = nil, unit_amount_decimal: StringNumber? = nil) {
			self.amount = amount
			self.description = description
			self.discountable = discountable
			self.discounts = discounts
			self.expand = expand
			self.metadata = metadata
			self.period = period
			self.price = price
			self.price_data = price_data
			self.quantity = quantity
			self.tax_rates = tax_rates
			self.unit_amount = unit_amount
			self.unit_amount_decimal = unit_amount_decimal
		}


		/// Data used to generate a new [Price](https://stripe.com/docs/api/prices) object inline.
		public final class OneTimePriceData: Codable {
			public var currency: String
			public var product: String
			public var tax_behavior: TaxBehaviorValues?
			public var unit_amount: Int?
			public var unit_amount_decimal: StringNumber?

			/// Data used to generate a new [Price](https://stripe.com/docs/api/prices) object inline.
			/// - Parameters:
			///   - currency: 
			///   - product: 
			public init(currency: String, product: String, tax_behavior: TaxBehaviorValues? = nil, unit_amount: Int? = nil, unit_amount_decimal: StringNumber? = nil) {
				self.currency = currency
				self.product = product
				self.tax_behavior = tax_behavior
				self.unit_amount = unit_amount
				self.unit_amount_decimal = unit_amount_decimal
			}

			public enum TaxBehaviorValues: String, Codable {
				case exclusive = "exclusive"
				case inclusive = "inclusive"
				case unspecified = "unspecified"
			}
		}



		/// The period associated with this invoice item.
		public final class Period: Codable {
			public var end: Timestamp
			public var start: Timestamp

			/// The period associated with this invoice item.
			/// - Parameters:
			///   - end: 
			///   - start: 
			public init(end: Timestamp, start: Timestamp) {
				self.end = end
				self.start = start
			}
		}

	}

}

/// Deletes an invoice item, removing it from an invoice. Deleting invoice items is only possible when they’re not attached to invoices, or if it’s attached to a draft invoice.
public struct DeleteInvoiceitemsInvoiceitem: StripeAPIEndpoint {
	public typealias inputType = AnyCodable
	public typealias outputType = DeletedInvoiceitem
	public typealias paramType = Params
	
	public struct Params {
		let invoiceitem: String

		/// Initialize the request parameters
		/// - Parameter invoiceitem: 
		public init(invoiceitem: String) {
			self.invoiceitem = invoiceitem
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/invoiceitems/\(inputs.invoiceitem)"
	}
	public static var method: HTTPMethod { return .DELETE }

}
