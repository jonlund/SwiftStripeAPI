
/// Returns a list of issuer fraud records.
public struct GetIssuerFraudRecords: StripeAPIEndpoint {
	public typealias inputType = AnyCodable
	public typealias outputType = RadarIssuerFraudRecordList
	public typealias paramType = Params
	
	public struct Params {
		let charge: String?
		let ending_before: String?
		let limit: Int?
		let starting_after: String?

		/// Initialize the request parameters
		/// - Parameter charge: Only return issuer fraud records for the charge specified by this charge ID.
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
		return "/v1/issuer_fraud_records?\(query)"
	}
	public static var method: HTTPMethod { return .GET }

	public final class RadarIssuerFraudRecordList: Codable {
		public var data: [IssuerFraudRecord]
		/// True if this list has another page of items after this one that can be fetched.
		public var has_more: Bool
		/// String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
		public var object: ObjectValues
		/// The URL where this list can be accessed.
		public var url: String

		public init(data: [IssuerFraudRecord], has_more: Bool, object: ObjectValues, url: String) {
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

/// Retrieves the details of an issuer fraud record that has previously been created.   Please refer to the <a href="#issuer_fraud_record_object">issuer fraud record</a> object reference for more details.
public struct GetIssuerFraudRecordsIssuerFraudRecord: StripeAPIEndpoint {
	public typealias inputType = AnyCodable
	public typealias outputType = IssuerFraudRecord
	public typealias paramType = Params
	
	public struct Params {
		let issuer_fraud_record: String

		/// Initialize the request parameters
		/// - Parameter issuer_fraud_record: 
		public init(issuer_fraud_record: String) {
			self.issuer_fraud_record = issuer_fraud_record
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/issuer_fraud_records/\(inputs.issuer_fraud_record)"
	}
	public static var method: HTTPMethod { return .GET }

}
