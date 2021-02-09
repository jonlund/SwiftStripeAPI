
/// List events, going back up to 30 days. Each event data is rendered according to Stripe API version at its creation time, specified in <a href="/docs/api/events/object">event object</a> <code>api_version</code> attribute (not according to your current Stripe API version or <code>Stripe-Version</code> header).
public struct GetEvents: StripeAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = NotificationEventList
	public typealias paramType = Params
	public struct Params {
		let delivery_success: Bool
		let ending_before: String
		let limit: Int
		let starting_after: String
		let type: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/events?delivery_success=\(inputs.delivery_success.urlEncoded))&ending_before=\(inputs.ending_before.urlEncoded))&limit=\(inputs.limit.urlEncoded))&starting_after=\(inputs.starting_after.urlEncoded))&type=\(inputs.type.urlEncoded))"
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
	public typealias inputType = Empty
	public typealias outputType = Event
	public typealias paramType = Params
	public struct Params {
		let id: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/events/\(inputs.id)"
	}
	public static var method: HTTPMethod { return .GET }

}
