
/// Returns a list of configurations that describe the functionality of the customer portal.
public struct GetBillingPortalConfigurations: StripeAPIEndpoint {
	public typealias inputType = AnyCodable
	public typealias outputType = Output
	public typealias paramType = Params
	
	public struct Params {
		let active: Bool?
		let ending_before: String?
		let is_default: Bool?
		let limit: Int?
		let starting_after: String?

		/// Initialize the request parameters
		/// - Parameter active: Only return configurations that are active or inactive (e.g., pass `true` to only list active configurations).
		/// - Parameter ending_before: A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list.
		/// - Parameter is_default: Only return the default or non-default configurations (e.g., pass `true` to only list the default configuration).
		/// - Parameter limit: A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10.
		/// - Parameter starting_after: A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list.
		public init(active: Bool? = nil, ending_before: String? = nil, is_default: Bool? = nil, limit: Int? = nil, starting_after: String? = nil) {
			self.active = active
			self.ending_before = ending_before
			self.is_default = is_default
			self.limit = limit
			self.starting_after = starting_after
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		var params = [String]()
		if let a = inputs.active?.urlEncoded { params.append("active=\(a)") }
		if let a = inputs.ending_before?.urlEncoded { params.append("ending_before=\(a)") }
		if let a = inputs.is_default?.urlEncoded { params.append("is_default=\(a)") }
		if let a = inputs.limit?.urlEncoded { params.append("limit=\(a)") }
		if let a = inputs.starting_after?.urlEncoded { params.append("starting_after=\(a)") }
		let query = params.joined(separator: "&")
		return "/v1/billing_portal/configurations?\(query)"
	}
	public static var method: HTTPMethod { return .GET }

	public final class Output: Codable {
		public var data: [BillingPortalConfiguration]
		/// True if this list has another page of items after this one that can be fetched.
		public var has_more: Bool
		/// String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
		public var object: ObjectValues
		/// The URL where this list can be accessed.
		public var url: String

		public init(data: [BillingPortalConfiguration], has_more: Bool, object: ObjectValues, url: String) {
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

/// Creates a configuration that describes the functionality and behavior of a PortalSession
public struct PostBillingPortalConfigurations: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = BillingPortalConfiguration
	public typealias paramType = AnyCodable
	public static func endpoint(for inputs: AnyCodable) throws -> String {
		return "/v1/billing_portal/configurations"
	}

	public final class FormInput: Codable {
		/// The business information shown to customers in the portal.
		public var business_profile: BusinessProfileCreateParam
		/// The default URL to redirect customers to when they click on the portal's link to return to your website. This can be [overriden](https://stripe.com/docs/api/customer_portal/sessions/create#create_portal_session-return_url) when creating the session.
		public var default_return_url: String?
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?
		/// Information about the features available in the portal.
		public var features: FeaturesCreationParam

		public init(business_profile: BusinessProfileCreateParam, features: FeaturesCreationParam, default_return_url: String? = nil, expand: [String]? = nil) {
			self.business_profile = business_profile
			self.features = features
			self.default_return_url = default_return_url
			self.expand = expand
		}


		/// The business information shown to customers in the portal.
		public final class BusinessProfileCreateParam: Codable {
			public var headline: String?
			public var privacy_policy_url: String
			public var terms_of_service_url: String

			/// The business information shown to customers in the portal.
			/// - Parameters:
			///   - privacy_policy_url: 
			///   - terms_of_service_url: 
			public init(privacy_policy_url: String, terms_of_service_url: String, headline: String? = nil) {
				self.privacy_policy_url = privacy_policy_url
				self.terms_of_service_url = terms_of_service_url
				self.headline = headline
			}
		}



		/// Information about the features available in the portal.
		public final class FeaturesCreationParam: Codable {
			public var customer_update: CustomerUpdateCreationParam?
			public var invoice_history: InvoiceListParam?
			public var payment_method_update: PaymentMethodUpdateParam?
			public var subscription_cancel: SubscriptionCancelCreationParam?
			public var subscription_pause: SubscriptionPauseParam?
			public var subscription_update: SubscriptionUpdateCreationParam?

			/// Information about the features available in the portal.
			/// - Parameters:
			public init(customer_update: CustomerUpdateCreationParam? = nil, invoice_history: InvoiceListParam? = nil, payment_method_update: PaymentMethodUpdateParam? = nil, subscription_cancel: SubscriptionCancelCreationParam? = nil, subscription_pause: SubscriptionPauseParam? = nil, subscription_update: SubscriptionUpdateCreationParam? = nil) {
				self.customer_update = customer_update
				self.invoice_history = invoice_history
				self.payment_method_update = payment_method_update
				self.subscription_cancel = subscription_cancel
				self.subscription_pause = subscription_pause
				self.subscription_update = subscription_update
			}


			public final class CustomerUpdateCreationParam: Codable {
				public var allowed_updates: AnyCodable
				public var enabled: Bool

				public init(allowed_updates: AnyCodable, enabled: Bool) {
					self.allowed_updates = allowed_updates
					self.enabled = enabled
				}
			}



			public final class InvoiceListParam: Codable {
				public var enabled: Bool

				public init(enabled: Bool) {
					self.enabled = enabled
				}
			}



			public final class PaymentMethodUpdateParam: Codable {
				public var enabled: Bool

				public init(enabled: Bool) {
					self.enabled = enabled
				}
			}



			public final class SubscriptionCancelCreationParam: Codable {
				public var cancellation_reason: SubscriptionCancellationReasonCreationParam?
				public var enabled: Bool
				public var mode: ModeValues?
				public var proration_behavior: ProrationBehaviorValues?

				public init(enabled: Bool, cancellation_reason: SubscriptionCancellationReasonCreationParam? = nil, mode: ModeValues? = nil, proration_behavior: ProrationBehaviorValues? = nil) {
					self.enabled = enabled
					self.cancellation_reason = cancellation_reason
					self.mode = mode
					self.proration_behavior = proration_behavior
				}


				public final class SubscriptionCancellationReasonCreationParam: Codable {
					public var enabled: Bool
					public var options: AnyCodable

					public init(enabled: Bool, options: AnyCodable) {
						self.enabled = enabled
						self.options = options
					}
				}


				public enum ModeValues: String, Codable {
					case atPeriodEnd = "at_period_end"
					case immediately = "immediately"
				}

				public enum ProrationBehaviorValues: String, Codable {
					case alwaysInvoice = "always_invoice"
					case createProrations = "create_prorations"
					case none = "none"
				}
			}



			public final class SubscriptionPauseParam: Codable {
				public var enabled: Bool?

				public init(enabled: Bool? = nil) {
					self.enabled = enabled
				}
			}



			public final class SubscriptionUpdateCreationParam: Codable {
				public var default_allowed_updates: AnyCodable
				public var enabled: Bool
				public var products: AnyCodable
				public var proration_behavior: ProrationBehaviorValues?

				public init(default_allowed_updates: AnyCodable, enabled: Bool, products: AnyCodable, proration_behavior: ProrationBehaviorValues? = nil) {
					self.default_allowed_updates = default_allowed_updates
					self.enabled = enabled
					self.products = products
					self.proration_behavior = proration_behavior
				}

				public enum ProrationBehaviorValues: String, Codable {
					case alwaysInvoice = "always_invoice"
					case createProrations = "create_prorations"
					case none = "none"
				}
			}

		}

	}

}

/// Retrieves a configuration that describes the functionality of the customer portal.
public struct GetBillingPortalConfigurationsConfiguration: StripeAPIEndpoint {
	public typealias inputType = AnyCodable
	public typealias outputType = BillingPortalConfiguration
	public typealias paramType = Params
	
	public struct Params {
		let configuration: String

		/// Initialize the request parameters
		/// - Parameter configuration: 
		public init(configuration: String) {
			self.configuration = configuration
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/billing_portal/configurations/\(inputs.configuration)"
	}
	public static var method: HTTPMethod { return .GET }

}

/// Updates a configuration that describes the functionality of the customer portal.
public struct PostBillingPortalConfigurationsConfiguration: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = BillingPortalConfiguration
	public typealias paramType = Params
	
	public struct Params {
		let configuration: String

		/// Initialize the request parameters
		/// - Parameter configuration: 
		public init(configuration: String) {
			self.configuration = configuration
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/billing_portal/configurations/\(inputs.configuration)"
	}

	public final class FormInput: Codable {
		/// Whether the configuration is active and can be used to create portal sessions.
		public var active: Bool?
		/// The business information shown to customers in the portal.
		public var business_profile: BusinessProfileUpdateParam?
		/// The default URL to redirect customers to when they click on the portal's link to return to your website. This can be [overriden](https://stripe.com/docs/api/customer_portal/sessions/create#create_portal_session-return_url) when creating the session.
		public var default_return_url: String?
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?
		/// Information about the features available in the portal.
		public var features: FeaturesUpdatingParam?

		public init(active: Bool? = nil, business_profile: BusinessProfileUpdateParam? = nil, default_return_url: String? = nil, expand: [String]? = nil, features: FeaturesUpdatingParam? = nil) {
			self.active = active
			self.business_profile = business_profile
			self.default_return_url = default_return_url
			self.expand = expand
			self.features = features
		}


		/// The business information shown to customers in the portal.
		public final class BusinessProfileUpdateParam: Codable {
			public var headline: String?
			public var privacy_policy_url: String?
			public var terms_of_service_url: String?

			/// The business information shown to customers in the portal.
			/// - Parameters:
			public init(headline: String? = nil, privacy_policy_url: String? = nil, terms_of_service_url: String? = nil) {
				self.headline = headline
				self.privacy_policy_url = privacy_policy_url
				self.terms_of_service_url = terms_of_service_url
			}
		}



		/// Information about the features available in the portal.
		public final class FeaturesUpdatingParam: Codable {
			public var customer_update: CustomerUpdateUpdatingParam?
			public var invoice_history: InvoiceListParam?
			public var payment_method_update: PaymentMethodUpdateParam?
			public var subscription_cancel: SubscriptionCancelUpdatingParam?
			public var subscription_pause: SubscriptionPauseParam?
			public var subscription_update: SubscriptionUpdateUpdatingParam?

			/// Information about the features available in the portal.
			/// - Parameters:
			public init(customer_update: CustomerUpdateUpdatingParam? = nil, invoice_history: InvoiceListParam? = nil, payment_method_update: PaymentMethodUpdateParam? = nil, subscription_cancel: SubscriptionCancelUpdatingParam? = nil, subscription_pause: SubscriptionPauseParam? = nil, subscription_update: SubscriptionUpdateUpdatingParam? = nil) {
				self.customer_update = customer_update
				self.invoice_history = invoice_history
				self.payment_method_update = payment_method_update
				self.subscription_cancel = subscription_cancel
				self.subscription_pause = subscription_pause
				self.subscription_update = subscription_update
			}


			public final class CustomerUpdateUpdatingParam: Codable {
				public var allowed_updates: AnyCodable?
				public var enabled: Bool?

				public init(allowed_updates: AnyCodable? = nil, enabled: Bool? = nil) {
					self.allowed_updates = allowed_updates
					self.enabled = enabled
				}
			}



			public final class InvoiceListParam: Codable {
				public var enabled: Bool

				public init(enabled: Bool) {
					self.enabled = enabled
				}
			}



			public final class PaymentMethodUpdateParam: Codable {
				public var enabled: Bool

				public init(enabled: Bool) {
					self.enabled = enabled
				}
			}



			public final class SubscriptionCancelUpdatingParam: Codable {
				public var cancellation_reason: SubscriptionCancellationReasonUpdatingParam?
				public var enabled: Bool?
				public var mode: ModeValues?
				public var proration_behavior: ProrationBehaviorValues?

				public init(cancellation_reason: SubscriptionCancellationReasonUpdatingParam? = nil, enabled: Bool? = nil, mode: ModeValues? = nil, proration_behavior: ProrationBehaviorValues? = nil) {
					self.cancellation_reason = cancellation_reason
					self.enabled = enabled
					self.mode = mode
					self.proration_behavior = proration_behavior
				}


				public final class SubscriptionCancellationReasonUpdatingParam: Codable {
					public var enabled: Bool
					public var options: AnyCodable?

					public init(enabled: Bool, options: AnyCodable? = nil) {
						self.enabled = enabled
						self.options = options
					}
				}


				public enum ModeValues: String, Codable {
					case atPeriodEnd = "at_period_end"
					case immediately = "immediately"
				}

				public enum ProrationBehaviorValues: String, Codable {
					case alwaysInvoice = "always_invoice"
					case createProrations = "create_prorations"
					case none = "none"
				}
			}



			public final class SubscriptionPauseParam: Codable {
				public var enabled: Bool?

				public init(enabled: Bool? = nil) {
					self.enabled = enabled
				}
			}



			public final class SubscriptionUpdateUpdatingParam: Codable {
				public var default_allowed_updates: AnyCodable?
				public var enabled: Bool?
				public var products: AnyCodable?
				public var proration_behavior: ProrationBehaviorValues?

				public init(default_allowed_updates: AnyCodable? = nil, enabled: Bool? = nil, products: AnyCodable? = nil, proration_behavior: ProrationBehaviorValues? = nil) {
					self.default_allowed_updates = default_allowed_updates
					self.enabled = enabled
					self.products = products
					self.proration_behavior = proration_behavior
				}

				public enum ProrationBehaviorValues: String, Codable {
					case alwaysInvoice = "always_invoice"
					case createProrations = "create_prorations"
					case none = "none"
				}
			}

		}

	}

}

/// Creates a session of the customer portal.
public struct PostBillingPortalSessions: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = BillingPortalSession
	public typealias paramType = AnyCodable
	public static func endpoint(for inputs: AnyCodable) throws -> String {
		return "/v1/billing_portal/sessions"
	}

	public final class FormInput: Codable {
		/// The ID of an existing [configuration](https://stripe.com/docs/api/customer_portal/configuration) to use for this session, describing its functionality and features. If not specified, the session uses the default configuration.
		public var configuration: String?
		/// The ID of an existing customer.
		public var customer: String
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?
		/// The IETF language tag of the locale Customer Portal is displayed in. If blank or auto, the customer’s `preferred_locales` or browser’s locale is used.
		public var locale: LocaleValues?
		/// The `on_behalf_of` account to use for this session. When specified, only subscriptions and invoices with this `on_behalf_of` account appear in the portal. For more information, see the [docs](https://stripe.com/docs/connect/charges-transfers#on-behalf-of). Use the [Accounts API](https://stripe.com/docs/api/accounts/object#account_object-settings-branding) to modify the `on_behalf_of` account's branding settings, which the portal displays.
		public var on_behalf_of: String?
		/// The default URL to redirect customers to when they click on the portal's link to return to your website.
		public var return_url: String?

		public init(customer: String, configuration: String? = nil, expand: [String]? = nil, locale: LocaleValues? = nil, on_behalf_of: String? = nil, return_url: String? = nil) {
			self.customer = customer
			self.configuration = configuration
			self.expand = expand
			self.locale = locale
			self.on_behalf_of = on_behalf_of
			self.return_url = return_url
		}

		public enum LocaleValues: String, Codable {
			case auto = "auto"
			case bg = "bg"
			case cs = "cs"
			case da = "da"
			case de = "de"
			case el = "el"
			case en = "en"
			case enMinusAu = "en-AU"
			case enMinusCa = "en-CA"
			case enMinusGb = "en-GB"
			case enMinusIe = "en-IE"
			case enMinusIn = "en-IN"
			case enMinusNz = "en-NZ"
			case enMinusSg = "en-SG"
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
	}

}
