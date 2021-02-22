
/// Returns a list of your webhook endpoints.
public struct GetWebhookEndpoints: StripeAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = Output
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
		return "/v1/webhook_endpoints?\(query)"
	}
	public static var method: HTTPMethod { return .GET }

	public final class Output: Codable {
		public var data: [WebhookEndpoint]
		/// True if this list has another page of items after this one that can be fetched.
		public var has_more: Bool
		/// String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
		public var object: ObjectValues
		/// The URL where this list can be accessed.
		public var url: String

		public init(data: [WebhookEndpoint], has_more: Bool, object: ObjectValues, url: String) {
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

/// A webhook endpoint must have a <code>url</code> and a list of <code>enabled_events</code>. You may optionally specify the Boolean <code>connect</code> parameter. If set to true, then a Connect webhook endpoint that notifies the specified <code>url</code> about events from all connected accounts is created; otherwise an account webhook endpoint that notifies the specified <code>url</code> only about events from your account is created. You can also create webhook endpoints in the <a href="https://dashboard.stripe.com/account/webhooks">webhooks settings</a> section of the Dashboard.
public struct PostWebhookEndpoints: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = WebhookEndpoint
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v1/webhook_endpoints"
	}

	public final class FormInput: Codable {
		/// Events sent to this endpoint will be generated with this Stripe Version instead of your account's default Stripe Version.
		public var api_version: ApiVersionValues?
		/// Whether this endpoint should receive events from connected accounts (`true`), or from your account (`false`). Defaults to `false`.
		public var connect: Bool?
		/// An optional description of what the webhook is used for.
		public var description: String?
		/// The list of events to enable for this endpoint. You may specify `['*']` to enable all events, except those that require explicit selection.
		public var enabled_events: [String]
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?
		/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
		public var metadata: AnyCodable?
		/// The URL of the webhook endpoint.
		public var url: String

		public init(enabled_events: [String], url: String, api_version: ApiVersionValues? = nil, connect: Bool? = nil, description: String? = nil, expand: [String]? = nil, metadata: AnyCodable? = nil) {
			self.enabled_events = enabled_events
			self.url = url
			self.api_version = api_version
			self.connect = connect
			self.description = description
			self.expand = expand
			self.metadata = metadata
		}

		public enum ApiVersionValues: String, Codable {
			case option2011Minus01Minus01 = "2011-01-01"
			case option2011Minus06Minus21 = "2011-06-21"
			case option2011Minus06Minus28 = "2011-06-28"
			case option2011Minus08Minus01 = "2011-08-01"
			case option2011Minus09Minus15 = "2011-09-15"
			case option2011Minus11Minus17 = "2011-11-17"
			case option2012Minus02Minus23 = "2012-02-23"
			case option2012Minus03Minus25 = "2012-03-25"
			case option2012Minus06Minus18 = "2012-06-18"
			case option2012Minus06Minus28 = "2012-06-28"
			case option2012Minus07Minus09 = "2012-07-09"
			case option2012Minus09Minus24 = "2012-09-24"
			case option2012Minus10Minus26 = "2012-10-26"
			case option2012Minus11Minus07 = "2012-11-07"
			case option2013Minus02Minus11 = "2013-02-11"
			case option2013Minus02Minus13 = "2013-02-13"
			case option2013Minus07Minus05 = "2013-07-05"
			case option2013Minus08Minus12 = "2013-08-12"
			case option2013Minus08Minus13 = "2013-08-13"
			case option2013Minus10Minus29 = "2013-10-29"
			case option2013Minus12Minus03 = "2013-12-03"
			case option2014Minus01Minus31 = "2014-01-31"
			case option2014Minus03Minus13 = "2014-03-13"
			case option2014Minus03Minus28 = "2014-03-28"
			case option2014Minus05Minus19 = "2014-05-19"
			case option2014Minus06Minus13 = "2014-06-13"
			case option2014Minus06Minus17 = "2014-06-17"
			case option2014Minus07Minus22 = "2014-07-22"
			case option2014Minus07Minus26 = "2014-07-26"
			case option2014Minus08Minus04 = "2014-08-04"
			case option2014Minus08Minus20 = "2014-08-20"
			case option2014Minus09Minus08 = "2014-09-08"
			case option2014Minus10Minus07 = "2014-10-07"
			case option2014Minus11Minus05 = "2014-11-05"
			case option2014Minus11Minus20 = "2014-11-20"
			case option2014Minus12Minus08 = "2014-12-08"
			case option2014Minus12Minus17 = "2014-12-17"
			case option2014Minus12Minus22 = "2014-12-22"
			case option2015Minus01Minus11 = "2015-01-11"
			case option2015Minus01Minus26 = "2015-01-26"
			case option2015Minus02Minus10 = "2015-02-10"
			case option2015Minus02Minus16 = "2015-02-16"
			case option2015Minus02Minus18 = "2015-02-18"
			case option2015Minus03Minus24 = "2015-03-24"
			case option2015Minus04Minus07 = "2015-04-07"
			case option2015Minus06Minus15 = "2015-06-15"
			case option2015Minus07Minus07 = "2015-07-07"
			case option2015Minus07Minus13 = "2015-07-13"
			case option2015Minus07Minus28 = "2015-07-28"
			case option2015Minus08Minus07 = "2015-08-07"
			case option2015Minus08Minus19 = "2015-08-19"
			case option2015Minus09Minus03 = "2015-09-03"
			case option2015Minus09Minus08 = "2015-09-08"
			case option2015Minus09Minus23 = "2015-09-23"
			case option2015Minus10Minus01 = "2015-10-01"
			case option2015Minus10Minus12 = "2015-10-12"
			case option2015Minus10Minus16 = "2015-10-16"
			case option2016Minus02Minus03 = "2016-02-03"
			case option2016Minus02Minus19 = "2016-02-19"
			case option2016Minus02Minus22 = "2016-02-22"
			case option2016Minus02Minus23 = "2016-02-23"
			case option2016Minus02Minus29 = "2016-02-29"
			case option2016Minus03Minus07 = "2016-03-07"
			case option2016Minus06Minus15 = "2016-06-15"
			case option2016Minus07Minus06 = "2016-07-06"
			case option2016Minus10Minus19 = "2016-10-19"
			case option2017Minus01Minus27 = "2017-01-27"
			case option2017Minus02Minus14 = "2017-02-14"
			case option2017Minus04Minus06 = "2017-04-06"
			case option2017Minus05Minus25 = "2017-05-25"
			case option2017Minus06Minus05 = "2017-06-05"
			case option2017Minus08Minus15 = "2017-08-15"
			case option2017Minus12Minus14 = "2017-12-14"
			case option2018Minus01Minus23 = "2018-01-23"
			case option2018Minus02Minus05 = "2018-02-05"
			case option2018Minus02Minus06 = "2018-02-06"
			case option2018Minus02Minus28 = "2018-02-28"
			case option2018Minus05Minus21 = "2018-05-21"
			case option2018Minus07Minus27 = "2018-07-27"
			case option2018Minus08Minus23 = "2018-08-23"
			case option2018Minus09Minus06 = "2018-09-06"
			case option2018Minus09Minus24 = "2018-09-24"
			case option2018Minus10Minus31 = "2018-10-31"
			case option2018Minus11Minus08 = "2018-11-08"
			case option2019Minus02Minus11 = "2019-02-11"
			case option2019Minus02Minus19 = "2019-02-19"
			case option2019Minus03Minus14 = "2019-03-14"
			case option2019Minus05Minus16 = "2019-05-16"
			case option2019Minus08Minus14 = "2019-08-14"
			case option2019Minus09Minus09 = "2019-09-09"
			case option2019Minus10Minus08 = "2019-10-08"
			case option2019Minus10Minus17 = "2019-10-17"
			case option2019Minus11Minus05 = "2019-11-05"
			case option2019Minus12Minus03 = "2019-12-03"
			case option2020Minus03Minus02 = "2020-03-02"
			case option2020Minus08Minus27 = "2020-08-27"
		}
	}

}

/// Retrieves the webhook endpoint with the given ID.
public struct GetWebhookEndpointsWebhookEndpoint: StripeAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = WebhookEndpoint
	public typealias paramType = Params
	
	public struct Params {
		let webhook_endpoint: String

		/// Initialize the request parameters
		/// - Parameter webhook_endpoint: 
		public init(webhook_endpoint: String) {
			self.webhook_endpoint = webhook_endpoint
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/webhook_endpoints/\(inputs.webhook_endpoint)"
	}
	public static var method: HTTPMethod { return .GET }

}

/// Updates the webhook endpoint. You may edit the <code>url</code>, the list of <code>enabled_events</code>, and the status of your endpoint.
public struct PostWebhookEndpointsWebhookEndpoint: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = WebhookEndpoint
	public typealias paramType = Params
	
	public struct Params {
		let webhook_endpoint: String

		/// Initialize the request parameters
		/// - Parameter webhook_endpoint: 
		public init(webhook_endpoint: String) {
			self.webhook_endpoint = webhook_endpoint
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/webhook_endpoints/\(inputs.webhook_endpoint)"
	}

	public final class FormInput: Codable {
		/// An optional description of what the webhook is used for.
		public var description: String?
		/// Disable the webhook endpoint if set to true.
		public var disabled: Bool?
		/// The list of events to enable for this endpoint. You may specify `['*']` to enable all events, except those that require explicit selection.
		public var enabled_events: [String]?
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?
		/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
		public var metadata: AnyCodable?
		/// The URL of the webhook endpoint.
		public var url: String?

		public init(description: String? = nil, disabled: Bool? = nil, enabled_events: [String]? = nil, expand: [String]? = nil, metadata: AnyCodable? = nil, url: String? = nil) {
			self.description = description
			self.disabled = disabled
			self.enabled_events = enabled_events
			self.expand = expand
			self.metadata = metadata
			self.url = url
		}
	}

}

/// You can also delete webhook endpoints via the <a href="https://dashboard.stripe.com/account/webhooks">webhook endpoint management</a> page of the Stripe dashboard.
public struct DeleteWebhookEndpointsWebhookEndpoint: StripeAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = DeletedWebhookEndpoint
	public typealias paramType = Params
	
	public struct Params {
		let webhook_endpoint: String

		/// Initialize the request parameters
		/// - Parameter webhook_endpoint: 
		public init(webhook_endpoint: String) {
			self.webhook_endpoint = webhook_endpoint
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/webhook_endpoints/\(inputs.webhook_endpoint)"
	}
	public static var method: HTTPMethod { return .DELETE }

}
