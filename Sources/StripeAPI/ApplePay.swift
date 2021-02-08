
/// List apple pay domains.
public struct GetApplePayDomains: StripeAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = ApplePayDomainList
	public typealias paramType = Params
	public struct Params {
		let starting_after: String
		let ending_before: String
		let domain_name: String
		let limit: Int
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/apple_pay/domains?ending_before=\(inputs.ending_before.urlEncoded))&limit=\(inputs.limit.urlEncoded))&domain_name=\(inputs.domain_name.urlEncoded))&starting_after=\(inputs.starting_after.urlEncoded))"
	}
	public static var method: HTTPMethod { return .GET }

	public class ApplePayDomainList: Codable {
		public var data: [ApplePayDomain]
		/// True if this list has another page of items after this one that can be fetched.
		public var has_more: Bool
		/// String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
		public var object: ObjectValues
		/// The URL where this list can be accessed.
		public var url: String

		public init(data: [ApplePayDomain], has_more: Bool, object: ObjectValues, url: String) {
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

/// Create an apple pay domain.
public struct PostApplePayDomains: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = ApplePayDomain
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v1/apple_pay/domains"
	}

	public class FormInput: Codable {
		public var domain_name: String
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?

		public init(domain_name: String, expand: [String]? = nil) {
			self.domain_name = domain_name
			self.expand = expand
		}
	}

}

/// Retrieve an apple pay domain.
public struct GetApplePayDomainsDomain: StripeAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = ApplePayDomain
	public typealias paramType = Params
	public struct Params {
		let domain: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/apple_pay/domains/\(inputs.domain)"
	}
	public static var method: HTTPMethod { return .GET }

}

/// Delete an apple pay domain.
public struct DeleteApplePayDomainsDomain: StripeAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = DeletedApplePayDomain
	public typealias paramType = Params
	public struct Params {
		let domain: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/apple_pay/domains/\(inputs.domain)"
	}
	public static var method: HTTPMethod { return .DELETE }

}