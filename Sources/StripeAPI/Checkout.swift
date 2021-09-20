
/// Returns a list of Checkout Sessions.
public struct GetCheckoutSessions: StripeAPIEndpoint {
	public typealias inputType = AnyCodable
	public typealias outputType = PaymentPagesCheckoutSessionList
	public typealias paramType = Params
	
	public struct Params {
		let ending_before: String?
		let limit: Int?
		let payment_intent: String?
		let starting_after: String?
		let subscription: String?

		/// Initialize the request parameters
		/// - Parameter ending_before: A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list.
		/// - Parameter limit: A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10.
		/// - Parameter payment_intent: Only return the Checkout Session for the PaymentIntent specified.
		/// - Parameter starting_after: A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list.
		/// - Parameter subscription: Only return the Checkout Session for the subscription specified.
		public init(ending_before: String? = nil, limit: Int? = nil, payment_intent: String? = nil, starting_after: String? = nil, subscription: String? = nil) {
			self.ending_before = ending_before
			self.limit = limit
			self.payment_intent = payment_intent
			self.starting_after = starting_after
			self.subscription = subscription
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		var params = [String]()
		if let a = inputs.ending_before?.urlEncoded { params.append("ending_before=\(a)") }
		if let a = inputs.limit?.urlEncoded { params.append("limit=\(a)") }
		if let a = inputs.payment_intent?.urlEncoded { params.append("payment_intent=\(a)") }
		if let a = inputs.starting_after?.urlEncoded { params.append("starting_after=\(a)") }
		if let a = inputs.subscription?.urlEncoded { params.append("subscription=\(a)") }
		let query = params.joined(separator: "&")
		return "/v1/checkout/sessions?\(query)"
	}
	public static var method: HTTPMethod { return .GET }

	public final class PaymentPagesCheckoutSessionList: Codable {
		public var data: [CheckoutSession]
		/// True if this list has another page of items after this one that can be fetched.
		public var has_more: Bool
		/// String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
		public var object: ObjectValues
		/// The URL where this list can be accessed.
		public var url: String

		public init(data: [CheckoutSession], has_more: Bool, object: ObjectValues, url: String) {
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

/// Creates a Session object.
public struct PostCheckoutSessions: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = CheckoutSession
	public typealias paramType = AnyCodable
	public static func endpoint(for inputs: AnyCodable) throws -> String {
		return "/v1/checkout/sessions"
	}

	public final class FormInput: Codable {
		/// Configure actions after a Checkout Session has expired.
		public var after_expiration: AfterExpirationParams?
		/// Enables user redeemable promotion codes.
		public var allow_promotion_codes: Bool?
		/// Settings for automatic tax lookup for this session and resulting payments, invoices, and subscriptions.
		public var automatic_tax: AutomaticTaxParams?
		/// Specify whether Checkout should collect the customer's billing address.
		public var billing_address_collection: BillingAddressCollectionValues?
		/// The URL the customer will be directed to if they decide to cancel payment and return to your website.
		public var cancel_url: String
		/// A unique string to reference the Checkout Session. This can be a customer ID, a cart ID, or similar, and can be used to reconcile the session with your internal systems.
		public var client_reference_id: String?
		/// Configure fields for the Checkout Session to gather active consent from customers.
		public var consent_collection: ConsentCollectionParams?
		/// ID of an existing Customer, if one exists. In `payment` mode, the customer’s most recent card payment method will be used to prefill the email, name, card details, and billing address on the Checkout page. In `subscription` mode, the customer’s [default payment method](https://stripe.com/docs/api/customers/update#update_customer-invoice_settings-default_payment_method) will be used if it’s a card, and otherwise the most recent card will be used. A valid billing address is required for Checkout to prefill the customer's card details.  If the customer changes their email on the Checkout page, the Customer object will be updated with the new email.  If blank for Checkout Sessions in `payment` or `subscription` mode, Checkout will create a new Customer object based on information provided during the payment flow.  You can set [`payment_intent_data.setup_future_usage`](https://stripe.com/docs/api/checkout/sessions/create#create_checkout_session-payment_intent_data-setup_future_usage) to have Checkout automatically attach the payment method to the Customer you pass in for future reuse.
		public var customer: String?
		/// If provided, this value will be used when the Customer object is created. If not provided, customers will be asked to enter their email address. Use this parameter to prefill customer data if you already have an email on file. To access information about the customer once a session is complete, use the `customer` field.
		public var customer_email: String?
		/// Controls what fields on Customer can be updated by the Checkout Session. Can only be provided when `customer` is provided.
		public var customer_update: CustomerUpdateParams?
		/// The coupon or promotion code to apply to this Session. Currently, only up to one may be specified.
		public var discounts: AnyCodable?
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?
		/// The Epoch time in seconds at which the Checkout Session will expire. It can be anywhere from 1 to 24 hours after Checkout Session creation. By default, this value is 24 hours from creation.
		public var expires_at: Timestamp?
		/// A list of items the customer is purchasing. Use this parameter to pass one-time or recurring [Prices](https://stripe.com/docs/api/prices).  For `payment` mode, there is a maximum of 100 line items, however it is recommended to consolidate line items if there are more than a few dozen.  For `subscription` mode, there is a maximum of 20 line items with recurring Prices and 20 line items with one-time Prices. Line items with one-time Prices in will be on the initial invoice only.
		public var line_items: AnyCodable?
		/// The IETF language tag of the locale Checkout is displayed in. If blank or `auto`, the browser's locale is used.
		public var locale: LocaleValues?
		/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
		public var metadata: AnyCodable?
		/// The mode of the Checkout Session. Required when using prices or `setup` mode. Pass `subscription` if the Checkout Session includes at least one recurring item.
		public var mode: ModeValues?
		/// A subset of parameters to be passed to PaymentIntent creation for Checkout Sessions in `payment` mode.
		public var payment_intent_data: PaymentIntentDataParams?
		/// Payment-method-specific configuration.
		public var payment_method_options: PaymentMethodOptionsParam?
		/// A list of the types of payment methods (e.g., `card`) this Checkout Session can accept.  Read more about the supported payment methods and their requirements in our [payment method details guide](/docs/payments/checkout/payment-methods).  If multiple payment methods are passed, Checkout will dynamically reorder them to prioritize the most relevant payment methods based on the customer's location and other characteristics.
		public var payment_method_types: [String]?
		/// A subset of parameters to be passed to SetupIntent creation for Checkout Sessions in `setup` mode.
		public var setup_intent_data: SetupIntentDataParam?
		/// When set, provides configuration for Checkout to collect a shipping address from a customer.
		public var shipping_address_collection: ShippingAddressCollectionParams?
		/// The shipping rate to apply to this Session. Currently, only up to one may be specified.
		public var shipping_rates: [String]?
		/// Describes the type of transaction being performed by Checkout in order to customize relevant text on the page, such as the submit button. `submit_type` can only be specified on Checkout Sessions in `payment` mode, but not Checkout Sessions in `subscription` or `setup` mode.
		public var submit_type: SubmitTypeValues?
		/// A subset of parameters to be passed to subscription creation for Checkout Sessions in `subscription` mode.
		public var subscription_data: SubscriptionDataParams?
		/// The URL to which Stripe should send customers when payment or setup is complete. If you’d like access to the Checkout Session for the successful payment, read more about it in the guide on [fulfilling orders](https://stripe.com/docs/payments/checkout/fulfill-orders).
		public var success_url: String
		/// Controls tax ID collection settings for the session.
		public var tax_id_collection: TaxIdCollectionParams?

		public init(cancel_url: String, success_url: String, after_expiration: AfterExpirationParams? = nil, allow_promotion_codes: Bool? = nil, automatic_tax: AutomaticTaxParams? = nil, billing_address_collection: BillingAddressCollectionValues? = nil, client_reference_id: String? = nil, consent_collection: ConsentCollectionParams? = nil, customer: String? = nil, customer_email: String? = nil, customer_update: CustomerUpdateParams? = nil, discounts: AnyCodable? = nil, expand: [String]? = nil, expires_at: Timestamp? = nil, line_items: AnyCodable? = nil, locale: LocaleValues? = nil, metadata: AnyCodable? = nil, mode: ModeValues? = nil, payment_intent_data: PaymentIntentDataParams? = nil, payment_method_options: PaymentMethodOptionsParam? = nil, payment_method_types: [String]? = nil, setup_intent_data: SetupIntentDataParam? = nil, shipping_address_collection: ShippingAddressCollectionParams? = nil, shipping_rates: [String]? = nil, submit_type: SubmitTypeValues? = nil, subscription_data: SubscriptionDataParams? = nil, tax_id_collection: TaxIdCollectionParams? = nil) {
			self.cancel_url = cancel_url
			self.success_url = success_url
			self.after_expiration = after_expiration
			self.allow_promotion_codes = allow_promotion_codes
			self.automatic_tax = automatic_tax
			self.billing_address_collection = billing_address_collection
			self.client_reference_id = client_reference_id
			self.consent_collection = consent_collection
			self.customer = customer
			self.customer_email = customer_email
			self.customer_update = customer_update
			self.discounts = discounts
			self.expand = expand
			self.expires_at = expires_at
			self.line_items = line_items
			self.locale = locale
			self.metadata = metadata
			self.mode = mode
			self.payment_intent_data = payment_intent_data
			self.payment_method_options = payment_method_options
			self.payment_method_types = payment_method_types
			self.setup_intent_data = setup_intent_data
			self.shipping_address_collection = shipping_address_collection
			self.shipping_rates = shipping_rates
			self.submit_type = submit_type
			self.subscription_data = subscription_data
			self.tax_id_collection = tax_id_collection
		}


		/// Configure actions after a Checkout Session has expired.
		public final class AfterExpirationParams: Codable {
			public var recovery: RecoveryParams?

			/// Configure actions after a Checkout Session has expired.
			/// - Parameters:
			public init(recovery: RecoveryParams? = nil) {
				self.recovery = recovery
			}


			public final class RecoveryParams: Codable {
				public var allow_promotion_codes: Bool?
				public var enabled: Bool

				public init(enabled: Bool, allow_promotion_codes: Bool? = nil) {
					self.enabled = enabled
					self.allow_promotion_codes = allow_promotion_codes
				}
			}

		}



		/// Settings for automatic tax lookup for this session and resulting payments, invoices, and subscriptions.
		public final class AutomaticTaxParams: Codable {
			public var enabled: Bool

			/// Settings for automatic tax lookup for this session and resulting payments, invoices, and subscriptions.
			/// - Parameters:
			///   - enabled: 
			public init(enabled: Bool) {
				self.enabled = enabled
			}
		}



		/// Configure fields for the Checkout Session to gather active consent from customers.
		public final class ConsentCollectionParams: Codable {
			public var promotions: PromotionsValues?

			/// Configure fields for the Checkout Session to gather active consent from customers.
			/// - Parameters:
			public init(promotions: PromotionsValues? = nil) {
				self.promotions = promotions
			}

			public enum PromotionsValues: String, Codable {
				case auto = "auto"
			}
		}



		/// Controls what fields on Customer can be updated by the Checkout Session. Can only be provided when `customer` is provided.
		public final class CustomerUpdateParams: Codable {
			public var address: AddressValues?
			public var name: NameValues?
			public var shipping: ShippingValues?

			/// Controls what fields on Customer can be updated by the Checkout Session. Can only be provided when `customer` is provided.
			/// - Parameters:
			public init(address: AddressValues? = nil, name: NameValues? = nil, shipping: ShippingValues? = nil) {
				self.address = address
				self.name = name
				self.shipping = shipping
			}

			public enum AddressValues: String, Codable {
				case auto = "auto"
				case never = "never"
			}

			public enum NameValues: String, Codable {
				case auto = "auto"
				case never = "never"
			}

			public enum ShippingValues: String, Codable {
				case auto = "auto"
				case never = "never"
			}
		}



		/// A subset of parameters to be passed to PaymentIntent creation for Checkout Sessions in `payment` mode.
		public final class PaymentIntentDataParams: Codable {
			public var application_fee_amount: Int?
			public var capture_method: CaptureMethodValues?
			public var description: String?
			public var metadata: AnyCodable?
			public var on_behalf_of: String?
			public var receipt_email: String?
			public var setup_future_usage: SetupFutureUsageValues?
			public var shipping: Shipping?
			public var statement_descriptor: String?
			public var statement_descriptor_suffix: String?
			public var transfer_data: TransferDataParams?
			public var transfer_group: String?

			/// A subset of parameters to be passed to PaymentIntent creation for Checkout Sessions in `payment` mode.
			/// - Parameters:
			public init(application_fee_amount: Int? = nil, capture_method: CaptureMethodValues? = nil, description: String? = nil, metadata: AnyCodable? = nil, on_behalf_of: String? = nil, receipt_email: String? = nil, setup_future_usage: SetupFutureUsageValues? = nil, shipping: Shipping? = nil, statement_descriptor: String? = nil, statement_descriptor_suffix: String? = nil, transfer_data: TransferDataParams? = nil, transfer_group: String? = nil) {
				self.application_fee_amount = application_fee_amount
				self.capture_method = capture_method
				self.description = description
				self.metadata = metadata
				self.on_behalf_of = on_behalf_of
				self.receipt_email = receipt_email
				self.setup_future_usage = setup_future_usage
				self.shipping = shipping
				self.statement_descriptor = statement_descriptor
				self.statement_descriptor_suffix = statement_descriptor_suffix
				self.transfer_data = transfer_data
				self.transfer_group = transfer_group
			}


			public final class Shipping: Codable {
				public var address: Address
				public var carrier: String?
				public var name: String
				public var phone: String?
				public var tracking_number: String?

				public init(address: Address, name: String, carrier: String? = nil, phone: String? = nil, tracking_number: String? = nil) {
					self.address = address
					self.name = name
					self.carrier = carrier
					self.phone = phone
					self.tracking_number = tracking_number
				}


				public final class Address: Codable {
					public var city: String?
					public var country: String?
					public var line1: String
					public var line2: String?
					public var postal_code: String?
					public var state: String?

					public init(line1: String, city: String? = nil, country: String? = nil, line2: String? = nil, postal_code: String? = nil, state: String? = nil) {
						self.line1 = line1
						self.city = city
						self.country = country
						self.line2 = line2
						self.postal_code = postal_code
						self.state = state
					}
				}

			}



			public final class TransferDataParams: Codable {
				public var amount: Int?
				public var destination: String

				public init(destination: String, amount: Int? = nil) {
					self.destination = destination
					self.amount = amount
				}
			}


			public enum CaptureMethodValues: String, Codable {
				case automatic = "automatic"
				case manual = "manual"
			}

			public enum SetupFutureUsageValues: String, Codable {
				case offSession = "off_session"
				case onSession = "on_session"
			}
		}



		/// Payment-method-specific configuration.
		public final class PaymentMethodOptionsParam: Codable {
			public var acss_debit: PaymentMethodOptionsParam?
			public var boleto: PaymentMethodOptionsParam?
			public var oxxo: PaymentMethodOptionsParam?
			public var wechat_pay: PaymentMethodOptionsParam?

			/// Payment-method-specific configuration.
			/// - Parameters:
			public init(acss_debit: PaymentMethodOptionsParam? = nil, boleto: PaymentMethodOptionsParam? = nil, oxxo: PaymentMethodOptionsParam? = nil, wechat_pay: PaymentMethodOptionsParam? = nil) {
				self.acss_debit = acss_debit
				self.boleto = boleto
				self.oxxo = oxxo
				self.wechat_pay = wechat_pay
			}


			public final class PaymentMethodOptionsParam: Codable {
				public var app_id: String?
				public var client: ClientValues

				public init(client: ClientValues, app_id: String? = nil) {
					self.client = client
					self.app_id = app_id
				}

				public enum ClientValues: String, Codable {
					case android = "android"
					case ios = "ios"
					case web = "web"
				}
			}

		}



		/// A subset of parameters to be passed to SetupIntent creation for Checkout Sessions in `setup` mode.
		public final class SetupIntentDataParam: Codable {
			public var description: String?
			public var metadata: AnyCodable?
			public var on_behalf_of: String?

			/// A subset of parameters to be passed to SetupIntent creation for Checkout Sessions in `setup` mode.
			/// - Parameters:
			public init(description: String? = nil, metadata: AnyCodable? = nil, on_behalf_of: String? = nil) {
				self.description = description
				self.metadata = metadata
				self.on_behalf_of = on_behalf_of
			}
		}



		/// When set, provides configuration for Checkout to collect a shipping address from a customer.
		public final class ShippingAddressCollectionParams: Codable {
			public var allowed_countries: [String]

			/// When set, provides configuration for Checkout to collect a shipping address from a customer.
			/// - Parameters:
			///   - allowed_countries: 
			public init(allowed_countries: [String]) {
				self.allowed_countries = allowed_countries
			}
		}



		/// A subset of parameters to be passed to subscription creation for Checkout Sessions in `subscription` mode.
		public final class SubscriptionDataParams: Codable {
			public var application_fee_percent: StringNumber?
			public var default_tax_rates: [String]?
			public var items: AnyCodable?
			public var metadata: AnyCodable?
			public var transfer_data: TransferDataSpecs?
			public var trial_end: Timestamp?
			public var trial_period_days: Int?

			/// A subset of parameters to be passed to subscription creation for Checkout Sessions in `subscription` mode.
			/// - Parameters:
			public init(application_fee_percent: StringNumber? = nil, default_tax_rates: [String]? = nil, items: AnyCodable? = nil, metadata: AnyCodable? = nil, transfer_data: TransferDataSpecs? = nil, trial_end: Timestamp? = nil, trial_period_days: Int? = nil) {
				self.application_fee_percent = application_fee_percent
				self.default_tax_rates = default_tax_rates
				self.items = items
				self.metadata = metadata
				self.transfer_data = transfer_data
				self.trial_end = trial_end
				self.trial_period_days = trial_period_days
			}


			public final class TransferDataSpecs: Codable {
				public var amount_percent: StringNumber?
				public var destination: String

				public init(destination: String, amount_percent: StringNumber? = nil) {
					self.destination = destination
					self.amount_percent = amount_percent
				}
			}

		}



		/// Controls tax ID collection settings for the session.
		public final class TaxIdCollectionParams: Codable {
			public var enabled: Bool

			/// Controls tax ID collection settings for the session.
			/// - Parameters:
			///   - enabled: 
			public init(enabled: Bool) {
				self.enabled = enabled
			}
		}


		public enum BillingAddressCollectionValues: String, Codable {
			case auto = "auto"
			case required = "required"
		}

		public enum LocaleValues: String, Codable {
			case auto = "auto"
			case bg = "bg"
			case cs = "cs"
			case da = "da"
			case de = "de"
			case el = "el"
			case en = "en"
			case enMinusGb = "en-GB"
			case es = "es"
			case esMinus419 = "es-419"
			case et = "et"
			case fi = "fi"
			case fil = "fil"
			case fr = "fr"
			case frMinusCa = "fr-CA"
			case hr = "hr"
			case hu = "hu"
			case id = "id"
			case it = "it"
			case ja = "ja"
			case ko = "ko"
			case lt = "lt"
			case lv = "lv"
			case ms = "ms"
			case mt = "mt"
			case nb = "nb"
			case nl = "nl"
			case pl = "pl"
			case pt = "pt"
			case ptMinusBr = "pt-BR"
			case ro = "ro"
			case ru = "ru"
			case sk = "sk"
			case sl = "sl"
			case sv = "sv"
			case th = "th"
			case tr = "tr"
			case vi = "vi"
			case zh = "zh"
			case zhMinusHk = "zh-HK"
			case zhMinusTw = "zh-TW"
		}

		public enum ModeValues: String, Codable {
			case payment = "payment"
			case setup = "setup"
			case subscription = "subscription"
		}

		public enum SubmitTypeValues: String, Codable {
			case auto = "auto"
			case book = "book"
			case donate = "donate"
			case pay = "pay"
		}
	}

}

/// Retrieves a Session object.
public struct GetCheckoutSessionsSession: StripeAPIEndpoint {
	public typealias inputType = AnyCodable
	public typealias outputType = CheckoutSession
	public typealias paramType = Params
	
	public struct Params {
		let session: String

		/// Initialize the request parameters
		/// - Parameter session: 
		public init(session: String) {
			self.session = session
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/checkout/sessions/\(inputs.session)"
	}
	public static var method: HTTPMethod { return .GET }

}

/// When retrieving a Checkout Session, there is an includable <strong>line_items</strong> property containing the first handful of those items. There is also a URL where you can retrieve the full (paginated) list of line items.
public struct GetCheckoutSessionsSessionLineItems: StripeAPIEndpoint {
	public typealias inputType = AnyCodable
	public typealias outputType = PaymentPagesCheckoutSessionListLineItems
	public typealias paramType = Params
	
	public struct Params {
		let session: String
		let ending_before: String?
		let limit: Int?
		let starting_after: String?

		/// Initialize the request parameters
		/// - Parameter session: 
		/// - Parameter ending_before: A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list.
		/// - Parameter limit: A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10.
		/// - Parameter starting_after: A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list.
		public init(session: String, ending_before: String? = nil, limit: Int? = nil, starting_after: String? = nil) {
			self.session = session
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
		return "/v1/checkout/sessions/\(inputs.session)/line_items?\(query)"
	}
	public static var method: HTTPMethod { return .GET }

	public final class PaymentPagesCheckoutSessionListLineItems: Codable {
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
