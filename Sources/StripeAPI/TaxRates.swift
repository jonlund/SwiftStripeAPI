
/// Returns a list of your tax rates. Tax rates are returned sorted by creation date, with the most recently created tax rates appearing first.
public struct GetTaxRates: StripeAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = Output
	public typealias paramType = Params
	
	public struct Params {
		let active: Bool?
		let ending_before: String?
		let inclusive: Bool?
		let limit: Int?
		let starting_after: String?

		/// Initialize the request parameters
		/// - Parameter active: Optional flag to filter by tax rates that are either active or inactive (archived).
		/// - Parameter ending_before: A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list.
		/// - Parameter inclusive: Optional flag to filter by tax rates that are inclusive (or those that are not inclusive).
		/// - Parameter limit: A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10.
		/// - Parameter starting_after: A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list.
		public init(active: Bool? = nil, ending_before: String? = nil, inclusive: Bool? = nil, limit: Int? = nil, starting_after: String? = nil) {
			self.active = active
			self.ending_before = ending_before
			self.inclusive = inclusive
			self.limit = limit
			self.starting_after = starting_after
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		var params = [String]()
		if let a = inputs.active?.urlEncoded { params.append("active=\(a)") }
		if let a = inputs.ending_before?.urlEncoded { params.append("ending_before=\(a)") }
		if let a = inputs.inclusive?.urlEncoded { params.append("inclusive=\(a)") }
		if let a = inputs.limit?.urlEncoded { params.append("limit=\(a)") }
		if let a = inputs.starting_after?.urlEncoded { params.append("starting_after=\(a)") }
		let query = params.joined(separator: "&")
		return "/v1/tax_rates?\(query)"
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

		/// Initialize the request parameters
		/// - Parameter tax_rate: 
		public init(tax_rate: String) {
			self.tax_rate = tax_rate
		}
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

		/// Initialize the request parameters
		/// - Parameter tax_rate: 
		public init(tax_rate: String) {
			self.tax_rate = tax_rate
		}
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
		public var metadata: AnyCodable?
		/// [ISO 3166-2 subdivision code](https://en.wikipedia.org/wiki/ISO_3166-2:US), without country prefix. For example, "NY" for New York, United States.
		public var state: String?

		public init(active: Bool? = nil, country: String? = nil, description: String? = nil, display_name: String? = nil, expand: [String]? = nil, jurisdiction: String? = nil, metadata: AnyCodable? = nil, state: String? = nil) {
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
