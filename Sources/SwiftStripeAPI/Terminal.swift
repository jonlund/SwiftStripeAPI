
/// To connect to a reader the Stripe Terminal SDK needs to retrieve a short-lived connection token from Stripe, proxied through your server. On your backend, add an endpoint that creates and returns a connection token.
public struct PostTerminalConnectionTokens: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = TerminalConnectionToken
	public typealias paramType = AnyCodable
	public static func endpoint(for inputs: AnyCodable) throws -> String {
		return "/v1/terminal/connection_tokens"
	}

	public final class FormInput: Codable {
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?
		/// The id of the location that this connection token is scoped to. If specified the connection token will only be usable with readers assigned to that location, otherwise the connection token will be usable with all readers. Note that location scoping only applies to internet-connected readers. For more details, see [the docs on scoping connection tokens](https://stripe.com/docs/terminal/readers/fleet-management#connection-tokens).
		public var location: String?

		public init(expand: [String]? = nil, location: String? = nil) {
			self.expand = expand
			self.location = location
		}
	}

}

/// Returns a list of <code>Location</code> objects.
public struct GetTerminalLocations: StripeAPIEndpoint {
	public typealias inputType = AnyCodable
	public typealias outputType = TerminalLocationLocationList
	public typealias paramType = Params
	
	public struct Params {
		let ending_before: String?
		let limit: Int?
		let starting_after: String?

		/// Initialize the request parameters
		/// - Parameter ending_before: A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list.
		/// - Parameter limit: A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10.
		/// - Parameter starting_after: A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list.
		public init(ending_before: String? = nil, limit: Int? = nil, starting_after: String? = nil) {
			self.ending_before = ending_before
			self.limit = limit
			self.starting_after = starting_after
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		var params = [String]()
		if let a = inputs.ending_before?.urlEncoded { params.append("ending_before=\(a)") }
		if let a = inputs.limit?.urlEncoded { params.append("limit=\(a)") }
		if let a = inputs.starting_after?.urlEncoded { params.append("starting_after=\(a)") }
		let query = params.joined(separator: "&")
		return "/v1/terminal/locations?\(query)"
	}
	public static var method: HTTPMethod { return .GET }

	public final class TerminalLocationLocationList: Codable {
		public var data: [TerminalLocation]
		/// True if this list has another page of items after this one that can be fetched.
		public var has_more: Bool
		/// String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
		public var object: ObjectValues
		/// The URL where this list can be accessed.
		public var url: String

		public init(data: [TerminalLocation], has_more: Bool, object: ObjectValues, url: String) {
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

/// Creates a new <code>Location</code> object.
public struct PostTerminalLocations: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = TerminalLocation
	public typealias paramType = AnyCodable
	public static func endpoint(for inputs: AnyCodable) throws -> String {
		return "/v1/terminal/locations"
	}

	public final class FormInput: Codable {
		/// The full address of the location.
		public var address: CreateLocationAddressParam
		/// A name for the location.
		public var display_name: String
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?
		/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
		public var metadata: AnyCodable?

		public init(address: CreateLocationAddressParam, display_name: String, expand: [String]? = nil, metadata: AnyCodable? = nil) {
			self.address = address
			self.display_name = display_name
			self.expand = expand
			self.metadata = metadata
		}


		/// The full address of the location.
		public final class CreateLocationAddressParam: Codable {
			public var city: String?
			public var country: String
			public var line1: String?
			public var line2: String?
			public var postal_code: String?
			public var state: String?

			/// The full address of the location.
			/// - Parameters:
			///   - country: 
			public init(country: String, city: String? = nil, line1: String? = nil, line2: String? = nil, postal_code: String? = nil, state: String? = nil) {
				self.country = country
				self.city = city
				self.line1 = line1
				self.line2 = line2
				self.postal_code = postal_code
				self.state = state
			}
		}

	}

}

/// Retrieves a <code>Location</code> object.
public struct GetTerminalLocationsLocation: StripeAPIEndpoint {
	public typealias inputType = AnyCodable
	public typealias outputType = TerminalLocation
	public typealias paramType = Params
	
	public struct Params {
		let location: String

		/// Initialize the request parameters
		/// - Parameter location: 
		public init(location: String) {
			self.location = location
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/terminal/locations/\(inputs.location)"
	}
	public static var method: HTTPMethod { return .GET }

}

/// Updates a <code>Location</code> object by setting the values of the parameters passed. Any parameters not provided will be left unchanged.
public struct PostTerminalLocationsLocation: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = TerminalLocation
	public typealias paramType = Params
	
	public struct Params {
		let location: String

		/// Initialize the request parameters
		/// - Parameter location: 
		public init(location: String) {
			self.location = location
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/terminal/locations/\(inputs.location)"
	}

	public final class FormInput: Codable {
		/// The full address of the location.
		public var address: OptionalFieldsAddress?
		/// A name for the location.
		public var display_name: String?
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?
		/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
		public var metadata: AnyCodable?

		public init(address: OptionalFieldsAddress? = nil, display_name: String? = nil, expand: [String]? = nil, metadata: AnyCodable? = nil) {
			self.address = address
			self.display_name = display_name
			self.expand = expand
			self.metadata = metadata
		}


		/// The full address of the location.
		public final class OptionalFieldsAddress: Codable {
			public var city: String?
			public var country: String?
			public var line1: String?
			public var line2: String?
			public var postal_code: String?
			public var state: String?

			/// The full address of the location.
			/// - Parameters:
			public init(city: String? = nil, country: String? = nil, line1: String? = nil, line2: String? = nil, postal_code: String? = nil, state: String? = nil) {
				self.city = city
				self.country = country
				self.line1 = line1
				self.line2 = line2
				self.postal_code = postal_code
				self.state = state
			}
		}

	}

}

/// Deletes a <code>Location</code> object.
public struct DeleteTerminalLocationsLocation: StripeAPIEndpoint {
	public typealias inputType = AnyCodable
	public typealias outputType = DeletedTerminalLocation
	public typealias paramType = Params
	
	public struct Params {
		let location: String

		/// Initialize the request parameters
		/// - Parameter location: 
		public init(location: String) {
			self.location = location
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/terminal/locations/\(inputs.location)"
	}
	public static var method: HTTPMethod { return .DELETE }

}

/// Returns a list of <code>Reader</code> objects.
public struct GetTerminalReaders: StripeAPIEndpoint {
	public typealias inputType = AnyCodable
	public typealias outputType = TerminalReaderRetrieveReader
	public typealias paramType = Params
	
	public struct Params {
		let device_type: String?
		let ending_before: String?
		let limit: Int?
		let location: String?
		let starting_after: String?
		let status: String?

		/// Initialize the request parameters
		/// - Parameter device_type: Filters readers by device type
		/// - Parameter ending_before: A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list.
		/// - Parameter limit: A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10.
		/// - Parameter location: A location ID to filter the response list to only readers at the specific location
		/// - Parameter starting_after: A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list.
		/// - Parameter status: A status filter to filter readers to only offline or online readers
		public init(device_type: String? = nil, ending_before: String? = nil, limit: Int? = nil, location: String? = nil, starting_after: String? = nil, status: String? = nil) {
			self.device_type = device_type
			self.ending_before = ending_before
			self.limit = limit
			self.location = location
			self.starting_after = starting_after
			self.status = status
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		var params = [String]()
		if let a = inputs.device_type?.urlEncoded { params.append("device_type=\(a)") }
		if let a = inputs.ending_before?.urlEncoded { params.append("ending_before=\(a)") }
		if let a = inputs.limit?.urlEncoded { params.append("limit=\(a)") }
		if let a = inputs.location?.urlEncoded { params.append("location=\(a)") }
		if let a = inputs.starting_after?.urlEncoded { params.append("starting_after=\(a)") }
		if let a = inputs.status?.urlEncoded { params.append("status=\(a)") }
		let query = params.joined(separator: "&")
		return "/v1/terminal/readers?\(query)"
	}
	public static var method: HTTPMethod { return .GET }

	public final class TerminalReaderRetrieveReader: Codable {
		/// A list of readers
		public var data: [TerminalReader]
		/// True if this list has another page of items after this one that can be fetched.
		public var has_more: Bool
		/// String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
		public var object: ObjectValues
		/// The URL where this list can be accessed.
		public var url: String

		public init(data: [TerminalReader], has_more: Bool, object: ObjectValues, url: String) {
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

/// Creates a new <code>Reader</code> object.
public struct PostTerminalReaders: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = TerminalReader
	public typealias paramType = AnyCodable
	public static func endpoint(for inputs: AnyCodable) throws -> String {
		return "/v1/terminal/readers"
	}

	public final class FormInput: Codable {
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?
		/// Custom label given to the reader for easier identification. If no label is specified, the registration code will be used.
		public var label: String?
		/// The location to assign the reader to. If no location is specified, the reader will be assigned to the account's default location.
		public var location: String?
		/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
		public var metadata: AnyCodable?
		/// A code generated by the reader used for registering to an account.
		public var registration_code: String

		public init(registration_code: String, expand: [String]? = nil, label: String? = nil, location: String? = nil, metadata: AnyCodable? = nil) {
			self.registration_code = registration_code
			self.expand = expand
			self.label = label
			self.location = location
			self.metadata = metadata
		}
	}

}

/// Retrieves a <code>Reader</code> object.
public struct GetTerminalReadersReader: StripeAPIEndpoint {
	public typealias inputType = AnyCodable
	public typealias outputType = TerminalReader
	public typealias paramType = Params
	
	public struct Params {
		let reader: String

		/// Initialize the request parameters
		/// - Parameter reader: 
		public init(reader: String) {
			self.reader = reader
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/terminal/readers/\(inputs.reader)"
	}
	public static var method: HTTPMethod { return .GET }

}

/// Updates a <code>Reader</code> object by setting the values of the parameters passed. Any parameters not provided will be left unchanged.
public struct PostTerminalReadersReader: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = TerminalReader
	public typealias paramType = Params
	
	public struct Params {
		let reader: String

		/// Initialize the request parameters
		/// - Parameter reader: 
		public init(reader: String) {
			self.reader = reader
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/terminal/readers/\(inputs.reader)"
	}

	public final class FormInput: Codable {
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?
		/// The new label of the reader.
		public var label: String?
		/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
		public var metadata: AnyCodable?

		public init(expand: [String]? = nil, label: String? = nil, metadata: AnyCodable? = nil) {
			self.expand = expand
			self.label = label
			self.metadata = metadata
		}
	}

}

/// Deletes a <code>Reader</code> object.
public struct DeleteTerminalReadersReader: StripeAPIEndpoint {
	public typealias inputType = AnyCodable
	public typealias outputType = DeletedTerminalReader
	public typealias paramType = Params
	
	public struct Params {
		let reader: String

		/// Initialize the request parameters
		/// - Parameter reader: 
		public init(reader: String) {
			self.reader = reader
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/terminal/readers/\(inputs.reader)"
	}
	public static var method: HTTPMethod { return .DELETE }

}
