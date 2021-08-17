
/// Retrieves a Mandate object.
public struct GetMandatesMandate: StripeAPIEndpoint {
	public typealias inputType = AnyCodable
	public typealias outputType = Mandate
	public typealias paramType = Params
	
	public struct Params {
		let mandate: String

		/// Initialize the request parameters
		/// - Parameter mandate: 
		public init(mandate: String) {
			self.mandate = mandate
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/mandates/\(inputs.mandate)"
	}
	public static var method: HTTPMethod { return .GET }

}
