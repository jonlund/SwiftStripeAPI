
/// Returns a list of PaymentMethods for a given Customer
public struct GetPaymentMethods: StripeAPIEndpoint {
	public typealias inputType = AnyCodable
	public typealias outputType = PaymentFlowsPaymentMethodList
	public typealias paramType = Params
	
	public struct Params {
		let customer: String
		let type: String
		let ending_before: String?
		let limit: Int?
		let starting_after: String?

		/// Initialize the request parameters
		/// - Parameter customer: The ID of the customer whose PaymentMethods will be retrieved.
		/// - Parameter type: A required filter on the list, based on the object `type` field.
		/// - Parameter ending_before: A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list.
		/// - Parameter limit: A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10.
		/// - Parameter starting_after: A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list.
		public init(customer: String, type: String, ending_before: String? = nil, limit: Int? = nil, starting_after: String? = nil) {
			self.customer = customer
			self.type = type
			self.ending_before = ending_before
			self.limit = limit
			self.starting_after = starting_after
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		var params = [String]()
		params.append("customer=\(inputs.customer.urlEncoded)")
		params.append("type=\(inputs.type.urlEncoded)")
		if let a = inputs.ending_before?.urlEncoded { params.append("ending_before=\(a)") }
		if let a = inputs.limit?.urlEncoded { params.append("limit=\(a)") }
		if let a = inputs.starting_after?.urlEncoded { params.append("starting_after=\(a)") }
		let query = params.joined(separator: "&")
		return "/v1/payment_methods?\(query)"
	}
	public static var method: HTTPMethod { return .GET }

	public final class PaymentFlowsPaymentMethodList: Codable {
		public var data: [PaymentMethod]
		/// True if this list has another page of items after this one that can be fetched.
		public var has_more: Bool
		/// String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
		public var object: ObjectValues
		/// The URL where this list can be accessed.
		public var url: String

		public init(data: [PaymentMethod], has_more: Bool, object: ObjectValues, url: String) {
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

/// Creates a PaymentMethod object. Read the <a href="/docs/stripe-js/reference#stripe-create-payment-method">Stripe.js reference</a> to learn how to create PaymentMethods via Stripe.js.  Instead of creating a PaymentMethod directly, we recommend using the <a href="/docs/payments/accept-a-payment">PaymentIntents</a> API to accept a payment immediately or the <a href="/docs/payments/save-and-reuse">SetupIntent</a> API to collect payment method details ahead of a future payment.
public struct PostPaymentMethods: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = PaymentMethod
	public typealias paramType = AnyCodable
	public static func endpoint(for inputs: AnyCodable) throws -> String {
		return "/v1/payment_methods"
	}

	public final class FormInput: Codable {
		/// If this is an `acss_debit` PaymentMethod, this hash contains details about the ACSS Debit payment method.
		public var acss_debit: PaymentMethodParam?
		/// If this is an `AfterpayClearpay` PaymentMethod, this hash contains details about the AfterpayClearpay payment method.
		public var afterpay_clearpay: Param?
		/// If this is an `Alipay` PaymentMethod, this hash contains details about the Alipay payment method.
		public var alipay: Param?
		/// If this is an `au_becs_debit` PaymentMethod, this hash contains details about the bank account.
		public var au_becs_debit: Param?
		/// If this is a `bacs_debit` PaymentMethod, this hash contains details about the Bacs Direct Debit bank account.
		public var bacs_debit: Param?
		/// If this is a `bancontact` PaymentMethod, this hash contains details about the Bancontact payment method.
		public var bancontact: Param?
		/// Billing information associated with the PaymentMethod that may be used or required by particular types of payment methods.
		public var billing_details: BillingDetailsInnerParams?
		/// If this is a `boleto` PaymentMethod, this hash contains details about the Boleto payment method.
		public var boleto: Param?
		/// If this is a `card` PaymentMethod, this hash contains the user's card details. For backwards compatibility, you can alternatively provide a Stripe token (e.g., for Apple Pay, Amex Express Checkout, or legacy Checkout) into the card hash with format `card: {token: "tok_visa"}`. When providing a card number, you must meet the requirements for [PCI compliance](https://stripe.com/docs/security#validating-pci-compliance). We strongly recommend using Stripe.js instead of interacting with this API directly.
		public var card: AnyCodable?
		/// The `Customer` to whom the original PaymentMethod is attached.
		public var customer: String?
		/// If this is an `eps` PaymentMethod, this hash contains details about the EPS payment method.
		public var eps: Param?
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?
		/// If this is an `fpx` PaymentMethod, this hash contains details about the FPX payment method.
		public var fpx: Param?
		/// If this is a `giropay` PaymentMethod, this hash contains details about the Giropay payment method.
		public var giropay: Param?
		/// If this is a `grabpay` PaymentMethod, this hash contains details about the GrabPay payment method.
		public var grabpay: Param?
		/// If this is an `ideal` PaymentMethod, this hash contains details about the iDEAL payment method.
		public var ideal: Param?
		/// If this is an `interac_present` PaymentMethod, this hash contains details about the Interac Present payment method.
		public var interac_present: Param?
		/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
		public var metadata: AnyCodable?
		/// If this is an `oxxo` PaymentMethod, this hash contains details about the OXXO payment method.
		public var oxxo: Param?
		/// If this is a `p24` PaymentMethod, this hash contains details about the P24 payment method.
		public var p24: Param?
		/// The PaymentMethod to share.
		public var payment_method: String?
		/// If this is a `sepa_debit` PaymentMethod, this hash contains details about the SEPA debit bank account.
		public var sepa_debit: Param?
		/// If this is a `sofort` PaymentMethod, this hash contains details about the SOFORT payment method.
		public var sofort: Param?
		/// The type of the PaymentMethod. An additional hash is included on the PaymentMethod with a name matching this value. It contains additional information specific to the PaymentMethod type.
		public var type: TypeValues?
		/// If this is an `wechat_pay` PaymentMethod, this hash contains details about the wechat_pay payment method.
		public var wechat_pay: Param?

		public init(acss_debit: PaymentMethodParam? = nil, afterpay_clearpay: Param? = nil, alipay: Param? = nil, au_becs_debit: Param? = nil, bacs_debit: Param? = nil, bancontact: Param? = nil, billing_details: BillingDetailsInnerParams? = nil, boleto: Param? = nil, card: AnyCodable? = nil, customer: String? = nil, eps: Param? = nil, expand: [String]? = nil, fpx: Param? = nil, giropay: Param? = nil, grabpay: Param? = nil, ideal: Param? = nil, interac_present: Param? = nil, metadata: AnyCodable? = nil, oxxo: Param? = nil, p24: Param? = nil, payment_method: String? = nil, sepa_debit: Param? = nil, sofort: Param? = nil, type: TypeValues? = nil, wechat_pay: Param? = nil) {
			self.acss_debit = acss_debit
			self.afterpay_clearpay = afterpay_clearpay
			self.alipay = alipay
			self.au_becs_debit = au_becs_debit
			self.bacs_debit = bacs_debit
			self.bancontact = bancontact
			self.billing_details = billing_details
			self.boleto = boleto
			self.card = card
			self.customer = customer
			self.eps = eps
			self.expand = expand
			self.fpx = fpx
			self.giropay = giropay
			self.grabpay = grabpay
			self.ideal = ideal
			self.interac_present = interac_present
			self.metadata = metadata
			self.oxxo = oxxo
			self.p24 = p24
			self.payment_method = payment_method
			self.sepa_debit = sepa_debit
			self.sofort = sofort
			self.type = type
			self.wechat_pay = wechat_pay
		}


		/// Billing information associated with the PaymentMethod that may be used or required by particular types of payment methods.
		public final class BillingDetailsInnerParams: Codable {
			public var address: AnyCodable?
			public var email: String?
			public var name: String?
			public var phone: String?

			/// Billing information associated with the PaymentMethod that may be used or required by particular types of payment methods.
			/// - Parameters:
			public init(address: AnyCodable? = nil, email: String? = nil, name: String? = nil, phone: String? = nil) {
				self.address = address
				self.email = email
				self.name = name
				self.phone = phone
			}
		}



		/// If this is an `wechat_pay` PaymentMethod, this hash contains details about the wechat_pay payment method.
		public final class Param: Codable {

			/// If this is an `wechat_pay` PaymentMethod, this hash contains details about the wechat_pay payment method.
			public init() {
			}
		}



		/// If this is an `acss_debit` PaymentMethod, this hash contains details about the ACSS Debit payment method.
		public final class PaymentMethodParam: Codable {
			public var account_number: String
			public var institution_number: String
			public var transit_number: String

			/// If this is an `acss_debit` PaymentMethod, this hash contains details about the ACSS Debit payment method.
			/// - Parameters:
			///   - account_number: 
			///   - institution_number: 
			///   - transit_number: 
			public init(account_number: String, institution_number: String, transit_number: String) {
				self.account_number = account_number
				self.institution_number = institution_number
				self.transit_number = transit_number
			}
		}


		public enum TypeValues: String, Codable {
			case acssDebit = "acss_debit"
			case afterpayClearpay = "afterpay_clearpay"
			case alipay = "alipay"
			case auBecsDebit = "au_becs_debit"
			case bacsDebit = "bacs_debit"
			case bancontact = "bancontact"
			case boleto = "boleto"
			case card = "card"
			case eps = "eps"
			case fpx = "fpx"
			case giropay = "giropay"
			case grabpay = "grabpay"
			case ideal = "ideal"
			case oxxo = "oxxo"
			case p24 = "p24"
			case sepaDebit = "sepa_debit"
			case sofort = "sofort"
			case wechatPay = "wechat_pay"
		}
	}

}

/// Retrieves a PaymentMethod object.
public struct GetPaymentMethodsPaymentMethod: StripeAPIEndpoint {
	public typealias inputType = AnyCodable
	public typealias outputType = PaymentMethod
	public typealias paramType = Params
	
	public struct Params {
		let payment_method: String

		/// Initialize the request parameters
		/// - Parameter payment_method: 
		public init(payment_method: String) {
			self.payment_method = payment_method
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/payment_methods/\(inputs.payment_method)"
	}
	public static var method: HTTPMethod { return .GET }

}

/// Updates a PaymentMethod object. A PaymentMethod must be attached a customer to be updated.
public struct PostPaymentMethodsPaymentMethod: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = PaymentMethod
	public typealias paramType = Params
	
	public struct Params {
		let payment_method: String

		/// Initialize the request parameters
		/// - Parameter payment_method: 
		public init(payment_method: String) {
			self.payment_method = payment_method
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/payment_methods/\(inputs.payment_method)"
	}

	public final class FormInput: Codable {
		/// Billing information associated with the PaymentMethod that may be used or required by particular types of payment methods.
		public var billing_details: BillingDetailsInnerParams?
		/// If this is a `card` PaymentMethod, this hash contains the user's card details.
		public var card: UpdateApiParam?
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?
		/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
		public var metadata: AnyCodable?

		public init(billing_details: BillingDetailsInnerParams? = nil, card: UpdateApiParam? = nil, expand: [String]? = nil, metadata: AnyCodable? = nil) {
			self.billing_details = billing_details
			self.card = card
			self.expand = expand
			self.metadata = metadata
		}


		/// Billing information associated with the PaymentMethod that may be used or required by particular types of payment methods.
		public final class BillingDetailsInnerParams: Codable {
			public var address: AnyCodable?
			public var email: String?
			public var name: String?
			public var phone: String?

			/// Billing information associated with the PaymentMethod that may be used or required by particular types of payment methods.
			/// - Parameters:
			public init(address: AnyCodable? = nil, email: String? = nil, name: String? = nil, phone: String? = nil) {
				self.address = address
				self.email = email
				self.name = name
				self.phone = phone
			}
		}



		/// If this is a `card` PaymentMethod, this hash contains the user's card details.
		public final class UpdateApiParam: Codable {
			public var exp_month: Int?
			public var exp_year: Int?

			/// If this is a `card` PaymentMethod, this hash contains the user's card details.
			/// - Parameters:
			public init(exp_month: Int? = nil, exp_year: Int? = nil) {
				self.exp_month = exp_month
				self.exp_year = exp_year
			}
		}

	}

}

/// Attaches a PaymentMethod object to a Customer.  To attach a new PaymentMethod to a customer for future payments, we recommend you use a <a href="/docs/api/setup_intents">SetupIntent</a> or a PaymentIntent with <a href="/docs/api/payment_intents/create#create_payment_intent-setup_future_usage">setup_future_usage</a>. These approaches will perform any necessary steps to ensure that the PaymentMethod can be used in a future payment. Using the <code>/v1/payment_methods/:id/attach</code> endpoint does not ensure that future payments can be made with the attached PaymentMethod. See <a href="/docs/payments/payment-intents#future-usage">Optimizing cards for future payments</a> for more information about setting up future payments.  To use this PaymentMethod as the default for invoice or subscription payments, set <a href="/docs/api/customers/update#update_customer-invoice_settings-default_payment_method"><code>invoice_settings.default_payment_method</code></a>, on the Customer to the PaymentMethod’s ID.
public struct PostPaymentMethodsPaymentMethodAttach: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = PaymentMethod
	public typealias paramType = Params
	
	public struct Params {
		let payment_method: String

		/// Initialize the request parameters
		/// - Parameter payment_method: 
		public init(payment_method: String) {
			self.payment_method = payment_method
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/payment_methods/\(inputs.payment_method)/attach"
	}

	public final class FormInput: Codable {
		/// The ID of the customer to which to attach the PaymentMethod.
		public var customer: String
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?

		public init(customer: String, expand: [String]? = nil) {
			self.customer = customer
			self.expand = expand
		}
	}

}

/// Detaches a PaymentMethod object from a Customer.
public struct PostPaymentMethodsPaymentMethodDetach: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = PaymentMethod
	public typealias paramType = Params
	
	public struct Params {
		let payment_method: String

		/// Initialize the request parameters
		/// - Parameter payment_method: 
		public init(payment_method: String) {
			self.payment_method = payment_method
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/payment_methods/\(inputs.payment_method)/detach"
	}

	public final class FormInput: Codable {
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?

		public init(expand: [String]? = nil) {
			self.expand = expand
		}
	}

}
