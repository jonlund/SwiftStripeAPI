
/// Returns a list of <code>Review</code> objects that have <code>open</code> set to <code>true</code>. The objects are sorted in descending order by creation date, with the most recently created object appearing first.
public struct GetReviews: StripeAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = Output
	public typealias paramType = Params
	public struct Params {
		let ending_before: String
		let limit: Int
		let starting_after: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/reviews?ending_before=\(inputs.ending_before.urlEncoded))&limit=\(inputs.limit.urlEncoded))&starting_after=\(inputs.starting_after.urlEncoded))"
	}
	public static var method: HTTPMethod { return .GET }

	public final class Output: Codable {
		public var data: [Review]
		/// True if this list has another page of items after this one that can be fetched.
		public var has_more: Bool
		/// String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
		public var object: ObjectValues
		/// The URL where this list can be accessed.
		public var url: String

		public init(data: [Review], has_more: Bool, object: ObjectValues, url: String) {
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

/// Retrieves a <code>Review</code> object.
public struct GetReviewsReview: StripeAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = Review
	public typealias paramType = Params
	public struct Params {
		let review: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/reviews/\(inputs.review)"
	}
	public static var method: HTTPMethod { return .GET }

}

/// Approves a <code>Review</code> object, closing it and removing it from the list of reviews.
public struct PostReviewsReviewApprove: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = Review
	public typealias paramType = Params
	public struct Params {
		let review: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/reviews/\(inputs.review)/approve"
	}

	public final class FormInput: Codable {
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?

		public init(expand: [String]? = nil) {
			self.expand = expand
		}
	}

}
