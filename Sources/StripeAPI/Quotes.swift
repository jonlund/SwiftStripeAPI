
/// Returns a list of your quotes.
public struct GetQuotes: StripeAPIEndpoint {
	public typealias inputType = AnyCodable
	public typealias outputType = Output
	public typealias paramType = Params
	
	public struct Params {
		let customer: String?
		let ending_before: String?
		let limit: Int?
		let starting_after: String?
		let status: String?

		/// Initialize the request parameters
		/// - Parameter customer: The ID of the customer whose quotes will be retrieved.
		/// - Parameter ending_before: A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list.
		/// - Parameter limit: A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10.
		/// - Parameter starting_after: A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list.
		/// - Parameter status: The status of the quote.
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
		return "/v1/quotes?\(query)"
	}
	public static var method: HTTPMethod { return .GET }

	public final class Output: Codable {
		public var data: [Quote]
		/// True if this list has another page of items after this one that can be fetched.
		public var has_more: Bool
		/// String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
		public var object: ObjectValues
		/// The URL where this list can be accessed.
		public var url: String

		public init(data: [Quote], has_more: Bool, object: ObjectValues, url: String) {
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

/// A quote models prices and services for a customer. Default options for <code>header</code>, <code>description</code>, <code>footer</code>, and <code>expires_at</code> can be set in the dashboard via the <a href="https://dashboard.stripe.com/settings/billing/quote">quote template</a>.
public struct PostQuotes: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = Quote
	public typealias paramType = AnyCodable
	public static func endpoint(for inputs: AnyCodable) throws -> String {
		return "/v1/quotes"
	}

	public final class FormInput: Codable {
		/// The amount of the application fee (if any) that will be requested to be applied to the payment and transferred to the application owner's Stripe account. There cannot be any line items with recurring prices when using this field.
		public var application_fee_amount: Int?
		/// A non-negative decimal between 0 and 100, with at most two decimal places. This represents the percentage of the subscription invoice subtotal that will be transferred to the application owner's Stripe account. There must be at least 1 line item with a recurring price to use this field.
		public var application_fee_percent: StringNumber?
		/// Settings for automatic tax lookup for this quote and resulting invoices and subscriptions.
		public var automatic_tax: AutomaticTaxParam?
		/// Either `charge_automatically`, or `send_invoice`. When charging automatically, Stripe will attempt to pay invoices at the end of the subscription cycle or at invoice finalization using the default payment method attached to the subscription or customer. When sending an invoice, Stripe will email your customer an invoice with payment instructions. Defaults to `charge_automatically`.
		public var collection_method: CollectionMethodValues?
		/// The customer for which this quote belongs to. A customer is required before finalizing the quote. Once specified, it cannot be changed.
		public var customer: String?
		/// The tax rates that will apply to any line item that does not have `tax_rates` set.
		public var default_tax_rates: AnyCodable?
		/// A description that will be displayed on the quote PDF. If no value is passed, the default description configured in your [quote template settings](https://dashboard.stripe.com/settings/billing/quote) will be used.
		public var description: String?
		/// The discounts applied to the quote. You can only set up to one discount.
		public var discounts: AnyCodable?
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?
		/// A future timestamp on which the quote will be canceled if in `open` or `draft` status. Measured in seconds since the Unix epoch. If no value is passed, the default expiration date configured in your [quote template settings](https://dashboard.stripe.com/settings/billing/quote) will be used.
		public var expires_at: Timestamp?
		/// A footer that will be displayed on the quote PDF. If no value is passed, the default footer configured in your [quote template settings](https://dashboard.stripe.com/settings/billing/quote) will be used.
		public var footer: String?
		/// Clone an existing quote. The new quote will be created in `status=draft`. When using this parameter, you cannot specify any other parameters except for `expires_at`.
		public var from_quote: FromQuoteParams?
		/// A header that will be displayed on the quote PDF. If no value is passed, the default header configured in your [quote template settings](https://dashboard.stripe.com/settings/billing/quote) will be used.
		public var header: String?
		/// All invoices will be billed using the specified settings.
		public var invoice_settings: QuoteParam?
		/// A list of line items the customer is being quoted for. Each line item includes information about the product, the quantity, and the resulting cost.
		public var line_items: AnyCodable?
		/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
		public var metadata: AnyCodable?
		/// The account on behalf of which to charge.
		public var on_behalf_of: String?
		/// When creating a subscription or subscription schedule, the specified configuration data will be used. There must be at least one line item with a recurring price for a subscription or subscription schedule to be created. A subscription schedule is created if `subscription_data[effective_date]` is present and in the future, otherwise a subscription is created.
		public var subscription_data: SubscriptionDataCreateParams?
		/// The data with which to automatically create a Transfer for each of the invoices.
		public var transfer_data: AnyCodable?

		public init(application_fee_amount: Int? = nil, application_fee_percent: StringNumber? = nil, automatic_tax: AutomaticTaxParam? = nil, collection_method: CollectionMethodValues? = nil, customer: String? = nil, default_tax_rates: AnyCodable? = nil, description: String? = nil, discounts: AnyCodable? = nil, expand: [String]? = nil, expires_at: Timestamp? = nil, footer: String? = nil, from_quote: FromQuoteParams? = nil, header: String? = nil, invoice_settings: QuoteParam? = nil, line_items: AnyCodable? = nil, metadata: AnyCodable? = nil, on_behalf_of: String? = nil, subscription_data: SubscriptionDataCreateParams? = nil, transfer_data: AnyCodable? = nil) {
			self.application_fee_amount = application_fee_amount
			self.application_fee_percent = application_fee_percent
			self.automatic_tax = automatic_tax
			self.collection_method = collection_method
			self.customer = customer
			self.default_tax_rates = default_tax_rates
			self.description = description
			self.discounts = discounts
			self.expand = expand
			self.expires_at = expires_at
			self.footer = footer
			self.from_quote = from_quote
			self.header = header
			self.invoice_settings = invoice_settings
			self.line_items = line_items
			self.metadata = metadata
			self.on_behalf_of = on_behalf_of
			self.subscription_data = subscription_data
			self.transfer_data = transfer_data
		}


		/// Settings for automatic tax lookup for this quote and resulting invoices and subscriptions.
		public final class AutomaticTaxParam: Codable {
			public var enabled: Bool

			/// Settings for automatic tax lookup for this quote and resulting invoices and subscriptions.
			/// - Parameters:
			///   - enabled: 
			public init(enabled: Bool) {
				self.enabled = enabled
			}
		}



		/// Clone an existing quote. The new quote will be created in `status=draft`. When using this parameter, you cannot specify any other parameters except for `expires_at`.
		public final class FromQuoteParams: Codable {
			public var is_revision: Bool?
			public var quote: String

			/// Clone an existing quote. The new quote will be created in `status=draft`. When using this parameter, you cannot specify any other parameters except for `expires_at`.
			/// - Parameters:
			///   - quote: 
			public init(quote: String, is_revision: Bool? = nil) {
				self.quote = quote
				self.is_revision = is_revision
			}
		}



		/// All invoices will be billed using the specified settings.
		public final class QuoteParam: Codable {
			public var days_until_due: Int?

			/// All invoices will be billed using the specified settings.
			/// - Parameters:
			public init(days_until_due: Int? = nil) {
				self.days_until_due = days_until_due
			}
		}



		/// When creating a subscription or subscription schedule, the specified configuration data will be used. There must be at least one line item with a recurring price for a subscription or subscription schedule to be created. A subscription schedule is created if `subscription_data[effective_date]` is present and in the future, otherwise a subscription is created.
		public final class SubscriptionDataCreateParams: Codable {
			public var effective_date: String?
			public var trial_period_days: Int?

			/// When creating a subscription or subscription schedule, the specified configuration data will be used. There must be at least one line item with a recurring price for a subscription or subscription schedule to be created. A subscription schedule is created if `subscription_data[effective_date]` is present and in the future, otherwise a subscription is created.
			/// - Parameters:
			public init(effective_date: String? = nil, trial_period_days: Int? = nil) {
				self.effective_date = effective_date
				self.trial_period_days = trial_period_days
			}
		}


		public enum CollectionMethodValues: String, Codable {
			case chargeAutomatically = "charge_automatically"
			case sendInvoice = "send_invoice"
		}
	}

}

/// Retrieves the quote with the given ID.
public struct GetQuotesQuote: StripeAPIEndpoint {
	public typealias inputType = AnyCodable
	public typealias outputType = Quote
	public typealias paramType = Params
	
	public struct Params {
		let quote: String

		/// Initialize the request parameters
		/// - Parameter quote: 
		public init(quote: String) {
			self.quote = quote
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/quotes/\(inputs.quote)"
	}
	public static var method: HTTPMethod { return .GET }

}

/// A quote models prices and services for a customer.
public struct PostQuotesQuote: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = Quote
	public typealias paramType = Params
	
	public struct Params {
		let quote: String

		/// Initialize the request parameters
		/// - Parameter quote: 
		public init(quote: String) {
			self.quote = quote
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/quotes/\(inputs.quote)"
	}

	public final class FormInput: Codable {
		/// The amount of the application fee (if any) that will be requested to be applied to the payment and transferred to the application owner's Stripe account. There cannot be any line items with recurring prices when using this field.
		public var application_fee_amount: Int?
		/// A non-negative decimal between 0 and 100, with at most two decimal places. This represents the percentage of the subscription invoice subtotal that will be transferred to the application owner's Stripe account. There must be at least 1 line item with a recurring price to use this field.
		public var application_fee_percent: StringNumber?
		/// Settings for automatic tax lookup for this quote and resulting invoices and subscriptions.
		public var automatic_tax: AutomaticTaxParam?
		/// Either `charge_automatically`, or `send_invoice`. When charging automatically, Stripe will attempt to pay invoices at the end of the subscription cycle or at invoice finalization using the default payment method attached to the subscription or customer. When sending an invoice, Stripe will email your customer an invoice with payment instructions. Defaults to `charge_automatically`.
		public var collection_method: CollectionMethodValues?
		/// The customer for which this quote belongs to. A customer is required before finalizing the quote. Once specified, it cannot be changed.
		public var customer: String?
		/// The tax rates that will apply to any line item that does not have `tax_rates` set.
		public var default_tax_rates: AnyCodable?
		/// A description that will be displayed on the quote PDF.
		public var description: String?
		/// The discounts applied to the quote. You can only set up to one discount.
		public var discounts: AnyCodable?
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?
		/// A future timestamp on which the quote will be canceled if in `open` or `draft` status. Measured in seconds since the Unix epoch.
		public var expires_at: Timestamp?
		/// A footer that will be displayed on the quote PDF.
		public var footer: String?
		/// A header that will be displayed on the quote PDF.
		public var header: String?
		/// All invoices will be billed using the specified settings.
		public var invoice_settings: QuoteParam?
		/// A list of line items the customer is being quoted for. Each line item includes information about the product, the quantity, and the resulting cost.
		public var line_items: AnyCodable?
		/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
		public var metadata: AnyCodable?
		/// The account on behalf of which to charge.
		public var on_behalf_of: String?
		/// When creating a subscription or subscription schedule, the specified configuration data will be used. There must be at least one line item with a recurring price for a subscription or subscription schedule to be created. A subscription schedule is created if `subscription_data[effective_date]` is present and in the future, otherwise a subscription is created.
		public var subscription_data: SubscriptionDataUpdateParams?
		/// The data with which to automatically create a Transfer for each of the invoices.
		public var transfer_data: AnyCodable?

		public init(application_fee_amount: Int? = nil, application_fee_percent: StringNumber? = nil, automatic_tax: AutomaticTaxParam? = nil, collection_method: CollectionMethodValues? = nil, customer: String? = nil, default_tax_rates: AnyCodable? = nil, description: String? = nil, discounts: AnyCodable? = nil, expand: [String]? = nil, expires_at: Timestamp? = nil, footer: String? = nil, header: String? = nil, invoice_settings: QuoteParam? = nil, line_items: AnyCodable? = nil, metadata: AnyCodable? = nil, on_behalf_of: String? = nil, subscription_data: SubscriptionDataUpdateParams? = nil, transfer_data: AnyCodable? = nil) {
			self.application_fee_amount = application_fee_amount
			self.application_fee_percent = application_fee_percent
			self.automatic_tax = automatic_tax
			self.collection_method = collection_method
			self.customer = customer
			self.default_tax_rates = default_tax_rates
			self.description = description
			self.discounts = discounts
			self.expand = expand
			self.expires_at = expires_at
			self.footer = footer
			self.header = header
			self.invoice_settings = invoice_settings
			self.line_items = line_items
			self.metadata = metadata
			self.on_behalf_of = on_behalf_of
			self.subscription_data = subscription_data
			self.transfer_data = transfer_data
		}


		/// Settings for automatic tax lookup for this quote and resulting invoices and subscriptions.
		public final class AutomaticTaxParam: Codable {
			public var enabled: Bool

			/// Settings for automatic tax lookup for this quote and resulting invoices and subscriptions.
			/// - Parameters:
			///   - enabled: 
			public init(enabled: Bool) {
				self.enabled = enabled
			}
		}



		/// All invoices will be billed using the specified settings.
		public final class QuoteParam: Codable {
			public var days_until_due: Int?

			/// All invoices will be billed using the specified settings.
			/// - Parameters:
			public init(days_until_due: Int? = nil) {
				self.days_until_due = days_until_due
			}
		}



		/// When creating a subscription or subscription schedule, the specified configuration data will be used. There must be at least one line item with a recurring price for a subscription or subscription schedule to be created. A subscription schedule is created if `subscription_data[effective_date]` is present and in the future, otherwise a subscription is created.
		public final class SubscriptionDataUpdateParams: Codable {
			public var effective_date: String?
			public var trial_period_days: Int?

			/// When creating a subscription or subscription schedule, the specified configuration data will be used. There must be at least one line item with a recurring price for a subscription or subscription schedule to be created. A subscription schedule is created if `subscription_data[effective_date]` is present and in the future, otherwise a subscription is created.
			/// - Parameters:
			public init(effective_date: String? = nil, trial_period_days: Int? = nil) {
				self.effective_date = effective_date
				self.trial_period_days = trial_period_days
			}
		}


		public enum CollectionMethodValues: String, Codable {
			case chargeAutomatically = "charge_automatically"
			case sendInvoice = "send_invoice"
		}
	}

}

/// Accepts the specified quote.
public struct PostQuotesQuoteAccept: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = Quote
	public typealias paramType = Params
	
	public struct Params {
		let quote: String

		/// Initialize the request parameters
		/// - Parameter quote: 
		public init(quote: String) {
			self.quote = quote
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/quotes/\(inputs.quote)/accept"
	}

	public final class FormInput: Codable {
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?

		public init(expand: [String]? = nil) {
			self.expand = expand
		}
	}

}

/// Cancels the quote.
public struct PostQuotesQuoteCancel: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = Quote
	public typealias paramType = Params
	
	public struct Params {
		let quote: String

		/// Initialize the request parameters
		/// - Parameter quote: 
		public init(quote: String) {
			self.quote = quote
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/quotes/\(inputs.quote)/cancel"
	}

	public final class FormInput: Codable {
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?

		public init(expand: [String]? = nil) {
			self.expand = expand
		}
	}

}

/// When retrieving a quote, there is an includable <a href="https://stripe.com/docs/api/quotes/object#quote_object-computed-upfront-line_items"><strong>computed.upfront.line_items</strong></a> property containing the first handful of those items. There is also a URL where you can retrieve the full (paginated) list of upfront line items.
public struct GetQuotesQuoteComputedUpfrontLineItems: StripeAPIEndpoint {
	public typealias inputType = AnyCodable
	public typealias outputType = QuotesResourceListLineItems
	public typealias paramType = Params
	
	public struct Params {
		let quote: String
		let ending_before: String?
		let limit: Int?
		let starting_after: String?

		/// Initialize the request parameters
		/// - Parameter quote: 
		/// - Parameter ending_before: A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list.
		/// - Parameter limit: A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10.
		/// - Parameter starting_after: A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list.
		public init(quote: String, ending_before: String? = nil, limit: Int? = nil, starting_after: String? = nil) {
			self.quote = quote
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
		return "/v1/quotes/\(inputs.quote)/computed_upfront_line_items?\(query)"
	}
	public static var method: HTTPMethod { return .GET }

	public final class QuotesResourceListLineItems: Codable {
		/// Details about each object.
		public var data: [Item]
		/// True if this list has another page of items after this one that can be fetched.
		public var has_more: Bool
		/// String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
		public var object: ObjectValues
		/// The URL where this list can be accessed.
		public var url: String

		public init(data: [Item], has_more: Bool, object: ObjectValues, url: String) {
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

/// Finalizes the quote.
public struct PostQuotesQuoteFinalize: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = Quote
	public typealias paramType = Params
	
	public struct Params {
		let quote: String

		/// Initialize the request parameters
		/// - Parameter quote: 
		public init(quote: String) {
			self.quote = quote
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/quotes/\(inputs.quote)/finalize"
	}

	public final class FormInput: Codable {
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?
		/// A future timestamp on which the quote will be canceled if in `open` or `draft` status. Measured in seconds since the Unix epoch.
		public var expires_at: Timestamp?

		public init(expand: [String]? = nil, expires_at: Timestamp? = nil) {
			self.expand = expand
			self.expires_at = expires_at
		}
	}

}

/// When retrieving a quote, there is an includable <strong>line_items</strong> property containing the first handful of those items. There is also a URL where you can retrieve the full (paginated) list of line items.
public struct GetQuotesQuoteLineItems: StripeAPIEndpoint {
	public typealias inputType = AnyCodable
	public typealias outputType = QuotesResourceListLineItems
	public typealias paramType = Params
	
	public struct Params {
		let quote: String
		let ending_before: String?
		let limit: Int?
		let starting_after: String?

		/// Initialize the request parameters
		/// - Parameter quote: 
		/// - Parameter ending_before: A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list.
		/// - Parameter limit: A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10.
		/// - Parameter starting_after: A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list.
		public init(quote: String, ending_before: String? = nil, limit: Int? = nil, starting_after: String? = nil) {
			self.quote = quote
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
		return "/v1/quotes/\(inputs.quote)/line_items?\(query)"
	}
	public static var method: HTTPMethod { return .GET }

	public final class QuotesResourceListLineItems: Codable {
		/// Details about each object.
		public var data: [Item]
		/// True if this list has another page of items after this one that can be fetched.
		public var has_more: Bool
		/// String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
		public var object: ObjectValues
		/// The URL where this list can be accessed.
		public var url: String

		public init(data: [Item], has_more: Bool, object: ObjectValues, url: String) {
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

/// Download the PDF for a finalized quote
public struct GetQuotesQuotePdf: StripeAPIEndpoint {
	public typealias inputType = AnyCodable
	public typealias outputType = AnyCodable
	public typealias paramType = Params
	
	public struct Params {
		let quote: String

		/// Initialize the request parameters
		/// - Parameter quote: 
		public init(quote: String) {
			self.quote = quote
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/quotes/\(inputs.quote)/pdf"
	}
	public static var method: HTTPMethod { return .GET }

}
