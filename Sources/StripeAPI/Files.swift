
/// Returns a list of the files that your account has access to. The files are returned sorted by creation date, with the most recently created files appearing first.
public struct GetFiles: StripeAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = Output
	public typealias paramType = Params
	
	public struct Params {
		let ending_before: String?
		let limit: Int?
		let purpose: String?
		let starting_after: String?

		/// Initialize the request parameters
		/// - Parameter ending_before: A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list.
		/// - Parameter limit: A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10.
		/// - Parameter purpose: The file purpose to filter queries by. If none is provided, files will not be filtered by purpose.
		/// - Parameter starting_after: A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list.
		public init(ending_before: String? = nil, limit: Int? = nil, purpose: String? = nil, starting_after: String? = nil) {
			self.ending_before = ending_before
			self.limit = limit
			self.purpose = purpose
			self.starting_after = starting_after
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		var params = [String]()
		if let a = inputs.ending_before?.urlEncoded { params.append("ending_before=\(a)") }
		if let a = inputs.limit?.urlEncoded { params.append("limit=\(a)") }
		if let a = inputs.purpose?.urlEncoded { params.append("purpose=\(a)") }
		if let a = inputs.starting_after?.urlEncoded { params.append("starting_after=\(a)") }
		let query = params.joined(separator: "&")
		return "/v1/files?\(query)"
	}
	public static var method: HTTPMethod { return .GET }

	public final class Output: Codable {
		public var data: [File]
		/// True if this list has another page of items after this one that can be fetched.
		public var has_more: Bool
		/// String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
		public var object: ObjectValues
		/// The URL where this list can be accessed.
		public var url: String

		public init(data: [File], has_more: Bool, object: ObjectValues, url: String) {
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

/// To upload a file to Stripe, you’ll need to send a request of type <code>multipart/form-data</code>. The request should contain the file you would like to upload, as well as the parameters for creating a file.  All of Stripe’s officially supported Client libraries should have support for sending <code>multipart/form-data</code>.
public struct PostFiles: StripeAPIEndpoint {
	public typealias inputType = DataInput
	public typealias outputType = File
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v1/files"
	}

	public final class DataInput: Codable {
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?
		/// A file to upload. The file should follow the specifications of RFC 2388 (which defines file transfers for the `multipart/form-data` protocol).
		public var file: String
		/// Optional parameters to automatically create a [file link](https://stripe.com/docs/api#file_links) for the newly created file.
		public var file_link_data: FileLinkCreationParams?
		/// The [purpose](https://stripe.com/docs/file-upload#uploading-a-file) of the uploaded file.
		public var purpose: PurposeValues

		public init(file: String, purpose: PurposeValues, expand: [String]? = nil, file_link_data: FileLinkCreationParams? = nil) {
			self.file = file
			self.purpose = purpose
			self.expand = expand
			self.file_link_data = file_link_data
		}


		/// Optional parameters to automatically create a [file link](https://stripe.com/docs/api#file_links) for the newly created file.
		public final class FileLinkCreationParams: Codable {
			public var create: Bool
			public var expires_at: Timestamp?
			public var metadata: AnyCodable?

			/// Optional parameters to automatically create a [file link](https://stripe.com/docs/api#file_links) for the newly created file.
			/// - Parameters:
			///   - create: 
			public init(create: Bool, expires_at: Timestamp? = nil, metadata: AnyCodable? = nil) {
				self.create = create
				self.expires_at = expires_at
				self.metadata = metadata
			}
		}


		public enum PurposeValues: String, Codable {
			case accountRequirement = "account_requirement"
			case additionalVerification = "additional_verification"
			case businessIcon = "business_icon"
			case businessLogo = "business_logo"
			case customerSignature = "customer_signature"
			case disputeEvidence = "dispute_evidence"
			case identityDocument = "identity_document"
			case pciDocument = "pci_document"
			case taxDocumentUserUpload = "tax_document_user_upload"
		}
	}

}

/// Retrieves the details of an existing file object. Supply the unique file ID from a file, and Stripe will return the corresponding file object. To access file contents, see the <a href="/docs/file-upload#download-file-contents">File Upload Guide</a>.
public struct GetFilesFile: StripeAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = File
	public typealias paramType = Params
	
	public struct Params {
		let file: String

		/// Initialize the request parameters
		/// - Parameter file: 
		public init(file: String) {
			self.file = file
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/files/\(inputs.file)"
	}
	public static var method: HTTPMethod { return .GET }

}
