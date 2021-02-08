
/// Returns a list of SetupIntents.
public struct GetSetupIntents: StripeAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = PaymentFlowsSetupIntentList
	public typealias paramType = Params
	public struct Params {
		let limit: Int
		let ending_before: String
		let customer: String
		let payment_method: String
		let starting_after: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/setup_intents?ending_before=\(inputs.ending_before.urlEncoded))&payment_method=\(inputs.payment_method.urlEncoded))&starting_after=\(inputs.starting_after.urlEncoded))&customer=\(inputs.customer.urlEncoded))&limit=\(inputs.limit.urlEncoded))"
	}
	public static var method: HTTPMethod { return .GET }

	public class PaymentFlowsSetupIntentList: Codable {
		public var data: [SetupIntent]
		/// True if this list has another page of items after this one that can be fetched.
		public var has_more: Bool
		/// String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
		public var object: ObjectValues
		/// The URL where this list can be accessed.
		public var url: String

		public init(data: [SetupIntent], has_more: Bool, object: ObjectValues, url: String) {
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

/// Creates a SetupIntent object.  After the SetupIntent is created, attach a payment method and <a href="/docs/api/setup_intents/confirm">confirm</a> to collect any required permissions to charge the payment method later.
public struct PostSetupIntents: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = SetupIntent
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v1/setup_intents"
	}

	public class FormInput: Codable {
		/// Set to `true` to attempt to confirm this SetupIntent immediately. This parameter defaults to `false`. If the payment method attached is a card, a return_url may be provided in case additional authentication is required.
		public var confirm: Bool?
		/// ID of the Customer this SetupIntent belongs to, if one exists.  If present, the SetupIntent's payment method will be attached to the Customer on successful setup. Payment methods attached to other Customers cannot be used with this SetupIntent.
		public var customer: String?
		/// An arbitrary string attached to the object. Often useful for displaying to users.
		public var description: String?
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?
		/// This hash contains details about the Mandate to create. This parameter can only be used with [`confirm=true`](https://stripe.com/docs/api/setup_intents/create#create_setup_intent-confirm).
		public var mandate_data: SecretKeyParam?
		/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
		public var metadata: String?
		/// The Stripe account ID for which this SetupIntent is created.
		public var on_behalf_of: String?
		/// ID of the payment method (a PaymentMethod, Card, or saved Source object) to attach to this SetupIntent.
		public var payment_method: String?
		/// Payment-method-specific configuration for this SetupIntent.
		public var payment_method_options: PaymentMethodOptionsParam?
		/// The list of payment method types (e.g. card) that this SetupIntent is allowed to use. If this is not provided, defaults to ["card"].
		public var payment_method_types: [String]?
		/// The URL to redirect your customer back to after they authenticate or cancel their payment on the payment method's app or site. If you'd prefer to redirect to a mobile application, you can alternatively supply an application URI scheme. This parameter can only be used with [`confirm=true`](https://stripe.com/docs/api/setup_intents/create#create_setup_intent-confirm).
		public var return_url: String?
		/// If this hash is populated, this SetupIntent will generate a single_use Mandate on success.
		public var single_use: SetupIntentSingleUseParams?
		/// Indicates how the payment method is intended to be used in the future. If not provided, this value defaults to `off_session`.
		public var usage: UsageValues?

		public init(confirm: Bool? = nil, customer: String? = nil, description: String? = nil, expand: [String]? = nil, mandate_data: SecretKeyParam? = nil, metadata: String? = nil, on_behalf_of: String? = nil, payment_method: String? = nil, payment_method_options: PaymentMethodOptionsParam? = nil, payment_method_types: [String]? = nil, return_url: String? = nil, single_use: SetupIntentSingleUseParams? = nil, usage: UsageValues? = nil) {
			self.confirm = confirm
			self.customer = customer
			self.description = description
			self.expand = expand
			self.mandate_data = mandate_data
			self.metadata = metadata
			self.on_behalf_of = on_behalf_of
			self.payment_method = payment_method
			self.payment_method_options = payment_method_options
			self.payment_method_types = payment_method_types
			self.return_url = return_url
			self.single_use = single_use
			self.usage = usage
		}


		/// This hash contains details about the Mandate to create. This parameter can only be used with [`confirm=true`](https://stripe.com/docs/api/setup_intents/create#create_setup_intent-confirm).
		public class SecretKeyParam: Codable {
			public var customer_acceptance: CustomerAcceptanceParam

			/// This hash contains details about the Mandate to create. This parameter can only be used with [`confirm=true`](https://stripe.com/docs/api/setup_intents/create#create_setup_intent-confirm).
			/// - Parameters:
			///   - customer_acceptance: 
			public init(customer_acceptance: CustomerAcceptanceParam) {
				self.customer_acceptance = customer_acceptance
			}


			public class CustomerAcceptanceParam: Codable {
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


				public class OnlineParam: Codable {
					public var ip_address: String
					public var user_agent: String

					public init(ip_address: String, user_agent: String) {
						self.ip_address = ip_address
						self.user_agent = user_agent
					}
				}



				public class OfflineParam: Codable {

					public init() {
					}
				}


				public enum TypeValues: String, Codable {
					case offline = "offline"
					case online = "online"
				}
			}

		}



		/// If this hash is populated, this SetupIntent will generate a single_use Mandate on success.
		public class SetupIntentSingleUseParams: Codable {
			public var amount: Int
			public var currency: String

			/// If this hash is populated, this SetupIntent will generate a single_use Mandate on success.
			/// - Parameters:
			///   - amount: 
			///   - currency: 
			public init(amount: Int, currency: String) {
				self.amount = amount
				self.currency = currency
			}
		}



		/// Payment-method-specific configuration for this SetupIntent.
		public class PaymentMethodOptionsParam: Codable {
			public var card: SetupIntentParam?
			public var sepa_debit: SetupIntentPaymentMethodOptionsParam?

			/// Payment-method-specific configuration for this SetupIntent.
			/// - Parameters:
			public init(card: SetupIntentParam? = nil, sepa_debit: SetupIntentPaymentMethodOptionsParam? = nil) {
				self.card = card
				self.sepa_debit = sepa_debit
			}


			public class SetupIntentParam: Codable {
				public var request_three_d_secure: RequestThreeDSecureValues?

				public init(request_three_d_secure: RequestThreeDSecureValues? = nil) {
					self.request_three_d_secure = request_three_d_secure
				}

				public enum RequestThreeDSecureValues: String, Codable {
					case any = "any"
					case automatic = "automatic"
				}
			}



			public class SetupIntentPaymentMethodOptionsParam: Codable {
				public var mandate_options: PaymentMethodOptionsMandateOptionsParam?

				public init(mandate_options: PaymentMethodOptionsMandateOptionsParam? = nil) {
					self.mandate_options = mandate_options
				}


				public class PaymentMethodOptionsMandateOptionsParam: Codable {

					public init() {
					}
				}

			}

		}


		public enum UsageValues: String, Codable {
			case offSession = "off_session"
			case onSession = "on_session"
		}
	}

}

/// Retrieves the details of a SetupIntent that has previously been created.   Client-side retrieval using a publishable key is allowed when the <code>client_secret</code> is provided in the query string.   When retrieved with a publishable key, only a subset of properties will be returned. Please refer to the <a href="#setup_intent_object">SetupIntent</a> object reference for more details.
public struct GetSetupIntentsIntent: StripeAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = SetupIntent
	public typealias paramType = Params
	public struct Params {
		let intent: String
		let client_secret: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/setup_intents/\(inputs.intent)?client_secret=\(inputs.client_secret.urlEncoded))"
	}
	public static var method: HTTPMethod { return .GET }

}

/// Updates a SetupIntent object.
public struct PostSetupIntentsIntent: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = SetupIntent
	public typealias paramType = Params
	public struct Params {
		let intent: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/setup_intents/\(inputs.intent)"
	}

	public class FormInput: Codable {
		/// ID of the Customer this SetupIntent belongs to, if one exists.  If present, the SetupIntent's payment method will be attached to the Customer on successful setup. Payment methods attached to other Customers cannot be used with this SetupIntent.
		public var customer: String?
		/// An arbitrary string attached to the object. Often useful for displaying to users.
		public var description: String?
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?
		/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
		public var metadata: MESSED_UP?
		/// ID of the payment method (a PaymentMethod, Card, or saved Source object) to attach to this SetupIntent.
		public var payment_method: String?
		/// Payment-method-specific configuration for this SetupIntent.
		public var payment_method_options: PaymentMethodOptionsParam?
		/// The list of payment method types (e.g. card) that this SetupIntent is allowed to set up. If this is not provided, defaults to ["card"].
		public var payment_method_types: [String]?

		public init(customer: String? = nil, description: String? = nil, expand: [String]? = nil, metadata: MESSED_UP? = nil, payment_method: String? = nil, payment_method_options: PaymentMethodOptionsParam? = nil, payment_method_types: [String]? = nil) {
			self.customer = customer
			self.description = description
			self.expand = expand
			self.metadata = metadata
			self.payment_method = payment_method
			self.payment_method_options = payment_method_options
			self.payment_method_types = payment_method_types
		}


		/// Payment-method-specific configuration for this SetupIntent.
		public class PaymentMethodOptionsParam: Codable {
			public var card: SetupIntentParam?
			public var sepa_debit: SetupIntentPaymentMethodOptionsParam?

			/// Payment-method-specific configuration for this SetupIntent.
			/// - Parameters:
			public init(card: SetupIntentParam? = nil, sepa_debit: SetupIntentPaymentMethodOptionsParam? = nil) {
				self.card = card
				self.sepa_debit = sepa_debit
			}


			public class SetupIntentPaymentMethodOptionsParam: Codable {
				public var mandate_options: PaymentMethodOptionsMandateOptionsParam?

				public init(mandate_options: PaymentMethodOptionsMandateOptionsParam? = nil) {
					self.mandate_options = mandate_options
				}


				public class PaymentMethodOptionsMandateOptionsParam: Codable {

					public init() {
					}
				}

			}



			public class SetupIntentParam: Codable {
				public var request_three_d_secure: RequestThreeDSecureValues?

				public init(request_three_d_secure: RequestThreeDSecureValues? = nil) {
					self.request_three_d_secure = request_three_d_secure
				}

				public enum RequestThreeDSecureValues: String, Codable {
					case any = "any"
					case automatic = "automatic"
				}
			}

		}

	}

}

/// A SetupIntent object can be canceled when it is in one of these statuses: <code>requires_payment_method</code>, <code>requires_confirmation</code>, or <code>requires_action</code>.   Once canceled, setup is abandoned and any operations on the SetupIntent will fail with an error.
public struct PostSetupIntentsIntentCancel: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = SetupIntent
	public typealias paramType = Params
	public struct Params {
		let intent: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/setup_intents/\(inputs.intent)/cancel"
	}

	public class FormInput: Codable {
		/// Reason for canceling this SetupIntent. Possible values are `abandoned`, `requested_by_customer`, or `duplicate`
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
			case requestedByCustomer = "requested_by_customer"
		}
	}

}

/// Confirm that your customer intends to set up the current or provided payment method. For example, you would confirm a SetupIntent when a customer hits the “Save” button on a payment method management page on your website.  If the selected payment method does not require any additional steps from the customer, the SetupIntent will transition to the <code>succeeded</code> status.  Otherwise, it will transition to the <code>requires_action</code> status and suggest additional actions via <code>next_action</code>. If setup fails, the SetupIntent will transition to the <code>requires_payment_method</code> status.
public struct PostSetupIntentsIntentConfirm: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = SetupIntent
	public typealias paramType = Params
	public struct Params {
		let intent: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/setup_intents/\(inputs.intent)/confirm"
	}

	public class FormInput: Codable {
		/// The client secret of the SetupIntent.
		public var client_secret: String?
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?
		/// This hash contains details about the Mandate to create
		public var mandate_data: MESSED_UP?
		/// ID of the payment method (a PaymentMethod, Card, or saved Source object) to attach to this SetupIntent.
		public var payment_method: String?
		/// Payment-method-specific configuration for this SetupIntent.
		public var payment_method_options: PaymentMethodOptionsParam?
		/// The URL to redirect your customer back to after they authenticate on the payment method's app or site. If you'd prefer to redirect to a mobile application, you can alternatively supply an application URI scheme. This parameter is only used for cards and other redirect-based payment methods.
		public var return_url: String?

		public init(client_secret: String? = nil, expand: [String]? = nil, mandate_data: MESSED_UP? = nil, payment_method: String? = nil, payment_method_options: PaymentMethodOptionsParam? = nil, return_url: String? = nil) {
			self.client_secret = client_secret
			self.expand = expand
			self.mandate_data = mandate_data
			self.payment_method = payment_method
			self.payment_method_options = payment_method_options
			self.return_url = return_url
		}


		/// Payment-method-specific configuration for this SetupIntent.
		public class PaymentMethodOptionsParam: Codable {
			public var card: SetupIntentParam?
			public var sepa_debit: SetupIntentPaymentMethodOptionsParam?

			/// Payment-method-specific configuration for this SetupIntent.
			/// - Parameters:
			public init(card: SetupIntentParam? = nil, sepa_debit: SetupIntentPaymentMethodOptionsParam? = nil) {
				self.card = card
				self.sepa_debit = sepa_debit
			}


			public class SetupIntentParam: Codable {
				public var request_three_d_secure: RequestThreeDSecureValues?

				public init(request_three_d_secure: RequestThreeDSecureValues? = nil) {
					self.request_three_d_secure = request_three_d_secure
				}

				public enum RequestThreeDSecureValues: String, Codable {
					case any = "any"
					case automatic = "automatic"
				}
			}



			public class SetupIntentPaymentMethodOptionsParam: Codable {
				public var mandate_options: PaymentMethodOptionsMandateOptionsParam?

				public init(mandate_options: PaymentMethodOptionsMandateOptionsParam? = nil) {
					self.mandate_options = mandate_options
				}


				public class PaymentMethodOptionsMandateOptionsParam: Codable {

					public init() {
					}
				}

			}

		}

	}

}