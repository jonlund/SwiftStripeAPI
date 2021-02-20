
/// Returns a list of PaymentIntents.
public struct GetPaymentIntents: StripeAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = PaymentFlowsPaymentIntentList
	public typealias paramType = Params
	public struct Params {
		let customer: String
		let ending_before: String
		let limit: Int
		let starting_after: String

		public init(customer: String, ending_before: String, limit: Int, starting_after: String) {
			self.customer = customer
			self.ending_before = ending_before
			self.limit = limit
			self.starting_after = starting_after
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/payment_intents?customer=\(inputs.customer.urlEncoded))&ending_before=\(inputs.ending_before.urlEncoded))&limit=\(inputs.limit.urlEncoded))&starting_after=\(inputs.starting_after.urlEncoded))"
	}
	public static var method: HTTPMethod { return .GET }

	public final class PaymentFlowsPaymentIntentList: Codable {
		public var data: [PaymentIntent]
		/// True if this list has another page of items after this one that can be fetched.
		public var has_more: Bool
		/// String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
		public var object: ObjectValues
		/// The URL where this list can be accessed.
		public var url: String

		public init(data: [PaymentIntent], has_more: Bool, object: ObjectValues, url: String) {
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

/// Creates a PaymentIntent object.  After the PaymentIntent is created, attach a payment method and <a href="/docs/api/payment_intents/confirm">confirm</a> to continue the payment. You can read more about the different payment flows available via the Payment Intents API <a href="/docs/payments/payment-intents">here</a>.  When <code>confirm=true</code> is used during creation, it is equivalent to creating and confirming the PaymentIntent in the same call. You may use any parameters available in the <a href="/docs/api/payment_intents/confirm">confirm API</a> when <code>confirm=true</code> is supplied.
public struct PostPaymentIntents: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = PaymentIntent
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v1/payment_intents"
	}

	public final class FormInput: Codable {
		/// Amount intended to be collected by this PaymentIntent. A positive integer representing how much to charge in the [smallest currency unit](https://stripe.com/docs/currencies#zero-decimal) (e.g., 100 cents to charge $1.00 or 100 to charge ¥100, a zero-decimal currency). The minimum amount is $0.50 US or [equivalent in charge currency](https://stripe.com/docs/currencies#minimum-and-maximum-charge-amounts). The amount value supports up to eight digits (e.g., a value of 99999999 for a USD charge of $999,999.99).
		public var amount: Int
		/// The amount of the application fee (if any) that will be requested to be applied to the payment and transferred to the application owner's Stripe account. The amount of the application fee collected will be capped at the total payment amount. For more information, see the PaymentIntents [use case for connected accounts](https://stripe.com/docs/payments/connected-accounts).
		public var application_fee_amount: Int?
		/// Controls when the funds will be captured from the customer's account.
		public var capture_method: CaptureMethodValues?
		/// Set to `true` to attempt to [confirm](https://stripe.com/docs/api/payment_intents/confirm) this PaymentIntent immediately. This parameter defaults to `false`. When creating and confirming a PaymentIntent at the same time, parameters available in the [confirm](https://stripe.com/docs/api/payment_intents/confirm) API may also be provided.
		public var confirm: Bool?
		public var confirmation_method: ConfirmationMethodValues?
		/// Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
		public var currency: String
		/// ID of the Customer this PaymentIntent belongs to, if one exists.  Payment methods attached to other Customers cannot be used with this PaymentIntent.  If present in combination with [setup_future_usage](https://stripe.com/docs/api#payment_intent_object-setup_future_usage), this PaymentIntent's payment method will be attached to the Customer after the PaymentIntent has been confirmed and any required actions from the user are complete.
		public var customer: String?
		/// An arbitrary string attached to the object. Often useful for displaying to users.
		public var description: String?
		/// Set to `true` to fail the payment attempt if the PaymentIntent transitions into `requires_action`. This parameter is intended for simpler integrations that do not handle customer actions, like [saving cards without authentication](https://stripe.com/docs/payments/save-card-without-authentication). This parameter can only be used with [`confirm=true`](https://stripe.com/docs/api/payment_intents/create#create_payment_intent-confirm).
		public var error_on_requires_action: Bool?
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?
		/// ID of the mandate to be used for this payment. This parameter can only be used with [`confirm=true`](https://stripe.com/docs/api/payment_intents/create#create_payment_intent-confirm).
		public var mandate: String?
		/// This hash contains details about the Mandate to create. This parameter can only be used with [`confirm=true`](https://stripe.com/docs/api/payment_intents/create#create_payment_intent-confirm).
		public var mandate_data: SecretKeyParam?
		/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
		public var metadata: Empty?
		/// Set to `true` to indicate that the customer is not in your checkout flow during this payment attempt, and therefore is unable to authenticate. This parameter is intended for scenarios where you collect card details and [charge them later](https://stripe.com/docs/payments/cards/charging-saved-cards). This parameter can only be used with [`confirm=true`](https://stripe.com/docs/api/payment_intents/create#create_payment_intent-confirm).
		public var off_session: Bool?
		/// The Stripe account ID for which these funds are intended. For details, see the PaymentIntents [use case for connected accounts](https://stripe.com/docs/payments/connected-accounts).
		public var on_behalf_of: String?
		/// ID of the payment method (a PaymentMethod, Card, or [compatible Source](https://stripe.com/docs/payments/payment-methods#compatibility) object) to attach to this PaymentIntent.  If this parameter is omitted with `confirm=true`, `customer.default_source` will be attached as this PaymentIntent's payment instrument to improve the migration experience for users of the Charges API. We recommend that you explicitly provide the `payment_method` going forward.
		public var payment_method: String?
		/// If provided, this hash will be used to create a PaymentMethod. The new PaymentMethod will appear in the [payment_method](https://stripe.com/docs/api/payment_intents/object#payment_intent_object-payment_method) property on the PaymentIntent.
		public var payment_method_data: PaymentMethodDataParams?
		/// Payment-method-specific configuration for this PaymentIntent.
		public var payment_method_options: PaymentMethodOptionsParam?
		/// The list of payment method types (e.g. card) that this PaymentIntent is allowed to use. If this is not provided, defaults to ["card"].
		public var payment_method_types: [String]?
		/// Email address that the receipt for the resulting payment will be sent to. If `receipt_email` is specified for a payment in live mode, a receipt will be sent regardless of your [email settings](https://dashboard.stripe.com/account/emails).
		public var receipt_email: String?
		/// The URL to redirect your customer back to after they authenticate or cancel their payment on the payment method's app or site. If you'd prefer to redirect to a mobile application, you can alternatively supply an application URI scheme. This parameter can only be used with [`confirm=true`](https://stripe.com/docs/api/payment_intents/create#create_payment_intent-confirm).
		public var return_url: String?
		/// Indicates that you intend to make future payments with this PaymentIntent's payment method.  Providing this parameter will [attach the payment method](https://stripe.com/docs/payments/save-during-payment) to the PaymentIntent's Customer, if present, after the PaymentIntent is confirmed and any required actions from the user are complete. If no Customer was provided, the payment method can still be [attached](https://stripe.com/docs/api/payment_methods/attach) to a Customer after the transaction completes.  When processing card payments, Stripe also uses `setup_future_usage` to dynamically optimize your payment flow and comply with regional legislation and network rules, such as [SCA](https://stripe.com/docs/strong-customer-authentication).
		public var setup_future_usage: SetupFutureUsageValues?
		/// Shipping information for this PaymentIntent.
		public var shipping: Shipping?
		/// For non-card charges, you can use this value as the complete description that appears on your customers’ statements. Must contain at least one letter, maximum 22 characters.
		public var statement_descriptor: String?
		/// Provides information about a card payment that customers see on their statements. Concatenated with the prefix (shortened descriptor) or statement descriptor that’s set on the account to form the complete statement descriptor. Maximum 22 characters for the concatenated descriptor.
		public var statement_descriptor_suffix: String?
		/// The parameters used to automatically create a Transfer when the payment succeeds. For more information, see the PaymentIntents [use case for connected accounts](https://stripe.com/docs/payments/connected-accounts).
		public var transfer_data: TransferDataCreationParams?
		/// A string that identifies the resulting payment as part of a group. See the PaymentIntents [use case for connected accounts](https://stripe.com/docs/payments/connected-accounts) for details.
		public var transfer_group: String?
		/// Set to `true` only when using manual confirmation and the iOS or Android SDKs to handle additional authentication steps.
		public var use_stripe_sdk: Bool?

		public init(amount: Int, currency: String, application_fee_amount: Int? = nil, capture_method: CaptureMethodValues? = nil, confirm: Bool? = nil, confirmation_method: ConfirmationMethodValues? = nil, customer: String? = nil, description: String? = nil, error_on_requires_action: Bool? = nil, expand: [String]? = nil, mandate: String? = nil, mandate_data: SecretKeyParam? = nil, metadata: Empty? = nil, off_session: Bool? = nil, on_behalf_of: String? = nil, payment_method: String? = nil, payment_method_data: PaymentMethodDataParams? = nil, payment_method_options: PaymentMethodOptionsParam? = nil, payment_method_types: [String]? = nil, receipt_email: String? = nil, return_url: String? = nil, setup_future_usage: SetupFutureUsageValues? = nil, shipping: Shipping? = nil, statement_descriptor: String? = nil, statement_descriptor_suffix: String? = nil, transfer_data: TransferDataCreationParams? = nil, transfer_group: String? = nil, use_stripe_sdk: Bool? = nil) {
			self.amount = amount
			self.currency = currency
			self.application_fee_amount = application_fee_amount
			self.capture_method = capture_method
			self.confirm = confirm
			self.confirmation_method = confirmation_method
			self.customer = customer
			self.description = description
			self.error_on_requires_action = error_on_requires_action
			self.expand = expand
			self.mandate = mandate
			self.mandate_data = mandate_data
			self.metadata = metadata
			self.off_session = off_session
			self.on_behalf_of = on_behalf_of
			self.payment_method = payment_method
			self.payment_method_data = payment_method_data
			self.payment_method_options = payment_method_options
			self.payment_method_types = payment_method_types
			self.receipt_email = receipt_email
			self.return_url = return_url
			self.setup_future_usage = setup_future_usage
			self.shipping = shipping
			self.statement_descriptor = statement_descriptor
			self.statement_descriptor_suffix = statement_descriptor_suffix
			self.transfer_data = transfer_data
			self.transfer_group = transfer_group
			self.use_stripe_sdk = use_stripe_sdk
		}


		/// If provided, this hash will be used to create a PaymentMethod. The new PaymentMethod will appear in the [payment_method](https://stripe.com/docs/api/payment_intents/object#payment_intent_object-payment_method) property on the PaymentIntent.
		public final class PaymentMethodDataParams: Codable {
			public var alipay: Param?
			public var au_becs_debit: Param?
			public var bacs_debit: Param?
			public var bancontact: Param?
			public var billing_details: BillingDetailsInnerParams?
			public var eps: Param?
			public var fpx: Param?
			public var giropay: Param?
			public var grabpay: Param?
			public var ideal: Param?
			public var interac_present: Param?
			public var metadata: Empty?
			public var oxxo: Param?
			public var p24: Param?
			public var sepa_debit: Param?
			public var sofort: Param?
			public var type: TypeValues

			/// If provided, this hash will be used to create a PaymentMethod. The new PaymentMethod will appear in the [payment_method](https://stripe.com/docs/api/payment_intents/object#payment_intent_object-payment_method) property on the PaymentIntent.
			/// - Parameters:
			///   - type: 
			public init(type: TypeValues, alipay: Param? = nil, au_becs_debit: Param? = nil, bacs_debit: Param? = nil, bancontact: Param? = nil, billing_details: BillingDetailsInnerParams? = nil, eps: Param? = nil, fpx: Param? = nil, giropay: Param? = nil, grabpay: Param? = nil, ideal: Param? = nil, interac_present: Param? = nil, metadata: Empty? = nil, oxxo: Param? = nil, p24: Param? = nil, sepa_debit: Param? = nil, sofort: Param? = nil) {
				self.type = type
				self.alipay = alipay
				self.au_becs_debit = au_becs_debit
				self.bacs_debit = bacs_debit
				self.bancontact = bancontact
				self.billing_details = billing_details
				self.eps = eps
				self.fpx = fpx
				self.giropay = giropay
				self.grabpay = grabpay
				self.ideal = ideal
				self.interac_present = interac_present
				self.metadata = metadata
				self.oxxo = oxxo
				self.p24 = p24
				self.sepa_debit = sepa_debit
				self.sofort = sofort
			}


			public final class BillingDetailsInnerParams: Codable {
				public var address: MESSED_UP?
				public var email: String?
				public var name: String?
				public var phone: String?

				public init(address: MESSED_UP? = nil, email: String? = nil, name: String? = nil, phone: String? = nil) {
					self.address = address
					self.email = email
					self.name = name
					self.phone = phone
				}
			}



			public final class Param: Codable {
				public var country: CountryValues

				public init(country: CountryValues) {
					self.country = country
				}

				public enum CountryValues: String, Codable {
					case optionAT = "AT"
					case optionBE = "BE"
					case optionDE = "DE"
					case optionES = "ES"
					case optionIT = "IT"
					case optionNL = "NL"
				}
			}


			public enum TypeValues: String, Codable {
				case alipay = "alipay"
				case auBecsDebit = "au_becs_debit"
				case bacsDebit = "bacs_debit"
				case bancontact = "bancontact"
				case eps = "eps"
				case fpx = "fpx"
				case giropay = "giropay"
				case grabpay = "grabpay"
				case ideal = "ideal"
				case oxxo = "oxxo"
				case p24 = "p24"
				case sepaDebit = "sepa_debit"
				case sofort = "sofort"
			}
		}



		/// Payment-method-specific configuration for this PaymentIntent.
		public final class PaymentMethodOptionsParam: Codable {
			public var alipay: MESSED_UP?
			public var bancontact: MESSED_UP?
			public var card: MESSED_UP?
			public var oxxo: MESSED_UP?
			public var p24: MESSED_UP?
			public var sepa_debit: MESSED_UP?
			public var sofort: MESSED_UP?

			/// Payment-method-specific configuration for this PaymentIntent.
			/// - Parameters:
			public init(alipay: MESSED_UP? = nil, bancontact: MESSED_UP? = nil, card: MESSED_UP? = nil, oxxo: MESSED_UP? = nil, p24: MESSED_UP? = nil, sepa_debit: MESSED_UP? = nil, sofort: MESSED_UP? = nil) {
				self.alipay = alipay
				self.bancontact = bancontact
				self.card = card
				self.oxxo = oxxo
				self.p24 = p24
				self.sepa_debit = sepa_debit
				self.sofort = sofort
			}
		}



		/// This hash contains details about the Mandate to create. This parameter can only be used with [`confirm=true`](https://stripe.com/docs/api/payment_intents/create#create_payment_intent-confirm).
		public final class SecretKeyParam: Codable {
			public var customer_acceptance: CustomerAcceptanceParam

			/// This hash contains details about the Mandate to create. This parameter can only be used with [`confirm=true`](https://stripe.com/docs/api/payment_intents/create#create_payment_intent-confirm).
			/// - Parameters:
			///   - customer_acceptance: 
			public init(customer_acceptance: CustomerAcceptanceParam) {
				self.customer_acceptance = customer_acceptance
			}


			public final class CustomerAcceptanceParam: Codable {
				public var accepted_at: Timestamp?
				public var offline: OfflineParam?
				public var online: OnlineParam?
				public var type: TypeValues

				public init(type: TypeValues, accepted_at: Timestamp? = nil, offline: OfflineParam? = nil, online: OnlineParam? = nil) {
					self.type = type
					self.accepted_at = accepted_at
					self.offline = offline
					self.online = online
				}


				public final class OfflineParam: Codable {

					public init() {
					}
				}



				public final class OnlineParam: Codable {
					public var ip_address: String
					public var user_agent: String

					public init(ip_address: String, user_agent: String) {
						self.ip_address = ip_address
						self.user_agent = user_agent
					}
				}


				public enum TypeValues: String, Codable {
					case offline = "offline"
					case online = "online"
				}
			}

		}



		/// Shipping information for this PaymentIntent.
		public final class Shipping: Codable {
			public var address: Address
			public var carrier: String?
			public var name: String
			public var phone: String?
			public var tracking_number: String?

			/// Shipping information for this PaymentIntent.
			/// - Parameters:
			///   - address: 
			///   - name: 
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



		/// The parameters used to automatically create a Transfer when the payment succeeds. For more information, see the PaymentIntents [use case for connected accounts](https://stripe.com/docs/payments/connected-accounts).
		public final class TransferDataCreationParams: Codable {
			public var amount: Int?
			public var destination: String

			/// The parameters used to automatically create a Transfer when the payment succeeds. For more information, see the PaymentIntents [use case for connected accounts](https://stripe.com/docs/payments/connected-accounts).
			/// - Parameters:
			///   - destination: 
			public init(destination: String, amount: Int? = nil) {
				self.destination = destination
				self.amount = amount
			}
		}


		public enum CaptureMethodValues: String, Codable {
			case automatic = "automatic"
			case manual = "manual"
		}

		public enum ConfirmationMethodValues: String, Codable {
			case automatic = "automatic"
			case manual = "manual"
		}

		public enum SetupFutureUsageValues: String, Codable {
			case offSession = "off_session"
			case onSession = "on_session"
		}
	}

}

/// Retrieves the details of a PaymentIntent that has previously been created.   Client-side retrieval using a publishable key is allowed when the <code>client_secret</code> is provided in the query string.   When retrieved with a publishable key, only a subset of properties will be returned. Please refer to the <a href="#payment_intent_object">payment intent</a> object reference for more details.
public struct GetPaymentIntentsIntent: StripeAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = PaymentIntent
	public typealias paramType = Params
	public struct Params {
		let client_secret: String
		let intent: String

		public init(client_secret: String, intent: String) {
			self.client_secret = client_secret
			self.intent = intent
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/payment_intents/\(inputs.intent)?client_secret=\(inputs.client_secret.urlEncoded))"
	}
	public static var method: HTTPMethod { return .GET }

}

/// Updates properties on a PaymentIntent object without confirming.  Depending on which properties you update, you may need to confirm the PaymentIntent again. For example, updating the <code>payment_method</code> will always require you to confirm the PaymentIntent again. If you prefer to update and confirm at the same time, we recommend updating properties via the <a href="/docs/api/payment_intents/confirm">confirm API</a> instead.
public struct PostPaymentIntentsIntent: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = PaymentIntent
	public typealias paramType = Params
	public struct Params {
		let intent: String

		public init(intent: String) {
			self.intent = intent
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/payment_intents/\(inputs.intent)"
	}

	public final class FormInput: Codable {
		/// Amount intended to be collected by this PaymentIntent. A positive integer representing how much to charge in the [smallest currency unit](https://stripe.com/docs/currencies#zero-decimal) (e.g., 100 cents to charge $1.00 or 100 to charge ¥100, a zero-decimal currency). The minimum amount is $0.50 US or [equivalent in charge currency](https://stripe.com/docs/currencies#minimum-and-maximum-charge-amounts). The amount value supports up to eight digits (e.g., a value of 99999999 for a USD charge of $999,999.99).
		public var amount: Int?
		/// The amount of the application fee (if any) that will be requested to be applied to the payment and transferred to the application owner's Stripe account. The amount of the application fee collected will be capped at the total payment amount. For more information, see the PaymentIntents [use case for connected accounts](https://stripe.com/docs/payments/connected-accounts).
		public var application_fee_amount: Int?
		/// Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
		public var currency: String?
		/// ID of the Customer this PaymentIntent belongs to, if one exists.  Payment methods attached to other Customers cannot be used with this PaymentIntent.  If present in combination with [setup_future_usage](https://stripe.com/docs/api#payment_intent_object-setup_future_usage), this PaymentIntent's payment method will be attached to the Customer after the PaymentIntent has been confirmed and any required actions from the user are complete.
		public var customer: String?
		/// An arbitrary string attached to the object. Often useful for displaying to users.
		public var description: String?
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?
		/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
		public var metadata: MESSED_UP?
		/// ID of the payment method (a PaymentMethod, Card, or [compatible Source](https://stripe.com/docs/payments/payment-methods#compatibility) object) to attach to this PaymentIntent.
		public var payment_method: String?
		/// If provided, this hash will be used to create a PaymentMethod. The new PaymentMethod will appear in the [payment_method](https://stripe.com/docs/api/payment_intents/object#payment_intent_object-payment_method) property on the PaymentIntent.
		public var payment_method_data: PaymentMethodDataParams?
		/// Payment-method-specific configuration for this PaymentIntent.
		public var payment_method_options: PaymentMethodOptionsParam?
		/// The list of payment method types (e.g. card) that this PaymentIntent is allowed to use.
		public var payment_method_types: [String]?
		/// Email address that the receipt for the resulting payment will be sent to. If `receipt_email` is specified for a payment in live mode, a receipt will be sent regardless of your [email settings](https://dashboard.stripe.com/account/emails).
		public var receipt_email: String?
		/// Indicates that you intend to make future payments with this PaymentIntent's payment method.  Providing this parameter will [attach the payment method](https://stripe.com/docs/payments/save-during-payment) to the PaymentIntent's Customer, if present, after the PaymentIntent is confirmed and any required actions from the user are complete. If no Customer was provided, the payment method can still be [attached](https://stripe.com/docs/api/payment_methods/attach) to a Customer after the transaction completes.  When processing card payments, Stripe also uses `setup_future_usage` to dynamically optimize your payment flow and comply with regional legislation and network rules, such as [SCA](https://stripe.com/docs/strong-customer-authentication).  If `setup_future_usage` is already set and you are performing a request using a publishable key, you may only update the value from `on_session` to `off_session`.
		public var setup_future_usage: SetupFutureUsageValues?
		/// Shipping information for this PaymentIntent.
		public var shipping: MESSED_UP?
		/// For non-card charges, you can use this value as the complete description that appears on your customers’ statements. Must contain at least one letter, maximum 22 characters.
		public var statement_descriptor: String?
		/// Provides information about a card payment that customers see on their statements. Concatenated with the prefix (shortened descriptor) or statement descriptor that’s set on the account to form the complete statement descriptor. Maximum 22 characters for the concatenated descriptor.
		public var statement_descriptor_suffix: String?
		/// The parameters used to automatically create a Transfer when the payment succeeds. For more information, see the PaymentIntents [use case for connected accounts](https://stripe.com/docs/payments/connected-accounts).
		public var transfer_data: TransferDataUpdateParams?
		/// A string that identifies the resulting payment as part of a group. `transfer_group` may only be provided if it has not been set. See the PaymentIntents [use case for connected accounts](https://stripe.com/docs/payments/connected-accounts) for details.
		public var transfer_group: String?

		public init(amount: Int? = nil, application_fee_amount: Int? = nil, currency: String? = nil, customer: String? = nil, description: String? = nil, expand: [String]? = nil, metadata: MESSED_UP? = nil, payment_method: String? = nil, payment_method_data: PaymentMethodDataParams? = nil, payment_method_options: PaymentMethodOptionsParam? = nil, payment_method_types: [String]? = nil, receipt_email: String? = nil, setup_future_usage: SetupFutureUsageValues? = nil, shipping: MESSED_UP? = nil, statement_descriptor: String? = nil, statement_descriptor_suffix: String? = nil, transfer_data: TransferDataUpdateParams? = nil, transfer_group: String? = nil) {
			self.amount = amount
			self.application_fee_amount = application_fee_amount
			self.currency = currency
			self.customer = customer
			self.description = description
			self.expand = expand
			self.metadata = metadata
			self.payment_method = payment_method
			self.payment_method_data = payment_method_data
			self.payment_method_options = payment_method_options
			self.payment_method_types = payment_method_types
			self.receipt_email = receipt_email
			self.setup_future_usage = setup_future_usage
			self.shipping = shipping
			self.statement_descriptor = statement_descriptor
			self.statement_descriptor_suffix = statement_descriptor_suffix
			self.transfer_data = transfer_data
			self.transfer_group = transfer_group
		}


		/// If provided, this hash will be used to create a PaymentMethod. The new PaymentMethod will appear in the [payment_method](https://stripe.com/docs/api/payment_intents/object#payment_intent_object-payment_method) property on the PaymentIntent.
		public final class PaymentMethodDataParams: Codable {
			public var alipay: Param?
			public var au_becs_debit: Param?
			public var bacs_debit: Param?
			public var bancontact: Param?
			public var billing_details: BillingDetailsInnerParams?
			public var eps: Param?
			public var fpx: Param?
			public var giropay: Param?
			public var grabpay: Param?
			public var ideal: Param?
			public var interac_present: Param?
			public var metadata: Empty?
			public var oxxo: Param?
			public var p24: Param?
			public var sepa_debit: Param?
			public var sofort: Param?
			public var type: TypeValues

			/// If provided, this hash will be used to create a PaymentMethod. The new PaymentMethod will appear in the [payment_method](https://stripe.com/docs/api/payment_intents/object#payment_intent_object-payment_method) property on the PaymentIntent.
			/// - Parameters:
			///   - type: 
			public init(type: TypeValues, alipay: Param? = nil, au_becs_debit: Param? = nil, bacs_debit: Param? = nil, bancontact: Param? = nil, billing_details: BillingDetailsInnerParams? = nil, eps: Param? = nil, fpx: Param? = nil, giropay: Param? = nil, grabpay: Param? = nil, ideal: Param? = nil, interac_present: Param? = nil, metadata: Empty? = nil, oxxo: Param? = nil, p24: Param? = nil, sepa_debit: Param? = nil, sofort: Param? = nil) {
				self.type = type
				self.alipay = alipay
				self.au_becs_debit = au_becs_debit
				self.bacs_debit = bacs_debit
				self.bancontact = bancontact
				self.billing_details = billing_details
				self.eps = eps
				self.fpx = fpx
				self.giropay = giropay
				self.grabpay = grabpay
				self.ideal = ideal
				self.interac_present = interac_present
				self.metadata = metadata
				self.oxxo = oxxo
				self.p24 = p24
				self.sepa_debit = sepa_debit
				self.sofort = sofort
			}


			public final class BillingDetailsInnerParams: Codable {
				public var address: MESSED_UP?
				public var email: String?
				public var name: String?
				public var phone: String?

				public init(address: MESSED_UP? = nil, email: String? = nil, name: String? = nil, phone: String? = nil) {
					self.address = address
					self.email = email
					self.name = name
					self.phone = phone
				}
			}



			public final class Param: Codable {
				public var country: CountryValues

				public init(country: CountryValues) {
					self.country = country
				}

				public enum CountryValues: String, Codable {
					case optionAT = "AT"
					case optionBE = "BE"
					case optionDE = "DE"
					case optionES = "ES"
					case optionIT = "IT"
					case optionNL = "NL"
				}
			}


			public enum TypeValues: String, Codable {
				case alipay = "alipay"
				case auBecsDebit = "au_becs_debit"
				case bacsDebit = "bacs_debit"
				case bancontact = "bancontact"
				case eps = "eps"
				case fpx = "fpx"
				case giropay = "giropay"
				case grabpay = "grabpay"
				case ideal = "ideal"
				case oxxo = "oxxo"
				case p24 = "p24"
				case sepaDebit = "sepa_debit"
				case sofort = "sofort"
			}
		}



		/// Payment-method-specific configuration for this PaymentIntent.
		public final class PaymentMethodOptionsParam: Codable {
			public var alipay: MESSED_UP?
			public var bancontact: MESSED_UP?
			public var card: MESSED_UP?
			public var oxxo: MESSED_UP?
			public var p24: MESSED_UP?
			public var sepa_debit: MESSED_UP?
			public var sofort: MESSED_UP?

			/// Payment-method-specific configuration for this PaymentIntent.
			/// - Parameters:
			public init(alipay: MESSED_UP? = nil, bancontact: MESSED_UP? = nil, card: MESSED_UP? = nil, oxxo: MESSED_UP? = nil, p24: MESSED_UP? = nil, sepa_debit: MESSED_UP? = nil, sofort: MESSED_UP? = nil) {
				self.alipay = alipay
				self.bancontact = bancontact
				self.card = card
				self.oxxo = oxxo
				self.p24 = p24
				self.sepa_debit = sepa_debit
				self.sofort = sofort
			}
		}



		/// The parameters used to automatically create a Transfer when the payment succeeds. For more information, see the PaymentIntents [use case for connected accounts](https://stripe.com/docs/payments/connected-accounts).
		public final class TransferDataUpdateParams: Codable {
			public var amount: Int?

			/// The parameters used to automatically create a Transfer when the payment succeeds. For more information, see the PaymentIntents [use case for connected accounts](https://stripe.com/docs/payments/connected-accounts).
			/// - Parameters:
			public init(amount: Int? = nil) {
				self.amount = amount
			}
		}


		public enum SetupFutureUsageValues: String, Codable {
			case offSession = "off_session"
			case onSession = "on_session"
		}
	}

}

/// A PaymentIntent object can be canceled when it is in one of these statuses: <code>requires_payment_method</code>, <code>requires_capture</code>, <code>requires_confirmation</code>, or <code>requires_action</code>.   Once canceled, no additional charges will be made by the PaymentIntent and any operations on the PaymentIntent will fail with an error. For PaymentIntents with <code>status=’requires_capture’</code>, the remaining <code>amount_capturable</code> will automatically be refunded.
public struct PostPaymentIntentsIntentCancel: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = PaymentIntent
	public typealias paramType = Params
	public struct Params {
		let intent: String

		public init(intent: String) {
			self.intent = intent
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/payment_intents/\(inputs.intent)/cancel"
	}

	public final class FormInput: Codable {
		/// Reason for canceling this PaymentIntent. Possible values are `duplicate`, `fraudulent`, `requested_by_customer`, or `abandoned`
		public var cancellation_reason: CancellationReasonValues?
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?

		public init(cancellation_reason: CancellationReasonValues? = nil, expand: [String]? = nil) {
			self.cancellation_reason = cancellation_reason
			self.expand = expand
		}

		public enum CancellationReasonValues: String, Codable {
			case abandoned = "abandoned"
			case duplicate = "duplicate"
			case fraudulent = "fraudulent"
			case requestedByCustomer = "requested_by_customer"
		}
	}

}

/// Capture the funds of an existing uncaptured PaymentIntent when its status is <code>requires_capture</code>.  Uncaptured PaymentIntents will be canceled exactly seven days after they are created.  Learn more about <a href="/docs/payments/capture-later">separate authorization and capture</a>.
public struct PostPaymentIntentsIntentCapture: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = PaymentIntent
	public typealias paramType = Params
	public struct Params {
		let intent: String

		public init(intent: String) {
			self.intent = intent
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/payment_intents/\(inputs.intent)/capture"
	}

	public final class FormInput: Codable {
		/// The amount to capture from the PaymentIntent, which must be less than or equal to the original amount. Any additional amount will be automatically refunded. Defaults to the full `amount_capturable` if not provided.
		public var amount_to_capture: Int?
		/// The amount of the application fee (if any) that will be requested to be applied to the payment and transferred to the application owner's Stripe account. The amount of the application fee collected will be capped at the total payment amount. For more information, see the PaymentIntents [use case for connected accounts](https://stripe.com/docs/payments/connected-accounts).
		public var application_fee_amount: Int?
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?
		/// For non-card charges, you can use this value as the complete description that appears on your customers’ statements. Must contain at least one letter, maximum 22 characters.
		public var statement_descriptor: String?
		/// Provides information about a card payment that customers see on their statements. Concatenated with the prefix (shortened descriptor) or statement descriptor that’s set on the account to form the complete statement descriptor. Maximum 22 characters for the concatenated descriptor.
		public var statement_descriptor_suffix: String?
		/// The parameters used to automatically create a Transfer when the payment is captured. For more information, see the PaymentIntents [use case for connected accounts](https://stripe.com/docs/payments/connected-accounts).
		public var transfer_data: TransferDataUpdateParams?

		public init(amount_to_capture: Int? = nil, application_fee_amount: Int? = nil, expand: [String]? = nil, statement_descriptor: String? = nil, statement_descriptor_suffix: String? = nil, transfer_data: TransferDataUpdateParams? = nil) {
			self.amount_to_capture = amount_to_capture
			self.application_fee_amount = application_fee_amount
			self.expand = expand
			self.statement_descriptor = statement_descriptor
			self.statement_descriptor_suffix = statement_descriptor_suffix
			self.transfer_data = transfer_data
		}


		/// The parameters used to automatically create a Transfer when the payment is captured. For more information, see the PaymentIntents [use case for connected accounts](https://stripe.com/docs/payments/connected-accounts).
		public final class TransferDataUpdateParams: Codable {
			public var amount: Int?

			/// The parameters used to automatically create a Transfer when the payment is captured. For more information, see the PaymentIntents [use case for connected accounts](https://stripe.com/docs/payments/connected-accounts).
			/// - Parameters:
			public init(amount: Int? = nil) {
				self.amount = amount
			}
		}

	}

}

/// Confirm that your customer intends to pay with current or provided payment method. Upon confirmation, the PaymentIntent will attempt to initiate a payment.  If the selected payment method requires additional authentication steps, the PaymentIntent will transition to the <code>requires_action</code> status and suggest additional actions via <code>next_action</code>. If payment fails, the PaymentIntent will transition to the <code>requires_payment_method</code> status. If payment succeeds, the PaymentIntent will transition to the <code>succeeded</code> status (or <code>requires_capture</code>, if <code>capture_method</code> is set to <code>manual</code>).  If the <code>confirmation_method</code> is <code>automatic</code>, payment may be attempted using our <a href="/docs/stripe-js/reference#stripe-handle-card-payment">client SDKs</a> and the PaymentIntent’s <a href="#payment_intent_object-client_secret">client_secret</a>. After <code>next_action</code>s are handled by the client, no additional confirmation is required to complete the payment.  If the <code>confirmation_method</code> is <code>manual</code>, all payment attempts must be initiated using a secret key. If any actions are required for the payment, the PaymentIntent will return to the <code>requires_confirmation</code> state after those actions are completed. Your server needs to then explicitly re-confirm the PaymentIntent to initiate the next payment attempt. Read the <a href="/docs/payments/payment-intents/web-manual">expanded documentation</a> to learn more about manual confirmation.
public struct PostPaymentIntentsIntentConfirm: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = PaymentIntent
	public typealias paramType = Params
	public struct Params {
		let intent: String

		public init(intent: String) {
			self.intent = intent
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/payment_intents/\(inputs.intent)/confirm"
	}

	public final class FormInput: Codable {
		/// The client secret of the PaymentIntent.
		public var client_secret: String?
		/// Set to `true` to fail the payment attempt if the PaymentIntent transitions into `requires_action`. This parameter is intended for simpler integrations that do not handle customer actions, like [saving cards without authentication](https://stripe.com/docs/payments/save-card-without-authentication).
		public var error_on_requires_action: Bool?
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?
		/// ID of the mandate to be used for this payment.
		public var mandate: String?
		/// This hash contains details about the Mandate to create
		public var mandate_data: MESSED_UP?
		/// Set to `true` to indicate that the customer is not in your checkout flow during this payment attempt, and therefore is unable to authenticate. This parameter is intended for scenarios where you collect card details and [charge them later](https://stripe.com/docs/payments/cards/charging-saved-cards).
		public var off_session: Bool?
		/// ID of the payment method (a PaymentMethod, Card, or [compatible Source](https://stripe.com/docs/payments/payment-methods#compatibility) object) to attach to this PaymentIntent.
		public var payment_method: String?
		/// If provided, this hash will be used to create a PaymentMethod. The new PaymentMethod will appear in the [payment_method](https://stripe.com/docs/api/payment_intents/object#payment_intent_object-payment_method) property on the PaymentIntent.
		public var payment_method_data: PaymentMethodDataParams?
		/// Payment-method-specific configuration for this PaymentIntent.
		public var payment_method_options: PaymentMethodOptionsParam?
		/// The list of payment method types (e.g. card) that this PaymentIntent is allowed to use.
		public var payment_method_types: [String]?
		/// Email address that the receipt for the resulting payment will be sent to. If `receipt_email` is specified for a payment in live mode, a receipt will be sent regardless of your [email settings](https://dashboard.stripe.com/account/emails).
		public var receipt_email: String?
		/// The URL to redirect your customer back to after they authenticate or cancel their payment on the payment method's app or site. If you'd prefer to redirect to a mobile application, you can alternatively supply an application URI scheme. This parameter is only used for cards and other redirect-based payment methods.
		public var return_url: String?
		/// Indicates that you intend to make future payments with this PaymentIntent's payment method.  Providing this parameter will [attach the payment method](https://stripe.com/docs/payments/save-during-payment) to the PaymentIntent's Customer, if present, after the PaymentIntent is confirmed and any required actions from the user are complete. If no Customer was provided, the payment method can still be [attached](https://stripe.com/docs/api/payment_methods/attach) to a Customer after the transaction completes.  When processing card payments, Stripe also uses `setup_future_usage` to dynamically optimize your payment flow and comply with regional legislation and network rules, such as [SCA](https://stripe.com/docs/strong-customer-authentication).  If `setup_future_usage` is already set and you are performing a request using a publishable key, you may only update the value from `on_session` to `off_session`.
		public var setup_future_usage: SetupFutureUsageValues?
		/// Shipping information for this PaymentIntent.
		public var shipping: MESSED_UP?
		/// Set to `true` only when using manual confirmation and the iOS or Android SDKs to handle additional authentication steps.
		public var use_stripe_sdk: Bool?

		public init(client_secret: String? = nil, error_on_requires_action: Bool? = nil, expand: [String]? = nil, mandate: String? = nil, mandate_data: MESSED_UP? = nil, off_session: Bool? = nil, payment_method: String? = nil, payment_method_data: PaymentMethodDataParams? = nil, payment_method_options: PaymentMethodOptionsParam? = nil, payment_method_types: [String]? = nil, receipt_email: String? = nil, return_url: String? = nil, setup_future_usage: SetupFutureUsageValues? = nil, shipping: MESSED_UP? = nil, use_stripe_sdk: Bool? = nil) {
			self.client_secret = client_secret
			self.error_on_requires_action = error_on_requires_action
			self.expand = expand
			self.mandate = mandate
			self.mandate_data = mandate_data
			self.off_session = off_session
			self.payment_method = payment_method
			self.payment_method_data = payment_method_data
			self.payment_method_options = payment_method_options
			self.payment_method_types = payment_method_types
			self.receipt_email = receipt_email
			self.return_url = return_url
			self.setup_future_usage = setup_future_usage
			self.shipping = shipping
			self.use_stripe_sdk = use_stripe_sdk
		}


		/// If provided, this hash will be used to create a PaymentMethod. The new PaymentMethod will appear in the [payment_method](https://stripe.com/docs/api/payment_intents/object#payment_intent_object-payment_method) property on the PaymentIntent.
		public final class PaymentMethodDataParams: Codable {
			public var alipay: Param?
			public var au_becs_debit: Param?
			public var bacs_debit: Param?
			public var bancontact: Param?
			public var billing_details: BillingDetailsInnerParams?
			public var eps: Param?
			public var fpx: Param?
			public var giropay: Param?
			public var grabpay: Param?
			public var ideal: Param?
			public var interac_present: Param?
			public var metadata: Empty?
			public var oxxo: Param?
			public var p24: Param?
			public var sepa_debit: Param?
			public var sofort: Param?
			public var type: TypeValues

			/// If provided, this hash will be used to create a PaymentMethod. The new PaymentMethod will appear in the [payment_method](https://stripe.com/docs/api/payment_intents/object#payment_intent_object-payment_method) property on the PaymentIntent.
			/// - Parameters:
			///   - type: 
			public init(type: TypeValues, alipay: Param? = nil, au_becs_debit: Param? = nil, bacs_debit: Param? = nil, bancontact: Param? = nil, billing_details: BillingDetailsInnerParams? = nil, eps: Param? = nil, fpx: Param? = nil, giropay: Param? = nil, grabpay: Param? = nil, ideal: Param? = nil, interac_present: Param? = nil, metadata: Empty? = nil, oxxo: Param? = nil, p24: Param? = nil, sepa_debit: Param? = nil, sofort: Param? = nil) {
				self.type = type
				self.alipay = alipay
				self.au_becs_debit = au_becs_debit
				self.bacs_debit = bacs_debit
				self.bancontact = bancontact
				self.billing_details = billing_details
				self.eps = eps
				self.fpx = fpx
				self.giropay = giropay
				self.grabpay = grabpay
				self.ideal = ideal
				self.interac_present = interac_present
				self.metadata = metadata
				self.oxxo = oxxo
				self.p24 = p24
				self.sepa_debit = sepa_debit
				self.sofort = sofort
			}


			public final class BillingDetailsInnerParams: Codable {
				public var address: MESSED_UP?
				public var email: String?
				public var name: String?
				public var phone: String?

				public init(address: MESSED_UP? = nil, email: String? = nil, name: String? = nil, phone: String? = nil) {
					self.address = address
					self.email = email
					self.name = name
					self.phone = phone
				}
			}



			public final class Param: Codable {
				public var country: CountryValues

				public init(country: CountryValues) {
					self.country = country
				}

				public enum CountryValues: String, Codable {
					case optionAT = "AT"
					case optionBE = "BE"
					case optionDE = "DE"
					case optionES = "ES"
					case optionIT = "IT"
					case optionNL = "NL"
				}
			}


			public enum TypeValues: String, Codable {
				case alipay = "alipay"
				case auBecsDebit = "au_becs_debit"
				case bacsDebit = "bacs_debit"
				case bancontact = "bancontact"
				case eps = "eps"
				case fpx = "fpx"
				case giropay = "giropay"
				case grabpay = "grabpay"
				case ideal = "ideal"
				case oxxo = "oxxo"
				case p24 = "p24"
				case sepaDebit = "sepa_debit"
				case sofort = "sofort"
			}
		}



		/// Payment-method-specific configuration for this PaymentIntent.
		public final class PaymentMethodOptionsParam: Codable {
			public var alipay: MESSED_UP?
			public var bancontact: MESSED_UP?
			public var card: MESSED_UP?
			public var oxxo: MESSED_UP?
			public var p24: MESSED_UP?
			public var sepa_debit: MESSED_UP?
			public var sofort: MESSED_UP?

			/// Payment-method-specific configuration for this PaymentIntent.
			/// - Parameters:
			public init(alipay: MESSED_UP? = nil, bancontact: MESSED_UP? = nil, card: MESSED_UP? = nil, oxxo: MESSED_UP? = nil, p24: MESSED_UP? = nil, sepa_debit: MESSED_UP? = nil, sofort: MESSED_UP? = nil) {
				self.alipay = alipay
				self.bancontact = bancontact
				self.card = card
				self.oxxo = oxxo
				self.p24 = p24
				self.sepa_debit = sepa_debit
				self.sofort = sofort
			}
		}


		public enum SetupFutureUsageValues: String, Codable {
			case offSession = "off_session"
			case onSession = "on_session"
		}
	}

}
