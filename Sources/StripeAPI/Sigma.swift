
/// Returns a list of scheduled query runs.
public struct GetSigmaScheduledQueryRuns: StripeAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = Output
	public typealias paramType = Params
	public struct Params {
		let ending_before: String
		let limit: Int
		let starting_after: String

		public init(ending_before: String, limit: Int, starting_after: String) {
			self.ending_before = ending_before
			self.limit = limit
			self.starting_after = starting_after
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/sigma/scheduled_query_runs?ending_before=\(inputs.ending_before.urlEncoded))&limit=\(inputs.limit.urlEncoded))&starting_after=\(inputs.starting_after.urlEncoded))"
	}
	public static var method: HTTPMethod { return .GET }

	public final class Output: Codable {
		public var data: [ScheduledQueryRun]
		/// True if this list has another page of items after this one that can be fetched.
		public var has_more: Bool
		/// String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
		public var object: ObjectValues
		/// The URL where this list can be accessed.
		public var url: String

		public init(data: [ScheduledQueryRun], has_more: Bool, object: ObjectValues, url: String) {
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

/// Retrieves the details of an scheduled query run.
public struct GetSigmaScheduledQueryRunsScheduledQueryRun: StripeAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = ScheduledQueryRun
	public typealias paramType = Params
	public struct Params {
		let scheduled_query_run: String

		public init(scheduled_query_run: String) {
			self.scheduled_query_run = scheduled_query_run
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/sigma/scheduled_query_runs/\(inputs.scheduled_query_run)"
	}
	public static var method: HTTPMethod { return .GET }

}
