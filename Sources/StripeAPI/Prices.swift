
/// Returns a list of your prices.
public struct GetPrices: StripeAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = PriceList
	public typealias paramType = Params
	public struct Params {
		let product: String
		let currency: String
		let type: String
		let active: Bool
		let limit: Int
		let ending_before: String
		let starting_after: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/prices?active=\(inputs.active.urlEncoded))&product=\(inputs.product.urlEncoded))&ending_before=\(inputs.ending_before.urlEncoded))&currency=\(inputs.currency.urlEncoded))&type=\(inputs.type.urlEncoded))&limit=\(inputs.limit.urlEncoded))&starting_after=\(inputs.starting_after.urlEncoded))"
	}
	public static var method: HTTPMethod { return .GET }

	public class PriceList: Codable {
		/// Details about each object.
		public var data: [Price]
		/// True if this list has another page of items after this one that can be fetched.
		public var has_more: Bool
		/// String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
		public var object: ObjectValues
		/// The URL where this list can be accessed.
		public var url: String

		public init(data: [Price], has_more: Bool, object: ObjectValues, url: String) {
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

/// Creates a new price for an existing product. The price can be recurring or one-time.
public struct PostPrices: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = Price
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v1/prices"
	}

	public class FormInput: Codable {
		/// Whether the price can be used for new purchases. Defaults to `true`.
		public var active: Bool?
		/// Describes how to compute the price per period. Either `per_unit` or `tiered`. `per_unit` indicates that the fixed amount (specified in `unit_amount` or `unit_amount_decimal`) will be charged per unit in `quantity` (for prices with `usage_type=licensed`), or per unit of total usage (for prices with `usage_type=metered`). `tiered` indicates that the unit pricing will be computed using a tiering strategy as defined using the `tiers` and `tiers_mode` attributes.
		public var billing_scheme: BillingSchemeValues?
		/// Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
		public var currency: String
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?
		/// A lookup key used to retrieve prices dynamically from a static string.
		public var lookup_key: String?
		/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
		public var metadata: String?
		/// A brief description of the price, hidden from customers.
		public var nickname: String?
		/// The ID of the product that this price will belong to.
		public var product: String?
		/// These fields can be used to create a new product that this price will belong to.
		public var product_data: InlineProductParams?
		/// The recurring components of a price such as `interval` and `usage_type`.
		public var recurring: Recurring?
		/// Each element represents a pricing tier. This parameter requires `billing_scheme` to be set to `tiered`. See also the documentation for `billing_scheme`.
		public var tiers: MESSED_UP?
		/// Defines if the tiering price should be `graduated` or `volume` based. In `volume`-based tiering, the maximum quantity within a period determines the per unit price, in `graduated` tiering pricing can successively change as the quantity grows.
		public var tiers_mode: TiersModeValues?
		/// If set to true, will atomically remove the lookup key from the existing price, and assign it to this price.
		public var transfer_lookup_key: Bool?
		/// Apply a transformation to the reported usage or set quantity before computing the billed price. Cannot be combined with `tiers`.
		public var transform_quantity: TransformUsageParam?
		/// A positive integer in %s (or 0 for a free price) representing how much to charge.
		public var unit_amount: Int?
		/// Same as `unit_amount`, but accepts a decimal value in %s with at most 12 decimal places. Only one of `unit_amount` and `unit_amount_decimal` can be set.
		public var unit_amount_decimal: StringNumber?

		public init(currency: String, active: Bool? = nil, billing_scheme: BillingSchemeValues? = nil, expand: [String]? = nil, lookup_key: String? = nil, metadata: String? = nil, nickname: String? = nil, product: String? = nil, product_data: InlineProductParams? = nil, recurring: Recurring? = nil, tiers: MESSED_UP? = nil, tiers_mode: TiersModeValues? = nil, transfer_lookup_key: Bool? = nil, transform_quantity: TransformUsageParam? = nil, unit_amount: Int? = nil, unit_amount_decimal: StringNumber? = nil) {
			self.currency = currency
			self.active = active
			self.billing_scheme = billing_scheme
			self.expand = expand
			self.lookup_key = lookup_key
			self.metadata = metadata
			self.nickname = nickname
			self.product = product
			self.product_data = product_data
			self.recurring = recurring
			self.tiers = tiers
			self.tiers_mode = tiers_mode
			self.transfer_lookup_key = transfer_lookup_key
			self.transform_quantity = transform_quantity
			self.unit_amount = unit_amount
			self.unit_amount_decimal = unit_amount_decimal
		}


		/// These fields can be used to create a new product that this price will belong to.
		public class InlineProductParams: Codable {
			public var active: Bool?
			public var id: String?
			public var metadata: String?
			public var name: String
			public var statement_descriptor: String?
			public var unit_label: String?

			/// These fields can be used to create a new product that this price will belong to.
			/// - Parameters:
			///   - name: 
			public init(name: String, active: Bool? = nil, id: String? = nil, metadata: String? = nil, statement_descriptor: String? = nil, unit_label: String? = nil) {
				self.name = name
				self.active = active
				self.id = id
				self.metadata = metadata
				self.statement_descriptor = statement_descriptor
				self.unit_label = unit_label
			}
		}



		/// The recurring components of a price such as `interval` and `usage_type`.
		public class Recurring: Codable {
			public var aggregate_usage: AggregateUsageValues?
			public var interval: IntervalValues
			public var interval_count: Int?
			public var usage_type: UsageTypeValues?

			/// The recurring components of a price such as `interval` and `usage_type`.
			/// - Parameters:
			///   - interval: 
			public init(interval: IntervalValues, aggregate_usage: AggregateUsageValues? = nil, interval_count: Int? = nil, usage_type: UsageTypeValues? = nil) {
				self.interval = interval
				self.aggregate_usage = aggregate_usage
				self.interval_count = interval_count
				self.usage_type = usage_type
			}

			public enum AggregateUsageValues: String, Codable {
				case lastDuringPeriod = "last_during_period"
				case lastEver = "last_ever"
				case max = "max"
				case sum = "sum"
			}

			public enum IntervalValues: String, Codable {
				case day = "day"
				case month = "month"
				case week = "week"
				case year = "year"
			}

			public enum UsageTypeValues: String, Codable {
				case licensed = "licensed"
				case metered = "metered"
			}
		}



		/// Apply a transformation to the reported usage or set quantity before computing the billed price. Cannot be combined with `tiers`.
		public class TransformUsageParam: Codable {
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


		public enum BillingSchemeValues: String, Codable {
			case perUnit = "per_unit"
			case tiered = "tiered"
		}

		public enum TiersModeValues: String, Codable {
			case graduated = "graduated"
			case volume = "volume"
		}
	}

}

/// Retrieves the price with the given ID.
public struct GetPricesPrice: StripeAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = Price
	public typealias paramType = Params
	public struct Params {
		let price: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/prices/\(inputs.price)"
	}
	public static var method: HTTPMethod { return .GET }

}

/// Updates the specified price by setting the values of the parameters passed. Any parameters not provided are left unchanged.
public struct PostPricesPrice: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = Price
	public typealias paramType = Params
	public struct Params {
		let price: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/prices/\(inputs.price)"
	}

	public class FormInput: Codable {
		/// Whether the price can be used for new purchases. Defaults to `true`.
		public var active: Bool?
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?
		/// A lookup key used to retrieve prices dynamically from a static string.
		public var lookup_key: String?
		/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
		public var metadata: MESSED_UP?
		/// A brief description of the price, hidden from customers.
		public var nickname: String?
		/// If set to true, will atomically remove the lookup key from the existing price, and assign it to this price.
		public var transfer_lookup_key: Bool?

		public init(active: Bool? = nil, expand: [String]? = nil, lookup_key: String? = nil, metadata: MESSED_UP? = nil, nickname: String? = nil, transfer_lookup_key: Bool? = nil) {
			self.active = active
			self.expand = expand
			self.lookup_key = lookup_key
			self.metadata = metadata
			self.nickname = nickname
			self.transfer_lookup_key = transfer_lookup_key
		}
	}

}