
/// Returns a list of file links.
public struct GetFileLinks: StripeAPIEndpoint {
	public typealias inputType = AnyCodable
	public typealias outputType = Output
	public typealias paramType = Params
	
	public struct Params {
		let ending_before: String?
		let expired: Bool?
		let file: String?
		let limit: Int?
		let starting_after: String?

		/// Initialize the request parameters
		/// - Parameter ending_before: A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list.
		/// - Parameter expired: Filter links by their expiration status. By default, all links are returned.
		/// - Parameter file: Only return links for the given file.
		/// - Parameter limit: A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10.
		/// - Parameter starting_after: A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list.
		public init(ending_before: String? = nil, expired: Bool? = nil, file: String? = nil, limit: Int? = nil, starting_after: String? = nil) {
			self.ending_before = ending_before
			self.expired = expired
			self.file = file
			self.limit = limit
			self.starting_after = starting_after
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		var params = [String]()
		if let a = inputs.ending_before?.urlEncoded { params.append("ending_before=\(a)") }
		if let a = inputs.expired?.urlEncoded { params.append("expired=\(a)") }
		if let a = inputs.file?.urlEncoded { params.append("file=\(a)") }
		if let a = inputs.limit?.urlEncoded { params.append("limit=\(a)") }
		if let a = inputs.starting_after?.urlEncoded { params.append("starting_after=\(a)") }
		let query = params.joined(separator: "&")
		return "/v1/file_links?\(query)"
	}
	public static var method: HTTPMethod { return .GET }

	public final class Output: Codable {
		public var data: [FileLink]
		/// True if this list has another page of items after this one that can be fetched.
		public var has_more: Bool
		/// String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
		public var object: ObjectValues
		/// The URL where this list can be accessed.
		public var url: String

		public init(data: [FileLink], has_more: Bool, object: ObjectValues, url: String) {
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

/// Creates a new file link object.
public struct PostFileLinks: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = FileLink
	public typealias paramType = AnyCodable
	public static func endpoint(for inputs: AnyCodable) throws -> String {
		return "/v1/file_links"
	}

	public final class FormInput: Codable {
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?
		/// A future timestamp after which the link will no longer be usable.
		public var expires_at: Timestamp?
		/// The ID of the file. The file's `purpose` must be one of the following: `business_icon`, `business_logo`, `customer_signature`, `dispute_evidence`, `finance_report_run`, `identity_document_downloadable`, `pci_document`, `selfie`, `sigma_scheduled_query`, or `tax_document_user_upload`.
		public var file: String
		/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
		public var metadata: AnyCodable?

		public init(file: String, expand: [String]? = nil, expires_at: Timestamp? = nil, metadata: AnyCodable? = nil) {
			self.file = file
			self.expand = expand
			self.expires_at = expires_at
			self.metadata = metadata
		}
	}

}

/// Retrieves the file link with the given ID.
public struct GetFileLinksLink: StripeAPIEndpoint {
	public typealias inputType = AnyCodable
	public typealias outputType = FileLink
	public typealias paramType = Params
	
	public struct Params {
		let link: String

		/// Initialize the request parameters
		/// - Parameter link: 
		public init(link: String) {
			self.link = link
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/file_links/\(inputs.link)"
	}
	public static var method: HTTPMethod { return .GET }

}

/// Updates an existing file link object. Expired links can no longer be updated.
public struct PostFileLinksLink: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = FileLink
	public typealias paramType = Params
	
	public struct Params {
		let link: String

		/// Initialize the request parameters
		/// - Parameter link: 
		public init(link: String) {
			self.link = link
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/file_links/\(inputs.link)"
	}

	public final class FormInput: Codable {
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?
		/// A future timestamp after which the link will no longer be usable, or `now` to expire the link immediately.
		public var expires_at: String?
		/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
		public var metadata: AnyCodable?

		public init(expand: [String]? = nil, expires_at: String? = nil, metadata: AnyCodable? = nil) {
			self.expand = expand
			self.expires_at = expires_at
			self.metadata = metadata
		}
	}

}
