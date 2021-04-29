/// This File Automatically Generated

/// Information about this version of this API
public struct StripeAPIInfo: Codable {
	public static let version: String = "2020-08-27"
	public static let server: String = "https://api.stripe.com/"
}

///// To charge a credit or a debit card, you create a `Charge` object. You can retrieve and refund individual charges as well as list all charges. Charges are identified by a unique, random ID.  Related guide: [Accept a payment with the Charges API](https://stripe.com/docs/payments/accept-a-payment-charges).
//public final class Charge: Codable {
//	/// Amount intended to be collected by this payment. A positive integer representing how much to charge in the [smallest currency unit](https://stripe.com/docs/currencies#zero-decimal) (e.g., 100 cents to charge $1.00 or 100 to charge ¥100, a zero-decimal currency). The minimum amount is $0.50 US or [equivalent in charge currency](https://stripe.com/docs/currencies#minimum-and-maximum-charge-amounts). The amount value supports up to eight digits (e.g., a value of 99999999 for a USD charge of $999,999.99).
//	public var amount: Int
//	/// Amount in %s captured (can be less than the amount attribute on the charge if a partial capture was made).
//	public var amount_captured: Int
//	/// Amount in %s refunded (can be less than the amount attribute on the charge if a partial refund was issued).
//	public var amount_refunded: Int
//	/// ID of the Connect application that created the charge.
//	public var application: String?
//	/// The application fee (if any) for the charge. [See the Connect documentation](https://stripe.com/docs/connect/direct-charges#collecting-fees) for details.
//	public var application_fee: String?
//	/// The amount of the application fee (if any) requested for the charge. [See the Connect documentation](https://stripe.com/docs/connect/direct-charges#collecting-fees) for details.
//	public var application_fee_amount: Int?
//	/// ID of the balance transaction that describes the impact of this charge on your account balance (not including refunds or disputes).
//	public var balance_transaction: String?
//	public var billing_details: BillingDetails
//	/// The full statement descriptor that is passed to card networks, and that is displayed on your customers' credit card and bank statements. Allows you to see what the statement descriptor looks like after the static and dynamic portions are combined.
//	public var calculated_statement_descriptor: String?
//	/// If the charge was created without capturing, this Boolean represents whether it is still uncaptured or has since been captured.
//	public var captured: Bool
//	/// Time at which the object was created. Measured in seconds since the Unix epoch.
//	public var created: Timestamp
//	/// Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
//	public var currency: String
//	/// ID of the customer this charge is for if one exists.
//	public var customer: String?
//	/// An arbitrary string attached to the object. Often useful for displaying to users.
//	public var description: String?
//	/// Whether the charge has been disputed.
//	public var disputed: Bool
//	/// Error code explaining reason for charge failure if available (see [the errors section](https://stripe.com/docs/api#errors) for a list of codes).
//	public var failure_code: String?
//	/// Message to user further explaining reason for charge failure if available.
//	public var failure_message: String?
//	/// Information on fraud assessments for the charge.
//	public var fraud_details: ChargeFraudDetails?
//	/// Unique identifier for the object.
//	public var id: String
//	/// ID of the invoice this charge is for if one exists.
//	public var invoice: String?
//	/// Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
//	public var livemode: Bool
//	/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
//	public var metadata: Empty
//	/// String representing the object's type. Objects of the same type share the same value.
//	public var object: ObjectValues
//	/// The account (if any) the charge was made on behalf of without triggering an automatic transfer. See the [Connect documentation](https://stripe.com/docs/connect/charges-transfers) for details.
//	public var on_behalf_of: String?
//	/// ID of the order this charge is for if one exists.
//	public var order: String?
//	/// Details about whether the payment was accepted, and why. See [understanding declines](https://stripe.com/docs/declines) for details.
//	public var outcome: ChargeOutcome?
//	/// `true` if the charge succeeded, or was successfully authorized for later capture.
//	public var paid: Bool
//	/// ID of the PaymentIntent associated with this charge, if one exists.
//	public var payment_intent: String?
//	/// ID of the payment method used in this charge.
//	public var payment_method: String?
//	/// Details about the payment method at the time of the transaction.
//	public var payment_method_details: PaymentMethodDetails?
//	/// This is the email address that the receipt for this charge was sent to.
//	public var receipt_email: String?
//	/// This is the transaction number that appears on email receipts sent for this charge. This attribute will be `null` until a receipt has been sent.
//	public var receipt_number: String?
//	/// This is the URL to view the receipt for this charge. The receipt is kept up-to-date to the latest state of the charge, including any refunds. If the charge is for an Invoice, the receipt will be stylized as an Invoice receipt.
//	public var receipt_url: String?
//	/// Whether the charge has been fully refunded. If the charge is only partially refunded, this attribute will still be false.
//	public var refunded: Bool
//	/// A list of refunds that have been applied to the charge.
//	public var refunds: RefundList
//	/// ID of the review associated with this charge if one exists.
//	public var review: String?
//	/// Shipping information for the charge.
//	public var shipping: Shipping?
//	/// The transfer ID which created this charge. Only present if the charge came from another Stripe account. [See the Connect documentation](https://stripe.com/docs/connect/destination-charges) for details.
//	public var source_transfer: String?
//	/// For card charges, use `statement_descriptor_suffix` instead. Otherwise, you can use this value as the complete description of a charge on your customers’ statements. Must contain at least one letter, maximum 22 characters.
//	public var statement_descriptor: String?
//	/// Provides information about the charge that customers see on their statements. Concatenated with the prefix (shortened descriptor) or statement descriptor that’s set on the account to form the complete statement descriptor. Maximum 22 characters for the concatenated descriptor.
//	public var statement_descriptor_suffix: String?
//	/// The status of the payment is either `succeeded`, `pending`, or `failed`.
//	public var status: String
//	/// ID of the transfer to the `destination` account (only applicable if the charge was created using the `destination` parameter).
//	public var transfer: String?
//	/// An optional dictionary including the account to automatically transfer to as part of a destination charge. [See the Connect documentation](https://stripe.com/docs/connect/destination-charges) for details.
//	public var transfer_data: ChargeTransferData?
//	/// A string that identifies this transaction as part of a group. See the [Connect documentation](https://stripe.com/docs/connect/charges-transfers#transfer-options) for details.
//	public var transfer_group: String?
//
//	/// To charge a credit or a debit card, you create a `Charge` object. You can retrieve and refund individual charges as well as list all charges. Charges are identified by a unique, random ID.  Related guide: [Accept a payment with the Charges API](https://stripe.com/docs/payments/accept-a-payment-charges).
//	/// - Parameters:
//	///   - amount: Amount intended to be collected by this payment. A positive integer representing how much to charge in the [smallest currency unit](https://stripe.com/docs/currencies#zero-decimal) (e.g., 100 cents to charge $1.00 or 100 to charge ¥100, a zero-decimal currency). The minimum amount is $0.50 US or [equivalent in charge currency](https://stripe.com/docs/currencies#minimum-and-maximum-charge-amounts). The amount value supports up to eight digits (e.g., a value of 99999999 for a USD charge of $999,999.99).
//	///   - amount_captured: Amount in %s captured (can be less than the amount attribute on the charge if a partial capture was made).
//	///   - amount_refunded: Amount in %s refunded (can be less than the amount attribute on the charge if a partial refund was issued).
//	///   - application: ID of the Connect application that created the charge.
//	///   - application_fee: The application fee (if any) for the charge. [See the Connect documentation](https://stripe.com/docs/connect/direct-charges#collecting-fees) for details.
//	///   - application_fee_amount: The amount of the application fee (if any) requested for the charge. [See the Connect documentation](https://stripe.com/docs/connect/direct-charges#collecting-fees) for details.
//	///   - balance_transaction: ID of the balance transaction that describes the impact of this charge on your account balance (not including refunds or disputes).
//	///   - billing_details:
//	///   - calculated_statement_descriptor: The full statement descriptor that is passed to card networks, and that is displayed on your customers' credit card and bank statements. Allows you to see what the statement descriptor looks like after the static and dynamic portions are combined.
//	///   - captured: If the charge was created without capturing, this Boolean represents whether it is still uncaptured or has since been captured.
//	///   - created: Time at which the object was created. Measured in seconds since the Unix epoch.
//	///   - currency: Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
//	///   - customer: ID of the customer this charge is for if one exists.
//	///   - description: An arbitrary string attached to the object. Often useful for displaying to users.
//	///   - disputed: Whether the charge has been disputed.
//	///   - failure_code: Error code explaining reason for charge failure if available (see [the errors section](https://stripe.com/docs/api#errors) for a list of codes).
//	///   - failure_message: Message to user further explaining reason for charge failure if available.
//	///   - fraud_details: Information on fraud assessments for the charge.
//	///   - id: Unique identifier for the object.
//	///   - invoice: ID of the invoice this charge is for if one exists.
//	///   - livemode: Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
//	///   - metadata: Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
//	///   - object: String representing the object's type. Objects of the same type share the same value.
//	///   - on_behalf_of: The account (if any) the charge was made on behalf of without triggering an automatic transfer. See the [Connect documentation](https://stripe.com/docs/connect/charges-transfers) for details.
//	///   - order: ID of the order this charge is for if one exists.
//	///   - outcome: Details about whether the payment was accepted, and why. See [understanding declines](https://stripe.com/docs/declines) for details.
//	///   - paid: `true` if the charge succeeded, or was successfully authorized for later capture.
//	///   - payment_intent: ID of the PaymentIntent associated with this charge, if one exists.
//	///   - payment_method: ID of the payment method used in this charge.
//	///   - payment_method_details: Details about the payment method at the time of the transaction.
//	///   - receipt_email: This is the email address that the receipt for this charge was sent to.
//	///   - receipt_number: This is the transaction number that appears on email receipts sent for this charge. This attribute will be `null` until a receipt has been sent.
//	///   - receipt_url: This is the URL to view the receipt for this charge. The receipt is kept up-to-date to the latest state of the charge, including any refunds. If the charge is for an Invoice, the receipt will be stylized as an Invoice receipt.
//	///   - refunded: Whether the charge has been fully refunded. If the charge is only partially refunded, this attribute will still be false.
//	///   - refunds: A list of refunds that have been applied to the charge.
//	///   - review: ID of the review associated with this charge if one exists.
//	///   - shipping: Shipping information for the charge.
//	///   - source_transfer: The transfer ID which created this charge. Only present if the charge came from another Stripe account. [See the Connect documentation](https://stripe.com/docs/connect/destination-charges) for details.
//	///   - statement_descriptor: For card charges, use `statement_descriptor_suffix` instead. Otherwise, you can use this value as the complete description of a charge on your customers’ statements. Must contain at least one letter, maximum 22 characters.
//	///   - statement_descriptor_suffix: Provides information about the charge that customers see on their statements. Concatenated with the prefix (shortened descriptor) or statement descriptor that’s set on the account to form the complete statement descriptor. Maximum 22 characters for the concatenated descriptor.
//	///   - status: The status of the payment is either `succeeded`, `pending`, or `failed`.
//	///   - transfer: ID of the transfer to the `destination` account (only applicable if the charge was created using the `destination` parameter).
//	///   - transfer_data: An optional dictionary including the account to automatically transfer to as part of a destination charge. [See the Connect documentation](https://stripe.com/docs/connect/destination-charges) for details.
//	///   - transfer_group: A string that identifies this transaction as part of a group. See the [Connect documentation](https://stripe.com/docs/connect/charges-transfers#transfer-options) for details.
//	public init(amount: Int, amount_captured: Int, amount_refunded: Int, billing_details: BillingDetails, captured: Bool, created: Timestamp, currency: String, disputed: Bool, id: String, livemode: Bool, metadata: Empty, object: ObjectValues, paid: Bool, refunded: Bool, refunds: RefundList, status: String, application: String? = nil, application_fee: String? = nil, application_fee_amount: Int? = nil, balance_transaction: String? = nil, calculated_statement_descriptor: String? = nil, customer: String? = nil, description: String? = nil, failure_code: String? = nil, failure_message: String? = nil, fraud_details: ChargeFraudDetails? = nil, invoice: String? = nil, on_behalf_of: String? = nil, order: String? = nil, outcome: ChargeOutcome? = nil, payment_intent: String? = nil, payment_method: String? = nil, payment_method_details: PaymentMethodDetails? = nil, receipt_email: String? = nil, receipt_number: String? = nil, receipt_url: String? = nil, review: String? = nil, shipping: Shipping? = nil, source_transfer: String? = nil, statement_descriptor: String? = nil, statement_descriptor_suffix: String? = nil, transfer: String? = nil, transfer_data: ChargeTransferData? = nil, transfer_group: String? = nil) {
//		self.amount = amount
//		self.amount_captured = amount_captured
//		self.amount_refunded = amount_refunded
//		self.billing_details = billing_details
//		self.captured = captured
//		self.created = created
//		self.currency = currency
//		self.disputed = disputed
//		self.id = id
//		self.livemode = livemode
//		self.metadata = metadata
//		self.object = object
//		self.paid = paid
//		self.refunded = refunded
//		self.refunds = refunds
//		self.status = status
//		self.application = application
//		self.application_fee = application_fee
//		self.application_fee_amount = application_fee_amount
//		self.balance_transaction = balance_transaction
//		self.calculated_statement_descriptor = calculated_statement_descriptor
//		self.customer = customer
//		self.description = description
//		self.failure_code = failure_code
//		self.failure_message = failure_message
//		self.fraud_details = fraud_details
//		self.invoice = invoice
//		self.on_behalf_of = on_behalf_of
//		self.order = order
//		self.outcome = outcome
//		self.payment_intent = payment_intent
//		self.payment_method = payment_method
//		self.payment_method_details = payment_method_details
//		self.receipt_email = receipt_email
//		self.receipt_number = receipt_number
//		self.receipt_url = receipt_url
//		self.review = review
//		self.shipping = shipping
//		self.source_transfer = source_transfer
//		self.statement_descriptor = statement_descriptor
//		self.statement_descriptor_suffix = statement_descriptor_suffix
//		self.transfer = transfer
//		self.transfer_data = transfer_data
//		self.transfer_group = transfer_group
//	}
//
//
//	/// A list of refunds that have been applied to the charge.
//	public final class RefundList: Codable {
//		/// Details about each object.
//		public var data: [Refund]
//		/// True if this list has another page of items after this one that can be fetched.
//		public var has_more: Bool
//		/// String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
//		public var object: ObjectValues
//		/// The URL where this list can be accessed.
//		public var url: String
//
//		/// A list of refunds that have been applied to the charge.
//		/// - Parameters:
//		///   - data: Details about each object.
//		///   - has_more: True if this list has another page of items after this one that can be fetched.
//		///   - object: String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
//		///   - url: The URL where this list can be accessed.
//		public init(data: [Refund], has_more: Bool, object: ObjectValues, url: String) {
//			self.data = data
//			self.has_more = has_more
//			self.object = object
//			self.url = url
//		}
//
//		public enum ObjectValues: String, Codable {
//			case list = "list"
//		}
//	}
//
//
//	public enum ObjectValues: String, Codable {
//		case charge = "charge"
//	}
//}

/// A PaymentIntent guides you through the process of collecting a payment from your customer. We recommend that you create exactly one PaymentIntent for each order or customer session in your system. You can reference the PaymentIntent later to see the history of payment attempts for a particular session.  A PaymentIntent transitions through [multiple statuses](https://stripe.com/docs/payments/intents#intent-statuses) throughout its lifetime as it interfaces with Stripe.js to perform authentication flows and ultimately creates at most one successful charge.  Related guide: [Payment Intents API](https://stripe.com/docs/payments/payment-intents).
public final class PaymentIntent: Codable {
	/// Amount intended to be collected by this PaymentIntent. A positive integer representing how much to charge in the [smallest currency unit](https://stripe.com/docs/currencies#zero-decimal) (e.g., 100 cents to charge $1.00 or 100 to charge ¥100, a zero-decimal currency). The minimum amount is $0.50 US or [equivalent in charge currency](https://stripe.com/docs/currencies#minimum-and-maximum-charge-amounts). The amount value supports up to eight digits (e.g., a value of 99999999 for a USD charge of $999,999.99).
	public var amount: Int
	/// Amount that can be captured from this PaymentIntent.
	public var amount_capturable: Int?
	/// Amount that was collected by this PaymentIntent.
	public var amount_received: Int?
	/// ID of the Connect application that created the PaymentIntent.
	public var application: String?
	/// The amount of the application fee (if any) that will be requested to be applied to the payment and transferred to the application owner's Stripe account. The amount of the application fee collected will be capped at the total payment amount. For more information, see the PaymentIntents [use case for connected accounts](https://stripe.com/docs/payments/connected-accounts).
	public var application_fee_amount: Int?
	/// Populated when `status` is `canceled`, this is the time at which the PaymentIntent was canceled. Measured in seconds since the Unix epoch.
	public var canceled_at: Timestamp?
	/// Reason for cancellation of this PaymentIntent, either user-provided (`duplicate`, `fraudulent`, `requested_by_customer`, or `abandoned`) or generated by Stripe internally (`failed_invoice`, `void_invoice`, or `automatic`).
	public var cancellation_reason: CancellationReasonValues?
	/// Controls when the funds will be captured from the customer's account.
	public var capture_method: CaptureMethodValues
	/// Charges that were created by this PaymentIntent, if any.
//	public var charges: PaymentFlowsPaymentIntentResourceChargeList?
	/// The client secret of this PaymentIntent. Used for client-side retrieval using a publishable key.   The client secret can be used to complete a payment from your frontend. It should not be stored, logged, embedded in URLs, or exposed to anyone other than the customer. Make sure that you have TLS enabled on any page that includes the client secret.  Refer to our docs to [accept a payment](https://stripe.com/docs/payments/accept-a-payment?integration=elements) and learn about how `client_secret` should be handled.
	public var client_secret: String?
	public var confirmation_method: ConfirmationMethodValues
	/// Time at which the object was created. Measured in seconds since the Unix epoch.
	public var created: Timestamp
	/// Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
	public var currency: String
	/// ID of the Customer this PaymentIntent belongs to, if one exists.  Payment methods attached to other Customers cannot be used with this PaymentIntent.  If present in combination with [setup_future_usage](https://stripe.com/docs/api#payment_intent_object-setup_future_usage), this PaymentIntent's payment method will be attached to the Customer after the PaymentIntent has been confirmed and any required actions from the user are complete.
	public var customer: String?
	/// An arbitrary string attached to the object. Often useful for displaying to users.
	public var description: String?
	/// Unique identifier for the object.
	public var id: String
	/// ID of the invoice that created this PaymentIntent, if it exists.
	public var invoice: String?
	/// The payment error encountered in the previous PaymentIntent confirmation. It will be cleared if the PaymentIntent is later updated for any reason.
//	public var last_payment_error: ApiErrors?
	/// Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
	public var livemode: Bool
	/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. For more information, see the [documentation](https://stripe.com/docs/payments/payment-intents/creating-payment-intents#storing-information-in-metadata).
	public var metadata: Empty?
	/// If present, this property tells you what actions you need to take in order for your customer to fulfill a payment using the provided source.
//	public var next_action: PaymentIntentNextAction?
	/// String representing the object's type. Objects of the same type share the same value.
	public var object: ObjectValues
	/// The account (if any) for which the funds of the PaymentIntent are intended. See the PaymentIntents [use case for connected accounts](https://stripe.com/docs/payments/connected-accounts) for details.
	public var on_behalf_of: String?
	/// ID of the payment method used in this PaymentIntent.
	public var payment_method: String?
	/// Payment-method-specific configuration for this PaymentIntent.
//	public var payment_method_options: PaymentIntentPaymentMethodOptions?
	/// The list of payment method types (e.g. card) that this PaymentIntent is allowed to use.
	public var payment_method_types: [String]
	/// Email address that the receipt for the resulting payment will be sent to. If `receipt_email` is specified for a payment in live mode, a receipt will be sent regardless of your [email settings](https://dashboard.stripe.com/account/emails).
	public var receipt_email: String?
	/// ID of the review associated with this PaymentIntent, if any.
	public var review: String?
	/// Indicates that you intend to make future payments with this PaymentIntent's payment method.  Providing this parameter will [attach the payment method](https://stripe.com/docs/payments/save-during-payment) to the PaymentIntent's Customer, if present, after the PaymentIntent is confirmed and any required actions from the user are complete. If no Customer was provided, the payment method can still be [attached](https://stripe.com/docs/api/payment_methods/attach) to a Customer after the transaction completes.  When processing card payments, Stripe also uses `setup_future_usage` to dynamically optimize your payment flow and comply with regional legislation and network rules, such as [SCA](https://stripe.com/docs/strong-customer-authentication).
	public var setup_future_usage: SetupFutureUsageValues?
	/// Shipping information for this PaymentIntent.
//	public var shipping: Shipping?
	/// For non-card charges, you can use this value as the complete description that appears on your customers’ statements. Must contain at least one letter, maximum 22 characters.
	public var statement_descriptor: String?
	/// Provides information about a card payment that customers see on their statements. Concatenated with the prefix (shortened descriptor) or statement descriptor that’s set on the account to form the complete statement descriptor. Maximum 22 characters for the concatenated descriptor.
	public var statement_descriptor_suffix: String?
	/// Status of this PaymentIntent, one of `requires_payment_method`, `requires_confirmation`, `requires_action`, `processing`, `requires_capture`, `canceled`, or `succeeded`. Read more about each PaymentIntent [status](https://stripe.com/docs/payments/intents#intent-statuses).
	public var status: StatusValues
	/// The data with which to automatically create a Transfer when the payment is finalized. See the PaymentIntents [use case for connected accounts](https://stripe.com/docs/payments/connected-accounts) for details.
//	public var transfer_data: TransferData?
	/// A string that identifies the resulting payment as part of a group. See the PaymentIntents [use case for connected accounts](https://stripe.com/docs/payments/connected-accounts) for details.
	public var transfer_group: String?

	/// A PaymentIntent guides you through the process of collecting a payment from your customer. We recommend that you create exactly one PaymentIntent for each order or customer session in your system. You can reference the PaymentIntent later to see the history of payment attempts for a particular session.  A PaymentIntent transitions through [multiple statuses](https://stripe.com/docs/payments/intents#intent-statuses) throughout its lifetime as it interfaces with Stripe.js to perform authentication flows and ultimately creates at most one successful charge.  Related guide: [Payment Intents API](https://stripe.com/docs/payments/payment-intents).
	/// - Parameters:
	///   - amount: Amount intended to be collected by this PaymentIntent. A positive integer representing how much to charge in the [smallest currency unit](https://stripe.com/docs/currencies#zero-decimal) (e.g., 100 cents to charge $1.00 or 100 to charge ¥100, a zero-decimal currency). The minimum amount is $0.50 US or [equivalent in charge currency](https://stripe.com/docs/currencies#minimum-and-maximum-charge-amounts). The amount value supports up to eight digits (e.g., a value of 99999999 for a USD charge of $999,999.99).
	///   - amount_capturable: Amount that can be captured from this PaymentIntent.
	///   - amount_received: Amount that was collected by this PaymentIntent.
	///   - application: ID of the Connect application that created the PaymentIntent.
	///   - application_fee_amount: The amount of the application fee (if any) that will be requested to be applied to the payment and transferred to the application owner's Stripe account. The amount of the application fee collected will be capped at the total payment amount. For more information, see the PaymentIntents [use case for connected accounts](https://stripe.com/docs/payments/connected-accounts).
	///   - canceled_at: Populated when `status` is `canceled`, this is the time at which the PaymentIntent was canceled. Measured in seconds since the Unix epoch.
	///   - cancellation_reason: Reason for cancellation of this PaymentIntent, either user-provided (`duplicate`, `fraudulent`, `requested_by_customer`, or `abandoned`) or generated by Stripe internally (`failed_invoice`, `void_invoice`, or `automatic`).
	///   - capture_method: Controls when the funds will be captured from the customer's account.
	///   - charges: Charges that were created by this PaymentIntent, if any.
	///   - client_secret: The client secret of this PaymentIntent. Used for client-side retrieval using a publishable key.   The client secret can be used to complete a payment from your frontend. It should not be stored, logged, embedded in URLs, or exposed to anyone other than the customer. Make sure that you have TLS enabled on any page that includes the client secret.  Refer to our docs to [accept a payment](https://stripe.com/docs/payments/accept-a-payment?integration=elements) and learn about how `client_secret` should be handled.
	///   - confirmation_method: 
	///   - created: Time at which the object was created. Measured in seconds since the Unix epoch.
	///   - currency: Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
	///   - customer: ID of the Customer this PaymentIntent belongs to, if one exists.  Payment methods attached to other Customers cannot be used with this PaymentIntent.  If present in combination with [setup_future_usage](https://stripe.com/docs/api#payment_intent_object-setup_future_usage), this PaymentIntent's payment method will be attached to the Customer after the PaymentIntent has been confirmed and any required actions from the user are complete.
	///   - description: An arbitrary string attached to the object. Often useful for displaying to users.
	///   - id: Unique identifier for the object.
	///   - invoice: ID of the invoice that created this PaymentIntent, if it exists.
	///   - last_payment_error: The payment error encountered in the previous PaymentIntent confirmation. It will be cleared if the PaymentIntent is later updated for any reason.
	///   - livemode: Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
	///   - metadata: Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. For more information, see the [documentation](https://stripe.com/docs/payments/payment-intents/creating-payment-intents#storing-information-in-metadata).
	///   - next_action: If present, this property tells you what actions you need to take in order for your customer to fulfill a payment using the provided source.
	///   - object: String representing the object's type. Objects of the same type share the same value.
	///   - on_behalf_of: The account (if any) for which the funds of the PaymentIntent are intended. See the PaymentIntents [use case for connected accounts](https://stripe.com/docs/payments/connected-accounts) for details.
	///   - payment_method: ID of the payment method used in this PaymentIntent.
	///   - payment_method_options: Payment-method-specific configuration for this PaymentIntent.
	///   - payment_method_types: The list of payment method types (e.g. card) that this PaymentIntent is allowed to use.
	///   - receipt_email: Email address that the receipt for the resulting payment will be sent to. If `receipt_email` is specified for a payment in live mode, a receipt will be sent regardless of your [email settings](https://dashboard.stripe.com/account/emails).
	///   - review: ID of the review associated with this PaymentIntent, if any.
	///   - setup_future_usage: Indicates that you intend to make future payments with this PaymentIntent's payment method.  Providing this parameter will [attach the payment method](https://stripe.com/docs/payments/save-during-payment) to the PaymentIntent's Customer, if present, after the PaymentIntent is confirmed and any required actions from the user are complete. If no Customer was provided, the payment method can still be [attached](https://stripe.com/docs/api/payment_methods/attach) to a Customer after the transaction completes.  When processing card payments, Stripe also uses `setup_future_usage` to dynamically optimize your payment flow and comply with regional legislation and network rules, such as [SCA](https://stripe.com/docs/strong-customer-authentication).
	///   - shipping: Shipping information for this PaymentIntent.
	///   - statement_descriptor: For non-card charges, you can use this value as the complete description that appears on your customers’ statements. Must contain at least one letter, maximum 22 characters.
	///   - statement_descriptor_suffix: Provides information about a card payment that customers see on their statements. Concatenated with the prefix (shortened descriptor) or statement descriptor that’s set on the account to form the complete statement descriptor. Maximum 22 characters for the concatenated descriptor.
	///   - status: Status of this PaymentIntent, one of `requires_payment_method`, `requires_confirmation`, `requires_action`, `processing`, `requires_capture`, `canceled`, or `succeeded`. Read more about each PaymentIntent [status](https://stripe.com/docs/payments/intents#intent-statuses).
	///   - transfer_data: The data with which to automatically create a Transfer when the payment is finalized. See the PaymentIntents [use case for connected accounts](https://stripe.com/docs/payments/connected-accounts) for details.
	///   - transfer_group: A string that identifies the resulting payment as part of a group. See the PaymentIntents [use case for connected accounts](https://stripe.com/docs/payments/connected-accounts) for details.
//	public init(amount: Int, capture_method: CaptureMethodValues, confirmation_method: ConfirmationMethodValues, created: Timestamp, currency: String, id: String, livemode: Bool, object: ObjectValues, payment_method_types: [String], status: StatusValues, amount_capturable: Int? = nil, amount_received: Int? = nil, application: String? = nil, application_fee_amount: Int? = nil, canceled_at: Timestamp? = nil, cancellation_reason: CancellationReasonValues? = nil, charges: PaymentFlowsPaymentIntentResourceChargeList? = nil, client_secret: String? = nil, customer: String? = nil, description: String? = nil, invoice: String? = nil, last_payment_error: ApiErrors? = nil, metadata: Empty? = nil, next_action: PaymentIntentNextAction? = nil, on_behalf_of: String? = nil, payment_method: String? = nil, payment_method_options: PaymentIntentPaymentMethodOptions? = nil, receipt_email: String? = nil, review: String? = nil, setup_future_usage: SetupFutureUsageValues? = nil, shipping: Shipping? = nil, statement_descriptor: String? = nil, statement_descriptor_suffix: String? = nil, transfer_data: TransferData? = nil, transfer_group: String? = nil) {
//		self.amount = amount
//		self.capture_method = capture_method
//		self.confirmation_method = confirmation_method
//		self.created = created
//		self.currency = currency
//		self.id = id
//		self.livemode = livemode
//		self.object = object
//		self.payment_method_types = payment_method_types
//		self.status = status
//		self.amount_capturable = amount_capturable
//		self.amount_received = amount_received
//		self.application = application
//		self.application_fee_amount = application_fee_amount
//		self.canceled_at = canceled_at
//		self.cancellation_reason = cancellation_reason
//		self.charges = charges
//		self.client_secret = client_secret
//		self.customer = customer
//		self.description = description
//		self.invoice = invoice
//		self.last_payment_error = last_payment_error
//		self.metadata = metadata
//		self.next_action = next_action
//		self.on_behalf_of = on_behalf_of
//		self.payment_method = payment_method
//		self.payment_method_options = payment_method_options
//		self.receipt_email = receipt_email
//		self.review = review
//		self.setup_future_usage = setup_future_usage
//		self.shipping = shipping
//		self.statement_descriptor = statement_descriptor
//		self.statement_descriptor_suffix = statement_descriptor_suffix
//		self.transfer_data = transfer_data
//		self.transfer_group = transfer_group
//	}


//	/// Charges that were created by this PaymentIntent, if any.
//	public final class PaymentFlowsPaymentIntentResourceChargeList: Codable {
//		/// This list only contains the latest charge, even if there were previously multiple unsuccessful charges. To view all previous charges for a PaymentIntent, you can filter the charges list using the `payment_intent` [parameter](https://stripe.com/docs/api/charges/list#list_charges-payment_intent).
//		public var data: [Charge]
//		/// True if this list has another page of items after this one that can be fetched.
//		public var has_more: Bool
//		/// String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
//		public var object: ObjectValues
//		/// The URL where this list can be accessed.
//		public var url: String
//
//		/// Charges that were created by this PaymentIntent, if any.
//		/// - Parameters:
//		///   - data: This list only contains the latest charge, even if there were previously multiple unsuccessful charges. To view all previous charges for a PaymentIntent, you can filter the charges list using the `payment_intent` [parameter](https://stripe.com/docs/api/charges/list#list_charges-payment_intent).
//		///   - has_more: True if this list has another page of items after this one that can be fetched.
//		///   - object: String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
//		///   - url: The URL where this list can be accessed.
//		public init(data: [Charge], has_more: Bool, object: ObjectValues, url: String) {
//			self.data = data
//			self.has_more = has_more
//			self.object = object
//			self.url = url
//		}
//
//		public enum ObjectValues: String, Codable {
//			case list = "list"
//		}
//	}


	public enum CancellationReasonValues: String, Codable {
		case abandoned = "abandoned"
		case automatic = "automatic"
		case duplicate = "duplicate"
		case failedInvoice = "failed_invoice"
		case fraudulent = "fraudulent"
		case requestedByCustomer = "requested_by_customer"
		case voidInvoice = "void_invoice"
	}

	public enum CaptureMethodValues: String, Codable {
		case automatic = "automatic"
		case manual = "manual"
	}

	public enum ConfirmationMethodValues: String, Codable {
		case automatic = "automatic"
		case manual = "manual"
	}

	public enum ObjectValues: String, Codable {
		case paymentIntent = "payment_intent"
	}

	public enum SetupFutureUsageValues: String, Codable {
		case offSession = "off_session"
		case onSession = "on_session"
	}

	public enum StatusValues: String, Codable {
		case canceled = "canceled"
		case processing = "processing"
		case requiresAction = "requires_action"
		case requiresCapture = "requires_capture"
		case requiresConfirmation = "requires_confirmation"
		case requiresPaymentMethod = "requires_payment_method"
		case succeeded = "succeeded"
	}
}


///// Prices define the unit cost, currency, and (optional) billing cycle for both recurring and one-time purchases of products. [Products](https://stripe.com/docs/api#products) help you track inventory or provisioning, and prices help you track payment terms. Different physical goods or levels of service should be represented by products, and pricing options should be represented by prices. This approach lets you change prices without having to change your provisioning scheme.  For example, you might have a single "gold" product that has prices for $10/month, $100/year, and €9 once.  Related guides: [Set up a subscription](https://stripe.com/docs/billing/subscriptions/set-up-subscription), [create an invoice](https://stripe.com/docs/billing/invoices/create), and more about [products and prices](https://stripe.com/docs/billing/prices-guide).
//public final class Price: Codable {
//	/// Whether the price can be used for new purchases.
//	public var active: Bool
//	/// Describes how to compute the price per period. Either `per_unit` or `tiered`. `per_unit` indicates that the fixed amount (specified in `unit_amount` or `unit_amount_decimal`) will be charged per unit in `quantity` (for prices with `usage_type=licensed`), or per unit of total usage (for prices with `usage_type=metered`). `tiered` indicates that the unit pricing will be computed using a tiering strategy as defined using the `tiers` and `tiers_mode` attributes.
//	public var billing_scheme: BillingSchemeValues
//	/// Time at which the object was created. Measured in seconds since the Unix epoch.
//	public var created: Timestamp
//	/// Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
//	public var currency: String
//	/// Unique identifier for the object.
//	public var id: String
//	/// Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
//	public var livemode: Bool
//	/// A lookup key used to retrieve prices dynamically from a static string.
//	public var lookup_key: String?
//	/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
//	public var metadata: Empty
//	/// A brief description of the plan, hidden from customers.
//	public var nickname: String?
//	/// String representing the object's type. Objects of the same type share the same value.
//	public var object: ObjectValues
//	/// The ID of the product this price is associated with.
//	public var product: String
//	/// The recurring components of a price such as `interval` and `usage_type`.
//	public var recurring: Recurring?
//	/// Each element represents a pricing tier. This parameter requires `billing_scheme` to be set to `tiered`. See also the documentation for `billing_scheme`.
//	public var tiers: [PriceTier]?
//	/// Defines if the tiering price should be `graduated` or `volume` based. In `volume`-based tiering, the maximum quantity within a period determines the per unit price. In `graduated` tiering, pricing can change as the quantity grows.
//	public var tiers_mode: TiersModeValues?
//	/// Apply a transformation to the reported usage or set quantity before computing the amount billed. Cannot be combined with `tiers`.
//	public var transform_quantity: TransformQuantity?
//	/// One of `one_time` or `recurring` depending on whether the price is for a one-time purchase or a recurring (subscription) purchase.
//	public var type: TypeValues
//	/// The unit amount in %s to be charged, represented as a whole integer if possible.
//	public var unit_amount: Int?
//	/// The unit amount in %s to be charged, represented as a decimal string with at most 12 decimal places.
//	public var unit_amount_decimal: StringNumber?
//
//	/// Prices define the unit cost, currency, and (optional) billing cycle for both recurring and one-time purchases of products. [Products](https://stripe.com/docs/api#products) help you track inventory or provisioning, and prices help you track payment terms. Different physical goods or levels of service should be represented by products, and pricing options should be represented by prices. This approach lets you change prices without having to change your provisioning scheme.  For example, you might have a single "gold" product that has prices for $10/month, $100/year, and €9 once.  Related guides: [Set up a subscription](https://stripe.com/docs/billing/subscriptions/set-up-subscription), [create an invoice](https://stripe.com/docs/billing/invoices/create), and more about [products and prices](https://stripe.com/docs/billing/prices-guide).
//	/// - Parameters:
//	///   - active: Whether the price can be used for new purchases.
//	///   - billing_scheme: Describes how to compute the price per period. Either `per_unit` or `tiered`. `per_unit` indicates that the fixed amount (specified in `unit_amount` or `unit_amount_decimal`) will be charged per unit in `quantity` (for prices with `usage_type=licensed`), or per unit of total usage (for prices with `usage_type=metered`). `tiered` indicates that the unit pricing will be computed using a tiering strategy as defined using the `tiers` and `tiers_mode` attributes.
//	///   - created: Time at which the object was created. Measured in seconds since the Unix epoch.
//	///   - currency: Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
//	///   - id: Unique identifier for the object.
//	///   - livemode: Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
//	///   - lookup_key: A lookup key used to retrieve prices dynamically from a static string.
//	///   - metadata: Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
//	///   - nickname: A brief description of the plan, hidden from customers.
//	///   - object: String representing the object's type. Objects of the same type share the same value.
//	///   - product: The ID of the product this price is associated with.
//	///   - recurring: The recurring components of a price such as `interval` and `usage_type`.
//	///   - tiers: Each element represents a pricing tier. This parameter requires `billing_scheme` to be set to `tiered`. See also the documentation for `billing_scheme`.
//	///   - tiers_mode: Defines if the tiering price should be `graduated` or `volume` based. In `volume`-based tiering, the maximum quantity within a period determines the per unit price. In `graduated` tiering, pricing can change as the quantity grows.
//	///   - transform_quantity: Apply a transformation to the reported usage or set quantity before computing the amount billed. Cannot be combined with `tiers`.
//	///   - type: One of `one_time` or `recurring` depending on whether the price is for a one-time purchase or a recurring (subscription) purchase.
//	///   - unit_amount: The unit amount in %s to be charged, represented as a whole integer if possible.
//	///   - unit_amount_decimal: The unit amount in %s to be charged, represented as a decimal string with at most 12 decimal places.
//	public init(active: Bool, billing_scheme: BillingSchemeValues, created: Timestamp, currency: String, id: String, livemode: Bool, metadata: Empty, object: ObjectValues, product: String, type: TypeValues, lookup_key: String? = nil, nickname: String? = nil, recurring: Recurring? = nil, tiers: [PriceTier]? = nil, tiers_mode: TiersModeValues? = nil, transform_quantity: TransformQuantity? = nil, unit_amount: Int? = nil, unit_amount_decimal: StringNumber? = nil) {
//		self.active = active
//		self.billing_scheme = billing_scheme
//		self.created = created
//		self.currency = currency
//		self.id = id
//		self.livemode = livemode
//		self.metadata = metadata
//		self.object = object
//		self.product = product
//		self.type = type
//		self.lookup_key = lookup_key
//		self.nickname = nickname
//		self.recurring = recurring
//		self.tiers = tiers
//		self.tiers_mode = tiers_mode
//		self.transform_quantity = transform_quantity
//		self.unit_amount = unit_amount
//		self.unit_amount_decimal = unit_amount_decimal
//	}
//
//	public enum BillingSchemeValues: String, Codable {
//		case perUnit = "per_unit"
//		case tiered = "tiered"
//	}
//
//	public enum ObjectValues: String, Codable {
//		case price = "price"
//	}
//
//	public enum TiersModeValues: String, Codable {
//		case graduated = "graduated"
//		case volume = "volume"
//	}
//
//	public enum TypeValues: String, Codable {
//		case oneTime = "one_time"
//		case recurring = "recurring"
//	}
//}
//
//public final class PriceTier: Codable {
//	/// Price for the entire tier.
//	public var flat_amount: Int?
//	/// Same as `flat_amount`, but contains a decimal value with at most 12 decimal places.
//	public var flat_amount_decimal: StringNumber?
//	/// Per unit price for units relevant to the tier.
//	public var unit_amount: Int?
//	/// Same as `unit_amount`, but contains a decimal value with at most 12 decimal places.
//	public var unit_amount_decimal: StringNumber?
//	/// Up to and including to this quantity will be contained in the tier.
//	public var up_to: Int?
//
//	public init(flat_amount: Int? = nil, flat_amount_decimal: StringNumber? = nil, unit_amount: Int? = nil, unit_amount_decimal: StringNumber? = nil, up_to: Int? = nil) {
//		self.flat_amount = flat_amount
//		self.flat_amount_decimal = flat_amount_decimal
//		self.unit_amount = unit_amount
//		self.unit_amount_decimal = unit_amount_decimal
//		self.up_to = up_to
//	}
//}

/// Subscriptions allow you to charge a customer on a recurring basis.  Related guide: [Creating Subscriptions](https://stripe.com/docs/billing/subscriptions/creating).
public final class Subscription: Codable {
	/// A non-negative decimal between 0 and 100, with at most two decimal places. This represents the percentage of the subscription invoice subtotal that will be transferred to the application owner's Stripe account.
	public var application_fee_percent: StringNumber?
	/// Determines the date of the first full invoice, and, for plans with `month` or `year` intervals, the day of the month for subsequent invoices.
	public var billing_cycle_anchor: Timestamp
	/// Define thresholds at which an invoice will be sent, and the subscription advanced to a new billing period
//	public var billing_thresholds: SubscriptionBillingThresholds?
	/// A date in the future at which the subscription will automatically get canceled
	public var cancel_at: Timestamp?
	/// If the subscription has been canceled with the `at_period_end` flag set to `true`, `cancel_at_period_end` on the subscription will be true. You can use this attribute to determine whether a subscription that has a status of active is scheduled to be canceled at the end of the current period.
	public var cancel_at_period_end: Bool
	/// If the subscription has been canceled, the date of that cancellation. If the subscription was canceled with `cancel_at_period_end`, `canceled_at` will reflect the time of the most recent update request, not the end of the subscription period when the subscription is automatically moved to a canceled state.
	public var canceled_at: Timestamp?
	/// Either `charge_automatically`, or `send_invoice`. When charging automatically, Stripe will attempt to pay this subscription at the end of the cycle using the default source attached to the customer. When sending an invoice, Stripe will email your customer an invoice with payment instructions.
	public var collection_method: CollectionMethodValues?
	/// Time at which the object was created. Measured in seconds since the Unix epoch.
	public var created: Timestamp
	/// End of the current period that the subscription has been invoiced for. At the end of this period, a new invoice will be created.
	public var current_period_end: Timestamp
	/// Start of the current period that the subscription has been invoiced for.
	public var current_period_start: Timestamp
	/// ID of the customer who owns the subscription.
	public var customer: String
	/// Number of days a customer has to pay invoices generated by this subscription. This value will be `null` for subscriptions where `collection_method=charge_automatically`.
	public var days_until_due: Int?
	/// ID of the default payment method for the subscription. It must belong to the customer associated with the subscription. This takes precedence over `default_source`. If neither are set, invoices will use the customer's [invoice_settings.default_payment_method](https://stripe.com/docs/api/customers/object#customer_object-invoice_settings-default_payment_method) or [default_source](https://stripe.com/docs/api/customers/object#customer_object-default_source).
	public var default_payment_method: String?
	/// ID of the default payment source for the subscription. It must belong to the customer associated with the subscription and be in a chargeable state. If `default_payment_method` is also set, `default_payment_method` will take precedence. If neither are set, invoices will use the customer's [invoice_settings.default_payment_method](https://stripe.com/docs/api/customers/object#customer_object-invoice_settings-default_payment_method) or [default_source](https://stripe.com/docs/api/customers/object#customer_object-default_source).
	public var default_source: String?
	/// The tax rates that will apply to any subscription item that does not have `tax_rates` set. Invoices created will have their `default_tax_rates` populated from the subscription.
//	public var default_tax_rates: [TaxRate]?
	/// Describes the current discount applied to this subscription, if there is one. When billing, a discount applied to a subscription overrides a discount applied on a customer-wide basis.
//	public var discount: Discount?
	/// If the subscription has ended, the date the subscription ended.
	public var ended_at: Timestamp?
	/// Unique identifier for the object.
	public var id: String
	/// List of subscription items, each with an attached price.
//	public var items: SubscriptionItemList
	/// The most recent invoice this subscription has generated.
	public var latest_invoice: String?
	/// Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
	public var livemode: Bool
	/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
	public var metadata: Empty
	/// Specifies the approximate timestamp on which any pending invoice items will be billed according to the schedule provided at `pending_invoice_item_interval`.
	public var next_pending_invoice_item_invoice: Timestamp?
	/// String representing the object's type. Objects of the same type share the same value.
	public var object: ObjectValues
	/// If specified, payment collection for this subscription will be paused.
//	public var pause_collection: SubscriptionsResourcePauseCollection?
	/// Specifies an interval for how often to bill for any pending invoice items. It is analogous to calling [Create an invoice](https://stripe.com/docs/api#create_invoice) for the given subscription at the specified interval.
//	public var pending_invoice_item_interval: SubscriptionPendingInvoiceItemInterval?
	/// You can use this [SetupIntent](https://stripe.com/docs/api/setup_intents) to collect user authentication when creating a subscription without immediate payment or updating a subscription's payment method, allowing you to optimize for off-session payments. Learn more in the [SCA Migration Guide](https://stripe.com/docs/billing/migration/strong-customer-authentication#scenario-2).
	public var pending_setup_intent: String?
	/// If specified, [pending updates](https://stripe.com/docs/billing/subscriptions/pending-updates) that will be applied to the subscription once the `latest_invoice` has been paid.
//	public var pending_update: SubscriptionsResourcePendingUpdate?
	/// The schedule attached to the subscription
	public var schedule: String?
	/// Date when the subscription was first created. The date might differ from the `created` date due to backdating.
	public var start_date: Timestamp
	/// Possible values are `incomplete`, `incomplete_expired`, `trialing`, `active`, `past_due`, `canceled`, or `unpaid`.   For `collection_method=charge_automatically` a subscription moves into `incomplete` if the initial payment attempt fails. A subscription in this state can only have metadata and default_source updated. Once the first invoice is paid, the subscription moves into an `active` state. If the first invoice is not paid within 23 hours, the subscription transitions to `incomplete_expired`. This is a terminal state, the open invoice will be voided and no further invoices will be generated.   A subscription that is currently in a trial period is `trialing` and moves to `active` when the trial period is over.   If subscription `collection_method=charge_automatically` it becomes `past_due` when payment to renew it fails and `canceled` or `unpaid` (depending on your subscriptions settings) when Stripe has exhausted all payment retry attempts.   If subscription `collection_method=send_invoice` it becomes `past_due` when its invoice is not paid by the due date, and `canceled` or `unpaid` if it is still not paid by an additional deadline after that. Note that when a subscription has a status of `unpaid`, no subsequent invoices will be attempted (invoices will be created, but then immediately automatically closed). After receiving updated payment information from a customer, you may choose to reopen and pay their closed invoices.
	public var status: StatusValues
	/// The account (if any) the subscription's payments will be attributed to for tax reporting, and where funds from each payment will be transferred to for each of the subscription's invoices.
//	public var transfer_data: SubscriptionTransferData?
	/// If the subscription has a trial, the end of that trial.
	public var trial_end: Timestamp?
	/// If the subscription has a trial, the beginning of that trial.
	public var trial_start: Timestamp?

	/// Subscriptions allow you to charge a customer on a recurring basis.  Related guide: [Creating Subscriptions](https://stripe.com/docs/billing/subscriptions/creating).
	/// - Parameters:
	///   - application_fee_percent: A non-negative decimal between 0 and 100, with at most two decimal places. This represents the percentage of the subscription invoice subtotal that will be transferred to the application owner's Stripe account.
	///   - billing_cycle_anchor: Determines the date of the first full invoice, and, for plans with `month` or `year` intervals, the day of the month for subsequent invoices.
	///   - billing_thresholds: Define thresholds at which an invoice will be sent, and the subscription advanced to a new billing period
	///   - cancel_at: A date in the future at which the subscription will automatically get canceled
	///   - cancel_at_period_end: If the subscription has been canceled with the `at_period_end` flag set to `true`, `cancel_at_period_end` on the subscription will be true. You can use this attribute to determine whether a subscription that has a status of active is scheduled to be canceled at the end of the current period.
	///   - canceled_at: If the subscription has been canceled, the date of that cancellation. If the subscription was canceled with `cancel_at_period_end`, `canceled_at` will reflect the time of the most recent update request, not the end of the subscription period when the subscription is automatically moved to a canceled state.
	///   - collection_method: Either `charge_automatically`, or `send_invoice`. When charging automatically, Stripe will attempt to pay this subscription at the end of the cycle using the default source attached to the customer. When sending an invoice, Stripe will email your customer an invoice with payment instructions.
	///   - created: Time at which the object was created. Measured in seconds since the Unix epoch.
	///   - current_period_end: End of the current period that the subscription has been invoiced for. At the end of this period, a new invoice will be created.
	///   - current_period_start: Start of the current period that the subscription has been invoiced for.
	///   - customer: ID of the customer who owns the subscription.
	///   - days_until_due: Number of days a customer has to pay invoices generated by this subscription. This value will be `null` for subscriptions where `collection_method=charge_automatically`.
	///   - default_payment_method: ID of the default payment method for the subscription. It must belong to the customer associated with the subscription. This takes precedence over `default_source`. If neither are set, invoices will use the customer's [invoice_settings.default_payment_method](https://stripe.com/docs/api/customers/object#customer_object-invoice_settings-default_payment_method) or [default_source](https://stripe.com/docs/api/customers/object#customer_object-default_source).
	///   - default_source: ID of the default payment source for the subscription. It must belong to the customer associated with the subscription and be in a chargeable state. If `default_payment_method` is also set, `default_payment_method` will take precedence. If neither are set, invoices will use the customer's [invoice_settings.default_payment_method](https://stripe.com/docs/api/customers/object#customer_object-invoice_settings-default_payment_method) or [default_source](https://stripe.com/docs/api/customers/object#customer_object-default_source).
	///   - default_tax_rates: The tax rates that will apply to any subscription item that does not have `tax_rates` set. Invoices created will have their `default_tax_rates` populated from the subscription.
	///   - discount: Describes the current discount applied to this subscription, if there is one. When billing, a discount applied to a subscription overrides a discount applied on a customer-wide basis.
	///   - ended_at: If the subscription has ended, the date the subscription ended.
	///   - id: Unique identifier for the object.
	///   - items: List of subscription items, each with an attached price.
	///   - latest_invoice: The most recent invoice this subscription has generated.
	///   - livemode: Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
	///   - metadata: Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
	///   - next_pending_invoice_item_invoice: Specifies the approximate timestamp on which any pending invoice items will be billed according to the schedule provided at `pending_invoice_item_interval`.
	///   - object: String representing the object's type. Objects of the same type share the same value.
	///   - pause_collection: If specified, payment collection for this subscription will be paused.
	///   - pending_invoice_item_interval: Specifies an interval for how often to bill for any pending invoice items. It is analogous to calling [Create an invoice](https://stripe.com/docs/api#create_invoice) for the given subscription at the specified interval.
	///   - pending_setup_intent: You can use this [SetupIntent](https://stripe.com/docs/api/setup_intents) to collect user authentication when creating a subscription without immediate payment or updating a subscription's payment method, allowing you to optimize for off-session payments. Learn more in the [SCA Migration Guide](https://stripe.com/docs/billing/migration/strong-customer-authentication#scenario-2).
	///   - pending_update: If specified, [pending updates](https://stripe.com/docs/billing/subscriptions/pending-updates) that will be applied to the subscription once the `latest_invoice` has been paid.
	///   - schedule: The schedule attached to the subscription
	///   - start_date: Date when the subscription was first created. The date might differ from the `created` date due to backdating.
	///   - status: Possible values are `incomplete`, `incomplete_expired`, `trialing`, `active`, `past_due`, `canceled`, or `unpaid`.   For `collection_method=charge_automatically` a subscription moves into `incomplete` if the initial payment attempt fails. A subscription in this state can only have metadata and default_source updated. Once the first invoice is paid, the subscription moves into an `active` state. If the first invoice is not paid within 23 hours, the subscription transitions to `incomplete_expired`. This is a terminal state, the open invoice will be voided and no further invoices will be generated.   A subscription that is currently in a trial period is `trialing` and moves to `active` when the trial period is over.   If subscription `collection_method=charge_automatically` it becomes `past_due` when payment to renew it fails and `canceled` or `unpaid` (depending on your subscriptions settings) when Stripe has exhausted all payment retry attempts.   If subscription `collection_method=send_invoice` it becomes `past_due` when its invoice is not paid by the due date, and `canceled` or `unpaid` if it is still not paid by an additional deadline after that. Note that when a subscription has a status of `unpaid`, no subsequent invoices will be attempted (invoices will be created, but then immediately automatically closed). After receiving updated payment information from a customer, you may choose to reopen and pay their closed invoices.
	///   - transfer_data: The account (if any) the subscription's payments will be attributed to for tax reporting, and where funds from each payment will be transferred to for each of the subscription's invoices.
	///   - trial_end: If the subscription has a trial, the end of that trial.
	///   - trial_start: If the subscription has a trial, the beginning of that trial.
//	public init(billing_cycle_anchor: Timestamp, cancel_at_period_end: Bool, created: Timestamp, current_period_end: Timestamp, current_period_start: Timestamp, customer: String, id: String, items: SubscriptionItemList, livemode: Bool, metadata: Empty, object: ObjectValues, start_date: Timestamp, status: StatusValues, application_fee_percent: StringNumber? = nil, billing_thresholds: SubscriptionBillingThresholds? = nil, cancel_at: Timestamp? = nil, canceled_at: Timestamp? = nil, collection_method: CollectionMethodValues? = nil, days_until_due: Int? = nil, default_payment_method: String? = nil, default_source: String? = nil, default_tax_rates: [TaxRate]? = nil, discount: Discount? = nil, ended_at: Timestamp? = nil, latest_invoice: String? = nil, next_pending_invoice_item_invoice: Timestamp? = nil, pause_collection: SubscriptionsResourcePauseCollection? = nil, pending_invoice_item_interval: SubscriptionPendingInvoiceItemInterval? = nil, pending_setup_intent: String? = nil, pending_update: SubscriptionsResourcePendingUpdate? = nil, schedule: String? = nil,  trial_end: Timestamp? = nil, trial_start: Timestamp? = nil) {
//		self.billing_cycle_anchor = billing_cycle_anchor
//		self.cancel_at_period_end = cancel_at_period_end
//		self.created = created
//		self.current_period_end = current_period_end
//		self.current_period_start = current_period_start
//		self.customer = customer
//		self.id = id
//		self.items = items
//		self.livemode = livemode
//		self.metadata = metadata
//		self.object = object
//		self.start_date = start_date
//		self.status = status
//		self.application_fee_percent = application_fee_percent
////		self.billing_thresholds = billing_thresholds
//		self.cancel_at = cancel_at
//		self.canceled_at = canceled_at
//		self.collection_method = collection_method
//		self.days_until_due = days_until_due
//		self.default_payment_method = default_payment_method
//		self.default_source = default_source
////		self.default_tax_rates = default_tax_rates
////		self.discount = discount
//		self.ended_at = ended_at
//		self.latest_invoice = latest_invoice
//		self.next_pending_invoice_item_invoice = next_pending_invoice_item_invoice
////		self.pause_collection = pause_collection
////		self.pending_invoice_item_interval = pending_invoice_item_interval
//		self.pending_setup_intent = pending_setup_intent
////		self.pending_update = pending_update
//		self.schedule = schedule
////		self.transfer_data = transfer_data
//		self.trial_end = trial_end
//		self.trial_start = trial_start
//	}


//	/// List of subscription items, each with an attached price.
//	public final class SubscriptionItemList: Codable {
//		/// Details about each object.
//		public var data: [SubscriptionItem]
//		/// True if this list has another page of items after this one that can be fetched.
//		public var has_more: Bool
//		/// String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
//		public var object: ObjectValues
//		/// The URL where this list can be accessed.
//		public var url: String
//
//		/// List of subscription items, each with an attached price.
//		/// - Parameters:
//		///   - data: Details about each object.
//		///   - has_more: True if this list has another page of items after this one that can be fetched.
//		///   - object: String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
//		///   - url: The URL where this list can be accessed.
//		public init(data: [SubscriptionItem], has_more: Bool, object: ObjectValues, url: String) {
//			self.data = data
//			self.has_more = has_more
//			self.object = object
//			self.url = url
//		}
//
//		public enum ObjectValues: String, Codable {
//			case list = "list"
//		}
//	}


	public enum CollectionMethodValues: String, Codable {
		case chargeAutomatically = "charge_automatically"
		case sendInvoice = "send_invoice"
	}

	public enum ObjectValues: String, Codable {
		case subscription = "subscription"
	}

	public enum StatusValues: String, Codable {
		case active = "active"
		case canceled = "canceled"
		case incomplete = "incomplete"
		case incompleteExpired = "incomplete_expired"
		case pastDue = "past_due"
		case trialing = "trialing"
		case unpaid = "unpaid"
	}
}

public final class SubscriptionBillingThresholds: Codable {
	/// Monetary threshold that triggers the subscription to create an invoice
	public var amount_gte: Int?
	/// Indicates if the `billing_cycle_anchor` should be reset when a threshold is reached. If true, `billing_cycle_anchor` will be updated to the date/time the threshold was last reached; otherwise, the value will remain unchanged. This value may not be `true` if the subscription contains items with plans that have `aggregate_usage=last_ever`.
	public var reset_billing_cycle_anchor: Bool?

	public init(amount_gte: Int? = nil, reset_billing_cycle_anchor: Bool? = nil) {
		self.amount_gte = amount_gte
		self.reset_billing_cycle_anchor = reset_billing_cycle_anchor
	}
}

///// Subscription items allow you to create customer subscriptions with more than one plan, making it easy to represent complex billing relationships.
//public final class SubscriptionItem: Codable {
//	/// Define thresholds at which an invoice will be sent, and the related subscription advanced to a new billing period
//	public var billing_thresholds: SubscriptionItemBillingThresholds?
//	/// Time at which the object was created. Measured in seconds since the Unix epoch.
//	public var created: Int
//	/// Unique identifier for the object.
//	public var id: String
//	/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
//	public var metadata: Empty
//	/// String representing the object's type. Objects of the same type share the same value.
//	public var object: ObjectValues
//	public var price: Price
//	/// The [quantity](https://stripe.com/docs/subscriptions/quantities) of the plan to which the customer should be subscribed.
//	public var quantity: Int?
//	/// The `subscription` this `subscription_item` belongs to.
//	public var subscription: String
//	/// The tax rates which apply to this `subscription_item`. When set, the `default_tax_rates` on the subscription do not apply to this `subscription_item`.
//	public var tax_rates: [TaxRate]?
//
//	/// Subscription items allow you to create customer subscriptions with more than one plan, making it easy to represent complex billing relationships.
//	/// - Parameters:
//	///   - billing_thresholds: Define thresholds at which an invoice will be sent, and the related subscription advanced to a new billing period
//	///   - created: Time at which the object was created. Measured in seconds since the Unix epoch.
//	///   - id: Unique identifier for the object.
//	///   - metadata: Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
//	///   - object: String representing the object's type. Objects of the same type share the same value.
//	///   - price:
//	///   - quantity: The [quantity](https://stripe.com/docs/subscriptions/quantities) of the plan to which the customer should be subscribed.
//	///   - subscription: The `subscription` this `subscription_item` belongs to.
//	///   - tax_rates: The tax rates which apply to this `subscription_item`. When set, the `default_tax_rates` on the subscription do not apply to this `subscription_item`.
//	public init(created: Int, id: String, metadata: Empty, object: ObjectValues, price: Price, subscription: String, billing_thresholds: SubscriptionItemBillingThresholds? = nil, quantity: Int? = nil, tax_rates: [TaxRate]? = nil) {
//		self.created = created
//		self.id = id
//		self.metadata = metadata
//		self.object = object
//		self.price = price
//		self.subscription = subscription
//		self.billing_thresholds = billing_thresholds
//		self.quantity = quantity
//		self.tax_rates = tax_rates
//	}
//
//	public enum ObjectValues: String, Codable {
//		case subscriptionItem = "subscription_item"
//	}
//}
//
//
///// Tax rates can be applied to [invoices](https://stripe.com/docs/billing/invoices/tax-rates), [subscriptions](https://stripe.com/docs/billing/subscriptions/taxes) and [Checkout Sessions](https://stripe.com/docs/payments/checkout/set-up-a-subscription#tax-rates) to collect tax.  Related guide: [Tax Rates](https://stripe.com/docs/billing/taxes/tax-rates).
//public final class TaxRate: Codable {
//	/// Defaults to `true`. When set to `false`, this tax rate cannot be used with new applications or Checkout Sessions, but will still work for subscriptions and invoices that already have it set.
//	public var active: Bool
//	/// Two-letter country code ([ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)).
//	public var country: String?
//	/// Time at which the object was created. Measured in seconds since the Unix epoch.
//	public var created: Timestamp
//	/// An arbitrary string attached to the tax rate for your internal use only. It will not be visible to your customers.
//	public var description: String?
//	/// The display name of the tax rates as it will appear to your customer on their receipt email, PDF, and the hosted invoice page.
//	public var display_name: String
//	/// Unique identifier for the object.
//	public var id: String
//	/// This specifies if the tax rate is inclusive or exclusive.
//	public var inclusive: Bool
//	/// The jurisdiction for the tax rate. You can use this label field for tax reporting purposes. It also appears on your customer’s invoice.
//	public var jurisdiction: String?
//	/// Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
//	public var livemode: Bool
//	/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
//	public var metadata: Empty?
//	/// String representing the object's type. Objects of the same type share the same value.
//	public var object: ObjectValues
//	/// This represents the tax rate percent out of 100.
//	public var percentage: StringNumber
//	/// [ISO 3166-2 subdivision code](https://en.wikipedia.org/wiki/ISO_3166-2:US), without country prefix. For example, "NY" for New York, United States.
//	public var state: String?
//
//	/// Tax rates can be applied to [invoices](https://stripe.com/docs/billing/invoices/tax-rates), [subscriptions](https://stripe.com/docs/billing/subscriptions/taxes) and [Checkout Sessions](https://stripe.com/docs/payments/checkout/set-up-a-subscription#tax-rates) to collect tax.  Related guide: [Tax Rates](https://stripe.com/docs/billing/taxes/tax-rates).
//	/// - Parameters:
//	///   - active: Defaults to `true`. When set to `false`, this tax rate cannot be used with new applications or Checkout Sessions, but will still work for subscriptions and invoices that already have it set.
//	///   - country: Two-letter country code ([ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)).
//	///   - created: Time at which the object was created. Measured in seconds since the Unix epoch.
//	///   - description: An arbitrary string attached to the tax rate for your internal use only. It will not be visible to your customers.
//	///   - display_name: The display name of the tax rates as it will appear to your customer on their receipt email, PDF, and the hosted invoice page.
//	///   - id: Unique identifier for the object.
//	///   - inclusive: This specifies if the tax rate is inclusive or exclusive.
//	///   - jurisdiction: The jurisdiction for the tax rate. You can use this label field for tax reporting purposes. It also appears on your customer’s invoice.
//	///   - livemode: Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
//	///   - metadata: Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
//	///   - object: String representing the object's type. Objects of the same type share the same value.
//	///   - percentage: This represents the tax rate percent out of 100.
//	///   - state: [ISO 3166-2 subdivision code](https://en.wikipedia.org/wiki/ISO_3166-2:US), without country prefix. For example, "NY" for New York, United States.
//	public init(active: Bool, created: Timestamp, display_name: String, id: String, inclusive: Bool, livemode: Bool, object: ObjectValues, percentage: StringNumber, country: String? = nil, description: String? = nil, jurisdiction: String? = nil, metadata: Empty? = nil, state: String? = nil) {
//		self.active = active
//		self.created = created
//		self.display_name = display_name
//		self.id = id
//		self.inclusive = inclusive
//		self.livemode = livemode
//		self.object = object
//		self.percentage = percentage
//		self.country = country
//		self.description = description
//		self.jurisdiction = jurisdiction
//		self.metadata = metadata
//		self.state = state
//	}
//
//	public enum ObjectValues: String, Codable {
//		case taxRate = "tax_rate"
//	}
//}


/// A Reader represents a physical device for accepting payment details.  Related guide: [Connecting to a Reader](https://stripe.com/docs/terminal/readers/connecting).
public final class TerminalReader: Codable {
	/// The current software version of the reader.
	public var device_sw_version: String?
	/// Type of reader, one of `bbpos_chipper2x` or `verifone_P400`.
	public var device_type: DeviceTypeValues
	/// Unique identifier for the object.
	public var id: String
	/// The local IP address of the reader.
	public var ip_address: String?
	/// Custom label given to the reader for easier identification.
	public var label: String
	/// Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
	public var livemode: Bool
	/// The location identifier of the reader.
	public var location: String?
	/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
	public var metadata: Empty
	/// String representing the object's type. Objects of the same type share the same value.
	public var object: ObjectValues
	/// Serial number of the reader.
	public var serial_number: String
	/// The networking status of the reader.
	public var status: String?
	
	/// A Reader represents a physical device for accepting payment details.  Related guide: [Connecting to a Reader](https://stripe.com/docs/terminal/readers/connecting).
	/// - Parameters:
	///   - device_sw_version: The current software version of the reader.
	///   - device_type: Type of reader, one of `bbpos_chipper2x` or `verifone_P400`.
	///   - id: Unique identifier for the object.
	///   - ip_address: The local IP address of the reader.
	///   - label: Custom label given to the reader for easier identification.
	///   - livemode: Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
	///   - location: The location identifier of the reader.
	///   - metadata: Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
	///   - object: String representing the object's type. Objects of the same type share the same value.
	///   - serial_number: Serial number of the reader.
	///   - status: The networking status of the reader.
	public init(device_type: DeviceTypeValues, id: String, label: String, livemode: Bool, metadata: Empty, object: ObjectValues, serial_number: String, device_sw_version: String? = nil, ip_address: String? = nil, location: String? = nil, status: String? = nil) {
		self.device_type = device_type
		self.id = id
		self.label = label
		self.livemode = livemode
		self.metadata = metadata
		self.object = object
		self.serial_number = serial_number
		self.device_sw_version = device_sw_version
		self.ip_address = ip_address
		self.location = location
		self.status = status
	}
	
	public enum DeviceTypeValues: String, Codable {
		case bbposChipper2X = "bbpos_chipper2x"
		case verifoneP400 = "verifone_P400"
	}
	
	public enum ObjectValues: String, Codable {
		case terminalReader = "terminal.reader"
	}
}
