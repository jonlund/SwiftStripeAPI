
/// Returns a list of <code>Review</code> objects that have <code>open</code> set to <code>true</code>. The objects are sorted in descending order by creation date, with the most recently created object appearing first.
public struct GetReviews: StripeAPIEndpoint {
	public typealias inputType = AnyCodable
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
		return "/v1/reviews?\(query)"
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
	public typealias inputType = AnyCodable
	public typealias outputType = Review
	public typealias paramType = Params
	
	public struct Params {
		let review: String

		/// Initialize the request parameters
		/// - Parameter review: 
		public init(review: String) {
			self.review = review
		}
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

		/// Initialize the request parameters
		/// - Parameter review: 
		public init(review: String) {
			self.review = review
		}
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
