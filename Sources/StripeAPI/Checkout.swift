
/// Returns a list of Checkout Sessions.
public struct GetCheckoutSessions: StripeAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = PaymentPagesCheckoutSessionList
	public typealias paramType = Params
	public struct Params {
		let ending_before: String
		let limit: Int
		let payment_intent: String
		let starting_after: String
		let subscription: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/checkout/sessions?ending_before=\(inputs.ending_before.urlEncoded))&limit=\(inputs.limit.urlEncoded))&payment_intent=\(inputs.payment_intent.urlEncoded))&starting_after=\(inputs.starting_after.urlEncoded))&subscription=\(inputs.subscription.urlEncoded))"
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
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v1/checkout/sessions"
	}

	public final class FormInput: Codable {
		/// Enables user redeemable promotion codes.
		public var allow_promotion_codes: Bool?
		/// Specify whether Checkout should collect the customer's billing address.
		public var billing_address_collection: BillingAddressCollectionValues?
		/// The URL the customer will be directed to if they decide to cancel payment and return to your website.
		public var cancel_url: String
		/// A unique string to reference the Checkout Session. This can be a customer ID, a cart ID, or similar, and can be used to reconcile the session with your internal systems.
		public var client_reference_id: String?
		/// ID of an existing customer, if one exists. The email stored on the customer will be used to prefill the email field on the Checkout page. If the customer changes their email on the Checkout page, the Customer object will be updated with the new email. If blank for Checkout Sessions in `payment` or `subscription` mode, Checkout will create a new customer object based on information provided during the payment flow.
		public var customer: String?
		/// If provided, this value will be used when the Customer object is created. If not provided, customers will be asked to enter their email address. Use this parameter to prefill customer data if you already have an email on file. To access information about the customer once a session is complete, use the `customer` field.
		public var customer_email: String?
		/// The coupon or promotion code to apply to this Session. Currently, only up to one may be specified.
		public var discounts: MESSED_UP?
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?
		/// A list of items the customer is purchasing. Use this parameter to pass one-time or recurring [Prices](https://stripe.com/docs/api/prices). One-time Prices in `subscription` mode will be on the initial invoice only.  There is a maximum of 100 line items, however it is recommended to consolidate line items if there are more than a few dozen.
		public var line_items: MESSED_UP?
		/// The IETF language tag of the locale Checkout is displayed in. If blank or `auto`, the browser's locale is used.
		public var locale: LocaleValues?
		/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
		public var metadata: String?
		/// The mode of the Checkout Session. Required when using prices or `setup` mode. Pass `subscription` if the Checkout Session includes at least one recurring item.
		public var mode: ModeValues?
		/// A subset of parameters to be passed to PaymentIntent creation for Checkout Sessions in `payment` mode.
		public var payment_intent_data: PaymentIntentDataParams?
		/// A list of the types of payment methods (e.g., `card`) this Checkout Session can accept.  Read more about the supported payment methods and their requirements in our [payment method details guide](/docs/payments/checkout/payment-methods).  If multiple payment methods are passed, Checkout will dynamically reorder them to prioritize the most relevant payment methods based on the customer's location and other characteristics.
		public var payment_method_types: [String]
		/// A subset of parameters to be passed to SetupIntent creation for Checkout Sessions in `setup` mode.
		public var setup_intent_data: SetupIntentDataParam?
		/// When set, provides configuration for Checkout to collect a shipping address from a customer.
		public var shipping_address_collection: ShippingAddressCollectionParams?
		/// Describes the type of transaction being performed by Checkout in order to customize relevant text on the page, such as the submit button. `submit_type` can only be specified on Checkout Sessions in `payment` mode, but not Checkout Sessions in `subscription` or `setup` mode.
		public var submit_type: SubmitTypeValues?
		/// A subset of parameters to be passed to subscription creation for Checkout Sessions in `subscription` mode.
		public var subscription_data: SubscriptionDataParams?
		/// The URL to which Stripe should send customers when payment or setup is complete. If you’d like access to the Checkout Session for the successful payment, read more about it in the guide on [fulfilling orders](https://stripe.com/docs/payments/checkout/fulfill-orders).
		public var success_url: String

		public init(cancel_url: String, payment_method_types: [String], success_url: String, allow_promotion_codes: Bool? = nil, billing_address_collection: BillingAddressCollectionValues? = nil, client_reference_id: String? = nil, customer: String? = nil, customer_email: String? = nil, discounts: MESSED_UP? = nil, expand: [String]? = nil, line_items: MESSED_UP? = nil, locale: LocaleValues? = nil, metadata: String? = nil, mode: ModeValues? = nil, payment_intent_data: PaymentIntentDataParams? = nil, setup_intent_data: SetupIntentDataParam? = nil, shipping_address_collection: ShippingAddressCollectionParams? = nil, submit_type: SubmitTypeValues? = nil, subscription_data: SubscriptionDataParams? = nil) {
			self.cancel_url = cancel_url
			self.payment_method_types = payment_method_types
			self.success_url = success_url
			self.allow_promotion_codes = allow_promotion_codes
			self.billing_address_collection = billing_address_collection
			self.client_reference_id = client_reference_id
			self.customer = customer
			self.customer_email = customer_email
			self.discounts = discounts
			self.expand = expand
			self.line_items = line_items
			self.locale = locale
			self.metadata = metadata
			self.mode = mode
			self.payment_intent_data = payment_intent_data
			self.setup_intent_data = setup_intent_data
			self.shipping_address_collection = shipping_address_collection
			self.submit_type = submit_type
			self.subscription_data = subscription_data
		}


		/// A subset of parameters to be passed to PaymentIntent creation for Checkout Sessions in `payment` mode.
		public final class PaymentIntentDataParams: Codable {
			public var application_fee_amount: Int?
			public var capture_method: CaptureMethodValues?
			public var description: String?
			public var metadata: String?
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
			public init(application_fee_amount: Int? = nil, capture_method: CaptureMethodValues? = nil, description: String? = nil, metadata: String? = nil, on_behalf_of: String? = nil, receipt_email: String? = nil, setup_future_usage: SetupFutureUsageValues? = nil, shipping: Shipping? = nil, statement_descriptor: String? = nil, statement_descriptor_suffix: String? = nil, transfer_data: TransferDataParams? = nil, transfer_group: String? = nil) {
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



		/// A subset of parameters to be passed to SetupIntent creation for Checkout Sessions in `setup` mode.
		public final class SetupIntentDataParam: Codable {
			public var description: String?
			public var metadata: String?
			public var on_behalf_of: String?

			/// A subset of parameters to be passed to SetupIntent creation for Checkout Sessions in `setup` mode.
			/// - Parameters:
			public init(description: String? = nil, metadata: String? = nil, on_behalf_of: String? = nil) {
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
			public var items: MESSED_UP?
			public var metadata: String?
			public var trial_end: Timestamp?
			public var trial_period_days: Int?

			/// A subset of parameters to be passed to subscription creation for Checkout Sessions in `subscription` mode.
			/// - Parameters:
			public init(application_fee_percent: StringNumber? = nil, default_tax_rates: [String]? = nil, items: MESSED_UP? = nil, metadata: String? = nil, trial_end: Timestamp? = nil, trial_period_days: Int? = nil) {
				self.application_fee_percent = application_fee_percent
				self.default_tax_rates = default_tax_rates
				self.items = items
				self.metadata = metadata
				self.trial_end = trial_end
				self.trial_period_days = trial_period_days
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
			case fr = "fr"
			case frMinusCa = "fr-CA"
			case hu = "hu"
			case id = "id"
			case it = "it"
			case ja = "ja"
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
			case tr = "tr"
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
	public typealias inputType = Empty
	public typealias outputType = CheckoutSession
	public typealias paramType = Params
	public struct Params {
		let session: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/checkout/sessions/\(inputs.session)"
	}
	public static var method: HTTPMethod { return .GET }

}

/// When retrieving a Checkout Session, there is an includable <strong>line_items</strong> property containing the first handful of those items. There is also a URL where you can retrieve the full (paginated) list of line items.
public struct GetCheckoutSessionsSessionLineItems: StripeAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = PaymentPagesCheckoutSessionListLineItems
	public typealias paramType = Params
	public struct Params {
		let ending_before: String
		let limit: Int
		let session: String
		let starting_after: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/checkout/sessions/\(inputs.session)/line_items?ending_before=\(inputs.ending_before.urlEncoded))&limit=\(inputs.limit.urlEncoded))&starting_after=\(inputs.starting_after.urlEncoded))"
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
