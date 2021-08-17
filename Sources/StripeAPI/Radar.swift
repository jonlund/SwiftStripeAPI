
/// Returns a list of early fraud warnings.
public struct GetRadarEarlyFraudWarnings: StripeAPIEndpoint {
	public typealias inputType = AnyCodable
	public typealias outputType = RadarEarlyFraudWarningList
	public typealias paramType = Params
	
	public struct Params {
		let charge: String?
		let ending_before: String?
		let limit: Int?
		let starting_after: String?

		/// Initialize the request parameters
		/// - Parameter charge: Only return early fraud warnings for the charge specified by this charge ID.
		/// - Parameter ending_before: A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list.
		/// - Parameter limit: A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10.
		/// - Parameter starting_after: A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list.
		public init(charge: String? = nil, ending_before: String? = nil, limit: Int? = nil, starting_after: String? = nil) {
			self.charge = charge
			self.ending_before = ending_before
			self.limit = limit
			self.starting_after = starting_after
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		var params = [String]()
		if let a = inputs.charge?.urlEncoded { params.append("charge=\(a)") }
		if let a = inputs.ending_before?.urlEncoded { params.append("ending_before=\(a)") }
		if let a = inputs.limit?.urlEncoded { params.append("limit=\(a)") }
		if let a = inputs.starting_after?.urlEncoded { params.append("starting_after=\(a)") }
		let query = params.joined(separator: "&")
		return "/v1/radar/early_fraud_warnings?\(query)"
	}
	public static var method: HTTPMethod { return .GET }

	public final class RadarEarlyFraudWarningList: Codable {
		public var data: [RadarEarlyFraudWarning]
		/// True if this list has another page of items after this one that can be fetched.
		public var has_more: Bool
		/// String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
		public var object: ObjectValues
		/// The URL where this list can be accessed.
		public var url: String

		public init(data: [RadarEarlyFraudWarning], has_more: Bool, object: ObjectValues, url: String) {
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

/// Retrieves the details of an early fraud warning that has previously been created.   Please refer to the <a href="#early_fraud_warning_object">early fraud warning</a> object reference for more details.
public struct GetRadarEarlyFraudWarningsEarlyFraudWarning: StripeAPIEndpoint {
	public typealias inputType = AnyCodable
	public typealias outputType = RadarEarlyFraudWarning
	public typealias paramType = Params
	
	public struct Params {
		let early_fraud_warning: String

		/// Initialize the request parameters
		/// - Parameter early_fraud_warning: 
		public init(early_fraud_warning: String) {
			self.early_fraud_warning = early_fraud_warning
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/radar/early_fraud_warnings/\(inputs.early_fraud_warning)"
	}
	public static var method: HTTPMethod { return .GET }

}

/// Returns a list of <code>ValueListItem</code> objects. The objects are sorted in descending order by creation date, with the most recently created object appearing first.
public struct GetRadarValueListItems: StripeAPIEndpoint {
	public typealias inputType = AnyCodable
	public typealias outputType = Output
	public typealias paramType = Params
	
	public struct Params {
		let value_list: String
		let ending_before: String?
		let limit: Int?
		let starting_after: String?
		let value: String?

		/// Initialize the request parameters
		/// - Parameter value_list: Identifier for the parent value list this item belongs to.
		/// - Parameter ending_before: A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list.
		/// - Parameter limit: A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10.
		/// - Parameter starting_after: A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list.
		/// - Parameter value: Return items belonging to the parent list whose value matches the specified value (using an "is like" match).
		public init(value_list: String, ending_before: String? = nil, limit: Int? = nil, starting_after: String? = nil, value: String? = nil) {
			self.value_list = value_list
			self.ending_before = ending_before
			self.limit = limit
			self.starting_after = starting_after
			self.value = value
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		var params = [String]()
		params.append("value_list=\(inputs.value_list.urlEncoded)")
		if let a = inputs.ending_before?.urlEncoded { params.append("ending_before=\(a)") }
		if let a = inputs.limit?.urlEncoded { params.append("limit=\(a)") }
		if let a = inputs.starting_after?.urlEncoded { params.append("starting_after=\(a)") }
		if let a = inputs.value?.urlEncoded { params.append("value=\(a)") }
		let query = params.joined(separator: "&")
		return "/v1/radar/value_list_items?\(query)"
	}
	public static var method: HTTPMethod { return .GET }

	public final class Output: Codable {
		public var data: [RadarValueListItem]
		/// True if this list has another page of items after this one that can be fetched.
		public var has_more: Bool
		/// String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
		public var object: ObjectValues
		/// The URL where this list can be accessed.
		public var url: String

		public init(data: [RadarValueListItem], has_more: Bool, object: ObjectValues, url: String) {
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

/// Creates a new <code>ValueListItem</code> object, which is added to the specified parent value list.
public struct PostRadarValueListItems: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = RadarValueListItem
	public typealias paramType = AnyCodable
	public static func endpoint(for inputs: AnyCodable) throws -> String {
		return "/v1/radar/value_list_items"
	}

	public final class FormInput: Codable {
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?
		/// The value of the item (whose type must match the type of the parent value list).
		public var value: String
		/// The identifier of the value list which the created item will be added to.
		public var value_list: String

		public init(value: String, value_list: String, expand: [String]? = nil) {
			self.value = value
			self.value_list = value_list
			self.expand = expand
		}
	}

}

/// Retrieves a <code>ValueListItem</code> object.
public struct GetRadarValueListItemsItem: StripeAPIEndpoint {
	public typealias inputType = AnyCodable
	public typealias outputType = RadarValueListItem
	public typealias paramType = Params
	
	public struct Params {
		let item: String

		/// Initialize the request parameters
		/// - Parameter item: 
		public init(item: String) {
			self.item = item
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/radar/value_list_items/\(inputs.item)"
	}
	public static var method: HTTPMethod { return .GET }

}

/// Deletes a <code>ValueListItem</code> object, removing it from its parent value list.
public struct DeleteRadarValueListItemsItem: StripeAPIEndpoint {
	public typealias inputType = AnyCodable
	public typealias outputType = DeletedRadarValueListItem
	public typealias paramType = Params
	
	public struct Params {
		let item: String

		/// Initialize the request parameters
		/// - Parameter item: 
		public init(item: String) {
			self.item = item
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/radar/value_list_items/\(inputs.item)"
	}
	public static var method: HTTPMethod { return .DELETE }

}

/// Returns a list of <code>ValueList</code> objects. The objects are sorted in descending order by creation date, with the most recently created object appearing first.
public struct GetRadarValueLists: StripeAPIEndpoint {
	public typealias inputType = AnyCodable
	public typealias outputType = Output
	public typealias paramType = Params
	
	public struct Params {
		let alias: String?
		let contains: String?
		let ending_before: String?
		let limit: Int?
		let starting_after: String?

		/// Initialize the request parameters
		/// - Parameter alias: The alias used to reference the value list when writing rules.
		/// - Parameter contains: A value contained within a value list - returns all value lists containing this value.
		/// - Parameter ending_before: A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list.
		/// - Parameter limit: A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10.
		/// - Parameter starting_after: A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list.
		public init(alias: String? = nil, contains: String? = nil, ending_before: String? = nil, limit: Int? = nil, starting_after: String? = nil) {
			self.alias = alias
			self.contains = contains
			self.ending_before = ending_before
			self.limit = limit
			self.starting_after = starting_after
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		var params = [String]()
		if let a = inputs.alias?.urlEncoded { params.append("alias=\(a)") }
		if let a = inputs.contains?.urlEncoded { params.append("contains=\(a)") }
		if let a = inputs.ending_before?.urlEncoded { params.append("ending_before=\(a)") }
		if let a = inputs.limit?.urlEncoded { params.append("limit=\(a)") }
		if let a = inputs.starting_after?.urlEncoded { params.append("starting_after=\(a)") }
		let query = params.joined(separator: "&")
		return "/v1/radar/value_lists?\(query)"
	}
	public static var method: HTTPMethod { return .GET }

	public final class Output: Codable {
		public var data: [RadarValueList]
		/// True if this list has another page of items after this one that can be fetched.
		public var has_more: Bool
		/// String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
		public var object: ObjectValues
		/// The URL where this list can be accessed.
		public var url: String

		public init(data: [RadarValueList], has_more: Bool, object: ObjectValues, url: String) {
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

/// Creates a new <code>ValueList</code> object, which can then be referenced in rules.
public struct PostRadarValueLists: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = RadarValueList
	public typealias paramType = AnyCodable
	public static func endpoint(for inputs: AnyCodable) throws -> String {
		return "/v1/radar/value_lists"
	}

	public final class FormInput: Codable {
		/// The name of the value list for use in rules.
		public var alias: String
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?
		/// Type of the items in the value list. One of `card_fingerprint`, `card_bin`, `email`, `ip_address`, `country`, `string`, or `case_sensitive_string`. Use `string` if the item type is unknown or mixed.
		public var item_type: ItemTypeValues?
		/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
		public var metadata: AnyCodable?
		/// The human-readable name of the value list.
		public var name: String

		public init(alias: String, name: String, expand: [String]? = nil, item_type: ItemTypeValues? = nil, metadata: AnyCodable? = nil) {
			self.alias = alias
			self.name = name
			self.expand = expand
			self.item_type = item_type
			self.metadata = metadata
		}

		public enum ItemTypeValues: String, Codable {
			case cardBin = "card_bin"
			case cardFingerprint = "card_fingerprint"
			case caseSensitiveString = "case_sensitive_string"
			case country = "country"
			case email = "email"
			case ipAddress = "ip_address"
			case string = "string"
		}
	}

}

/// Retrieves a <code>ValueList</code> object.
public struct GetRadarValueListsValueList: StripeAPIEndpoint {
	public typealias inputType = AnyCodable
	public typealias outputType = RadarValueList
	public typealias paramType = Params
	
	public struct Params {
		let value_list: String

		/// Initialize the request parameters
		/// - Parameter value_list: 
		public init(value_list: String) {
			self.value_list = value_list
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/radar/value_lists/\(inputs.value_list)"
	}
	public static var method: HTTPMethod { return .GET }

}

/// Updates a <code>ValueList</code> object by setting the values of the parameters passed. Any parameters not provided will be left unchanged. Note that <code>item_type</code> is immutable.
public struct PostRadarValueListsValueList: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = RadarValueList
	public typealias paramType = Params
	
	public struct Params {
		let value_list: String

		/// Initialize the request parameters
		/// - Parameter value_list: 
		public init(value_list: String) {
			self.value_list = value_list
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/radar/value_lists/\(inputs.value_list)"
	}

	public final class FormInput: Codable {
		/// The name of the value list for use in rules.
		public var alias: String?
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?
		/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
		public var metadata: AnyCodable?
		/// The human-readable name of the value list.
		public var name: String?

		public init(alias: String? = nil, expand: [String]? = nil, metadata: AnyCodable? = nil, name: String? = nil) {
			self.alias = alias
			self.expand = expand
			self.metadata = metadata
			self.name = name
		}
	}

}

/// Deletes a <code>ValueList</code> object, also deleting any items contained within the value list. To be deleted, a value list must not be referenced in any rules.
public struct DeleteRadarValueListsValueList: StripeAPIEndpoint {
	public typealias inputType = AnyCodable
	public typealias outputType = DeletedRadarValueList
	public typealias paramType = Params
	
	public struct Params {
		let value_list: String

		/// Initialize the request parameters
		/// - Parameter value_list: 
		public init(value_list: String) {
			self.value_list = value_list
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/radar/value_lists/\(inputs.value_list)"
	}
	public static var method: HTTPMethod { return .DELETE }

}
