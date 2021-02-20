
/// Returns a list of your subscription items for a given subscription.
public struct GetSubscriptionItems: StripeAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = Output
	public typealias paramType = Params
	public struct Params {
		let ending_before: String
		let limit: Int
		let starting_after: String
		let subscription: String

		public init(ending_before: String, limit: Int, starting_after: String, subscription: String) {
			self.ending_before = ending_before
			self.limit = limit
			self.starting_after = starting_after
			self.subscription = subscription
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/subscription_items?ending_before=\(inputs.ending_before.urlEncoded))&limit=\(inputs.limit.urlEncoded))&starting_after=\(inputs.starting_after.urlEncoded))&subscription=\(inputs.subscription.urlEncoded))"
	}
	public static var method: HTTPMethod { return .GET }

	public final class Output: Codable {
		public var data: [SubscriptionItem]
		/// True if this list has another page of items after this one that can be fetched.
		public var has_more: Bool
		/// String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
		public var object: ObjectValues
		/// The URL where this list can be accessed.
		public var url: String

		public init(data: [SubscriptionItem], has_more: Bool, object: ObjectValues, url: String) {
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

/// Adds a new item to an existing subscription. No existing items will be changed or replaced.
public struct PostSubscriptionItems: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = SubscriptionItem
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v1/subscription_items"
	}

	public final class FormInput: Codable {
		/// Define thresholds at which an invoice will be sent, and the subscription advanced to a new billing period. When updating, pass an empty string to remove previously-defined thresholds.
		public var billing_thresholds: MESSED_UP?
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?
		/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
		public var metadata: Empty?
		/// Use `allow_incomplete` to transition the subscription to `status=past_due` if a payment is required but cannot be paid. This allows you to manage scenarios where additional user actions are needed to pay a subscription's invoice. For example, SCA regulation may require 3DS authentication to complete payment. See the [SCA Migration Guide](https://stripe.com/docs/billing/migration/strong-customer-authentication) for Billing to learn more. This is the default behavior.  Use `pending_if_incomplete` to update the subscription using [pending updates](https://stripe.com/docs/billing/subscriptions/pending-updates). When you use `pending_if_incomplete` you can only pass the parameters [supported by pending updates](https://stripe.com/docs/billing/pending-updates-reference#supported-attributes).  Use `error_if_incomplete` if you want Stripe to return an HTTP 402 status code if a subscription's invoice cannot be paid. For example, if a payment method requires 3DS authentication due to SCA regulation and further user action is needed, this parameter does not update the subscription and returns an error instead. This was the default behavior for API versions prior to 2019-03-14. See the [changelog](https://stripe.com/docs/upgrades#2019-03-14) to learn more.
		public var payment_behavior: PaymentBehaviorValues?
		/// The ID of the price object.
		public var price: String?
		/// Data used to generate a new [Price](https://stripe.com/docs/api/prices) object inline.
		public var price_data: RecurringPriceData?
		/// Determines how to handle [prorations](https://stripe.com/docs/subscriptions/billing-cycle#prorations) when the billing cycle changes (e.g., when switching plans, resetting `billing_cycle_anchor=now`, or starting a trial), or if an item's `quantity` changes. Valid values are `create_prorations`, `none`, or `always_invoice`.  Passing `create_prorations` will cause proration invoice items to be created when applicable. These proration items will only be invoiced immediately under [certain conditions](https://stripe.com/docs/subscriptions/upgrading-downgrading#immediate-payment). In order to always invoice immediately for prorations, pass `always_invoice`.  Prorations can be disabled by passing `none`.
		public var proration_behavior: ProrationBehaviorValues?
		/// If set, the proration will be calculated as though the subscription was updated at the given time. This can be used to apply the same proration that was previewed with the [upcoming invoice](https://stripe.com/docs/api#retrieve_customer_invoice) endpoint.
		public var proration_date: Timestamp?
		/// The quantity you'd like to apply to the subscription item you're creating.
		public var quantity: Int?
		/// The identifier of the subscription to modify.
		public var subscription: String
		/// A list of [Tax Rate](https://stripe.com/docs/api/tax_rates) ids. These Tax Rates will override the [`default_tax_rates`](https://stripe.com/docs/api/subscriptions/create#create_subscription-default_tax_rates) on the Subscription. When updating, pass an empty string to remove previously-defined tax rates.
		public var tax_rates: MESSED_UP?

		public init(subscription: String, billing_thresholds: MESSED_UP? = nil, expand: [String]? = nil, metadata: Empty? = nil, payment_behavior: PaymentBehaviorValues? = nil, price: String? = nil, price_data: RecurringPriceData? = nil, proration_behavior: ProrationBehaviorValues? = nil, proration_date: Timestamp? = nil, quantity: Int? = nil, tax_rates: MESSED_UP? = nil) {
			self.subscription = subscription
			self.billing_thresholds = billing_thresholds
			self.expand = expand
			self.metadata = metadata
			self.payment_behavior = payment_behavior
			self.price = price
			self.price_data = price_data
			self.proration_behavior = proration_behavior
			self.proration_date = proration_date
			self.quantity = quantity
			self.tax_rates = tax_rates
		}


		/// Data used to generate a new [Price](https://stripe.com/docs/api/prices) object inline.
		public final class RecurringPriceData: Codable {
			public var currency: String
			public var product: String
			public var recurring: RecurringAdhoc
			public var unit_amount: Int?
			public var unit_amount_decimal: StringNumber?

			/// Data used to generate a new [Price](https://stripe.com/docs/api/prices) object inline.
			/// - Parameters:
			///   - currency: 
			///   - product: 
			///   - recurring: 
			public init(currency: String, product: String, recurring: RecurringAdhoc, unit_amount: Int? = nil, unit_amount_decimal: StringNumber? = nil) {
				self.currency = currency
				self.product = product
				self.recurring = recurring
				self.unit_amount = unit_amount
				self.unit_amount_decimal = unit_amount_decimal
			}


			public final class RecurringAdhoc: Codable {
				public var interval: IntervalValues
				public var interval_count: Int?

				public init(interval: IntervalValues, interval_count: Int? = nil) {
					self.interval = interval
					self.interval_count = interval_count
				}

				public enum IntervalValues: String, Codable {
					case day = "day"
					case month = "month"
					case week = "week"
					case year = "year"
				}
			}

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

/// Retrieves the subscription item with the given ID.
public struct GetSubscriptionItemsItem: StripeAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = SubscriptionItem
	public typealias paramType = Params
	public struct Params {
		let item: String

		public init(item: String) {
			self.item = item
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/subscription_items/\(inputs.item)"
	}
	public static var method: HTTPMethod { return .GET }

}

/// Updates the plan or quantity of an item on a current subscription.
public struct PostSubscriptionItemsItem: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = SubscriptionItem
	public typealias paramType = Params
	public struct Params {
		let item: String

		public init(item: String) {
			self.item = item
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/subscription_items/\(inputs.item)"
	}

	public final class FormInput: Codable {
		/// Define thresholds at which an invoice will be sent, and the subscription advanced to a new billing period. When updating, pass an empty string to remove previously-defined thresholds.
		public var billing_thresholds: MESSED_UP?
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?
		/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
		public var metadata: MESSED_UP?
		/// Indicates if a customer is on or off-session while an invoice payment is attempted.
		public var off_session: Bool?
		/// Use `allow_incomplete` to transition the subscription to `status=past_due` if a payment is required but cannot be paid. This allows you to manage scenarios where additional user actions are needed to pay a subscription's invoice. For example, SCA regulation may require 3DS authentication to complete payment. See the [SCA Migration Guide](https://stripe.com/docs/billing/migration/strong-customer-authentication) for Billing to learn more. This is the default behavior.  Use `pending_if_incomplete` to update the subscription using [pending updates](https://stripe.com/docs/billing/subscriptions/pending-updates). When you use `pending_if_incomplete` you can only pass the parameters [supported by pending updates](https://stripe.com/docs/billing/pending-updates-reference#supported-attributes).  Use `error_if_incomplete` if you want Stripe to return an HTTP 402 status code if a subscription's invoice cannot be paid. For example, if a payment method requires 3DS authentication due to SCA regulation and further user action is needed, this parameter does not update the subscription and returns an error instead. This was the default behavior for API versions prior to 2019-03-14. See the [changelog](https://stripe.com/docs/upgrades#2019-03-14) to learn more.
		public var payment_behavior: PaymentBehaviorValues?
		/// The ID of the price object.
		public var price: String?
		/// Data used to generate a new [Price](https://stripe.com/docs/api/prices) object inline.
		public var price_data: RecurringPriceData?
		/// Determines how to handle [prorations](https://stripe.com/docs/subscriptions/billing-cycle#prorations) when the billing cycle changes (e.g., when switching plans, resetting `billing_cycle_anchor=now`, or starting a trial), or if an item's `quantity` changes. Valid values are `create_prorations`, `none`, or `always_invoice`.  Passing `create_prorations` will cause proration invoice items to be created when applicable. These proration items will only be invoiced immediately under [certain conditions](https://stripe.com/docs/subscriptions/upgrading-downgrading#immediate-payment). In order to always invoice immediately for prorations, pass `always_invoice`.  Prorations can be disabled by passing `none`.
		public var proration_behavior: ProrationBehaviorValues?
		/// If set, the proration will be calculated as though the subscription was updated at the given time. This can be used to apply the same proration that was previewed with the [upcoming invoice](https://stripe.com/docs/api#retrieve_customer_invoice) endpoint.
		public var proration_date: Timestamp?
		/// The quantity you'd like to apply to the subscription item you're creating.
		public var quantity: Int?
		/// A list of [Tax Rate](https://stripe.com/docs/api/tax_rates) ids. These Tax Rates will override the [`default_tax_rates`](https://stripe.com/docs/api/subscriptions/create#create_subscription-default_tax_rates) on the Subscription. When updating, pass an empty string to remove previously-defined tax rates.
		public var tax_rates: MESSED_UP?

		public init(billing_thresholds: MESSED_UP? = nil, expand: [String]? = nil, metadata: MESSED_UP? = nil, off_session: Bool? = nil, payment_behavior: PaymentBehaviorValues? = nil, price: String? = nil, price_data: RecurringPriceData? = nil, proration_behavior: ProrationBehaviorValues? = nil, proration_date: Timestamp? = nil, quantity: Int? = nil, tax_rates: MESSED_UP? = nil) {
			self.billing_thresholds = billing_thresholds
			self.expand = expand
			self.metadata = metadata
			self.off_session = off_session
			self.payment_behavior = payment_behavior
			self.price = price
			self.price_data = price_data
			self.proration_behavior = proration_behavior
			self.proration_date = proration_date
			self.quantity = quantity
			self.tax_rates = tax_rates
		}


		/// Data used to generate a new [Price](https://stripe.com/docs/api/prices) object inline.
		public final class RecurringPriceData: Codable {
			public var currency: String
			public var product: String
			public var recurring: RecurringAdhoc
			public var unit_amount: Int?
			public var unit_amount_decimal: StringNumber?

			/// Data used to generate a new [Price](https://stripe.com/docs/api/prices) object inline.
			/// - Parameters:
			///   - currency: 
			///   - product: 
			///   - recurring: 
			public init(currency: String, product: String, recurring: RecurringAdhoc, unit_amount: Int? = nil, unit_amount_decimal: StringNumber? = nil) {
				self.currency = currency
				self.product = product
				self.recurring = recurring
				self.unit_amount = unit_amount
				self.unit_amount_decimal = unit_amount_decimal
			}


			public final class RecurringAdhoc: Codable {
				public var interval: IntervalValues
				public var interval_count: Int?

				public init(interval: IntervalValues, interval_count: Int? = nil) {
					self.interval = interval
					self.interval_count = interval_count
				}

				public enum IntervalValues: String, Codable {
					case day = "day"
					case month = "month"
					case week = "week"
					case year = "year"
				}
			}

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

/// Deletes an item from the subscription. Removing a subscription item from a subscription will not cancel the subscription.
public struct DeleteSubscriptionItemsItem: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = DeletedSubscriptionItem
	public typealias paramType = Params
	public struct Params {
		let item: String

		public init(item: String) {
			self.item = item
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/subscription_items/\(inputs.item)"
	}
	public static var method: HTTPMethod { return .DELETE }

	public final class FormInput: Codable {
		/// Delete all usage for the given subscription item. Allowed only when the current plan's `usage_type` is `metered`.
		public var clear_usage: Bool?
		/// Determines how to handle [prorations](https://stripe.com/docs/subscriptions/billing-cycle#prorations) when the billing cycle changes (e.g., when switching plans, resetting `billing_cycle_anchor=now`, or starting a trial), or if an item's `quantity` changes. Valid values are `create_prorations`, `none`, or `always_invoice`.  Passing `create_prorations` will cause proration invoice items to be created when applicable. These proration items will only be invoiced immediately under [certain conditions](https://stripe.com/docs/subscriptions/upgrading-downgrading#immediate-payment). In order to always invoice immediately for prorations, pass `always_invoice`.  Prorations can be disabled by passing `none`.
		public var proration_behavior: ProrationBehaviorValues?
		/// If set, the proration will be calculated as though the subscription was updated at the given time. This can be used to apply the same proration that was previewed with the [upcoming invoice](https://stripe.com/docs/api#retrieve_customer_invoice) endpoint.
		public var proration_date: Timestamp?

		public init(clear_usage: Bool? = nil, proration_behavior: ProrationBehaviorValues? = nil, proration_date: Timestamp? = nil) {
			self.clear_usage = clear_usage
			self.proration_behavior = proration_behavior
			self.proration_date = proration_date
		}

		public enum ProrationBehaviorValues: String, Codable {
			case alwaysInvoice = "always_invoice"
			case createProrations = "create_prorations"
			case none = "none"
		}
	}

}

/// For the specified subscription item, returns a list of summary objects. Each object in the list provides usage information that’s been summarized from multiple usage records and over a subscription billing period (e.g., 15 usage records in the month of September).  The list is sorted in reverse-chronological order (newest first). The first list item represents the most current usage period that hasn’t ended yet. Since new usage records can still be added, the returned summary information for the subscription item’s ID should be seen as unstable until the subscription billing period ends.
public struct GetSubscriptionItemsSubscriptionItemUsageRecordSummaries: StripeAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = Output
	public typealias paramType = Params
	public struct Params {
		let ending_before: String
		let limit: Int
		let starting_after: String
		let subscription_item: String

		public init(ending_before: String, limit: Int, starting_after: String, subscription_item: String) {
			self.ending_before = ending_before
			self.limit = limit
			self.starting_after = starting_after
			self.subscription_item = subscription_item
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/subscription_items/\(inputs.subscription_item)/usage_record_summaries?ending_before=\(inputs.ending_before.urlEncoded))&limit=\(inputs.limit.urlEncoded))&starting_after=\(inputs.starting_after.urlEncoded))"
	}
	public static var method: HTTPMethod { return .GET }

	public final class Output: Codable {
		public var data: [UsageRecordSummary]
		/// True if this list has another page of items after this one that can be fetched.
		public var has_more: Bool
		/// String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
		public var object: ObjectValues
		/// The URL where this list can be accessed.
		public var url: String

		public init(data: [UsageRecordSummary], has_more: Bool, object: ObjectValues, url: String) {
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

/// Creates a usage record for a specified subscription item and date, and fills it with a quantity.  Usage records provide <code>quantity</code> information that Stripe uses to track how much a customer is using your service. With usage information and the pricing model set up by the <a href="https://stripe.com/docs/billing/subscriptions/metered-billing">metered billing</a> plan, Stripe helps you send accurate invoices to your customers.  The default calculation for usage is to add up all the <code>quantity</code> values of the usage records within a billing period. You can change this default behavior with the billing plan’s <code>aggregate_usage</code> <a href="/docs/api/plans/create#create_plan-aggregate_usage">parameter</a>. When there is more than one usage record with the same timestamp, Stripe adds the <code>quantity</code> values together. In most cases, this is the desired resolution, however, you can change this behavior with the <code>action</code> parameter.  The default pricing model for metered billing is <a href="/docs/api/plans/object#plan_object-billing_scheme">per-unit pricing</a>. For finer granularity, you can configure metered billing to have a <a href="https://stripe.com/docs/billing/subscriptions/tiers">tiered pricing</a> model.
public struct PostSubscriptionItemsSubscriptionItemUsageRecords: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = UsageRecord
	public typealias paramType = Params
	public struct Params {
		let subscription_item: String

		public init(subscription_item: String) {
			self.subscription_item = subscription_item
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/subscription_items/\(inputs.subscription_item)/usage_records"
	}

	public final class FormInput: Codable {
		/// Valid values are `increment` (default) or `set`. When using `increment` the specified `quantity` will be added to the usage at the specified timestamp. The `set` action will overwrite the usage quantity at that timestamp. If the subscription has [billing thresholds](https://stripe.com/docs/api/subscriptions/object#subscription_object-billing_thresholds), `increment` is the only allowed value.
		public var action: ActionValues?
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?
		/// The usage quantity for the specified timestamp.
		public var quantity: Int
		/// The timestamp for the usage event. This timestamp must be within the current billing period of the subscription of the provided `subscription_item`.
		public var timestamp: Int

		public init(quantity: Int, timestamp: Int, action: ActionValues? = nil, expand: [String]? = nil) {
			self.quantity = quantity
			self.timestamp = timestamp
			self.action = action
			self.expand = expand
		}

		public enum ActionValues: String, Codable {
			case increment = "increment"
			case set = "set"
		}
	}

}
