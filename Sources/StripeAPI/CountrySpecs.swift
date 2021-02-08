
/// Lists all Country Spec objects available in the API.
public struct GetCountrySpecs: StripeAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = Output
	public typealias paramType = Params
	public struct Params {
		let ending_before: String
		let starting_after: String
		let limit: Int
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/country_specs?limit=\(inputs.limit.urlEncoded))&ending_before=\(inputs.ending_before.urlEncoded))&starting_after=\(inputs.starting_after.urlEncoded))"
	}
	public static var method: HTTPMethod { return .GET }

	public class Output: Codable {
		public var data: [CountrySpec]
		/// True if this list has another page of items after this one that can be fetched.
		public var has_more: Bool
		/// String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
		public var object: ObjectValues
		/// The URL where this list can be accessed.
		public var url: String

		public init(data: [CountrySpec], has_more: Bool, object: ObjectValues, url: String) {
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

/// Returns a Country Spec for a given Country code.
public struct GetCountrySpecsCountry: StripeAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = CountrySpec
	public typealias paramType = Params
	public struct Params {
		let country: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/country_specs/\(inputs.country)"
	}
	public static var method: HTTPMethod { return .GET }

}