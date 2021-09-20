
/// List apple pay domains.
public struct GetApplePayDomains: StripeAPIEndpoint {
	public typealias inputType = AnyCodable
	public typealias outputType = ApplePayDomainList
	public typealias paramType = Params
	
	public struct Params {
		let domain_name: String?
		let ending_before: String?
		let limit: Int?
		let starting_after: String?

		/// Initialize the request parameters
		/// - Parameter domain_name: 
		/// - Parameter ending_before: A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list.
		/// - Parameter limit: A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10.
		/// - Parameter starting_after: A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list.
		public init(domain_name: String? = nil, ending_before: String? = nil, limit: Int? = nil, starting_after: String? = nil) {
			self.domain_name = domain_name
			self.ending_before = ending_before
			self.limit = limit
			self.starting_after = starting_after
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		var params = [String]()
		if let a = inputs.domain_name?.urlEncoded { params.append("domain_name=\(a)") }
		if let a = inputs.ending_before?.urlEncoded { params.append("ending_before=\(a)") }
		if let a = inputs.limit?.urlEncoded { params.append("limit=\(a)") }
		if let a = inputs.starting_after?.urlEncoded { params.append("starting_after=\(a)") }
		let query = params.joined(separator: "&")
		return "/v1/apple_pay/domains?\(query)"
	}
	public static var method: HTTPMethod { return .GET }

	public final class ApplePayDomainList: Codable {
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
	public typealias paramType = AnyCodable
	public static func endpoint(for inputs: AnyCodable) throws -> String {
		return "/v1/apple_pay/domains"
	}

	public final class FormInput: Codable {
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
	public typealias inputType = AnyCodable
	public typealias outputType = ApplePayDomain
	public typealias paramType = Params
	
	public struct Params {
		let domain: String

		/// Initialize the request parameters
		/// - Parameter domain: 
		public init(domain: String) {
			self.domain = domain
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/apple_pay/domains/\(inputs.domain)"
	}
	public static var method: HTTPMethod { return .GET }

}

/// Delete an apple pay domain.
public struct DeleteApplePayDomainsDomain: StripeAPIEndpoint {
	public typealias inputType = AnyCodable
	public typealias outputType = DeletedApplePayDomain
	public typealias paramType = Params
	
	public struct Params {
		let domain: String

		/// Initialize the request parameters
		/// - Parameter domain: 
		public init(domain: String) {
			self.domain = domain
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/apple_pay/domains/\(inputs.domain)"
	}
	public static var method: HTTPMethod { return .DELETE }

}
