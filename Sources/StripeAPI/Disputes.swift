
/// Returns a list of your disputes.
public struct GetDisputes: StripeAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = Output
	public typealias paramType = Params
	public struct Params {
		let starting_after: String
		let ending_before: String
		let charge: String
		let limit: Int
		let payment_intent: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/disputes?charge=\(inputs.charge.urlEncoded))&limit=\(inputs.limit.urlEncoded))&payment_intent=\(inputs.payment_intent.urlEncoded))&starting_after=\(inputs.starting_after.urlEncoded))&ending_before=\(inputs.ending_before.urlEncoded))"
	}
	public static var method: HTTPMethod { return .GET }

	public class Output: Codable {
		public var data: [Dispute]
		/// True if this list has another page of items after this one that can be fetched.
		public var has_more: Bool
		/// String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
		public var object: ObjectValues
		/// The URL where this list can be accessed.
		public var url: String

		public init(data: [Dispute], has_more: Bool, object: ObjectValues, url: String) {
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

/// Retrieves the dispute with the given ID.
public struct GetDisputesDispute: StripeAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = Dispute
	public typealias paramType = Params
	public struct Params {
		let dispute: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/disputes/\(inputs.dispute)"
	}
	public static var method: HTTPMethod { return .GET }

}

/// When you get a dispute, contacting your customer is always the best first step. If that doesn’t work, you can submit evidence to help us resolve the dispute in your favor. You can do this in your <a href="https://dashboard.stripe.com/disputes">dashboard</a>, but if you prefer, you can use the API to submit evidence programmatically.  Depending on your dispute type, different evidence fields will give you a better chance of winning your dispute. To figure out which evidence fields to provide, see our <a href="/docs/disputes/categories">guide to dispute types</a>.
public struct PostDisputesDispute: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = Dispute
	public typealias paramType = Params
	public struct Params {
		let dispute: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/disputes/\(inputs.dispute)"
	}

	public class FormInput: Codable {
		/// Evidence to upload, to respond to a dispute. Updating any field in the hash will submit all fields in the hash for review. The combined character count of all fields is limited to 150,000.
		public var evidence: DisputeEvidenceParams?
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?
		/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
		public var metadata: MESSED_UP?
		/// Whether to immediately submit evidence to the bank. If `false`, evidence is staged on the dispute. Staged evidence is visible in the API and Dashboard, and can be submitted to the bank by making another request with this attribute set to `true` (the default).
		public var submit: Bool?

		public init(evidence: DisputeEvidenceParams? = nil, expand: [String]? = nil, metadata: MESSED_UP? = nil, submit: Bool? = nil) {
			self.evidence = evidence
			self.expand = expand
			self.metadata = metadata
			self.submit = submit
		}


		/// Evidence to upload, to respond to a dispute. Updating any field in the hash will submit all fields in the hash for review. The combined character count of all fields is limited to 150,000.
		public class DisputeEvidenceParams: Codable {
			public var access_activity_log: String?
			public var billing_address: String?
			public var cancellation_policy: String?
			public var cancellation_policy_disclosure: String?
			public var cancellation_rebuttal: String?
			public var customer_communication: String?
			public var customer_email_address: String?
			public var customer_name: String?
			public var customer_purchase_ip: String?
			public var customer_signature: String?
			public var duplicate_charge_documentation: String?
			public var duplicate_charge_explanation: String?
			public var duplicate_charge_id: String?
			public var product_description: String?
			public var receipt: String?
			public var refund_policy: String?
			public var refund_policy_disclosure: String?
			public var refund_refusal_explanation: String?
			public var service_date: String?
			public var service_documentation: String?
			public var shipping_address: String?
			public var shipping_carrier: String?
			public var shipping_date: String?
			public var shipping_documentation: String?
			public var shipping_tracking_number: String?
			public var uncategorized_file: String?
			public var uncategorized_text: String?

			/// Evidence to upload, to respond to a dispute. Updating any field in the hash will submit all fields in the hash for review. The combined character count of all fields is limited to 150,000.
			/// - Parameters:
			public init(access_activity_log: String? = nil, billing_address: String? = nil, cancellation_policy: String? = nil, cancellation_policy_disclosure: String? = nil, cancellation_rebuttal: String? = nil, customer_communication: String? = nil, customer_email_address: String? = nil, customer_name: String? = nil, customer_purchase_ip: String? = nil, customer_signature: String? = nil, duplicate_charge_documentation: String? = nil, duplicate_charge_explanation: String? = nil, duplicate_charge_id: String? = nil, product_description: String? = nil, receipt: String? = nil, refund_policy: String? = nil, refund_policy_disclosure: String? = nil, refund_refusal_explanation: String? = nil, service_date: String? = nil, service_documentation: String? = nil, shipping_address: String? = nil, shipping_carrier: String? = nil, shipping_date: String? = nil, shipping_documentation: String? = nil, shipping_tracking_number: String? = nil, uncategorized_file: String? = nil, uncategorized_text: String? = nil) {
				self.access_activity_log = access_activity_log
				self.billing_address = billing_address
				self.cancellation_policy = cancellation_policy
				self.cancellation_policy_disclosure = cancellation_policy_disclosure
				self.cancellation_rebuttal = cancellation_rebuttal
				self.customer_communication = customer_communication
				self.customer_email_address = customer_email_address
				self.customer_name = customer_name
				self.customer_purchase_ip = customer_purchase_ip
				self.customer_signature = customer_signature
				self.duplicate_charge_documentation = duplicate_charge_documentation
				self.duplicate_charge_explanation = duplicate_charge_explanation
				self.duplicate_charge_id = duplicate_charge_id
				self.product_description = product_description
				self.receipt = receipt
				self.refund_policy = refund_policy
				self.refund_policy_disclosure = refund_policy_disclosure
				self.refund_refusal_explanation = refund_refusal_explanation
				self.service_date = service_date
				self.service_documentation = service_documentation
				self.shipping_address = shipping_address
				self.shipping_carrier = shipping_carrier
				self.shipping_date = shipping_date
				self.shipping_documentation = shipping_documentation
				self.shipping_tracking_number = shipping_tracking_number
				self.uncategorized_file = uncategorized_file
				self.uncategorized_text = uncategorized_text
			}
		}

	}

}

/// Closing the dispute for a charge indicates that you do not have any evidence to submit and are essentially dismissing the dispute, acknowledging it as lost.  The status of the dispute will change from <code>needs_response</code> to <code>lost</code>. <em>Closing a dispute is irreversible</em>.
public struct PostDisputesDisputeClose: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = Dispute
	public typealias paramType = Params
	public struct Params {
		let dispute: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/disputes/\(inputs.dispute)/close"
	}

	public class FormInput: Codable {
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?

		public init(expand: [String]? = nil) {
			self.expand = expand
		}
	}

}
