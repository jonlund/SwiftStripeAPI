
/// Returns a list of charges you’ve previously created. The charges are returned in sorted order, with the most recent charges appearing first.
public struct GetCharges: StripeAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = Output
	public typealias paramType = Params
	public struct Params {
		let customer: String
		let ending_before: String
		let limit: Int
		let payment_intent: String
		let starting_after: String
		let transfer_group: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/charges?customer=\(inputs.customer.urlEncoded))&ending_before=\(inputs.ending_before.urlEncoded))&limit=\(inputs.limit.urlEncoded))&payment_intent=\(inputs.payment_intent.urlEncoded))&starting_after=\(inputs.starting_after.urlEncoded))&transfer_group=\(inputs.transfer_group.urlEncoded))"
	}
	public static var method: HTTPMethod { return .GET }

	public final class Output: Codable {
		public var data: [Charge]
		/// True if this list has another page of items after this one that can be fetched.
		public var has_more: Bool
		/// String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
		public var object: ObjectValues
		/// The URL where this list can be accessed.
		public var url: String

		public init(data: [Charge], has_more: Bool, object: ObjectValues, url: String) {
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

/// To charge a credit card or other payment source, you create a <code>Charge</code> object. If your API key is in test mode, the supplied payment source (e.g., card) won’t actually be charged, although everything else will occur as if in live mode. (Stripe assumes that the charge would have completed successfully).
public struct PostCharges: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = Charge
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v1/charges"
	}

	public final class FormInput: Codable {
		/// Amount intended to be collected by this payment. A positive integer representing how much to charge in the [smallest currency unit](https://stripe.com/docs/currencies#zero-decimal) (e.g., 100 cents to charge $1.00 or 100 to charge ¥100, a zero-decimal currency). The minimum amount is $0.50 US or [equivalent in charge currency](https://stripe.com/docs/currencies#minimum-and-maximum-charge-amounts). The amount value supports up to eight digits (e.g., a value of 99999999 for a USD charge of $999,999.99).
		public var amount: Int?
		public var application_fee: Int?
		/// A fee in %s that will be applied to the charge and transferred to the application owner's Stripe account. The request must be made with an OAuth key or the `Stripe-Account` header in order to take an application fee. For more information, see the application fees [documentation](https://stripe.com/docs/connect/direct-charges#collecting-fees).
		public var application_fee_amount: Int?
		/// Whether to immediately capture the charge. Defaults to `true`. When `false`, the charge issues an authorization (or pre-authorization), and will need to be [captured](https://stripe.com/docs/api#capture_charge) later. Uncaptured charges expire in _seven days_. For more information, see the [authorizing charges and settling later](https://stripe.com/docs/charges/placing-a-hold) documentation.
		public var capture: Bool?
		/// A token, like the ones returned by [Stripe.js](https://stripe.com/docs/stripe.js).
		public var card: MESSED_UP?
		/// Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
		public var currency: String?
		/// The ID of an existing customer that will be charged in this request.
		public var customer: String?
		/// An arbitrary string which you can attach to a `Charge` object. It is displayed when in the web interface alongside the charge. Note that if you use Stripe to send automatic email receipts to your customers, your receipt emails will include the `description` of the charge(s) that they are describing.
		public var description: String?
		public var destination: MESSED_UP?
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?
		/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
		public var metadata: MESSED_UP?
		/// The Stripe account ID for which these funds are intended. Automatically set if you use the `destination` parameter. For details, see [Creating Separate Charges and Transfers](https://stripe.com/docs/connect/charges-transfers#on-behalf-of).
		public var on_behalf_of: String?
		/// The email address to which this charge's [receipt](https://stripe.com/docs/dashboard/receipts) will be sent. The receipt will not be sent until the charge is paid, and no receipts will be sent for test mode charges. If this charge is for a [Customer](https://stripe.com/docs/api/customers/object), the email address specified here will override the customer's email address. If `receipt_email` is specified for a charge in live mode, a receipt will be sent regardless of your [email settings](https://dashboard.stripe.com/account/emails).
		public var receipt_email: String?
		/// Shipping information for the charge. Helps prevent fraud on charges for physical goods.
		public var shipping: Shipping?
		/// A payment source to be charged. This can be the ID of a [card](https://stripe.com/docs/api#cards) (i.e., credit or debit card), a [bank account](https://stripe.com/docs/api#bank_accounts), a [source](https://stripe.com/docs/api#sources), a [token](https://stripe.com/docs/api#tokens), or a [connected account](https://stripe.com/docs/connect/account-debits#charging-a-connected-account). For certain sources---namely, [cards](https://stripe.com/docs/api#cards), [bank accounts](https://stripe.com/docs/api#bank_accounts), and attached [sources](https://stripe.com/docs/api#sources)---you must also pass the ID of the associated customer.
		public var source: String?
		/// For card charges, use `statement_descriptor_suffix` instead. Otherwise, you can use this value as the complete description of a charge on your customers’ statements. Must contain at least one letter, maximum 22 characters.
		public var statement_descriptor: String?
		/// Provides information about the charge that customers see on their statements. Concatenated with the prefix (shortened descriptor) or statement descriptor that’s set on the account to form the complete statement descriptor. Maximum 22 characters for the concatenated descriptor.
		public var statement_descriptor_suffix: String?
		/// An optional dictionary including the account to automatically transfer to as part of a destination charge. [See the Connect documentation](https://stripe.com/docs/connect/destination-charges) for details.
		public var transfer_data: TransferDataSpecs?
		/// A string that identifies this transaction as part of a group. For details, see [Grouping transactions](https://stripe.com/docs/connect/charges-transfers#transfer-options).
		public var transfer_group: String?

		public init(amount: Int? = nil, application_fee: Int? = nil, application_fee_amount: Int? = nil, capture: Bool? = nil, card: MESSED_UP? = nil, currency: String? = nil, customer: String? = nil, description: String? = nil, destination: MESSED_UP? = nil, expand: [String]? = nil, metadata: MESSED_UP? = nil, on_behalf_of: String? = nil, receipt_email: String? = nil, shipping: Shipping? = nil, source: String? = nil, statement_descriptor: String? = nil, statement_descriptor_suffix: String? = nil, transfer_data: TransferDataSpecs? = nil, transfer_group: String? = nil) {
			self.amount = amount
			self.application_fee = application_fee
			self.application_fee_amount = application_fee_amount
			self.capture = capture
			self.card = card
			self.currency = currency
			self.customer = customer
			self.description = description
			self.destination = destination
			self.expand = expand
			self.metadata = metadata
			self.on_behalf_of = on_behalf_of
			self.receipt_email = receipt_email
			self.shipping = shipping
			self.source = source
			self.statement_descriptor = statement_descriptor
			self.statement_descriptor_suffix = statement_descriptor_suffix
			self.transfer_data = transfer_data
			self.transfer_group = transfer_group
		}


		/// Shipping information for the charge. Helps prevent fraud on charges for physical goods.
		public final class Shipping: Codable {
			public var address: Address
			public var carrier: String?
			public var name: String
			public var phone: String?
			public var tracking_number: String?

			/// Shipping information for the charge. Helps prevent fraud on charges for physical goods.
			/// - Parameters:
			///   - address: 
			///   - name: 
			public init(address: Address, name: String, carrier: String? = nil, phone: String? = nil, tracking_number: String? = nil) {
				self.address = address
				self.name = name
				self.carrier = carrier
				self.phone = phone
				self.tracking_number = tracking_number
			}


			public final class Address: Codable {
				public var city: String?
				public var country: String?
				public var line1: String
				public var line2: String?
				public var postal_code: String?
				public var state: String?

				public init(line1: String, city: String? = nil, country: String? = nil, line2: String? = nil, postal_code: String? = nil, state: String? = nil) {
					self.line1 = line1
					self.city = city
					self.country = country
					self.line2 = line2
					self.postal_code = postal_code
					self.state = state
				}
			}

		}



		/// An optional dictionary including the account to automatically transfer to as part of a destination charge. [See the Connect documentation](https://stripe.com/docs/connect/destination-charges) for details.
		public final class TransferDataSpecs: Codable {
			public var amount: Int?
			public var destination: String

			/// An optional dictionary including the account to automatically transfer to as part of a destination charge. [See the Connect documentation](https://stripe.com/docs/connect/destination-charges) for details.
			/// - Parameters:
			///   - destination: 
			public init(destination: String, amount: Int? = nil) {
				self.destination = destination
				self.amount = amount
			}
		}

	}

}

/// Retrieves the details of a charge that has previously been created. Supply the unique charge ID that was returned from your previous request, and Stripe will return the corresponding charge information. The same information is returned when creating or refunding the charge.
public struct GetChargesCharge: StripeAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = Charge
	public typealias paramType = Params
	public struct Params {
		let charge: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/charges/\(inputs.charge)"
	}
	public static var method: HTTPMethod { return .GET }

}

/// Updates the specified charge by setting the values of the parameters passed. Any parameters not provided will be left unchanged.
public struct PostChargesCharge: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = Charge
	public typealias paramType = Params
	public struct Params {
		let charge: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/charges/\(inputs.charge)"
	}

	public final class FormInput: Codable {
		/// The ID of an existing customer that will be associated with this request. This field may only be updated if there is no existing associated customer with this charge.
		public var customer: String?
		/// An arbitrary string which you can attach to a charge object. It is displayed when in the web interface alongside the charge. Note that if you use Stripe to send automatic email receipts to your customers, your receipt emails will include the `description` of the charge(s) that they are describing.
		public var description: String?
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?
		/// A set of key-value pairs you can attach to a charge giving information about its riskiness. If you believe a charge is fraudulent, include a `user_report` key with a value of `fraudulent`. If you believe a charge is safe, include a `user_report` key with a value of `safe`. Stripe will use the information you send to improve our fraud detection algorithms.
		public var fraud_details: FraudDetails?
		/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
		public var metadata: MESSED_UP?
		/// This is the email address that the receipt for this charge will be sent to. If this field is updated, then a new email receipt will be sent to the updated address.
		public var receipt_email: String?
		/// Shipping information for the charge. Helps prevent fraud on charges for physical goods.
		public var shipping: Shipping?
		/// A string that identifies this transaction as part of a group. `transfer_group` may only be provided if it has not been set. See the [Connect documentation](https://stripe.com/docs/connect/charges-transfers#transfer-options) for details.
		public var transfer_group: String?

		public init(customer: String? = nil, description: String? = nil, expand: [String]? = nil, fraud_details: FraudDetails? = nil, metadata: MESSED_UP? = nil, receipt_email: String? = nil, shipping: Shipping? = nil, transfer_group: String? = nil) {
			self.customer = customer
			self.description = description
			self.expand = expand
			self.fraud_details = fraud_details
			self.metadata = metadata
			self.receipt_email = receipt_email
			self.shipping = shipping
			self.transfer_group = transfer_group
		}


		/// A set of key-value pairs you can attach to a charge giving information about its riskiness. If you believe a charge is fraudulent, include a `user_report` key with a value of `fraudulent`. If you believe a charge is safe, include a `user_report` key with a value of `safe`. Stripe will use the information you send to improve our fraud detection algorithms.
		public final class FraudDetails: Codable {
			public var user_report: UserReportValues

			/// A set of key-value pairs you can attach to a charge giving information about its riskiness. If you believe a charge is fraudulent, include a `user_report` key with a value of `fraudulent`. If you believe a charge is safe, include a `user_report` key with a value of `safe`. Stripe will use the information you send to improve our fraud detection algorithms.
			/// - Parameters:
			///   - user_report: 
			public init(user_report: UserReportValues) {
				self.user_report = user_report
			}

			public enum UserReportValues: String, Codable {
				case fraudulent = "fraudulent"
				case safe = "safe"
			}
		}



		/// Shipping information for the charge. Helps prevent fraud on charges for physical goods.
		public final class Shipping: Codable {
			public var address: Address
			public var carrier: String?
			public var name: String
			public var phone: String?
			public var tracking_number: String?

			/// Shipping information for the charge. Helps prevent fraud on charges for physical goods.
			/// - Parameters:
			///   - address: 
			///   - name: 
			public init(address: Address, name: String, carrier: String? = nil, phone: String? = nil, tracking_number: String? = nil) {
				self.address = address
				self.name = name
				self.carrier = carrier
				self.phone = phone
				self.tracking_number = tracking_number
			}


			public final class Address: Codable {
				public var city: String?
				public var country: String?
				public var line1: String
				public var line2: String?
				public var postal_code: String?
				public var state: String?

				public init(line1: String, city: String? = nil, country: String? = nil, line2: String? = nil, postal_code: String? = nil, state: String? = nil) {
					self.line1 = line1
					self.city = city
					self.country = country
					self.line2 = line2
					self.postal_code = postal_code
					self.state = state
				}
			}

		}

	}

}

/// Capture the payment of an existing, uncaptured, charge. This is the second half of the two-step payment flow, where first you <a href="#create_charge">created a charge</a> with the capture option set to false.  Uncaptured payments expire exactly seven days after they are created. If they are not captured by that point in time, they will be marked as refunded and will no longer be capturable.
public struct PostChargesChargeCapture: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = Charge
	public typealias paramType = Params
	public struct Params {
		let charge: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/charges/\(inputs.charge)/capture"
	}

	public final class FormInput: Codable {
		/// The amount to capture, which must be less than or equal to the original amount. Any additional amount will be automatically refunded.
		public var amount: Int?
		/// An application fee to add on to this charge.
		public var application_fee: Int?
		/// An application fee amount to add on to this charge, which must be less than or equal to the original amount.
		public var application_fee_amount: Int?
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?
		/// The email address to send this charge's receipt to. This will override the previously-specified email address for this charge, if one was set. Receipts will not be sent in test mode.
		public var receipt_email: String?
		/// For card charges, use `statement_descriptor_suffix` instead. Otherwise, you can use this value as the complete description of a charge on your customers’ statements. Must contain at least one letter, maximum 22 characters.
		public var statement_descriptor: String?
		/// Provides information about the charge that customers see on their statements. Concatenated with the prefix (shortened descriptor) or statement descriptor that’s set on the account to form the complete statement descriptor. Maximum 22 characters for the concatenated descriptor.
		public var statement_descriptor_suffix: String?
		/// An optional dictionary including the account to automatically transfer to as part of a destination charge. [See the Connect documentation](https://stripe.com/docs/connect/destination-charges) for details.
		public var transfer_data: TransferDataSpecs?
		/// A string that identifies this transaction as part of a group. `transfer_group` may only be provided if it has not been set. See the [Connect documentation](https://stripe.com/docs/connect/charges-transfers#transfer-options) for details.
		public var transfer_group: String?

		public init(amount: Int? = nil, application_fee: Int? = nil, application_fee_amount: Int? = nil, expand: [String]? = nil, receipt_email: String? = nil, statement_descriptor: String? = nil, statement_descriptor_suffix: String? = nil, transfer_data: TransferDataSpecs? = nil, transfer_group: String? = nil) {
			self.amount = amount
			self.application_fee = application_fee
			self.application_fee_amount = application_fee_amount
			self.expand = expand
			self.receipt_email = receipt_email
			self.statement_descriptor = statement_descriptor
			self.statement_descriptor_suffix = statement_descriptor_suffix
			self.transfer_data = transfer_data
			self.transfer_group = transfer_group
		}


		/// An optional dictionary including the account to automatically transfer to as part of a destination charge. [See the Connect documentation](https://stripe.com/docs/connect/destination-charges) for details.
		public final class TransferDataSpecs: Codable {
			public var amount: Int?

			/// An optional dictionary including the account to automatically transfer to as part of a destination charge. [See the Connect documentation](https://stripe.com/docs/connect/destination-charges) for details.
			/// - Parameters:
			public init(amount: Int? = nil) {
				self.amount = amount
			}
		}

	}

}

/// Retrieve a dispute for a specified charge.
public struct GetChargesChargeDispute: StripeAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = Dispute
	public typealias paramType = Params
	public struct Params {
		let charge: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/charges/\(inputs.charge)/dispute"
	}
	public static var method: HTTPMethod { return .GET }

}

public struct PostChargesChargeDispute: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = Dispute
	public typealias paramType = Params
	public struct Params {
		let charge: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/charges/\(inputs.charge)/dispute"
	}

	public final class FormInput: Codable {
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
		public final class DisputeEvidenceParams: Codable {
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

public struct PostChargesChargeDisputeClose: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = Dispute
	public typealias paramType = Params
	public struct Params {
		let charge: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/charges/\(inputs.charge)/dispute/close"
	}

	public final class FormInput: Codable {
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?

		public init(expand: [String]? = nil) {
			self.expand = expand
		}
	}

}

/// When you create a new refund, you must specify a Charge or a PaymentIntent object on which to create it.  Creating a new refund will refund a charge that has previously been created but not yet refunded. Funds will be refunded to the credit or debit card that was originally charged.  You can optionally refund only part of a charge. You can do so multiple times, until the entire charge has been refunded.  Once entirely refunded, a charge can’t be refunded again. This method will raise an error when called on an already-refunded charge, or when trying to refund more money than is left on a charge.
public struct PostChargesChargeRefund: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = Charge
	public typealias paramType = Params
	public struct Params {
		let charge: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/charges/\(inputs.charge)/refund"
	}

	public final class FormInput: Codable {
		public var amount: Int?
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?
		/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
		public var metadata: MESSED_UP?
		public var payment_intent: String?
		public var reason: ReasonValues?
		public var refund_application_fee: Bool?
		public var reverse_transfer: Bool?

		public init(amount: Int? = nil, expand: [String]? = nil, metadata: MESSED_UP? = nil, payment_intent: String? = nil, reason: ReasonValues? = nil, refund_application_fee: Bool? = nil, reverse_transfer: Bool? = nil) {
			self.amount = amount
			self.expand = expand
			self.metadata = metadata
			self.payment_intent = payment_intent
			self.reason = reason
			self.refund_application_fee = refund_application_fee
			self.reverse_transfer = reverse_transfer
		}

		public enum ReasonValues: String, Codable {
			case duplicate = "duplicate"
			case fraudulent = "fraudulent"
			case requestedByCustomer = "requested_by_customer"
		}
	}

}

/// You can see a list of the refunds belonging to a specific charge. Note that the 10 most recent refunds are always available by default on the charge object. If you need more than those 10, you can use this API method and the <code>limit</code> and <code>starting_after</code> parameters to page through additional refunds.
public struct GetChargesChargeRefunds: StripeAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = RefundList
	public typealias paramType = Params
	public struct Params {
		let charge: String
		let ending_before: String
		let limit: Int
		let starting_after: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/charges/\(inputs.charge)/refunds?ending_before=\(inputs.ending_before.urlEncoded))&limit=\(inputs.limit.urlEncoded))&starting_after=\(inputs.starting_after.urlEncoded))"
	}
	public static var method: HTTPMethod { return .GET }

	public final class RefundList: Codable {
		/// Details about each object.
		public var data: [Refund]
		/// True if this list has another page of items after this one that can be fetched.
		public var has_more: Bool
		/// String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
		public var object: ObjectValues
		/// The URL where this list can be accessed.
		public var url: String

		public init(data: [Refund], has_more: Bool, object: ObjectValues, url: String) {
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

/// Create a refund.
public struct PostChargesChargeRefunds: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = Refund
	public typealias paramType = Params
	public struct Params {
		let charge: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/charges/\(inputs.charge)/refunds"
	}

	public final class FormInput: Codable {
		public var amount: Int?
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?
		/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
		public var metadata: MESSED_UP?
		public var payment_intent: String?
		public var reason: ReasonValues?
		public var refund_application_fee: Bool?
		public var reverse_transfer: Bool?

		public init(amount: Int? = nil, expand: [String]? = nil, metadata: MESSED_UP? = nil, payment_intent: String? = nil, reason: ReasonValues? = nil, refund_application_fee: Bool? = nil, reverse_transfer: Bool? = nil) {
			self.amount = amount
			self.expand = expand
			self.metadata = metadata
			self.payment_intent = payment_intent
			self.reason = reason
			self.refund_application_fee = refund_application_fee
			self.reverse_transfer = reverse_transfer
		}

		public enum ReasonValues: String, Codable {
			case duplicate = "duplicate"
			case fraudulent = "fraudulent"
			case requestedByCustomer = "requested_by_customer"
		}
	}

}

/// Retrieves the details of an existing refund.
public struct GetChargesChargeRefundsRefund: StripeAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = Refund
	public typealias paramType = Params
	public struct Params {
		let charge: String
		let refund: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/charges/\(inputs.charge)/refunds/\(inputs.refund)"
	}
	public static var method: HTTPMethod { return .GET }

}

/// Update a specified refund.
public struct PostChargesChargeRefundsRefund: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = Refund
	public typealias paramType = Params
	public struct Params {
		let charge: String
		let refund: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/charges/\(inputs.charge)/refunds/\(inputs.refund)"
	}

	public final class FormInput: Codable {
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?
		public var metadata: MESSED_UP?

		public init(expand: [String]? = nil, metadata: MESSED_UP? = nil) {
			self.expand = expand
			self.metadata = metadata
		}
	}

}
