
/// Returns a list of issuer fraud records.
public struct GetIssuerFraudRecords: StripeAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = RadarIssuerFraudRecordList
	public typealias paramType = Params
	public struct Params {
		let charge: String
		let ending_before: String
		let limit: Int
		let starting_after: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/issuer_fraud_records?charge=\(inputs.charge.urlEncoded))&ending_before=\(inputs.ending_before.urlEncoded))&limit=\(inputs.limit.urlEncoded))&starting_after=\(inputs.starting_after.urlEncoded))"
	}
	public static var method: HTTPMethod { return .GET }

	public class RadarIssuerFraudRecordList: Codable {
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
	public typealias inputType = Empty
	public typealias outputType = IssuerFraudRecord
	public typealias paramType = Params
	public struct Params {
		let issuer_fraud_record: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/issuer_fraud_records/\(inputs.issuer_fraud_record)"
	}
	public static var method: HTTPMethod { return .GET }

}
