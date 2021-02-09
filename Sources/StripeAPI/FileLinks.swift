
/// Returns a list of file links.
public struct GetFileLinks: StripeAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = Output
	public typealias paramType = Params
	public struct Params {
		let ending_before: String
		let expired: Bool
		let file: String
		let limit: Int
		let starting_after: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/file_links?ending_before=\(inputs.ending_before.urlEncoded))&expired=\(inputs.expired.urlEncoded))&file=\(inputs.file.urlEncoded))&limit=\(inputs.limit.urlEncoded))&starting_after=\(inputs.starting_after.urlEncoded))"
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
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v1/file_links"
	}

	public final class FormInput: Codable {
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?
		/// A future timestamp after which the link will no longer be usable.
		public var expires_at: Timestamp?
		/// The ID of the file. The file's `purpose` must be one of the following: `business_icon`, `business_logo`, `customer_signature`, `dispute_evidence`, `finance_report_run`, `pci_document`, `sigma_scheduled_query`, or `tax_document_user_upload`.
		public var file: String
		/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
		public var metadata: MESSED_UP?

		public init(file: String, expand: [String]? = nil, expires_at: Timestamp? = nil, metadata: MESSED_UP? = nil) {
			self.file = file
			self.expand = expand
			self.expires_at = expires_at
			self.metadata = metadata
		}
	}

}

/// Retrieves the file link with the given ID.
public struct GetFileLinksLink: StripeAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = FileLink
	public typealias paramType = Params
	public struct Params {
		let link: String
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
		public var metadata: MESSED_UP?

		public init(expand: [String]? = nil, expires_at: String? = nil, metadata: MESSED_UP? = nil) {
			self.expand = expand
			self.expires_at = expires_at
			self.metadata = metadata
		}
	}

}
