
/// Returns a list of early fraud warnings.
public struct GetRadarEarlyFraudWarnings: StripeAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = RadarEarlyFraudWarningList
	public typealias paramType = Params
	public struct Params {
		let charge: String
		let ending_before: String
		let limit: Int
		let starting_after: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/radar/early_fraud_warnings?charge=\(inputs.charge.urlEncoded))&ending_before=\(inputs.ending_before.urlEncoded))&limit=\(inputs.limit.urlEncoded))&starting_after=\(inputs.starting_after.urlEncoded))"
	}
	public static var method: HTTPMethod { return .GET }

	public class RadarEarlyFraudWarningList: Codable {
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
	public typealias inputType = Empty
	public typealias outputType = RadarEarlyFraudWarning
	public typealias paramType = Params
	public struct Params {
		let early_fraud_warning: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/radar/early_fraud_warnings/\(inputs.early_fraud_warning)"
	}
	public static var method: HTTPMethod { return .GET }

}

/// Returns a list of <code>ValueListItem</code> objects. The objects are sorted in descending order by creation date, with the most recently created object appearing first.
public struct GetRadarValueListItems: StripeAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = Output
	public typealias paramType = Params
	public struct Params {
		let ending_before: String
		let limit: Int
		let starting_after: String
		let value: String
		let value_list: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/radar/value_list_items?ending_before=\(inputs.ending_before.urlEncoded))&limit=\(inputs.limit.urlEncoded))&starting_after=\(inputs.starting_after.urlEncoded))&value=\(inputs.value.urlEncoded))&value_list=\(inputs.value_list.urlEncoded))"
	}
	public static var method: HTTPMethod { return .GET }

	public class Output: Codable {
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
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v1/radar/value_list_items"
	}

	public class FormInput: Codable {
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
	public typealias inputType = Empty
	public typealias outputType = RadarValueListItem
	public typealias paramType = Params
	public struct Params {
		let item: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/radar/value_list_items/\(inputs.item)"
	}
	public static var method: HTTPMethod { return .GET }

}

/// Deletes a <code>ValueListItem</code> object, removing it from its parent value list.
public struct DeleteRadarValueListItemsItem: StripeAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = DeletedRadarValueListItem
	public typealias paramType = Params
	public struct Params {
		let item: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/radar/value_list_items/\(inputs.item)"
	}
	public static var method: HTTPMethod { return .DELETE }

}

/// Returns a list of <code>ValueList</code> objects. The objects are sorted in descending order by creation date, with the most recently created object appearing first.
public struct GetRadarValueLists: StripeAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = Output
	public typealias paramType = Params
	public struct Params {
		let alias: String
		let contains: String
		let ending_before: String
		let limit: Int
		let starting_after: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/radar/value_lists?alias=\(inputs.alias.urlEncoded))&contains=\(inputs.contains.urlEncoded))&ending_before=\(inputs.ending_before.urlEncoded))&limit=\(inputs.limit.urlEncoded))&starting_after=\(inputs.starting_after.urlEncoded))"
	}
	public static var method: HTTPMethod { return .GET }

	public class Output: Codable {
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
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v1/radar/value_lists"
	}

	public class FormInput: Codable {
		/// The name of the value list for use in rules.
		public var alias: String
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?
		/// Type of the items in the value list. One of `card_fingerprint`, `card_bin`, `email`, `ip_address`, `country`, `string`, or `case_sensitive_string`. Use `string` if the item type is unknown or mixed.
		public var item_type: ItemTypeValues?
		/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
		public var metadata: String?
		/// The human-readable name of the value list.
		public var name: String

		public init(alias: String, name: String, expand: [String]? = nil, item_type: ItemTypeValues? = nil, metadata: String? = nil) {
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
	public typealias inputType = Empty
	public typealias outputType = RadarValueList
	public typealias paramType = Params
	public struct Params {
		let value_list: String
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
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/radar/value_lists/\(inputs.value_list)"
	}

	public class FormInput: Codable {
		/// The name of the value list for use in rules.
		public var alias: String?
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?
		/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
		public var metadata: String?
		/// The human-readable name of the value list.
		public var name: String?

		public init(alias: String? = nil, expand: [String]? = nil, metadata: String? = nil, name: String? = nil) {
			self.alias = alias
			self.expand = expand
			self.metadata = metadata
			self.name = name
		}
	}

}

/// Deletes a <code>ValueList</code> object, also deleting any items contained within the value list. To be deleted, a value list must not be referenced in any rules.
public struct DeleteRadarValueListsValueList: StripeAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = DeletedRadarValueList
	public typealias paramType = Params
	public struct Params {
		let value_list: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/radar/value_lists/\(inputs.value_list)"
	}
	public static var method: HTTPMethod { return .DELETE }

}
