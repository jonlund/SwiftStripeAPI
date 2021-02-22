
/// Returns a list of your customers. The customers are returned sorted by creation date, with the most recent customers appearing first.
public struct GetCustomers: StripeAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = Output
	public typealias paramType = Params
	
	public struct Params {
		let email: String?
		let ending_before: String?
		let limit: Int?
		let starting_after: String?

		/// Initialize the request parameters
		/// - Parameter email: A case-sensitive filter on the list based on the customer's `email` field. The value must be a string.
		/// - Parameter ending_before: A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list.
		/// - Parameter limit: A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10.
		/// - Parameter starting_after: A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list.
		public init(email: String? = nil, ending_before: String? = nil, limit: Int? = nil, starting_after: String? = nil) {
			self.email = email
			self.ending_before = ending_before
			self.limit = limit
			self.starting_after = starting_after
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		var params = [String]()
		if let a = inputs.email?.urlEncoded { params.append("email=\(a)") }
		if let a = inputs.ending_before?.urlEncoded { params.append("ending_before=\(a)") }
		if let a = inputs.limit?.urlEncoded { params.append("limit=\(a)") }
		if let a = inputs.starting_after?.urlEncoded { params.append("starting_after=\(a)") }
		let query = params.joined(separator: "&")
		return "/v1/customers?\(query)"
	}
	public static var method: HTTPMethod { return .GET }

	public final class Output: Codable {
		public var data: [Customer]
		/// True if this list has another page of items after this one that can be fetched.
		public var has_more: Bool
		/// String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
		public var object: ObjectValues
		/// The URL where this list can be accessed.
		public var url: String

		public init(data: [Customer], has_more: Bool, object: ObjectValues, url: String) {
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

/// Creates a new customer object.
public struct PostCustomers: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = Customer
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v1/customers"
	}

	public final class FormInput: Codable {
		/// The customer's address.
		public var address: AnyCodable?
		/// An integer amount in %s that represents the customer's current balance, which affect the customer's future invoices. A negative amount represents a credit that decreases the amount due on an invoice; a positive amount increases the amount due on an invoice.
		public var balance: Int?
		public var coupon: String?
		/// An arbitrary string that you can attach to a customer object. It is displayed alongside the customer in the dashboard.
		public var description: String?
		/// Customer's email address. It's displayed alongside the customer in your dashboard and can be useful for searching and tracking. This may be up to *512 characters*.
		public var email: String?
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?
		/// The prefix for the customer used to generate unique invoice numbers. Must be 3–12 uppercase letters or numbers.
		public var invoice_prefix: String?
		/// Default invoice settings for this customer.
		public var invoice_settings: CustomerParam?
		/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
		public var metadata: AnyCodable?
		/// The customer's full name or business name.
		public var name: String?
		/// The sequence to be used on the customer's next invoice. Defaults to 1.
		public var next_invoice_sequence: Int?
		public var payment_method: String?
		/// The customer's phone number.
		public var phone: String?
		/// Customer's preferred languages, ordered by preference.
		public var preferred_locales: [String]?
		/// The API ID of a promotion code to apply to the customer. The customer will have a discount applied on all recurring payments. Charges you create through the API will not have the discount.
		public var promotion_code: String?
		/// The customer's shipping information. Appears on invoices emailed to this customer.
		public var shipping: AnyCodable?
		public var source: String?
		/// The customer's tax exemption. One of `none`, `exempt`, or `reverse`.
		public var tax_exempt: TaxExemptValues?
		/// The customer's tax IDs.
		public var tax_id_data: AnyCodable?

		public init(address: AnyCodable? = nil, balance: Int? = nil, coupon: String? = nil, description: String? = nil, email: String? = nil, expand: [String]? = nil, invoice_prefix: String? = nil, invoice_settings: CustomerParam? = nil, metadata: AnyCodable? = nil, name: String? = nil, next_invoice_sequence: Int? = nil, payment_method: String? = nil, phone: String? = nil, preferred_locales: [String]? = nil, promotion_code: String? = nil, shipping: AnyCodable? = nil, source: String? = nil, tax_exempt: TaxExemptValues? = nil, tax_id_data: AnyCodable? = nil) {
			self.address = address
			self.balance = balance
			self.coupon = coupon
			self.description = description
			self.email = email
			self.expand = expand
			self.invoice_prefix = invoice_prefix
			self.invoice_settings = invoice_settings
			self.metadata = metadata
			self.name = name
			self.next_invoice_sequence = next_invoice_sequence
			self.payment_method = payment_method
			self.phone = phone
			self.preferred_locales = preferred_locales
			self.promotion_code = promotion_code
			self.shipping = shipping
			self.source = source
			self.tax_exempt = tax_exempt
			self.tax_id_data = tax_id_data
		}


		/// Default invoice settings for this customer.
		public final class CustomerParam: Codable {
			public var custom_fields: AnyCodable?
			public var default_payment_method: String?
			public var footer: String?

			/// Default invoice settings for this customer.
			/// - Parameters:
			public init(custom_fields: AnyCodable? = nil, default_payment_method: String? = nil, footer: String? = nil) {
				self.custom_fields = custom_fields
				self.default_payment_method = default_payment_method
				self.footer = footer
			}
		}


		public enum TaxExemptValues: String, Codable {
			case exempt = "exempt"
			case none = "none"
			case reverse = "reverse"
		}
	}

}

/// Retrieves the details of an existing customer. You need only supply the unique customer identifier that was returned upon customer creation.
public struct GetCustomersCustomer: StripeAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = Customer
	public typealias paramType = Params
	
	public struct Params {
		let customer: String

		/// Initialize the request parameters
		/// - Parameter customer: 
		public init(customer: String) {
			self.customer = customer
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/customers/\(inputs.customer)"
	}
	public static var method: HTTPMethod { return .GET }

}

/// Updates the specified customer by setting the values of the parameters passed. Any parameters not provided will be left unchanged. For example, if you pass the <strong>source</strong> parameter, that becomes the customer’s active source (e.g., a card) to be used for all charges in the future. When you update a customer to a new valid card source by passing the <strong>source</strong> parameter: for each of the customer’s current subscriptions, if the subscription bills automatically and is in the <code>past_due</code> state, then the latest open invoice for the subscription with automatic collection enabled will be retried. This retry will not count as an automatic retry, and will not affect the next regularly scheduled payment for the invoice. Changing the <strong>default_source</strong> for a customer will not trigger this behavior.  This request accepts mostly the same arguments as the customer creation call.
public struct PostCustomersCustomer: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = Customer
	public typealias paramType = Params
	
	public struct Params {
		let customer: String

		/// Initialize the request parameters
		/// - Parameter customer: 
		public init(customer: String) {
			self.customer = customer
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/customers/\(inputs.customer)"
	}

	public final class FormInput: Codable {
		/// The customer's address.
		public var address: AnyCodable?
		/// An integer amount in %s that represents the customer's current balance, which affect the customer's future invoices. A negative amount represents a credit that decreases the amount due on an invoice; a positive amount increases the amount due on an invoice.
		public var balance: Int?
		/// Either a token, like the ones returned by [Stripe.js](https://stripe.com/docs/stripe.js), or a dictionary containing a user's bank account details.
		public var bank_account: AnyCodable?
		/// A token, like the ones returned by [Stripe.js](https://stripe.com/docs/stripe.js).
		public var card: AnyCodable?
		public var coupon: String?
		/// ID of Alipay account to make the customer's new default for invoice payments.
		public var default_alipay_account: String?
		/// ID of bank account to make the customer's new default for invoice payments.
		public var default_bank_account: String?
		/// ID of card to make the customer's new default for invoice payments.
		public var default_card: String?
		/// If you are using payment methods created via the PaymentMethods API, see the [invoice_settings.default_payment_method](https://stripe.com/docs/api/customers/update#update_customer-invoice_settings-default_payment_method) parameter.  Provide the ID of a payment source already attached to this customer to make it this customer's default payment source.  If you want to add a new payment source and make it the default, see the [source](https://stripe.com/docs/api/customers/update#update_customer-source) property.
		public var default_source: String?
		/// An arbitrary string that you can attach to a customer object. It is displayed alongside the customer in the dashboard.
		public var description: String?
		/// Customer's email address. It's displayed alongside the customer in your dashboard and can be useful for searching and tracking. This may be up to *512 characters*.
		public var email: String?
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?
		/// The prefix for the customer used to generate unique invoice numbers. Must be 3–12 uppercase letters or numbers.
		public var invoice_prefix: String?
		/// Default invoice settings for this customer.
		public var invoice_settings: CustomerParam?
		/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
		public var metadata: AnyCodable?
		/// The customer's full name or business name.
		public var name: String?
		/// The sequence to be used on the customer's next invoice. Defaults to 1.
		public var next_invoice_sequence: Int?
		/// The customer's phone number.
		public var phone: String?
		/// Customer's preferred languages, ordered by preference.
		public var preferred_locales: [String]?
		/// The API ID of a promotion code to apply to the customer. The customer will have a discount applied on all recurring payments. Charges you create through the API will not have the discount.
		public var promotion_code: String?
		/// The customer's shipping information. Appears on invoices emailed to this customer.
		public var shipping: AnyCodable?
		public var source: String?
		/// The customer's tax exemption. One of `none`, `exempt`, or `reverse`.
		public var tax_exempt: TaxExemptValues?
		/// Unix timestamp representing the end of the trial period the customer will get before being charged for the first time. This will always overwrite any trials that might apply via a subscribed plan. If set, trial_end will override the default trial period of the plan the customer is being subscribed to. The special value `now` can be provided to end the customer's trial immediately. Can be at most two years from `billing_cycle_anchor`.
		public var trial_end: String?

		public init(address: AnyCodable? = nil, balance: Int? = nil, bank_account: AnyCodable? = nil, card: AnyCodable? = nil, coupon: String? = nil, default_alipay_account: String? = nil, default_bank_account: String? = nil, default_card: String? = nil, default_source: String? = nil, description: String? = nil, email: String? = nil, expand: [String]? = nil, invoice_prefix: String? = nil, invoice_settings: CustomerParam? = nil, metadata: AnyCodable? = nil, name: String? = nil, next_invoice_sequence: Int? = nil, phone: String? = nil, preferred_locales: [String]? = nil, promotion_code: String? = nil, shipping: AnyCodable? = nil, source: String? = nil, tax_exempt: TaxExemptValues? = nil, trial_end: String? = nil) {
			self.address = address
			self.balance = balance
			self.bank_account = bank_account
			self.card = card
			self.coupon = coupon
			self.default_alipay_account = default_alipay_account
			self.default_bank_account = default_bank_account
			self.default_card = default_card
			self.default_source = default_source
			self.description = description
			self.email = email
			self.expand = expand
			self.invoice_prefix = invoice_prefix
			self.invoice_settings = invoice_settings
			self.metadata = metadata
			self.name = name
			self.next_invoice_sequence = next_invoice_sequence
			self.phone = phone
			self.preferred_locales = preferred_locales
			self.promotion_code = promotion_code
			self.shipping = shipping
			self.source = source
			self.tax_exempt = tax_exempt
			self.trial_end = trial_end
		}


		/// Default invoice settings for this customer.
		public final class CustomerParam: Codable {
			public var custom_fields: AnyCodable?
			public var default_payment_method: String?
			public var footer: String?

			/// Default invoice settings for this customer.
			/// - Parameters:
			public init(custom_fields: AnyCodable? = nil, default_payment_method: String? = nil, footer: String? = nil) {
				self.custom_fields = custom_fields
				self.default_payment_method = default_payment_method
				self.footer = footer
			}
		}


		public enum TaxExemptValues: String, Codable {
			case exempt = "exempt"
			case none = "none"
			case reverse = "reverse"
		}
	}

}

/// Permanently deletes a customer. It cannot be undone. Also immediately cancels any active subscriptions on the customer.
public struct DeleteCustomersCustomer: StripeAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = DeletedCustomer
	public typealias paramType = Params
	
	public struct Params {
		let customer: String

		/// Initialize the request parameters
		/// - Parameter customer: 
		public init(customer: String) {
			self.customer = customer
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/customers/\(inputs.customer)"
	}
	public static var method: HTTPMethod { return .DELETE }

}

/// Returns a list of transactions that updated the customer’s <a href="/docs/billing/customer/balance">balances</a>.
public struct GetCustomersCustomerBalanceTransactions: StripeAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = CustomerBalanceTransactionList
	public typealias paramType = Params
	
	public struct Params {
		let customer: String
		let ending_before: String?
		let limit: Int?
		let starting_after: String?

		/// Initialize the request parameters
		/// - Parameter customer: 
		/// - Parameter ending_before: A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list.
		/// - Parameter limit: A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10.
		/// - Parameter starting_after: A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list.
		public init(customer: String, ending_before: String? = nil, limit: Int? = nil, starting_after: String? = nil) {
			self.customer = customer
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
		return "/v1/customers/\(inputs.customer)/balance_transactions?\(query)"
	}
	public static var method: HTTPMethod { return .GET }

	public final class CustomerBalanceTransactionList: Codable {
		/// Details about each object.
		public var data: [CustomerBalanceTransaction]
		/// True if this list has another page of items after this one that can be fetched.
		public var has_more: Bool
		/// String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
		public var object: ObjectValues
		/// The URL where this list can be accessed.
		public var url: String

		public init(data: [CustomerBalanceTransaction], has_more: Bool, object: ObjectValues, url: String) {
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

/// Creates an immutable transaction that updates the customer’s credit <a href="/docs/billing/customer/balance">balance</a>.
public struct PostCustomersCustomerBalanceTransactions: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = CustomerBalanceTransaction
	public typealias paramType = Params
	
	public struct Params {
		let customer: String

		/// Initialize the request parameters
		/// - Parameter customer: 
		public init(customer: String) {
			self.customer = customer
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/customers/\(inputs.customer)/balance_transactions"
	}

	public final class FormInput: Codable {
		/// The integer amount in **%s** to apply to the customer's credit balance.
		public var amount: Int
		/// Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). If the customer's [`currency`](https://stripe.com/docs/api/customers/object#customer_object-currency) is set, this value must match it. If the customer's `currency` is not set, it will be updated to this value.
		public var currency: String
		/// An arbitrary string attached to the object. Often useful for displaying to users.
		public var description: String?
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?
		/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
		public var metadata: AnyCodable?

		public init(amount: Int, currency: String, description: String? = nil, expand: [String]? = nil, metadata: AnyCodable? = nil) {
			self.amount = amount
			self.currency = currency
			self.description = description
			self.expand = expand
			self.metadata = metadata
		}
	}

}

/// Retrieves a specific customer balance transaction that updated the customer’s <a href="/docs/billing/customer/balance">balances</a>.
public struct GetCustomersCustomerBalanceTransactionsTransaction: StripeAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = CustomerBalanceTransaction
	public typealias paramType = Params
	
	public struct Params {
		let customer: String
		let transaction: String

		/// Initialize the request parameters
		/// - Parameter customer: 
		/// - Parameter transaction: 
		public init(customer: String, transaction: String) {
			self.customer = customer
			self.transaction = transaction
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/customers/\(inputs.customer)/balance_transactions/\(inputs.transaction)"
	}
	public static var method: HTTPMethod { return .GET }

}

/// Most credit balance transaction fields are immutable, but you may update its <code>description</code> and <code>metadata</code>.
public struct PostCustomersCustomerBalanceTransactionsTransaction: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = CustomerBalanceTransaction
	public typealias paramType = Params
	
	public struct Params {
		let customer: String
		let transaction: String

		/// Initialize the request parameters
		/// - Parameter customer: 
		/// - Parameter transaction: 
		public init(customer: String, transaction: String) {
			self.customer = customer
			self.transaction = transaction
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/customers/\(inputs.customer)/balance_transactions/\(inputs.transaction)"
	}

	public final class FormInput: Codable {
		/// An arbitrary string attached to the object. Often useful for displaying to users.
		public var description: String?
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?
		/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
		public var metadata: AnyCodable?

		public init(description: String? = nil, expand: [String]? = nil, metadata: AnyCodable? = nil) {
			self.description = description
			self.expand = expand
			self.metadata = metadata
		}
	}

}

/// You can see a list of the bank accounts belonging to a Customer. Note that the 10 most recent sources are always available by default on the Customer. If you need more than those 10, you can use this API method and the <code>limit</code> and <code>starting_after</code> parameters to page through additional bank accounts.
public struct GetCustomersCustomerBankAccounts: StripeAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = BankAccountList
	public typealias paramType = Params
	
	public struct Params {
		let customer: String
		let ending_before: String?
		let limit: Int?
		let starting_after: String?

		/// Initialize the request parameters
		/// - Parameter customer: 
		/// - Parameter ending_before: A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list.
		/// - Parameter limit: A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10.
		/// - Parameter starting_after: A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list.
		public init(customer: String, ending_before: String? = nil, limit: Int? = nil, starting_after: String? = nil) {
			self.customer = customer
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
		return "/v1/customers/\(inputs.customer)/bank_accounts?\(query)"
	}
	public static var method: HTTPMethod { return .GET }

	public final class BankAccountList: Codable {
		/// Details about each object.
		public var data: [BankAccount]
		/// True if this list has another page of items after this one that can be fetched.
		public var has_more: Bool
		/// String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
		public var object: ObjectValues
		/// The URL where this list can be accessed.
		public var url: String

		public init(data: [BankAccount], has_more: Bool, object: ObjectValues, url: String) {
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

/// When you create a new credit card, you must specify a customer or recipient on which to create it.  If the card’s owner has no default card, then the new card will become the default. However, if the owner already has a default, then it will not change. To change the default, you should <a href="/docs/api#update_customer">update the customer</a> to have a new <code>default_source</code>.
public struct PostCustomersCustomerBankAccounts: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = PaymentSource
	public typealias paramType = Params
	
	public struct Params {
		let customer: String

		/// Initialize the request parameters
		/// - Parameter customer: 
		public init(customer: String) {
			self.customer = customer
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/customers/\(inputs.customer)/bank_accounts"
	}

	public final class FormInput: Codable {
		/// A token returned by [Stripe.js](https://stripe.com/docs/stripe.js) representing the user’s Alipay account details.
		public var alipay_account: String?
		/// Either a token, like the ones returned by [Stripe.js](https://stripe.com/docs/stripe.js), or a dictionary containing a user's bank account details.
		public var bank_account: AnyCodable?
		/// A token, like the ones returned by [Stripe.js](https://stripe.com/docs/stripe.js).
		public var card: AnyCodable?
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?
		/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
		public var metadata: Empty?
		/// Please refer to full [documentation](https://stripe.com/docs/api) instead.
		public var source: String?

		public init(alipay_account: String? = nil, bank_account: AnyCodable? = nil, card: AnyCodable? = nil, expand: [String]? = nil, metadata: Empty? = nil, source: String? = nil) {
			self.alipay_account = alipay_account
			self.bank_account = bank_account
			self.card = card
			self.expand = expand
			self.metadata = metadata
			self.source = source
		}
	}

}

/// By default, you can see the 10 most recent sources stored on a Customer directly on the object, but you can also retrieve details about a specific bank account stored on the Stripe account.
public struct GetCustomersCustomerBankAccountsId: StripeAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = BankAccount
	public typealias paramType = Params
	
	public struct Params {
		let customer: String
		let id: String

		/// Initialize the request parameters
		/// - Parameter customer: 
		/// - Parameter id: 
		public init(customer: String, id: String) {
			self.customer = customer
			self.id = id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/customers/\(inputs.customer)/bank_accounts/\(inputs.id)"
	}
	public static var method: HTTPMethod { return .GET }

}

/// Update a specified source for a given customer.
public struct PostCustomersCustomerBankAccountsId: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = Card
	public typealias paramType = Params
	
	public struct Params {
		let customer: String
		let id: String

		/// Initialize the request parameters
		/// - Parameter customer: 
		/// - Parameter id: 
		public init(customer: String, id: String) {
			self.customer = customer
			self.id = id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/customers/\(inputs.customer)/bank_accounts/\(inputs.id)"
	}

	public final class FormInput: Codable {
		/// The name of the person or business that owns the bank account.
		public var account_holder_name: String?
		/// The type of entity that holds the account. This can be either `individual` or `company`.
		public var account_holder_type: AccountHolderTypeValues?
		/// City/District/Suburb/Town/Village.
		public var address_city: String?
		/// Billing address country, if provided when creating card.
		public var address_country: String?
		/// Address line 1 (Street address/PO Box/Company name).
		public var address_line1: String?
		/// Address line 2 (Apartment/Suite/Unit/Building).
		public var address_line2: String?
		/// State/County/Province/Region.
		public var address_state: String?
		/// ZIP or postal code.
		public var address_zip: String?
		/// Two digit number representing the card’s expiration month.
		public var exp_month: String?
		/// Four digit number representing the card’s expiration year.
		public var exp_year: String?
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?
		/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
		public var metadata: AnyCodable?
		/// Cardholder name.
		public var name: String?
		public var owner: Owner?

		public init(account_holder_name: String? = nil, account_holder_type: AccountHolderTypeValues? = nil, address_city: String? = nil, address_country: String? = nil, address_line1: String? = nil, address_line2: String? = nil, address_state: String? = nil, address_zip: String? = nil, exp_month: String? = nil, exp_year: String? = nil, expand: [String]? = nil, metadata: AnyCodable? = nil, name: String? = nil, owner: Owner? = nil) {
			self.account_holder_name = account_holder_name
			self.account_holder_type = account_holder_type
			self.address_city = address_city
			self.address_country = address_country
			self.address_line1 = address_line1
			self.address_line2 = address_line2
			self.address_state = address_state
			self.address_zip = address_zip
			self.exp_month = exp_month
			self.exp_year = exp_year
			self.expand = expand
			self.metadata = metadata
			self.name = name
			self.owner = owner
		}


		public final class Owner: Codable {
			public var address: SourceAddress?
			public var email: String?
			public var name: String?
			public var phone: String?

			public init(address: SourceAddress? = nil, email: String? = nil, name: String? = nil, phone: String? = nil) {
				self.address = address
				self.email = email
				self.name = name
				self.phone = phone
			}


			public final class SourceAddress: Codable {
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


		public enum AccountHolderTypeValues: String, Codable {
			case company = "company"
			case individual = "individual"
		}
	}

}

/// Delete a specified source for a given customer.
public struct DeleteCustomersCustomerBankAccountsId: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = PaymentSource
	public typealias paramType = Params
	
	public struct Params {
		let customer: String
		let id: String

		/// Initialize the request parameters
		/// - Parameter customer: 
		/// - Parameter id: 
		public init(customer: String, id: String) {
			self.customer = customer
			self.id = id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/customers/\(inputs.customer)/bank_accounts/\(inputs.id)"
	}
	public static var method: HTTPMethod { return .DELETE }

	public final class FormInput: Codable {
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?

		public init(expand: [String]? = nil) {
			self.expand = expand
		}
	}

}

/// Verify a specified bank account for a given customer.
public struct PostCustomersCustomerBankAccountsIdVerify: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = BankAccount
	public typealias paramType = Params
	
	public struct Params {
		let customer: String
		let id: String

		/// Initialize the request parameters
		/// - Parameter customer: 
		/// - Parameter id: 
		public init(customer: String, id: String) {
			self.customer = customer
			self.id = id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/customers/\(inputs.customer)/bank_accounts/\(inputs.id)/verify"
	}

	public final class FormInput: Codable {
		/// Two positive integers, in *cents*, equal to the values of the microdeposits sent to the bank account.
		public var amounts: [Int]?
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?

		public init(amounts: [Int]? = nil, expand: [String]? = nil) {
			self.amounts = amounts
			self.expand = expand
		}
	}

}

/// You can see a list of the cards belonging to a customer. Note that the 10 most recent sources are always available on the <code>Customer</code> object. If you need more than those 10, you can use this API method and the <code>limit</code> and <code>starting_after</code> parameters to page through additional cards.
public struct GetCustomersCustomerCards: StripeAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = CardList
	public typealias paramType = Params
	
	public struct Params {
		let customer: String
		let ending_before: String?
		let limit: Int?
		let starting_after: String?

		/// Initialize the request parameters
		/// - Parameter customer: 
		/// - Parameter ending_before: A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list.
		/// - Parameter limit: A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10.
		/// - Parameter starting_after: A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list.
		public init(customer: String, ending_before: String? = nil, limit: Int? = nil, starting_after: String? = nil) {
			self.customer = customer
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
		return "/v1/customers/\(inputs.customer)/cards?\(query)"
	}
	public static var method: HTTPMethod { return .GET }

	public final class CardList: Codable {
		public var data: [Card]
		/// True if this list has another page of items after this one that can be fetched.
		public var has_more: Bool
		/// String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
		public var object: ObjectValues
		/// The URL where this list can be accessed.
		public var url: String

		public init(data: [Card], has_more: Bool, object: ObjectValues, url: String) {
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

/// When you create a new credit card, you must specify a customer or recipient on which to create it.  If the card’s owner has no default card, then the new card will become the default. However, if the owner already has a default, then it will not change. To change the default, you should <a href="/docs/api#update_customer">update the customer</a> to have a new <code>default_source</code>.
public struct PostCustomersCustomerCards: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = PaymentSource
	public typealias paramType = Params
	
	public struct Params {
		let customer: String

		/// Initialize the request parameters
		/// - Parameter customer: 
		public init(customer: String) {
			self.customer = customer
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/customers/\(inputs.customer)/cards"
	}

	public final class FormInput: Codable {
		/// A token returned by [Stripe.js](https://stripe.com/docs/stripe.js) representing the user’s Alipay account details.
		public var alipay_account: String?
		/// Either a token, like the ones returned by [Stripe.js](https://stripe.com/docs/stripe.js), or a dictionary containing a user's bank account details.
		public var bank_account: AnyCodable?
		/// A token, like the ones returned by [Stripe.js](https://stripe.com/docs/stripe.js).
		public var card: AnyCodable?
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?
		/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
		public var metadata: Empty?
		/// Please refer to full [documentation](https://stripe.com/docs/api) instead.
		public var source: String?

		public init(alipay_account: String? = nil, bank_account: AnyCodable? = nil, card: AnyCodable? = nil, expand: [String]? = nil, metadata: Empty? = nil, source: String? = nil) {
			self.alipay_account = alipay_account
			self.bank_account = bank_account
			self.card = card
			self.expand = expand
			self.metadata = metadata
			self.source = source
		}
	}

}

/// You can always see the 10 most recent cards directly on a customer; this method lets you retrieve details about a specific card stored on the customer.
public struct GetCustomersCustomerCardsId: StripeAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = Card
	public typealias paramType = Params
	
	public struct Params {
		let customer: String
		let id: String

		/// Initialize the request parameters
		/// - Parameter customer: 
		/// - Parameter id: 
		public init(customer: String, id: String) {
			self.customer = customer
			self.id = id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/customers/\(inputs.customer)/cards/\(inputs.id)"
	}
	public static var method: HTTPMethod { return .GET }

}

/// Update a specified source for a given customer.
public struct PostCustomersCustomerCardsId: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = Card
	public typealias paramType = Params
	
	public struct Params {
		let customer: String
		let id: String

		/// Initialize the request parameters
		/// - Parameter customer: 
		/// - Parameter id: 
		public init(customer: String, id: String) {
			self.customer = customer
			self.id = id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/customers/\(inputs.customer)/cards/\(inputs.id)"
	}

	public final class FormInput: Codable {
		/// The name of the person or business that owns the bank account.
		public var account_holder_name: String?
		/// The type of entity that holds the account. This can be either `individual` or `company`.
		public var account_holder_type: AccountHolderTypeValues?
		/// City/District/Suburb/Town/Village.
		public var address_city: String?
		/// Billing address country, if provided when creating card.
		public var address_country: String?
		/// Address line 1 (Street address/PO Box/Company name).
		public var address_line1: String?
		/// Address line 2 (Apartment/Suite/Unit/Building).
		public var address_line2: String?
		/// State/County/Province/Region.
		public var address_state: String?
		/// ZIP or postal code.
		public var address_zip: String?
		/// Two digit number representing the card’s expiration month.
		public var exp_month: String?
		/// Four digit number representing the card’s expiration year.
		public var exp_year: String?
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?
		/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
		public var metadata: AnyCodable?
		/// Cardholder name.
		public var name: String?
		public var owner: Owner?

		public init(account_holder_name: String? = nil, account_holder_type: AccountHolderTypeValues? = nil, address_city: String? = nil, address_country: String? = nil, address_line1: String? = nil, address_line2: String? = nil, address_state: String? = nil, address_zip: String? = nil, exp_month: String? = nil, exp_year: String? = nil, expand: [String]? = nil, metadata: AnyCodable? = nil, name: String? = nil, owner: Owner? = nil) {
			self.account_holder_name = account_holder_name
			self.account_holder_type = account_holder_type
			self.address_city = address_city
			self.address_country = address_country
			self.address_line1 = address_line1
			self.address_line2 = address_line2
			self.address_state = address_state
			self.address_zip = address_zip
			self.exp_month = exp_month
			self.exp_year = exp_year
			self.expand = expand
			self.metadata = metadata
			self.name = name
			self.owner = owner
		}


		public final class Owner: Codable {
			public var address: SourceAddress?
			public var email: String?
			public var name: String?
			public var phone: String?

			public init(address: SourceAddress? = nil, email: String? = nil, name: String? = nil, phone: String? = nil) {
				self.address = address
				self.email = email
				self.name = name
				self.phone = phone
			}


			public final class SourceAddress: Codable {
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


		public enum AccountHolderTypeValues: String, Codable {
			case company = "company"
			case individual = "individual"
		}
	}

}

/// Delete a specified source for a given customer.
public struct DeleteCustomersCustomerCardsId: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = PaymentSource
	public typealias paramType = Params
	
	public struct Params {
		let customer: String
		let id: String

		/// Initialize the request parameters
		/// - Parameter customer: 
		/// - Parameter id: 
		public init(customer: String, id: String) {
			self.customer = customer
			self.id = id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/customers/\(inputs.customer)/cards/\(inputs.id)"
	}
	public static var method: HTTPMethod { return .DELETE }

	public final class FormInput: Codable {
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?

		public init(expand: [String]? = nil) {
			self.expand = expand
		}
	}

}

public struct GetCustomersCustomerDiscount: StripeAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = Discount
	public typealias paramType = Params
	
	public struct Params {
		let customer: String

		/// Initialize the request parameters
		/// - Parameter customer: 
		public init(customer: String) {
			self.customer = customer
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/customers/\(inputs.customer)/discount"
	}
	public static var method: HTTPMethod { return .GET }

}

/// Removes the currently applied discount on a customer.
public struct DeleteCustomersCustomerDiscount: StripeAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = DeletedDiscount
	public typealias paramType = Params
	
	public struct Params {
		let customer: String

		/// Initialize the request parameters
		/// - Parameter customer: 
		public init(customer: String) {
			self.customer = customer
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/customers/\(inputs.customer)/discount"
	}
	public static var method: HTTPMethod { return .DELETE }

}

/// List sources for a specified customer.
public struct GetCustomersCustomerSources: StripeAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = ApmsSourcesSourceList
	public typealias paramType = Params
	
	public struct Params {
		let customer: String
		let ending_before: String?
		let limit: Int?
		let object: String?
		let starting_after: String?

		/// Initialize the request parameters
		/// - Parameter customer: 
		/// - Parameter ending_before: A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list.
		/// - Parameter limit: A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10.
		/// - Parameter object: Filter sources according to a particular object type.
		/// - Parameter starting_after: A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list.
		public init(customer: String, ending_before: String? = nil, limit: Int? = nil, object: String? = nil, starting_after: String? = nil) {
			self.customer = customer
			self.ending_before = ending_before
			self.limit = limit
			self.object = object
			self.starting_after = starting_after
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		var params = [String]()
		if let a = inputs.ending_before?.urlEncoded { params.append("ending_before=\(a)") }
		if let a = inputs.limit?.urlEncoded { params.append("limit=\(a)") }
		if let a = inputs.object?.urlEncoded { params.append("object=\(a)") }
		if let a = inputs.starting_after?.urlEncoded { params.append("starting_after=\(a)") }
		let query = params.joined(separator: "&")
		return "/v1/customers/\(inputs.customer)/sources?\(query)"
	}
	public static var method: HTTPMethod { return .GET }

	public final class ApmsSourcesSourceList: Codable {
		/// Details about each object.
		public var data: [AlipayAccount]
		/// True if this list has another page of items after this one that can be fetched.
		public var has_more: Bool
		/// String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
		public var object: ObjectValues
		/// The URL where this list can be accessed.
		public var url: String

		public init(data: [AlipayAccount], has_more: Bool, object: ObjectValues, url: String) {
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

/// When you create a new credit card, you must specify a customer or recipient on which to create it.  If the card’s owner has no default card, then the new card will become the default. However, if the owner already has a default, then it will not change. To change the default, you should <a href="/docs/api#update_customer">update the customer</a> to have a new <code>default_source</code>.
public struct PostCustomersCustomerSources: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = PaymentSource
	public typealias paramType = Params
	
	public struct Params {
		let customer: String

		/// Initialize the request parameters
		/// - Parameter customer: 
		public init(customer: String) {
			self.customer = customer
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/customers/\(inputs.customer)/sources"
	}

	public final class FormInput: Codable {
		/// A token returned by [Stripe.js](https://stripe.com/docs/stripe.js) representing the user’s Alipay account details.
		public var alipay_account: String?
		/// Either a token, like the ones returned by [Stripe.js](https://stripe.com/docs/stripe.js), or a dictionary containing a user's bank account details.
		public var bank_account: AnyCodable?
		/// A token, like the ones returned by [Stripe.js](https://stripe.com/docs/stripe.js).
		public var card: AnyCodable?
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?
		/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
		public var metadata: Empty?
		/// Please refer to full [documentation](https://stripe.com/docs/api) instead.
		public var source: String?

		public init(alipay_account: String? = nil, bank_account: AnyCodable? = nil, card: AnyCodable? = nil, expand: [String]? = nil, metadata: Empty? = nil, source: String? = nil) {
			self.alipay_account = alipay_account
			self.bank_account = bank_account
			self.card = card
			self.expand = expand
			self.metadata = metadata
			self.source = source
		}
	}

}

/// Retrieve a specified source for a given customer.
public struct GetCustomersCustomerSourcesId: StripeAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = PaymentSource
	public typealias paramType = Params
	
	public struct Params {
		let customer: String
		let id: String

		/// Initialize the request parameters
		/// - Parameter customer: 
		/// - Parameter id: 
		public init(customer: String, id: String) {
			self.customer = customer
			self.id = id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/customers/\(inputs.customer)/sources/\(inputs.id)"
	}
	public static var method: HTTPMethod { return .GET }

}

/// Update a specified source for a given customer.
public struct PostCustomersCustomerSourcesId: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = Card
	public typealias paramType = Params
	
	public struct Params {
		let customer: String
		let id: String

		/// Initialize the request parameters
		/// - Parameter customer: 
		/// - Parameter id: 
		public init(customer: String, id: String) {
			self.customer = customer
			self.id = id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/customers/\(inputs.customer)/sources/\(inputs.id)"
	}

	public final class FormInput: Codable {
		/// The name of the person or business that owns the bank account.
		public var account_holder_name: String?
		/// The type of entity that holds the account. This can be either `individual` or `company`.
		public var account_holder_type: AccountHolderTypeValues?
		/// City/District/Suburb/Town/Village.
		public var address_city: String?
		/// Billing address country, if provided when creating card.
		public var address_country: String?
		/// Address line 1 (Street address/PO Box/Company name).
		public var address_line1: String?
		/// Address line 2 (Apartment/Suite/Unit/Building).
		public var address_line2: String?
		/// State/County/Province/Region.
		public var address_state: String?
		/// ZIP or postal code.
		public var address_zip: String?
		/// Two digit number representing the card’s expiration month.
		public var exp_month: String?
		/// Four digit number representing the card’s expiration year.
		public var exp_year: String?
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?
		/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
		public var metadata: AnyCodable?
		/// Cardholder name.
		public var name: String?
		public var owner: Owner?

		public init(account_holder_name: String? = nil, account_holder_type: AccountHolderTypeValues? = nil, address_city: String? = nil, address_country: String? = nil, address_line1: String? = nil, address_line2: String? = nil, address_state: String? = nil, address_zip: String? = nil, exp_month: String? = nil, exp_year: String? = nil, expand: [String]? = nil, metadata: AnyCodable? = nil, name: String? = nil, owner: Owner? = nil) {
			self.account_holder_name = account_holder_name
			self.account_holder_type = account_holder_type
			self.address_city = address_city
			self.address_country = address_country
			self.address_line1 = address_line1
			self.address_line2 = address_line2
			self.address_state = address_state
			self.address_zip = address_zip
			self.exp_month = exp_month
			self.exp_year = exp_year
			self.expand = expand
			self.metadata = metadata
			self.name = name
			self.owner = owner
		}


		public final class Owner: Codable {
			public var address: SourceAddress?
			public var email: String?
			public var name: String?
			public var phone: String?

			public init(address: SourceAddress? = nil, email: String? = nil, name: String? = nil, phone: String? = nil) {
				self.address = address
				self.email = email
				self.name = name
				self.phone = phone
			}


			public final class SourceAddress: Codable {
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


		public enum AccountHolderTypeValues: String, Codable {
			case company = "company"
			case individual = "individual"
		}
	}

}

/// Delete a specified source for a given customer.
public struct DeleteCustomersCustomerSourcesId: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = PaymentSource
	public typealias paramType = Params
	
	public struct Params {
		let customer: String
		let id: String

		/// Initialize the request parameters
		/// - Parameter customer: 
		/// - Parameter id: 
		public init(customer: String, id: String) {
			self.customer = customer
			self.id = id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/customers/\(inputs.customer)/sources/\(inputs.id)"
	}
	public static var method: HTTPMethod { return .DELETE }

	public final class FormInput: Codable {
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?

		public init(expand: [String]? = nil) {
			self.expand = expand
		}
	}

}

/// Verify a specified bank account for a given customer.
public struct PostCustomersCustomerSourcesIdVerify: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = BankAccount
	public typealias paramType = Params
	
	public struct Params {
		let customer: String
		let id: String

		/// Initialize the request parameters
		/// - Parameter customer: 
		/// - Parameter id: 
		public init(customer: String, id: String) {
			self.customer = customer
			self.id = id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/customers/\(inputs.customer)/sources/\(inputs.id)/verify"
	}

	public final class FormInput: Codable {
		/// Two positive integers, in *cents*, equal to the values of the microdeposits sent to the bank account.
		public var amounts: [Int]?
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?

		public init(amounts: [Int]? = nil, expand: [String]? = nil) {
			self.amounts = amounts
			self.expand = expand
		}
	}

}

/// You can see a list of the customer’s active subscriptions. Note that the 10 most recent active subscriptions are always available by default on the customer object. If you need more than those 10, you can use the limit and starting_after parameters to page through additional subscriptions.
public struct GetCustomersCustomerSubscriptions: StripeAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = SubscriptionList
	public typealias paramType = Params
	
	public struct Params {
		let customer: String
		let ending_before: String?
		let limit: Int?
		let starting_after: String?

		/// Initialize the request parameters
		/// - Parameter customer: 
		/// - Parameter ending_before: A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list.
		/// - Parameter limit: A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10.
		/// - Parameter starting_after: A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list.
		public init(customer: String, ending_before: String? = nil, limit: Int? = nil, starting_after: String? = nil) {
			self.customer = customer
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
		return "/v1/customers/\(inputs.customer)/subscriptions?\(query)"
	}
	public static var method: HTTPMethod { return .GET }

	public final class SubscriptionList: Codable {
		/// Details about each object.
		public var data: [Subscription]
		/// True if this list has another page of items after this one that can be fetched.
		public var has_more: Bool
		/// String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
		public var object: ObjectValues
		/// The URL where this list can be accessed.
		public var url: String

		public init(data: [Subscription], has_more: Bool, object: ObjectValues, url: String) {
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

/// Creates a new subscription on an existing customer.
public struct PostCustomersCustomerSubscriptions: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = Subscription
	public typealias paramType = Params
	
	public struct Params {
		let customer: String

		/// Initialize the request parameters
		/// - Parameter customer: 
		public init(customer: String) {
			self.customer = customer
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/customers/\(inputs.customer)/subscriptions"
	}

	public final class FormInput: Codable {
		/// A list of prices and quantities that will generate invoice items appended to the first invoice for this subscription. You may pass up to 10 items.
		public var add_invoice_items: AnyCodable?
		/// A non-negative decimal between 0 and 100, with at most two decimal places. This represents the percentage of the subscription invoice subtotal that will be transferred to the application owner's Stripe account. The request must be made by a platform account on a connected account in order to set an application fee percentage. For more information, see the application fees [documentation](https://stripe.com/docs/connect/subscriptions#collecting-fees-on-subscriptions).
		public var application_fee_percent: StringNumber?
		/// For new subscriptions, a past timestamp to backdate the subscription's start date to. If set, the first invoice will contain a proration for the timespan between the start date and the current time. Can be combined with trials and the billing cycle anchor.
		public var backdate_start_date: Timestamp?
		/// A future timestamp to anchor the subscription's [billing cycle](https://stripe.com/docs/subscriptions/billing-cycle). This is used to determine the date of the first full invoice, and, for plans with `month` or `year` intervals, the day of the month for subsequent invoices.
		public var billing_cycle_anchor: Timestamp?
		/// Define thresholds at which an invoice will be sent, and the subscription advanced to a new billing period. Pass an empty string to remove previously-defined thresholds.
		public var billing_thresholds: AnyCodable?
		/// A timestamp at which the subscription should cancel. If set to a date before the current period ends, this will cause a proration if prorations have been enabled using `proration_behavior`. If set during a future period, this will always cause a proration for that period.
		public var cancel_at: Timestamp?
		/// Boolean indicating whether this subscription should cancel at the end of the current period.
		public var cancel_at_period_end: Bool?
		/// Either `charge_automatically`, or `send_invoice`. When charging automatically, Stripe will attempt to pay this subscription at the end of the cycle using the default source attached to the customer. When sending an invoice, Stripe will email your customer an invoice with payment instructions. Defaults to `charge_automatically`.
		public var collection_method: CollectionMethodValues?
		/// The code of the coupon to apply to this subscription. A coupon applied to a subscription will only affect invoices created for that particular subscription.
		public var coupon: String?
		/// Number of days a customer has to pay invoices generated by this subscription. Valid only for subscriptions where `collection_method` is set to `send_invoice`.
		public var days_until_due: Int?
		/// ID of the default payment method for the subscription. It must belong to the customer associated with the subscription. This takes precedence over `default_source`. If neither are set, invoices will use the customer's [invoice_settings.default_payment_method](https://stripe.com/docs/api/customers/object#customer_object-invoice_settings-default_payment_method) or [default_source](https://stripe.com/docs/api/customers/object#customer_object-default_source).
		public var default_payment_method: String?
		/// ID of the default payment source for the subscription. It must belong to the customer associated with the subscription and be in a chargeable state. If `default_payment_method` is also set, `default_payment_method` will take precedence. If neither are set, invoices will use the customer's [invoice_settings.default_payment_method](https://stripe.com/docs/api/customers/object#customer_object-invoice_settings-default_payment_method) or [default_source](https://stripe.com/docs/api/customers/object#customer_object-default_source).
		public var default_source: String?
		/// The tax rates that will apply to any subscription item that does not have `tax_rates` set. Invoices created will have their `default_tax_rates` populated from the subscription.
		public var default_tax_rates: AnyCodable?
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?
		/// A list of up to 20 subscription items, each with an attached price.
		public var items: AnyCodable?
		/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
		public var metadata: AnyCodable?
		/// Indicates if a customer is on or off-session while an invoice payment is attempted.
		public var off_session: Bool?
		/// Use `allow_incomplete` to create subscriptions with `status=incomplete` if the first invoice cannot be paid. Creating subscriptions with this status allows you to manage scenarios where additional user actions are needed to pay a subscription's invoice. For example, SCA regulation may require 3DS authentication to complete payment. See the [SCA Migration Guide](https://stripe.com/docs/billing/migration/strong-customer-authentication) for Billing to learn more. This is the default behavior.  Use `error_if_incomplete` if you want Stripe to return an HTTP 402 status code if a subscription's first invoice cannot be paid. For example, if a payment method requires 3DS authentication due to SCA regulation and further user action is needed, this parameter does not create a subscription and returns an error instead. This was the default behavior for API versions prior to 2019-03-14. See the [changelog](https://stripe.com/docs/upgrades#2019-03-14) to learn more.  `pending_if_incomplete` is only used with updates and cannot be passed when creating a subscription.
		public var payment_behavior: PaymentBehaviorValues?
		/// Specifies an interval for how often to bill for any pending invoice items. It is analogous to calling [Create an invoice](https://stripe.com/docs/api#create_invoice) for the given subscription at the specified interval.
		public var pending_invoice_item_interval: AnyCodable?
		/// The API ID of a promotion code to apply to this subscription. A promotion code applied to a subscription will only affect invoices created for that particular subscription.
		public var promotion_code: String?
		/// Determines how to handle [prorations](https://stripe.com/docs/subscriptions/billing-cycle#prorations) resulting from the `billing_cycle_anchor`. Valid values are `create_prorations` or `none`.  Passing `create_prorations` will cause proration invoice items to be created when applicable. Prorations can be disabled by passing `none`. If no value is passed, the default is `create_prorations`.
		public var proration_behavior: ProrationBehaviorValues?
		/// If specified, the funds from the subscription's invoices will be transferred to the destination and the ID of the resulting transfers will be found on the resulting charges.
		public var transfer_data: TransferDataSpecs?
		/// Unix timestamp representing the end of the trial period the customer will get before being charged for the first time. This will always overwrite any trials that might apply via a subscribed plan. If set, trial_end will override the default trial period of the plan the customer is being subscribed to. The special value `now` can be provided to end the customer's trial immediately. Can be at most two years from `billing_cycle_anchor`.
		public var trial_end: String?
		/// Indicates if a plan's `trial_period_days` should be applied to the subscription. Setting `trial_end` per subscription is preferred, and this defaults to `false`. Setting this flag to `true` together with `trial_end` is not allowed.
		public var trial_from_plan: Bool?
		/// Integer representing the number of trial period days before the customer is charged for the first time. This will always overwrite any trials that might apply via a subscribed plan.
		public var trial_period_days: Int?

		public init(add_invoice_items: AnyCodable? = nil, application_fee_percent: StringNumber? = nil, backdate_start_date: Timestamp? = nil, billing_cycle_anchor: Timestamp? = nil, billing_thresholds: AnyCodable? = nil, cancel_at: Timestamp? = nil, cancel_at_period_end: Bool? = nil, collection_method: CollectionMethodValues? = nil, coupon: String? = nil, days_until_due: Int? = nil, default_payment_method: String? = nil, default_source: String? = nil, default_tax_rates: AnyCodable? = nil, expand: [String]? = nil, items: AnyCodable? = nil, metadata: AnyCodable? = nil, off_session: Bool? = nil, payment_behavior: PaymentBehaviorValues? = nil, pending_invoice_item_interval: AnyCodable? = nil, promotion_code: String? = nil, proration_behavior: ProrationBehaviorValues? = nil, transfer_data: TransferDataSpecs? = nil, trial_end: String? = nil, trial_from_plan: Bool? = nil, trial_period_days: Int? = nil) {
			self.add_invoice_items = add_invoice_items
			self.application_fee_percent = application_fee_percent
			self.backdate_start_date = backdate_start_date
			self.billing_cycle_anchor = billing_cycle_anchor
			self.billing_thresholds = billing_thresholds
			self.cancel_at = cancel_at
			self.cancel_at_period_end = cancel_at_period_end
			self.collection_method = collection_method
			self.coupon = coupon
			self.days_until_due = days_until_due
			self.default_payment_method = default_payment_method
			self.default_source = default_source
			self.default_tax_rates = default_tax_rates
			self.expand = expand
			self.items = items
			self.metadata = metadata
			self.off_session = off_session
			self.payment_behavior = payment_behavior
			self.pending_invoice_item_interval = pending_invoice_item_interval
			self.promotion_code = promotion_code
			self.proration_behavior = proration_behavior
			self.transfer_data = transfer_data
			self.trial_end = trial_end
			self.trial_from_plan = trial_from_plan
			self.trial_period_days = trial_period_days
		}


		/// If specified, the funds from the subscription's invoices will be transferred to the destination and the ID of the resulting transfers will be found on the resulting charges.
		public final class TransferDataSpecs: Codable {
			public var amount_percent: StringNumber?
			public var destination: String

			/// If specified, the funds from the subscription's invoices will be transferred to the destination and the ID of the resulting transfers will be found on the resulting charges.
			/// - Parameters:
			///   - destination: 
			public init(destination: String, amount_percent: StringNumber? = nil) {
				self.destination = destination
				self.amount_percent = amount_percent
			}
		}


		public enum CollectionMethodValues: String, Codable {
			case chargeAutomatically = "charge_automatically"
			case sendInvoice = "send_invoice"
		}

		public enum PaymentBehaviorValues: String, Codable {
			case allowIncomplete = "allow_incomplete"
			case errorIfIncomplete = "error_if_incomplete"
			case pendingIfIncomplete = "pending_if_incomplete"
		}

		public enum ProrationBehaviorValues: String, Codable {
			case alwaysInvoice = "always_invoice"
			case createProrations = "create_prorations"
			case none = "none"
		}
	}

}

/// Retrieves the subscription with the given ID.
public struct GetCustomersCustomerSubscriptionsSubscriptionExposedId: StripeAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = Subscription
	public typealias paramType = Params
	
	public struct Params {
		let customer: String
		let subscription_exposed_id: String

		/// Initialize the request parameters
		/// - Parameter customer: 
		/// - Parameter subscription_exposed_id: 
		public init(customer: String, subscription_exposed_id: String) {
			self.customer = customer
			self.subscription_exposed_id = subscription_exposed_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/customers/\(inputs.customer)/subscriptions/\(inputs.subscription_exposed_id)"
	}
	public static var method: HTTPMethod { return .GET }

}

/// Updates an existing subscription on a customer to match the specified parameters. When changing plans or quantities, we will optionally prorate the price we charge next month to make up for any price changes. To preview how the proration will be calculated, use the <a href="#upcoming_invoice">upcoming invoice</a> endpoint.
public struct PostCustomersCustomerSubscriptionsSubscriptionExposedId: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = Subscription
	public typealias paramType = Params
	
	public struct Params {
		let customer: String
		let subscription_exposed_id: String

		/// Initialize the request parameters
		/// - Parameter customer: 
		/// - Parameter subscription_exposed_id: 
		public init(customer: String, subscription_exposed_id: String) {
			self.customer = customer
			self.subscription_exposed_id = subscription_exposed_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/customers/\(inputs.customer)/subscriptions/\(inputs.subscription_exposed_id)"
	}

	public final class FormInput: Codable {
		/// A list of prices and quantities that will generate invoice items appended to the first invoice for this subscription. You may pass up to 10 items.
		public var add_invoice_items: AnyCodable?
		/// A non-negative decimal between 0 and 100, with at most two decimal places. This represents the percentage of the subscription invoice subtotal that will be transferred to the application owner's Stripe account. The request must be made by a platform account on a connected account in order to set an application fee percentage. For more information, see the application fees [documentation](https://stripe.com/docs/connect/subscriptions#collecting-fees-on-subscriptions).
		public var application_fee_percent: StringNumber?
		/// Either `now` or `unchanged`. Setting the value to `now` resets the subscription's billing cycle anchor to the current time. For more information, see the billing cycle [documentation](https://stripe.com/docs/billing/subscriptions/billing-cycle).
		public var billing_cycle_anchor: BillingCycleAnchorValues?
		/// Define thresholds at which an invoice will be sent, and the subscription advanced to a new billing period. Pass an empty string to remove previously-defined thresholds.
		public var billing_thresholds: AnyCodable?
		/// A timestamp at which the subscription should cancel. If set to a date before the current period ends, this will cause a proration if prorations have been enabled using `proration_behavior`. If set during a future period, this will always cause a proration for that period.
		public var cancel_at: Int?
		/// Boolean indicating whether this subscription should cancel at the end of the current period.
		public var cancel_at_period_end: Bool?
		/// Either `charge_automatically`, or `send_invoice`. When charging automatically, Stripe will attempt to pay this subscription at the end of the cycle using the default source attached to the customer. When sending an invoice, Stripe will email your customer an invoice with payment instructions. Defaults to `charge_automatically`.
		public var collection_method: CollectionMethodValues?
		/// The code of the coupon to apply to this subscription. A coupon applied to a subscription will only affect invoices created for that particular subscription.
		public var coupon: String?
		/// Number of days a customer has to pay invoices generated by this subscription. Valid only for subscriptions where `collection_method` is set to `send_invoice`.
		public var days_until_due: Int?
		/// ID of the default payment method for the subscription. It must belong to the customer associated with the subscription. This takes precedence over `default_source`. If neither are set, invoices will use the customer's [invoice_settings.default_payment_method](https://stripe.com/docs/api/customers/object#customer_object-invoice_settings-default_payment_method) or [default_source](https://stripe.com/docs/api/customers/object#customer_object-default_source).
		public var default_payment_method: String?
		/// ID of the default payment source for the subscription. It must belong to the customer associated with the subscription and be in a chargeable state. If `default_payment_method` is also set, `default_payment_method` will take precedence. If neither are set, invoices will use the customer's [invoice_settings.default_payment_method](https://stripe.com/docs/api/customers/object#customer_object-invoice_settings-default_payment_method) or [default_source](https://stripe.com/docs/api/customers/object#customer_object-default_source).
		public var default_source: String?
		/// The tax rates that will apply to any subscription item that does not have `tax_rates` set. Invoices created will have their `default_tax_rates` populated from the subscription. Pass an empty string to remove previously-defined tax rates.
		public var default_tax_rates: AnyCodable?
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?
		/// A list of up to 20 subscription items, each with an attached price.
		public var items: AnyCodable?
		/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
		public var metadata: AnyCodable?
		/// Indicates if a customer is on or off-session while an invoice payment is attempted.
		public var off_session: Bool?
		/// If specified, payment collection for this subscription will be paused.
		public var pause_collection: AnyCodable?
		/// Use `allow_incomplete` to transition the subscription to `status=past_due` if a payment is required but cannot be paid. This allows you to manage scenarios where additional user actions are needed to pay a subscription's invoice. For example, SCA regulation may require 3DS authentication to complete payment. See the [SCA Migration Guide](https://stripe.com/docs/billing/migration/strong-customer-authentication) for Billing to learn more. This is the default behavior.  Use `pending_if_incomplete` to update the subscription using [pending updates](https://stripe.com/docs/billing/subscriptions/pending-updates). When you use `pending_if_incomplete` you can only pass the parameters [supported by pending updates](https://stripe.com/docs/billing/pending-updates-reference#supported-attributes).  Use `error_if_incomplete` if you want Stripe to return an HTTP 402 status code if a subscription's invoice cannot be paid. For example, if a payment method requires 3DS authentication due to SCA regulation and further user action is needed, this parameter does not update the subscription and returns an error instead. This was the default behavior for API versions prior to 2019-03-14. See the [changelog](https://stripe.com/docs/upgrades#2019-03-14) to learn more.
		public var payment_behavior: PaymentBehaviorValues?
		/// Specifies an interval for how often to bill for any pending invoice items. It is analogous to calling [Create an invoice](https://stripe.com/docs/api#create_invoice) for the given subscription at the specified interval.
		public var pending_invoice_item_interval: AnyCodable?
		/// The promotion code to apply to this subscription. A promotion code applied to a subscription will only affect invoices created for that particular subscription.
		public var promotion_code: String?
		/// Determines how to handle [prorations](https://stripe.com/docs/subscriptions/billing-cycle#prorations) when the billing cycle changes (e.g., when switching plans, resetting `billing_cycle_anchor=now`, or starting a trial), or if an item's `quantity` changes. Valid values are `create_prorations`, `none`, or `always_invoice`.  Passing `create_prorations` will cause proration invoice items to be created when applicable. These proration items will only be invoiced immediately under [certain conditions](https://stripe.com/docs/subscriptions/upgrading-downgrading#immediate-payment). In order to always invoice immediately for prorations, pass `always_invoice`.  Prorations can be disabled by passing `none`.
		public var proration_behavior: ProrationBehaviorValues?
		/// If set, the proration will be calculated as though the subscription was updated at the given time. This can be used to apply exactly the same proration that was previewed with [upcoming invoice](https://stripe.com/docs/api#retrieve_customer_invoice) endpoint. It can also be used to implement custom proration logic, such as prorating by day instead of by second, by providing the time that you wish to use for proration calculations.
		public var proration_date: Timestamp?
		/// If specified, the funds from the subscription's invoices will be transferred to the destination and the ID of the resulting transfers will be found on the resulting charges. This will be unset if you POST an empty value.
		public var transfer_data: AnyCodable?
		/// Unix timestamp representing the end of the trial period the customer will get before being charged for the first time. This will always overwrite any trials that might apply via a subscribed plan. If set, trial_end will override the default trial period of the plan the customer is being subscribed to. The special value `now` can be provided to end the customer's trial immediately. Can be at most two years from `billing_cycle_anchor`.
		public var trial_end: String?
		/// Indicates if a plan's `trial_period_days` should be applied to the subscription. Setting `trial_end` per subscription is preferred, and this defaults to `false`. Setting this flag to `true` together with `trial_end` is not allowed.
		public var trial_from_plan: Bool?

		public init(add_invoice_items: AnyCodable? = nil, application_fee_percent: StringNumber? = nil, billing_cycle_anchor: BillingCycleAnchorValues? = nil, billing_thresholds: AnyCodable? = nil, cancel_at: Int? = nil, cancel_at_period_end: Bool? = nil, collection_method: CollectionMethodValues? = nil, coupon: String? = nil, days_until_due: Int? = nil, default_payment_method: String? = nil, default_source: String? = nil, default_tax_rates: AnyCodable? = nil, expand: [String]? = nil, items: AnyCodable? = nil, metadata: AnyCodable? = nil, off_session: Bool? = nil, pause_collection: AnyCodable? = nil, payment_behavior: PaymentBehaviorValues? = nil, pending_invoice_item_interval: AnyCodable? = nil, promotion_code: String? = nil, proration_behavior: ProrationBehaviorValues? = nil, proration_date: Timestamp? = nil, transfer_data: AnyCodable? = nil, trial_end: String? = nil, trial_from_plan: Bool? = nil) {
			self.add_invoice_items = add_invoice_items
			self.application_fee_percent = application_fee_percent
			self.billing_cycle_anchor = billing_cycle_anchor
			self.billing_thresholds = billing_thresholds
			self.cancel_at = cancel_at
			self.cancel_at_period_end = cancel_at_period_end
			self.collection_method = collection_method
			self.coupon = coupon
			self.days_until_due = days_until_due
			self.default_payment_method = default_payment_method
			self.default_source = default_source
			self.default_tax_rates = default_tax_rates
			self.expand = expand
			self.items = items
			self.metadata = metadata
			self.off_session = off_session
			self.pause_collection = pause_collection
			self.payment_behavior = payment_behavior
			self.pending_invoice_item_interval = pending_invoice_item_interval
			self.promotion_code = promotion_code
			self.proration_behavior = proration_behavior
			self.proration_date = proration_date
			self.transfer_data = transfer_data
			self.trial_end = trial_end
			self.trial_from_plan = trial_from_plan
		}

		public enum BillingCycleAnchorValues: String, Codable {
			case now = "now"
			case unchanged = "unchanged"
		}

		public enum CollectionMethodValues: String, Codable {
			case chargeAutomatically = "charge_automatically"
			case sendInvoice = "send_invoice"
		}

		public enum PaymentBehaviorValues: String, Codable {
			case allowIncomplete = "allow_incomplete"
			case errorIfIncomplete = "error_if_incomplete"
			case pendingIfIncomplete = "pending_if_incomplete"
		}

		public enum ProrationBehaviorValues: String, Codable {
			case alwaysInvoice = "always_invoice"
			case createProrations = "create_prorations"
			case none = "none"
		}
	}

}

/// Cancels a customer’s subscription. If you set the <code>at_period_end</code> parameter to <code>true</code>, the subscription will remain active until the end of the period, at which point it will be canceled and not renewed. Otherwise, with the default <code>false</code> value, the subscription is terminated immediately. In either case, the customer will not be charged again for the subscription.  Note, however, that any pending invoice items that you’ve created will still be charged for at the end of the period, unless manually <a href="#delete_invoiceitem">deleted</a>. If you’ve set the subscription to cancel at the end of the period, any pending prorations will also be left in place and collected at the end of the period. But if the subscription is set to cancel immediately, pending prorations will be removed.  By default, upon subscription cancellation, Stripe will stop automatic collection of all finalized invoices for the customer. This is intended to prevent unexpected payment attempts after the customer has canceled a subscription. However, you can resume automatic collection of the invoices manually after subscription cancellation to have us proceed. Or, you could check for unpaid invoices before allowing the customer to cancel the subscription at all.
public struct DeleteCustomersCustomerSubscriptionsSubscriptionExposedId: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = Subscription
	public typealias paramType = Params
	
	public struct Params {
		let customer: String
		let subscription_exposed_id: String

		/// Initialize the request parameters
		/// - Parameter customer: 
		/// - Parameter subscription_exposed_id: 
		public init(customer: String, subscription_exposed_id: String) {
			self.customer = customer
			self.subscription_exposed_id = subscription_exposed_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/customers/\(inputs.customer)/subscriptions/\(inputs.subscription_exposed_id)"
	}
	public static var method: HTTPMethod { return .DELETE }

	public final class FormInput: Codable {
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?
		/// Can be set to `true` if `at_period_end` is not set to `true`. Will generate a final invoice that invoices for any un-invoiced metered usage and new/pending proration invoice items.
		public var invoice_now: Bool?
		/// Can be set to `true` if `at_period_end` is not set to `true`. Will generate a proration invoice item that credits remaining unused time until the subscription period end.
		public var prorate: Bool?

		public init(expand: [String]? = nil, invoice_now: Bool? = nil, prorate: Bool? = nil) {
			self.expand = expand
			self.invoice_now = invoice_now
			self.prorate = prorate
		}
	}

}

public struct GetCustomersCustomerSubscriptionsSubscriptionExposedIdDiscount: StripeAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = Discount
	public typealias paramType = Params
	
	public struct Params {
		let customer: String
		let subscription_exposed_id: String

		/// Initialize the request parameters
		/// - Parameter customer: 
		/// - Parameter subscription_exposed_id: 
		public init(customer: String, subscription_exposed_id: String) {
			self.customer = customer
			self.subscription_exposed_id = subscription_exposed_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/customers/\(inputs.customer)/subscriptions/\(inputs.subscription_exposed_id)/discount"
	}
	public static var method: HTTPMethod { return .GET }

}

/// Removes the currently applied discount on a customer.
public struct DeleteCustomersCustomerSubscriptionsSubscriptionExposedIdDiscount: StripeAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = DeletedDiscount
	public typealias paramType = Params
	
	public struct Params {
		let customer: String
		let subscription_exposed_id: String

		/// Initialize the request parameters
		/// - Parameter customer: 
		/// - Parameter subscription_exposed_id: 
		public init(customer: String, subscription_exposed_id: String) {
			self.customer = customer
			self.subscription_exposed_id = subscription_exposed_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/customers/\(inputs.customer)/subscriptions/\(inputs.subscription_exposed_id)/discount"
	}
	public static var method: HTTPMethod { return .DELETE }

}

/// Returns a list of tax IDs for a customer.
public struct GetCustomersCustomerTaxIds: StripeAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = TaxIDsList
	public typealias paramType = Params
	
	public struct Params {
		let customer: String
		let ending_before: String?
		let limit: Int?
		let starting_after: String?

		/// Initialize the request parameters
		/// - Parameter customer: 
		/// - Parameter ending_before: A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list.
		/// - Parameter limit: A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10.
		/// - Parameter starting_after: A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list.
		public init(customer: String, ending_before: String? = nil, limit: Int? = nil, starting_after: String? = nil) {
			self.customer = customer
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
		return "/v1/customers/\(inputs.customer)/tax_ids?\(query)"
	}
	public static var method: HTTPMethod { return .GET }

	public final class TaxIDsList: Codable {
		/// Details about each object.
		public var data: [TaxId]
		/// True if this list has another page of items after this one that can be fetched.
		public var has_more: Bool
		/// String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
		public var object: ObjectValues
		/// The URL where this list can be accessed.
		public var url: String

		public init(data: [TaxId], has_more: Bool, object: ObjectValues, url: String) {
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

/// Creates a new <code>TaxID</code> object for a customer.
public struct PostCustomersCustomerTaxIds: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = TaxId
	public typealias paramType = Params
	
	public struct Params {
		let customer: String

		/// Initialize the request parameters
		/// - Parameter customer: 
		public init(customer: String) {
			self.customer = customer
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/customers/\(inputs.customer)/tax_ids"
	}

	public final class FormInput: Codable {
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?
		/// Type of the tax ID, one of `ae_trn`, `au_abn`, `br_cnpj`, `br_cpf`, `ca_bn`, `ca_qst`, `ch_vat`, `cl_tin`, `es_cif`, `eu_vat`, `hk_br`, `id_npwp`, `in_gst`, `jp_cn`, `jp_rn`, `kr_brn`, `li_uid`, `mx_rfc`, `my_frp`, `my_itn`, `my_sst`, `no_vat`, `nz_gst`, `ru_inn`, `ru_kpp`, `sa_vat`, `sg_gst`, `sg_uen`, `th_vat`, `tw_vat`, `us_ein`, or `za_vat`
		public var type: TypeValues
		/// Value of the tax ID.
		public var value: String

		public init(type: TypeValues, value: String, expand: [String]? = nil) {
			self.type = type
			self.value = value
			self.expand = expand
		}

		public enum TypeValues: String, Codable {
			case aeTrn = "ae_trn"
			case auAbn = "au_abn"
			case brCnpj = "br_cnpj"
			case brCpf = "br_cpf"
			case caBn = "ca_bn"
			case caQst = "ca_qst"
			case chVat = "ch_vat"
			case clTin = "cl_tin"
			case esCif = "es_cif"
			case euVat = "eu_vat"
			case hkBr = "hk_br"
			case idNpwp = "id_npwp"
			case inGst = "in_gst"
			case jpCn = "jp_cn"
			case jpRn = "jp_rn"
			case krBrn = "kr_brn"
			case liUid = "li_uid"
			case mxRfc = "mx_rfc"
			case myFrp = "my_frp"
			case myItn = "my_itn"
			case mySst = "my_sst"
			case noVat = "no_vat"
			case nzGst = "nz_gst"
			case ruInn = "ru_inn"
			case ruKpp = "ru_kpp"
			case saVat = "sa_vat"
			case sgGst = "sg_gst"
			case sgUen = "sg_uen"
			case thVat = "th_vat"
			case twVat = "tw_vat"
			case usEin = "us_ein"
			case zaVat = "za_vat"
		}
	}

}

/// Retrieves the <code>TaxID</code> object with the given identifier.
public struct GetCustomersCustomerTaxIdsId: StripeAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = TaxId
	public typealias paramType = Params
	
	public struct Params {
		let customer: String
		let id: String

		/// Initialize the request parameters
		/// - Parameter customer: 
		/// - Parameter id: 
		public init(customer: String, id: String) {
			self.customer = customer
			self.id = id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/customers/\(inputs.customer)/tax_ids/\(inputs.id)"
	}
	public static var method: HTTPMethod { return .GET }

}

/// Deletes an existing <code>TaxID</code> object.
public struct DeleteCustomersCustomerTaxIdsId: StripeAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = DeletedTaxId
	public typealias paramType = Params
	
	public struct Params {
		let customer: String
		let id: String

		/// Initialize the request parameters
		/// - Parameter customer: 
		/// - Parameter id: 
		public init(customer: String, id: String) {
			self.customer = customer
			self.id = id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/customers/\(inputs.customer)/tax_ids/\(inputs.id)"
	}
	public static var method: HTTPMethod { return .DELETE }

}
