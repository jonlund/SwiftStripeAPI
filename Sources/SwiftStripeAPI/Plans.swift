
/// Returns a list of your plans.
public struct GetPlans: StripeAPIEndpoint {
	public typealias inputType = AnyCodable
	public typealias outputType = PlanList
	public typealias paramType = Params
	
	public struct Params {
		let active: Bool?
		let ending_before: String?
		let limit: Int?
		let product: String?
		let starting_after: String?

		/// Initialize the request parameters
		/// - Parameter active: Only return plans that are active or inactive (e.g., pass `false` to list all inactive plans).
		/// - Parameter ending_before: A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list.
		/// - Parameter limit: A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10.
		/// - Parameter product: Only return plans for the given product.
		/// - Parameter starting_after: A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list.
		public init(active: Bool? = nil, ending_before: String? = nil, limit: Int? = nil, product: String? = nil, starting_after: String? = nil) {
			self.active = active
			self.ending_before = ending_before
			self.limit = limit
			self.product = product
			self.starting_after = starting_after
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		var params = [String]()
		if let a = inputs.active?.urlEncoded { params.append("active=\(a)") }
		if let a = inputs.ending_before?.urlEncoded { params.append("ending_before=\(a)") }
		if let a = inputs.limit?.urlEncoded { params.append("limit=\(a)") }
		if let a = inputs.product?.urlEncoded { params.append("product=\(a)") }
		if let a = inputs.starting_after?.urlEncoded { params.append("starting_after=\(a)") }
		let query = params.joined(separator: "&")
		return "/v1/plans?\(query)"
	}
	public static var method: HTTPMethod { return .GET }

	public final class PlanList: Codable {
		/// Details about each object.
		public var data: [Plan]
		/// True if this list has another page of items after this one that can be fetched.
		public var has_more: Bool
		/// String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
		public var object: ObjectValues
		/// The URL where this list can be accessed.
		public var url: String

		public init(data: [Plan], has_more: Bool, object: ObjectValues, url: String) {
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

/// You can now model subscriptions more flexibly using the <a href="#prices">Prices API</a>. It replaces the Plans API and is backwards compatible to simplify your migration.
public struct PostPlans: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = Plan
	public typealias paramType = AnyCodable
	public static func endpoint(for inputs: AnyCodable) throws -> String {
		return "/v1/plans"
	}

	public final class FormInput: Codable {
		/// Whether the plan is currently available for new subscriptions. Defaults to `true`.
		public var active: Bool?
		/// Specifies a usage aggregation strategy for plans of `usage_type=metered`. Allowed values are `sum` for summing up all usage during a period, `last_during_period` for using the last usage record reported within a period, `last_ever` for using the last usage record ever (across period bounds) or `max` which uses the usage record with the maximum reported usage during a period. Defaults to `sum`.
		public var aggregate_usage: AggregateUsageValues?
		/// A positive integer in %s (or 0 for a free plan) representing how much to charge on a recurring basis.
		public var amount: Int?
		/// Same as `amount`, but accepts a decimal value with at most 12 decimal places. Only one of `amount` and `amount_decimal` can be set.
		public var amount_decimal: StringNumber?
		/// Describes how to compute the price per period. Either `per_unit` or `tiered`. `per_unit` indicates that the fixed amount (specified in `amount`) will be charged per unit in `quantity` (for plans with `usage_type=licensed`), or per unit of total usage (for plans with `usage_type=metered`). `tiered` indicates that the unit pricing will be computed using a tiering strategy as defined using the `tiers` and `tiers_mode` attributes.
		public var billing_scheme: BillingSchemeValues?
		/// Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
		public var currency: String
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?
		/// An identifier randomly generated by Stripe. Used to identify this plan when subscribing a customer. You can optionally override this ID, but the ID must be unique across all plans in your Stripe account. You can, however, use the same plan ID in both live and test modes.
		public var id: String?
		/// Specifies billing frequency. Either `day`, `week`, `month` or `year`.
		public var interval: IntervalValues
		/// The number of intervals between subscription billings. For example, `interval=month` and `interval_count=3` bills every 3 months. Maximum of one year interval allowed (1 year, 12 months, or 52 weeks).
		public var interval_count: Int?
		/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
		public var metadata: AnyCodable?
		/// A brief description of the plan, hidden from customers.
		public var nickname: String?
		public var product: AnyCodable?
		/// Each element represents a pricing tier. This parameter requires `billing_scheme` to be set to `tiered`. See also the documentation for `billing_scheme`.
		public var tiers: AnyCodable?
		/// Defines if the tiering price should be `graduated` or `volume` based. In `volume`-based tiering, the maximum quantity within a period determines the per unit price, in `graduated` tiering pricing can successively change as the quantity grows.
		public var tiers_mode: TiersModeValues?
		/// Apply a transformation to the reported usage or set quantity before computing the billed price. Cannot be combined with `tiers`.
		public var transform_usage: TransformUsageParam?
		/// Default number of trial days when subscribing a customer to this plan using [`trial_from_plan=true`](https://stripe.com/docs/api#create_subscription-trial_from_plan).
		public var trial_period_days: Int?
		/// Configures how the quantity per period should be determined. Can be either `metered` or `licensed`. `licensed` automatically bills the `quantity` set when adding it to a subscription. `metered` aggregates the total usage based on usage records. Defaults to `licensed`.
		public var usage_type: UsageTypeValues?

		public init(currency: String, interval: IntervalValues, active: Bool? = nil, aggregate_usage: AggregateUsageValues? = nil, amount: Int? = nil, amount_decimal: StringNumber? = nil, billing_scheme: BillingSchemeValues? = nil, expand: [String]? = nil, id: String? = nil, interval_count: Int? = nil, metadata: AnyCodable? = nil, nickname: String? = nil, product: AnyCodable? = nil, tiers: AnyCodable? = nil, tiers_mode: TiersModeValues? = nil, transform_usage: TransformUsageParam? = nil, trial_period_days: Int? = nil, usage_type: UsageTypeValues? = nil) {
			self.currency = currency
			self.interval = interval
			self.active = active
			self.aggregate_usage = aggregate_usage
			self.amount = amount
			self.amount_decimal = amount_decimal
			self.billing_scheme = billing_scheme
			self.expand = expand
			self.id = id
			self.interval_count = interval_count
			self.metadata = metadata
			self.nickname = nickname
			self.product = product
			self.tiers = tiers
			self.tiers_mode = tiers_mode
			self.transform_usage = transform_usage
			self.trial_period_days = trial_period_days
			self.usage_type = usage_type
		}


		/// Apply a transformation to the reported usage or set quantity before computing the billed price. Cannot be combined with `tiers`.
		public final class TransformUsageParam: Codable {
			public var divide_by: Int
			public var round: RoundValues

			/// Apply a transformation to the reported usage or set quantity before computing the billed price. Cannot be combined with `tiers`.
			/// - Parameters:
			///   - divide_by: 
			///   - round: 
			public init(divide_by: Int, round: RoundValues) {
				self.divide_by = divide_by
				self.round = round
			}

			public enum RoundValues: String, Codable {
				case down = "down"
				case up = "up"
			}
		}


		public enum AggregateUsageValues: String, Codable {
			case lastDuringPeriod = "last_during_period"
			case lastEver = "last_ever"
			case max = "max"
			case sum = "sum"
		}

		public enum BillingSchemeValues: String, Codable {
			case perUnit = "per_unit"
			case tiered = "tiered"
		}

		public enum IntervalValues: String, Codable {
			case day = "day"
			case month = "month"
			case week = "week"
			case year = "year"
		}

		public enum TiersModeValues: String, Codable {
			case graduated = "graduated"
			case volume = "volume"
		}

		public enum UsageTypeValues: String, Codable {
			case licensed = "licensed"
			case metered = "metered"
		}
	}

}

/// Retrieves the plan with the given ID.
public struct GetPlansPlan: StripeAPIEndpoint {
	public typealias inputType = AnyCodable
	public typealias outputType = Plan
	public typealias paramType = Params
	
	public struct Params {
		let plan: String

		/// Initialize the request parameters
		/// - Parameter plan: 
		public init(plan: String) {
			self.plan = plan
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/plans/\(inputs.plan)"
	}
	public static var method: HTTPMethod { return .GET }

}

/// Updates the specified plan by setting the values of the parameters passed. Any parameters not provided are left unchanged. By design, you cannot change a plan’s ID, amount, currency, or billing cycle.
public struct PostPlansPlan: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = Plan
	public typealias paramType = Params
	
	public struct Params {
		let plan: String

		/// Initialize the request parameters
		/// - Parameter plan: 
		public init(plan: String) {
			self.plan = plan
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/plans/\(inputs.plan)"
	}

	public final class FormInput: Codable {
		/// Whether the plan is currently available for new subscriptions.
		public var active: Bool?
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?
		/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
		public var metadata: AnyCodable?
		/// A brief description of the plan, hidden from customers.
		public var nickname: String?
		/// The product the plan belongs to. This cannot be changed once it has been used in a subscription or subscription schedule.
		public var product: String?
		/// Default number of trial days when subscribing a customer to this plan using [`trial_from_plan=true`](https://stripe.com/docs/api#create_subscription-trial_from_plan).
		public var trial_period_days: Int?

		public init(active: Bool? = nil, expand: [String]? = nil, metadata: AnyCodable? = nil, nickname: String? = nil, product: String? = nil, trial_period_days: Int? = nil) {
			self.active = active
			self.expand = expand
			self.metadata = metadata
			self.nickname = nickname
			self.product = product
			self.trial_period_days = trial_period_days
		}
	}

}

/// Deleting plans means new subscribers can’t be added. Existing subscribers aren’t affected.
public struct DeletePlansPlan: StripeAPIEndpoint {
	public typealias inputType = AnyCodable
	public typealias outputType = DeletedPlan
	public typealias paramType = Params
	
	public struct Params {
		let plan: String

		/// Initialize the request parameters
		/// - Parameter plan: 
		public init(plan: String) {
			self.plan = plan
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/plans/\(inputs.plan)"
	}
	public static var method: HTTPMethod { return .DELETE }

}
