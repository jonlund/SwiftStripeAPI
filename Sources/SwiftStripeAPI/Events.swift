
/// List events, going back up to 30 days. Each event data is rendered according to Stripe API version at its creation time, specified in <a href="/docs/api/events/object">event object</a> <code>api_version</code> attribute (not according to your current Stripe API version or <code>Stripe-Version</code> header).
public struct GetEvents: StripeAPIEndpoint {
	public typealias inputType = AnyCodable
	public typealias outputType = NotificationEventList
	public typealias paramType = Params
	
	public struct Params {
		let delivery_success: Bool?
		let ending_before: String?
		let limit: Int?
		let starting_after: String?
		let type: String?

		/// Initialize the request parameters
		/// - Parameter delivery_success: Filter events by whether all webhooks were successfully delivered. If false, events which are still pending or have failed all delivery attempts to a webhook endpoint will be returned.
		/// - Parameter ending_before: A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list.
		/// - Parameter limit: A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10.
		/// - Parameter starting_after: A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list.
		/// - Parameter type: A string containing a specific event name, or group of events using * as a wildcard. The list will be filtered to include only events with a matching event property.
		public init(delivery_success: Bool? = nil, ending_before: String? = nil, limit: Int? = nil, starting_after: String? = nil, type: String? = nil) {
			self.delivery_success = delivery_success
			self.ending_before = ending_before
			self.limit = limit
			self.starting_after = starting_after
			self.type = type
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		var params = [String]()
		if let a = inputs.delivery_success?.urlEncoded { params.append("delivery_success=\(a)") }
		if let a = inputs.ending_before?.urlEncoded { params.append("ending_before=\(a)") }
		if let a = inputs.limit?.urlEncoded { params.append("limit=\(a)") }
		if let a = inputs.starting_after?.urlEncoded { params.append("starting_after=\(a)") }
		if let a = inputs.type?.urlEncoded { params.append("type=\(a)") }
		let query = params.joined(separator: "&")
		return "/v1/events?\(query)"
	}
	public static var method: HTTPMethod { return .GET }

	public final class NotificationEventList: Codable {
		public var data: [Event]
		/// True if this list has another page of items after this one that can be fetched.
		public var has_more: Bool
		/// String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
		public var object: ObjectValues
		/// The URL where this list can be accessed.
		public var url: String

		public init(data: [Event], has_more: Bool, object: ObjectValues, url: String) {
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

/// Retrieves the details of an event. Supply the unique identifier of the event, which you might have received in a webhook.
public struct GetEventsId: StripeAPIEndpoint {
	public typealias inputType = AnyCodable
	public typealias outputType = Event
	public typealias paramType = Params
	
	public struct Params {
		let id: String

		/// Initialize the request parameters
		/// - Parameter id: 
		public init(id: String) {
			self.id = id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/events/\(inputs.id)"
	}
	public static var method: HTTPMethod { return .GET }

}
