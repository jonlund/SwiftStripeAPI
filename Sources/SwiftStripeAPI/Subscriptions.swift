
/// By default, returns a list of subscriptions that have not been canceled. In order to list canceled subscriptions, specify <code>status=canceled</code>.
public struct GetSubscriptions: StripeAPIEndpoint {
	public typealias inputType = AnyCodable
	public typealias outputType = Output
	public typealias paramType = Params
	
	public struct Params {
		let collection_method: String?
		let customer: String?
		let ending_before: String?
		let limit: Int?
		let price: String?
		let starting_after: String?
		let status: String?

		/// Initialize the request parameters
		/// - Parameter collection_method: The collection method of the subscriptions to retrieve. Either `charge_automatically` or `send_invoice`.
		/// - Parameter customer: The ID of the customer whose subscriptions will be retrieved.
		/// - Parameter ending_before: A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list.
		/// - Parameter limit: A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10.
		/// - Parameter price: Filter for subscriptions that contain this recurring price ID.
		/// - Parameter starting_after: A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list.
		/// - Parameter status: The status of the subscriptions to retrieve. Passing in a value of `canceled` will return all canceled subscriptions, including those belonging to deleted customers. Pass `ended` to find subscriptions that are canceled and subscriptions that are expired due to [incomplete payment](https://stripe.com/docs/billing/subscriptions/overview#subscription-statuses). Passing in a value of `all` will return subscriptions of all statuses. If no value is supplied, all subscriptions that have not been canceled are returned.
		public init(collection_method: String? = nil, customer: String? = nil, ending_before: String? = nil, limit: Int? = nil, price: String? = nil, starting_after: String? = nil, status: String? = nil) {
			self.collection_method = collection_method
			self.customer = customer
			self.ending_before = ending_before
			self.limit = limit
			self.price = price
			self.starting_after = starting_after
			self.status = status
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		var params = [String]()
		if let a = inputs.collection_method?.urlEncoded { params.append("collection_method=\(a)") }
		if let a = inputs.customer?.urlEncoded { params.append("customer=\(a)") }
		if let a = inputs.ending_before?.urlEncoded { params.append("ending_before=\(a)") }
		if let a = inputs.limit?.urlEncoded { params.append("limit=\(a)") }
		if let a = inputs.price?.urlEncoded { params.append("price=\(a)") }
		if let a = inputs.starting_after?.urlEncoded { params.append("starting_after=\(a)") }
		if let a = inputs.status?.urlEncoded { params.append("status=\(a)") }
		let query = params.joined(separator: "&")
		return "/v1/subscriptions?\(query)"
	}
	public static var method: HTTPMethod { return .GET }

	public final class Output: Codable {
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

/// Creates a new subscription on an existing customer. Each customer can have up to 500 active or scheduled subscriptions.
public struct PostSubscriptions: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = Subscription
	public typealias paramType = AnyCodable
	public static func endpoint(for inputs: AnyCodable) throws -> String {
		return "/v1/subscriptions"
	}

	public final class FormInput: Codable {
		/// A list of prices and quantities that will generate invoice items appended to the first invoice for this subscription. You may pass up to 20 items.
		public var add_invoice_items: AnyCodable?
		/// A non-negative decimal between 0 and 100, with at most two decimal places. This represents the percentage of the subscription invoice subtotal that will be transferred to the application owner's Stripe account. The request must be made by a platform account on a connected account in order to set an application fee percentage. For more information, see the application fees [documentation](https://stripe.com/docs/connect/subscriptions#collecting-fees-on-subscriptions).
		public var application_fee_percent: StringNumber?
		/// Automatic tax settings for this subscription.
		public var automatic_tax: AutomaticTaxConfig?
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
		/// The ID of the coupon to apply to this subscription. A coupon applied to a subscription will only affect invoices created for that particular subscription.
		public var coupon: String?
		/// The identifier of the customer to subscribe.
		public var customer: String
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
		/// Use `allow_incomplete` to create subscriptions with `status=incomplete` if the first invoice cannot be paid. Creating subscriptions with this status allows you to manage scenarios where additional user actions are needed to pay a subscription's invoice. For example, SCA regulation may require 3DS authentication to complete payment. See the [SCA Migration Guide](https://stripe.com/docs/billing/migration/strong-customer-authentication) for Billing to learn more. This is the default behavior.  Use `default_incomplete` to create Subscriptions with `status=incomplete` when the first invoice requires payment, otherwise start as active. Subscriptions transition to `status=active` when successfully confirming the payment intent on the first invoice. This allows simpler management of scenarios where additional user actions are needed to pay a subscription’s invoice. Such as failed payments, [SCA regulation](https://stripe.com/docs/billing/migration/strong-customer-authentication), or collecting a mandate for a bank debit payment method. If the payment intent is not confirmed within 23 hours subscriptions transition to `status=incomplete_expired`, which is a terminal state.  Use `error_if_incomplete` if you want Stripe to return an HTTP 402 status code if a subscription's first invoice cannot be paid. For example, if a payment method requires 3DS authentication due to SCA regulation and further user action is needed, this parameter does not create a subscription and returns an error instead. This was the default behavior for API versions prior to 2019-03-14. See the [changelog](https://stripe.com/docs/upgrades#2019-03-14) to learn more.  `pending_if_incomplete` is only used with updates and cannot be passed when creating a subscription.
		public var payment_behavior: PaymentBehaviorValues?
		/// Payment settings to pass to invoices created by the subscription.
		public var payment_settings: PaymentSettings?
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

		public init(customer: String, add_invoice_items: AnyCodable? = nil, application_fee_percent: StringNumber? = nil, automatic_tax: AutomaticTaxConfig? = nil, backdate_start_date: Timestamp? = nil, billing_cycle_anchor: Timestamp? = nil, billing_thresholds: AnyCodable? = nil, cancel_at: Timestamp? = nil, cancel_at_period_end: Bool? = nil, collection_method: CollectionMethodValues? = nil, coupon: String? = nil, days_until_due: Int? = nil, default_payment_method: String? = nil, default_source: String? = nil, default_tax_rates: AnyCodable? = nil, expand: [String]? = nil, items: AnyCodable? = nil, metadata: AnyCodable? = nil, off_session: Bool? = nil, payment_behavior: PaymentBehaviorValues? = nil, payment_settings: PaymentSettings? = nil, pending_invoice_item_interval: AnyCodable? = nil, promotion_code: String? = nil, proration_behavior: ProrationBehaviorValues? = nil, transfer_data: TransferDataSpecs? = nil, trial_end: String? = nil, trial_from_plan: Bool? = nil, trial_period_days: Int? = nil) {
			self.customer = customer
			self.add_invoice_items = add_invoice_items
			self.application_fee_percent = application_fee_percent
			self.automatic_tax = automatic_tax
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
			self.payment_settings = payment_settings
			self.pending_invoice_item_interval = pending_invoice_item_interval
			self.promotion_code = promotion_code
			self.proration_behavior = proration_behavior
			self.transfer_data = transfer_data
			self.trial_end = trial_end
			self.trial_from_plan = trial_from_plan
			self.trial_period_days = trial_period_days
		}


		/// Automatic tax settings for this subscription.
		public final class AutomaticTaxConfig: Codable {
			public var enabled: Bool

			/// Automatic tax settings for this subscription.
			/// - Parameters:
			///   - enabled: 
			public init(enabled: Bool) {
				self.enabled = enabled
			}
		}



		/// Payment settings to pass to invoices created by the subscription.
		public final class PaymentSettings: Codable {
			public var payment_method_options: PaymentMethodOptions?
			public var payment_method_types: AnyCodable?

			/// Payment settings to pass to invoices created by the subscription.
			/// - Parameters:
			public init(payment_method_options: PaymentMethodOptions? = nil, payment_method_types: AnyCodable? = nil) {
				self.payment_method_options = payment_method_options
				self.payment_method_types = payment_method_types
			}


			public final class PaymentMethodOptions: Codable {
				public var acss_debit: AnyCodable?
				public var bancontact: AnyCodable?
				public var card: AnyCodable?

				public init(acss_debit: AnyCodable? = nil, bancontact: AnyCodable? = nil, card: AnyCodable? = nil) {
					self.acss_debit = acss_debit
					self.bancontact = bancontact
					self.card = card
				}
			}

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
			case defaultIncomplete = "default_incomplete"
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
public struct GetSubscriptionsSubscriptionExposedId: StripeAPIEndpoint {
	public typealias inputType = AnyCodable
	public typealias outputType = Subscription
	public typealias paramType = Params
	
	public struct Params {
		let subscription_exposed_id: String

		/// Initialize the request parameters
		/// - Parameter subscription_exposed_id: 
		public init(subscription_exposed_id: String) {
			self.subscription_exposed_id = subscription_exposed_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/subscriptions/\(inputs.subscription_exposed_id)"
	}
	public static var method: HTTPMethod { return .GET }

}

/// Updates an existing subscription on a customer to match the specified parameters. When changing plans or quantities, we will optionally prorate the price we charge next month to make up for any price changes. To preview how the proration will be calculated, use the <a href="#upcoming_invoice">upcoming invoice</a> endpoint.
public struct PostSubscriptionsSubscriptionExposedId: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = Subscription
	public typealias paramType = Params
	
	public struct Params {
		let subscription_exposed_id: String

		/// Initialize the request parameters
		/// - Parameter subscription_exposed_id: 
		public init(subscription_exposed_id: String) {
			self.subscription_exposed_id = subscription_exposed_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/subscriptions/\(inputs.subscription_exposed_id)"
	}

	public final class FormInput: Codable {
		/// A list of prices and quantities that will generate invoice items appended to the first invoice for this subscription. You may pass up to 20 items.
		public var add_invoice_items: AnyCodable?
		/// A non-negative decimal between 0 and 100, with at most two decimal places. This represents the percentage of the subscription invoice subtotal that will be transferred to the application owner's Stripe account. The request must be made by a platform account on a connected account in order to set an application fee percentage. For more information, see the application fees [documentation](https://stripe.com/docs/connect/subscriptions#collecting-fees-on-subscriptions).
		public var application_fee_percent: StringNumber?
		/// Automatic tax settings for this subscription.
		public var automatic_tax: AutomaticTaxConfig?
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
		/// The ID of the coupon to apply to this subscription. A coupon applied to a subscription will only affect invoices created for that particular subscription.
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
		/// Use `allow_incomplete` to transition the subscription to `status=past_due` if a payment is required but cannot be paid. This allows you to manage scenarios where additional user actions are needed to pay a subscription's invoice. For example, SCA regulation may require 3DS authentication to complete payment. See the [SCA Migration Guide](https://stripe.com/docs/billing/migration/strong-customer-authentication) for Billing to learn more. This is the default behavior.  Use `default_incomplete` to transition the subscription to `status=past_due` when payment is required and await explicit confirmation of the invoice's payment intent. This allows simpler management of scenarios where additional user actions are needed to pay a subscription’s invoice. Such as failed payments, [SCA regulation](https://stripe.com/docs/billing/migration/strong-customer-authentication), or collecting a mandate for a bank debit payment method.  Use `pending_if_incomplete` to update the subscription using [pending updates](https://stripe.com/docs/billing/subscriptions/pending-updates). When you use `pending_if_incomplete` you can only pass the parameters [supported by pending updates](https://stripe.com/docs/billing/pending-updates-reference#supported-attributes).  Use `error_if_incomplete` if you want Stripe to return an HTTP 402 status code if a subscription's invoice cannot be paid. For example, if a payment method requires 3DS authentication due to SCA regulation and further user action is needed, this parameter does not update the subscription and returns an error instead. This was the default behavior for API versions prior to 2019-03-14. See the [changelog](https://stripe.com/docs/upgrades#2019-03-14) to learn more.
		public var payment_behavior: PaymentBehaviorValues?
		/// Payment settings to pass to invoices created by the subscription.
		public var payment_settings: PaymentSettings?
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

		public init(add_invoice_items: AnyCodable? = nil, application_fee_percent: StringNumber? = nil, automatic_tax: AutomaticTaxConfig? = nil, billing_cycle_anchor: BillingCycleAnchorValues? = nil, billing_thresholds: AnyCodable? = nil, cancel_at: Int? = nil, cancel_at_period_end: Bool? = nil, collection_method: CollectionMethodValues? = nil, coupon: String? = nil, days_until_due: Int? = nil, default_payment_method: String? = nil, default_source: String? = nil, default_tax_rates: AnyCodable? = nil, expand: [String]? = nil, items: AnyCodable? = nil, metadata: AnyCodable? = nil, off_session: Bool? = nil, pause_collection: AnyCodable? = nil, payment_behavior: PaymentBehaviorValues? = nil, payment_settings: PaymentSettings? = nil, pending_invoice_item_interval: AnyCodable? = nil, promotion_code: String? = nil, proration_behavior: ProrationBehaviorValues? = nil, proration_date: Timestamp? = nil, transfer_data: AnyCodable? = nil, trial_end: String? = nil, trial_from_plan: Bool? = nil) {
			self.add_invoice_items = add_invoice_items
			self.application_fee_percent = application_fee_percent
			self.automatic_tax = automatic_tax
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
			self.payment_settings = payment_settings
			self.pending_invoice_item_interval = pending_invoice_item_interval
			self.promotion_code = promotion_code
			self.proration_behavior = proration_behavior
			self.proration_date = proration_date
			self.transfer_data = transfer_data
			self.trial_end = trial_end
			self.trial_from_plan = trial_from_plan
		}


		/// Automatic tax settings for this subscription.
		public final class AutomaticTaxConfig: Codable {
			public var enabled: Bool

			/// Automatic tax settings for this subscription.
			/// - Parameters:
			///   - enabled: 
			public init(enabled: Bool) {
				self.enabled = enabled
			}
		}



		/// Payment settings to pass to invoices created by the subscription.
		public final class PaymentSettings: Codable {
			public var payment_method_options: PaymentMethodOptions?
			public var payment_method_types: AnyCodable?

			/// Payment settings to pass to invoices created by the subscription.
			/// - Parameters:
			public init(payment_method_options: PaymentMethodOptions? = nil, payment_method_types: AnyCodable? = nil) {
				self.payment_method_options = payment_method_options
				self.payment_method_types = payment_method_types
			}


			public final class PaymentMethodOptions: Codable {
				public var acss_debit: AnyCodable?
				public var bancontact: AnyCodable?
				public var card: AnyCodable?

				public init(acss_debit: AnyCodable? = nil, bancontact: AnyCodable? = nil, card: AnyCodable? = nil) {
					self.acss_debit = acss_debit
					self.bancontact = bancontact
					self.card = card
				}
			}

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
			case defaultIncomplete = "default_incomplete"
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

/// Cancels a customer’s subscription immediately. The customer will not be charged again for the subscription.  Note, however, that any pending invoice items that you’ve created will still be charged for at the end of the period, unless manually <a href="#delete_invoiceitem">deleted</a>. If you’ve set the subscription to cancel at the end of the period, any pending prorations will also be left in place and collected at the end of the period. But if the subscription is set to cancel immediately, pending prorations will be removed.  By default, upon subscription cancellation, Stripe will stop automatic collection of all finalized invoices for the customer. This is intended to prevent unexpected payment attempts after the customer has canceled a subscription. However, you can resume automatic collection of the invoices manually after subscription cancellation to have us proceed. Or, you could check for unpaid invoices before allowing the customer to cancel the subscription at all.
public struct DeleteSubscriptionsSubscriptionExposedId: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = Subscription
	public typealias paramType = Params
	
	public struct Params {
		let subscription_exposed_id: String

		/// Initialize the request parameters
		/// - Parameter subscription_exposed_id: 
		public init(subscription_exposed_id: String) {
			self.subscription_exposed_id = subscription_exposed_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/subscriptions/\(inputs.subscription_exposed_id)"
	}
	public static var method: HTTPMethod { return .DELETE }

	public final class FormInput: Codable {
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?
		/// Will generate a final invoice that invoices for any un-invoiced metered usage and new/pending proration invoice items.
		public var invoice_now: Bool?
		/// Will generate a proration invoice item that credits remaining unused time until the subscription period end.
		public var prorate: Bool?

		public init(expand: [String]? = nil, invoice_now: Bool? = nil, prorate: Bool? = nil) {
			self.expand = expand
			self.invoice_now = invoice_now
			self.prorate = prorate
		}
	}

}

/// Removes the currently applied discount on a subscription.
public struct DeleteSubscriptionsSubscriptionExposedIdDiscount: StripeAPIEndpoint {
	public typealias inputType = AnyCodable
	public typealias outputType = DeletedDiscount
	public typealias paramType = Params
	
	public struct Params {
		let subscription_exposed_id: String

		/// Initialize the request parameters
		/// - Parameter subscription_exposed_id: 
		public init(subscription_exposed_id: String) {
			self.subscription_exposed_id = subscription_exposed_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/subscriptions/\(inputs.subscription_exposed_id)/discount"
	}
	public static var method: HTTPMethod { return .DELETE }

}
