
/// Returns a list of your tax rates. Tax rates are returned sorted by creation date, with the most recently created tax rates appearing first.
public struct GetTaxRates: StripeAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = Output
	public typealias paramType = Params
	public struct Params {
		let active: Bool
		let ending_before: String
		let inclusive: Bool
		let limit: Int
		let starting_after: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/tax_rates?active=\(inputs.active.urlEncoded))&ending_before=\(inputs.ending_before.urlEncoded))&inclusive=\(inputs.inclusive.urlEncoded))&limit=\(inputs.limit.urlEncoded))&starting_after=\(inputs.starting_after.urlEncoded))"
	}
	public static var method: HTTPMethod { return .GET }

	public final class Output: Codable {
		public var data: [TaxRate]
		/// True if this list has another page of items after this one that can be fetched.
		public var has_more: Bool
		/// String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
		public var object: ObjectValues
		/// The URL where this list can be accessed.
		public var url: String

		public init(data: [TaxRate], has_more: Bool, object: ObjectValues, url: String) {
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

/// Creates a new tax rate.
public struct PostTaxRates: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = TaxRate
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v1/tax_rates"
	}

	public final class FormInput: Codable {
		/// Flag determining whether the tax rate is active or inactive (archived). Inactive tax rates cannot be used with new applications or Checkout Sessions, but will still work for subscriptions and invoices that already have it set.
		public var active: Bool?
		/// Two-letter country code ([ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)).
		public var country: String?
		/// An arbitrary string attached to the tax rate for your internal use only. It will not be visible to your customers.
		public var description: String?
		/// The display name of the tax rate, which will be shown to users.
		public var display_name: String
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?
		/// This specifies if the tax rate is inclusive or exclusive.
		public var inclusive: Bool
		/// The jurisdiction for the tax rate. You can use this label field for tax reporting purposes. It also appears on your customer’s invoice.
		public var jurisdiction: String?
		/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
		public var metadata: Empty?
		/// This represents the tax rate percent out of 100.
		public var percentage: StringNumber
		/// [ISO 3166-2 subdivision code](https://en.wikipedia.org/wiki/ISO_3166-2:US), without country prefix. For example, "NY" for New York, United States.
		public var state: String?

		public init(display_name: String, inclusive: Bool, percentage: StringNumber, active: Bool? = nil, country: String? = nil, description: String? = nil, expand: [String]? = nil, jurisdiction: String? = nil, metadata: Empty? = nil, state: String? = nil) {
			self.display_name = display_name
			self.inclusive = inclusive
			self.percentage = percentage
			self.active = active
			self.country = country
			self.description = description
			self.expand = expand
			self.jurisdiction = jurisdiction
			self.metadata = metadata
			self.state = state
		}
	}

}

/// Retrieves a tax rate with the given ID
public struct GetTaxRatesTaxRate: StripeAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = TaxRate
	public typealias paramType = Params
	public struct Params {
		let tax_rate: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/tax_rates/\(inputs.tax_rate)"
	}
	public static var method: HTTPMethod { return .GET }

}

/// Updates an existing tax rate.
public struct PostTaxRatesTaxRate: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = TaxRate
	public typealias paramType = Params
	public struct Params {
		let tax_rate: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/tax_rates/\(inputs.tax_rate)"
	}

	public final class FormInput: Codable {
		/// Flag determining whether the tax rate is active or inactive (archived). Inactive tax rates cannot be used with new applications or Checkout Sessions, but will still work for subscriptions and invoices that already have it set.
		public var active: Bool?
		/// Two-letter country code ([ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)).
		public var country: String?
		/// An arbitrary string attached to the tax rate for your internal use only. It will not be visible to your customers.
		public var description: String?
		/// The display name of the tax rate, which will be shown to users.
		public var display_name: String?
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?
		/// The jurisdiction for the tax rate. You can use this label field for tax reporting purposes. It also appears on your customer’s invoice.
		public var jurisdiction: String?
		/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
		public var metadata: MESSED_UP?
		/// [ISO 3166-2 subdivision code](https://en.wikipedia.org/wiki/ISO_3166-2:US), without country prefix. For example, "NY" for New York, United States.
		public var state: String?

		public init(active: Bool? = nil, country: String? = nil, description: String? = nil, display_name: String? = nil, expand: [String]? = nil, jurisdiction: String? = nil, metadata: MESSED_UP? = nil, state: String? = nil) {
			self.active = active
			self.country = country
			self.description = description
			self.display_name = display_name
			self.expand = expand
			self.jurisdiction = jurisdiction
			self.metadata = metadata
			self.state = state
		}
	}

}
