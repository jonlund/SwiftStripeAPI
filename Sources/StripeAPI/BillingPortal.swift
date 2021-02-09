
/// Creates a session of the customer portal.
public struct PostBillingPortalSessions: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = BillingPortalSession
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v1/billing_portal/sessions"
	}

	public final class FormInput: Codable {
		/// The ID of an existing customer.
		public var customer: String
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?
		/// The URL to which Stripe should send customers when they click on the link to return to your website. This field is required if a default return URL has not been configured for the portal.
		public var return_url: String?

		public init(customer: String, expand: [String]? = nil, return_url: String? = nil) {
			self.customer = customer
			self.expand = expand
			self.return_url = return_url
		}
	}

}
