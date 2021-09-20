
/// List all verification reports.
public struct GetIdentityVerificationReports: StripeAPIEndpoint {
	public typealias inputType = AnyCodable
	public typealias outputType = Output
	public typealias paramType = Params
	
	public struct Params {
		let ending_before: String?
		let limit: Int?
		let starting_after: String?
		let type: String?
		let verification_session: String?

		/// Initialize the request parameters
		/// - Parameter ending_before: A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list.
		/// - Parameter limit: A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10.
		/// - Parameter starting_after: A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list.
		/// - Parameter type: Only return VerificationReports of this type
		/// - Parameter verification_session: Only return VerificationReports created by this VerificationSession ID. It is allowed to provide a VerificationIntent ID.
		public init(ending_before: String? = nil, limit: Int? = nil, starting_after: String? = nil, type: String? = nil, verification_session: String? = nil) {
			self.ending_before = ending_before
			self.limit = limit
			self.starting_after = starting_after
			self.type = type
			self.verification_session = verification_session
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		var params = [String]()
		if let a = inputs.ending_before?.urlEncoded { params.append("ending_before=\(a)") }
		if let a = inputs.limit?.urlEncoded { params.append("limit=\(a)") }
		if let a = inputs.starting_after?.urlEncoded { params.append("starting_after=\(a)") }
		if let a = inputs.type?.urlEncoded { params.append("type=\(a)") }
		if let a = inputs.verification_session?.urlEncoded { params.append("verification_session=\(a)") }
		let query = params.joined(separator: "&")
		return "/v1/identity/verification_reports?\(query)"
	}
	public static var method: HTTPMethod { return .GET }

	public final class Output: Codable {
		public var data: [IdentityVerificationReport]
		/// True if this list has another page of items after this one that can be fetched.
		public var has_more: Bool
		/// String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
		public var object: ObjectValues
		/// The URL where this list can be accessed.
		public var url: String

		public init(data: [IdentityVerificationReport], has_more: Bool, object: ObjectValues, url: String) {
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

/// Retrieves an existing VerificationReport
public struct GetIdentityVerificationReportsReport: StripeAPIEndpoint {
	public typealias inputType = AnyCodable
	public typealias outputType = IdentityVerificationReport
	public typealias paramType = Params
	
	public struct Params {
		let report: String

		/// Initialize the request parameters
		/// - Parameter report: 
		public init(report: String) {
			self.report = report
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/identity/verification_reports/\(inputs.report)"
	}
	public static var method: HTTPMethod { return .GET }

}

/// Returns a list of VerificationSessions
public struct GetIdentityVerificationSessions: StripeAPIEndpoint {
	public typealias inputType = AnyCodable
	public typealias outputType = Output
	public typealias paramType = Params
	
	public struct Params {
		let ending_before: String?
		let limit: Int?
		let starting_after: String?
		let status: String?

		/// Initialize the request parameters
		/// - Parameter ending_before: A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list.
		/// - Parameter limit: A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10.
		/// - Parameter starting_after: A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list.
		/// - Parameter status: Only return VerificationSessions with this status. [Learn more about the lifecycle of sessions](https://stripe.com/docs/identity/how-sessions-work).
		public init(ending_before: String? = nil, limit: Int? = nil, starting_after: String? = nil, status: String? = nil) {
			self.ending_before = ending_before
			self.limit = limit
			self.starting_after = starting_after
			self.status = status
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		var params = [String]()
		if let a = inputs.ending_before?.urlEncoded { params.append("ending_before=\(a)") }
		if let a = inputs.limit?.urlEncoded { params.append("limit=\(a)") }
		if let a = inputs.starting_after?.urlEncoded { params.append("starting_after=\(a)") }
		if let a = inputs.status?.urlEncoded { params.append("status=\(a)") }
		let query = params.joined(separator: "&")
		return "/v1/identity/verification_sessions?\(query)"
	}
	public static var method: HTTPMethod { return .GET }

	public final class Output: Codable {
		public var data: [IdentityVerificationSession]
		/// True if this list has another page of items after this one that can be fetched.
		public var has_more: Bool
		/// String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
		public var object: ObjectValues
		/// The URL where this list can be accessed.
		public var url: String

		public init(data: [IdentityVerificationSession], has_more: Bool, object: ObjectValues, url: String) {
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

/// Creates a VerificationSession object.  After the VerificationSession is created, display a verification modal using the session <code>client_secret</code> or send your users to the session’s <code>url</code>.  If your API key is in test mode, verification checks won’t actually process, though everything else will occur as if in live mode.  Related guide: <a href="/docs/identity/verify-identity-documents">Verify your users’ identity documents</a>.
public struct PostIdentityVerificationSessions: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = IdentityVerificationSession
	public typealias paramType = AnyCodable
	public static func endpoint(for inputs: AnyCodable) throws -> String {
		return "/v1/identity/verification_sessions"
	}

	public final class FormInput: Codable {
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?
		/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
		public var metadata: AnyCodable?
		/// A set of options for the session’s verification checks.
		public var options: SessionOptionsParam?
		/// The URL that the user will be redirected to upon completing the verification flow.
		public var return_url: String?
		/// The type of [verification check](https://stripe.com/docs/identity/verification-checks) to be performed.
		public var type: TypeValues

		public init(type: TypeValues, expand: [String]? = nil, metadata: AnyCodable? = nil, options: SessionOptionsParam? = nil, return_url: String? = nil) {
			self.type = type
			self.expand = expand
			self.metadata = metadata
			self.options = options
			self.return_url = return_url
		}


		/// A set of options for the session’s verification checks.
		public final class SessionOptionsParam: Codable {
			public var document: AnyCodable?

			/// A set of options for the session’s verification checks.
			/// - Parameters:
			public init(document: AnyCodable? = nil) {
				self.document = document
			}
		}


		public enum TypeValues: String, Codable {
			case document = "document"
			case idNumber = "id_number"
		}
	}

}

/// Retrieves the details of a VerificationSession that was previously created.  When the session status is <code>requires_input</code>, you can use this method to retrieve a valid <code>client_secret</code> or <code>url</code> to allow re-submission.
public struct GetIdentityVerificationSessionsSession: StripeAPIEndpoint {
	public typealias inputType = AnyCodable
	public typealias outputType = IdentityVerificationSession
	public typealias paramType = Params
	
	public struct Params {
		let session: String

		/// Initialize the request parameters
		/// - Parameter session: 
		public init(session: String) {
			self.session = session
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/identity/verification_sessions/\(inputs.session)"
	}
	public static var method: HTTPMethod { return .GET }

}

/// Updates a VerificationSession object.  When the session status is <code>requires_input</code>, you can use this method to update the verification check and options.
public struct PostIdentityVerificationSessionsSession: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = IdentityVerificationSession
	public typealias paramType = Params
	
	public struct Params {
		let session: String

		/// Initialize the request parameters
		/// - Parameter session: 
		public init(session: String) {
			self.session = session
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/identity/verification_sessions/\(inputs.session)"
	}

	public final class FormInput: Codable {
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?
		/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
		public var metadata: AnyCodable?
		/// A set of options for the session’s verification checks.
		public var options: SessionOptionsParam?
		/// The type of [verification check](https://stripe.com/docs/identity/verification-checks) to be performed.
		public var type: TypeValues?

		public init(expand: [String]? = nil, metadata: AnyCodable? = nil, options: SessionOptionsParam? = nil, type: TypeValues? = nil) {
			self.expand = expand
			self.metadata = metadata
			self.options = options
			self.type = type
		}


		/// A set of options for the session’s verification checks.
		public final class SessionOptionsParam: Codable {
			public var document: AnyCodable?

			/// A set of options for the session’s verification checks.
			/// - Parameters:
			public init(document: AnyCodable? = nil) {
				self.document = document
			}
		}


		public enum TypeValues: String, Codable {
			case document = "document"
			case idNumber = "id_number"
		}
	}

}

/// A VerificationSession object can be canceled when it is in <code>requires_input</code> <a href="/docs/identity/how-sessions-work">status</a>.  Once canceled, future submission attempts are disabled. This cannot be undone. <a href="/docs/identity/verification-sessions#cancel">Learn more</a>.
public struct PostIdentityVerificationSessionsSessionCancel: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = IdentityVerificationSession
	public typealias paramType = Params
	
	public struct Params {
		let session: String

		/// Initialize the request parameters
		/// - Parameter session: 
		public init(session: String) {
			self.session = session
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/identity/verification_sessions/\(inputs.session)/cancel"
	}

	public final class FormInput: Codable {
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?

		public init(expand: [String]? = nil) {
			self.expand = expand
		}
	}

}

/// Redact a VerificationSession to remove all collected information from Stripe. This will redact the VerificationSession and all objects related to it, including VerificationReports, Events, request logs, etc.  A VerificationSession object can be redacted when it is in <code>requires_input</code> or <code>verified</code> <a href="/docs/identity/how-sessions-work">status</a>. Redacting a VerificationSession in <code>requires_action</code> state will automatically cancel it.  The redaction process may take up to four days. When the redaction process is in progress, the VerificationSession’s <code>redaction.status</code> field will be set to <code>processing</code>; when the process is finished, it will change to <code>redacted</code> and an <code>identity.verification_session.redacted</code> event will be emitted.  Redaction is irreversible. Redacted objects are still accessible in the Stripe API, but all the fields that contain personal data will be replaced by the string <code>[redacted]</code> or a similar placeholder. The <code>metadata</code> field will also be erased. Redacted objects cannot be updated or used for any purpose.  <a href="/docs/identity/verification-sessions#redact">Learn more</a>.
public struct PostIdentityVerificationSessionsSessionRedact: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = IdentityVerificationSession
	public typealias paramType = Params
	
	public struct Params {
		let session: String

		/// Initialize the request parameters
		/// - Parameter session: 
		public init(session: String) {
			self.session = session
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/identity/verification_sessions/\(inputs.session)/redact"
	}

	public final class FormInput: Codable {
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?

		public init(expand: [String]? = nil) {
			self.expand = expand
		}
	}

}
