
/// You can list all invoices, or list the invoices for a specific customer. The invoices are returned sorted by creation date, with the most recently created invoices appearing first.
public struct GetInvoices: StripeAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = InvoicesList
	public typealias paramType = Params
	public struct Params {
		let collection_method: String
		let customer: String
		let ending_before: String
		let limit: Int
		let starting_after: String
		let status: String
		let subscription: String

		public init(collection_method: String, customer: String, ending_before: String, limit: Int, starting_after: String, status: String, subscription: String) {
			self.collection_method = collection_method
			self.customer = customer
			self.ending_before = ending_before
			self.limit = limit
			self.starting_after = starting_after
			self.status = status
			self.subscription = subscription
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/invoices?collection_method=\(inputs.collection_method.urlEncoded))&customer=\(inputs.customer.urlEncoded))&ending_before=\(inputs.ending_before.urlEncoded))&limit=\(inputs.limit.urlEncoded))&starting_after=\(inputs.starting_after.urlEncoded))&status=\(inputs.status.urlEncoded))&subscription=\(inputs.subscription.urlEncoded))"
	}
	public static var method: HTTPMethod { return .GET }

	public final class InvoicesList: Codable {
		public var data: [Invoice]
		/// True if this list has another page of items after this one that can be fetched.
		public var has_more: Bool
		/// String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
		public var object: ObjectValues
		/// The URL where this list can be accessed.
		public var url: String

		public init(data: [Invoice], has_more: Bool, object: ObjectValues, url: String) {
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

/// This endpoint creates a draft invoice for a given customer. The draft invoice created pulls in all pending invoice items on that customer, including prorations. The invoice remains a draft until you <a href="#finalize_invoice">finalize</a> the invoice, which allows you to <a href="#pay_invoice">pay</a> or <a href="#send_invoice">send</a> the invoice to your customers.
public struct PostInvoices: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = Invoice
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v1/invoices"
	}

	public final class FormInput: Codable {
		/// The account tax IDs associated with the invoice. Only editable when the invoice is a draft.
		public var account_tax_ids: MESSED_UP?
		/// A fee in %s that will be applied to the invoice and transferred to the application owner's Stripe account. The request must be made with an OAuth key or the Stripe-Account header in order to take an application fee. For more information, see the application fees [documentation](https://stripe.com/docs/billing/invoices/connect#collecting-fees).
		public var application_fee_amount: Int?
		/// Controls whether Stripe will perform [automatic collection](https://stripe.com/docs/billing/invoices/workflow/#auto_advance) of the invoice. When `false`, the invoice's state will not automatically advance without an explicit action.
		public var auto_advance: Bool?
		/// Either `charge_automatically`, or `send_invoice`. When charging automatically, Stripe will attempt to pay this invoice using the default source attached to the customer. When sending an invoice, Stripe will email this invoice to the customer with payment instructions. Defaults to `charge_automatically`.
		public var collection_method: CollectionMethodValues?
		/// A list of up to 4 custom fields to be displayed on the invoice.
		public var custom_fields: MESSED_UP?
		/// The ID of the customer who will be billed.
		public var customer: String
		/// The number of days from when the invoice is created until it is due. Valid only for invoices where `collection_method=send_invoice`.
		public var days_until_due: Int?
		/// ID of the default payment method for the invoice. It must belong to the customer associated with the invoice. If not set, defaults to the subscription's default payment method, if any, or to the default payment method in the customer's invoice settings.
		public var default_payment_method: String?
		/// ID of the default payment source for the invoice. It must belong to the customer associated with the invoice and be in a chargeable state. If not set, defaults to the subscription's default source, if any, or to the customer's default source.
		public var default_source: String?
		/// The tax rates that will apply to any line item that does not have `tax_rates` set.
		public var default_tax_rates: [String]?
		/// An arbitrary string attached to the object. Often useful for displaying to users. Referenced as 'memo' in the Dashboard.
		public var description: String?
		/// The coupons to redeem into discounts for the invoice. If not specified, inherits the discount from the invoice's customer. Pass an empty string to avoid inheriting any discounts.
		public var discounts: MESSED_UP?
		/// The date on which payment for this invoice is due. Valid only for invoices where `collection_method=send_invoice`.
		public var due_date: Timestamp?
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?
		/// Footer to be displayed on the invoice.
		public var footer: String?
		/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
		public var metadata: MESSED_UP?
		/// Extra information about a charge for the customer's credit card statement. It must contain at least one letter. If not specified and this invoice is part of a subscription, the default `statement_descriptor` will be set to the first subscription item's product's `statement_descriptor`.
		public var statement_descriptor: String?
		/// The ID of the subscription to invoice, if any. If not set, the created invoice will include all pending invoice items for the customer. If set, the created invoice will only include pending invoice items for that subscription and pending invoice items not associated with any subscription. The subscription's billing cycle and regular subscription events won't be affected.
		public var subscription: String?
		/// If specified, the funds from the invoice will be transferred to the destination and the ID of the resulting transfer will be found on the invoice's charge.
		public var transfer_data: TransferDataSpecs?

		public init(customer: String, account_tax_ids: MESSED_UP? = nil, application_fee_amount: Int? = nil, auto_advance: Bool? = nil, collection_method: CollectionMethodValues? = nil, custom_fields: MESSED_UP? = nil, days_until_due: Int? = nil, default_payment_method: String? = nil, default_source: String? = nil, default_tax_rates: [String]? = nil, description: String? = nil, discounts: MESSED_UP? = nil, due_date: Timestamp? = nil, expand: [String]? = nil, footer: String? = nil, metadata: MESSED_UP? = nil, statement_descriptor: String? = nil, subscription: String? = nil, transfer_data: TransferDataSpecs? = nil) {
			self.customer = customer
			self.account_tax_ids = account_tax_ids
			self.application_fee_amount = application_fee_amount
			self.auto_advance = auto_advance
			self.collection_method = collection_method
			self.custom_fields = custom_fields
			self.days_until_due = days_until_due
			self.default_payment_method = default_payment_method
			self.default_source = default_source
			self.default_tax_rates = default_tax_rates
			self.description = description
			self.discounts = discounts
			self.due_date = due_date
			self.expand = expand
			self.footer = footer
			self.metadata = metadata
			self.statement_descriptor = statement_descriptor
			self.subscription = subscription
			self.transfer_data = transfer_data
		}


		/// If specified, the funds from the invoice will be transferred to the destination and the ID of the resulting transfer will be found on the invoice's charge.
		public final class TransferDataSpecs: Codable {
			public var amount: Int?
			public var destination: String

			/// If specified, the funds from the invoice will be transferred to the destination and the ID of the resulting transfer will be found on the invoice's charge.
			/// - Parameters:
			///   - destination: 
			public init(destination: String, amount: Int? = nil) {
				self.destination = destination
				self.amount = amount
			}
		}


		public enum CollectionMethodValues: String, Codable {
			case chargeAutomatically = "charge_automatically"
			case sendInvoice = "send_invoice"
		}
	}

}

/// At any time, you can preview the upcoming invoice for a customer. This will show you all the charges that are pending, including subscription renewal charges, invoice item charges, etc. It will also show you any discounts that are applicable to the invoice.  Note that when you are viewing an upcoming invoice, you are simply viewing a preview – the invoice has not yet been created. As such, the upcoming invoice will not show up in invoice listing calls, and you cannot use the API to pay or edit the invoice. If you want to change the amount that your customer will be billed, you can add, remove, or update pending invoice items, or update the customer’s discount.  You can preview the effects of updating a subscription, including a preview of what proration will take place. To ensure that the actual proration is calculated exactly the same as the previewed proration, you should pass a <code>proration_date</code> parameter when doing the actual subscription update. The value passed in should be the same as the <code>subscription_proration_date</code> returned on the upcoming invoice resource. The recommended way to get only the prorations being previewed is to consider only proration line items where <code>period[start]</code> is equal to the <code>subscription_proration_date</code> on the upcoming invoice resource.
public struct GetInvoicesUpcoming: StripeAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = Invoice
	public typealias paramType = Params
	public struct Params {
		let coupon: String
		let customer: String
		let schedule: String
		let subscription: String
		let subscription_cancel_at_period_end: Bool
		let subscription_cancel_now: Bool
		let subscription_proration_behavior: String
		let subscription_proration_date: Timestamp
		let subscription_start_date: Timestamp
		let subscription_trial_from_plan: Bool

		public init(coupon: String, customer: String, schedule: String, subscription: String, subscription_cancel_at_period_end: Bool, subscription_cancel_now: Bool, subscription_proration_behavior: String, subscription_proration_date: Timestamp, subscription_start_date: Timestamp, subscription_trial_from_plan: Bool) {
			self.coupon = coupon
			self.customer = customer
			self.schedule = schedule
			self.subscription = subscription
			self.subscription_cancel_at_period_end = subscription_cancel_at_period_end
			self.subscription_cancel_now = subscription_cancel_now
			self.subscription_proration_behavior = subscription_proration_behavior
			self.subscription_proration_date = subscription_proration_date
			self.subscription_start_date = subscription_start_date
			self.subscription_trial_from_plan = subscription_trial_from_plan
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/invoices/upcoming?coupon=\(inputs.coupon.urlEncoded))&customer=\(inputs.customer.urlEncoded))&schedule=\(inputs.schedule.urlEncoded))&subscription=\(inputs.subscription.urlEncoded))&subscription_cancel_at_period_end=\(inputs.subscription_cancel_at_period_end.urlEncoded))&subscription_cancel_now=\(inputs.subscription_cancel_now.urlEncoded))&subscription_proration_behavior=\(inputs.subscription_proration_behavior.urlEncoded))&subscription_proration_date=\(inputs.subscription_proration_date.urlEncoded))&subscription_start_date=\(inputs.subscription_start_date.urlEncoded))&subscription_trial_from_plan=\(inputs.subscription_trial_from_plan.urlEncoded))"
	}
	public static var method: HTTPMethod { return .GET }

}

/// When retrieving an upcoming invoice, you’ll get a <strong>lines</strong> property containing the total count of line items and the first handful of those items. There is also a URL where you can retrieve the full (paginated) list of line items.
public struct GetInvoicesUpcomingLines: StripeAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = InvoiceLinesList
	public typealias paramType = Params
	public struct Params {
		let coupon: String
		let customer: String
		let ending_before: String
		let limit: Int
		let schedule: String
		let starting_after: String
		let subscription: String
		let subscription_cancel_at_period_end: Bool
		let subscription_cancel_now: Bool
		let subscription_proration_behavior: String
		let subscription_proration_date: Timestamp
		let subscription_start_date: Timestamp
		let subscription_trial_from_plan: Bool

		public init(coupon: String, customer: String, ending_before: String, limit: Int, schedule: String, starting_after: String, subscription: String, subscription_cancel_at_period_end: Bool, subscription_cancel_now: Bool, subscription_proration_behavior: String, subscription_proration_date: Timestamp, subscription_start_date: Timestamp, subscription_trial_from_plan: Bool) {
			self.coupon = coupon
			self.customer = customer
			self.ending_before = ending_before
			self.limit = limit
			self.schedule = schedule
			self.starting_after = starting_after
			self.subscription = subscription
			self.subscription_cancel_at_period_end = subscription_cancel_at_period_end
			self.subscription_cancel_now = subscription_cancel_now
			self.subscription_proration_behavior = subscription_proration_behavior
			self.subscription_proration_date = subscription_proration_date
			self.subscription_start_date = subscription_start_date
			self.subscription_trial_from_plan = subscription_trial_from_plan
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/invoices/upcoming/lines?coupon=\(inputs.coupon.urlEncoded))&customer=\(inputs.customer.urlEncoded))&ending_before=\(inputs.ending_before.urlEncoded))&limit=\(inputs.limit.urlEncoded))&schedule=\(inputs.schedule.urlEncoded))&starting_after=\(inputs.starting_after.urlEncoded))&subscription=\(inputs.subscription.urlEncoded))&subscription_cancel_at_period_end=\(inputs.subscription_cancel_at_period_end.urlEncoded))&subscription_cancel_now=\(inputs.subscription_cancel_now.urlEncoded))&subscription_proration_behavior=\(inputs.subscription_proration_behavior.urlEncoded))&subscription_proration_date=\(inputs.subscription_proration_date.urlEncoded))&subscription_start_date=\(inputs.subscription_start_date.urlEncoded))&subscription_trial_from_plan=\(inputs.subscription_trial_from_plan.urlEncoded))"
	}
	public static var method: HTTPMethod { return .GET }

	public final class InvoiceLinesList: Codable {
		/// Details about each object.
		public var data: [LineItem]
		/// True if this list has another page of items after this one that can be fetched.
		public var has_more: Bool
		/// String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
		public var object: ObjectValues
		/// The URL where this list can be accessed.
		public var url: String

		public init(data: [LineItem], has_more: Bool, object: ObjectValues, url: String) {
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

/// Retrieves the invoice with the given ID.
public struct GetInvoicesInvoice: StripeAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = Invoice
	public typealias paramType = Params
	public struct Params {
		let invoice: String

		public init(invoice: String) {
			self.invoice = invoice
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/invoices/\(inputs.invoice)"
	}
	public static var method: HTTPMethod { return .GET }

}

/// Draft invoices are fully editable. Once an invoice is <a href="/docs/billing/invoices/workflow#finalized">finalized</a>, monetary values, as well as <code>collection_method</code>, become uneditable.  If you would like to stop the Stripe Billing engine from automatically finalizing, reattempting payments on, sending reminders for, or <a href="/docs/billing/invoices/reconciliation">automatically reconciling</a> invoices, pass <code>auto_advance=false</code>.
public struct PostInvoicesInvoice: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = Invoice
	public typealias paramType = Params
	public struct Params {
		let invoice: String

		public init(invoice: String) {
			self.invoice = invoice
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/invoices/\(inputs.invoice)"
	}

	public final class FormInput: Codable {
		/// The account tax IDs associated with the invoice. Only editable when the invoice is a draft.
		public var account_tax_ids: MESSED_UP?
		/// A fee in %s that will be applied to the invoice and transferred to the application owner's Stripe account. The request must be made with an OAuth key or the Stripe-Account header in order to take an application fee. For more information, see the application fees [documentation](https://stripe.com/docs/billing/invoices/connect#collecting-fees).
		public var application_fee_amount: Int?
		/// Controls whether Stripe will perform [automatic collection](https://stripe.com/docs/billing/invoices/workflow/#auto_advance) of the invoice.
		public var auto_advance: Bool?
		/// Either `charge_automatically` or `send_invoice`. This field can be updated only on `draft` invoices.
		public var collection_method: CollectionMethodValues?
		/// A list of up to 4 custom fields to be displayed on the invoice. If a value for `custom_fields` is specified, the list specified will replace the existing custom field list on this invoice. Pass an empty string to remove previously-defined fields.
		public var custom_fields: MESSED_UP?
		/// The number of days from which the invoice is created until it is due. Only valid for invoices where `collection_method=send_invoice`. This field can only be updated on `draft` invoices.
		public var days_until_due: Int?
		/// ID of the default payment method for the invoice. It must belong to the customer associated with the invoice. If not set, defaults to the subscription's default payment method, if any, or to the default payment method in the customer's invoice settings.
		public var default_payment_method: String?
		/// ID of the default payment source for the invoice. It must belong to the customer associated with the invoice and be in a chargeable state. If not set, defaults to the subscription's default source, if any, or to the customer's default source.
		public var default_source: String?
		/// The tax rates that will apply to any line item that does not have `tax_rates` set. Pass an empty string to remove previously-defined tax rates.
		public var default_tax_rates: MESSED_UP?
		/// An arbitrary string attached to the object. Often useful for displaying to users. Referenced as 'memo' in the Dashboard.
		public var description: String?
		/// The discounts that will apply to the invoice. Pass an empty string to remove previously-defined discounts.
		public var discounts: MESSED_UP?
		/// The date on which payment for this invoice is due. Only valid for invoices where `collection_method=send_invoice`. This field can only be updated on `draft` invoices.
		public var due_date: Timestamp?
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?
		/// Footer to be displayed on the invoice.
		public var footer: String?
		/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
		public var metadata: MESSED_UP?
		/// Extra information about a charge for the customer's credit card statement. It must contain at least one letter. If not specified and this invoice is part of a subscription, the default `statement_descriptor` will be set to the first subscription item's product's `statement_descriptor`.
		public var statement_descriptor: String?
		/// If specified, the funds from the invoice will be transferred to the destination and the ID of the resulting transfer will be found on the invoice's charge. This will be unset if you POST an empty value.
		public var transfer_data: MESSED_UP?

		public init(account_tax_ids: MESSED_UP? = nil, application_fee_amount: Int? = nil, auto_advance: Bool? = nil, collection_method: CollectionMethodValues? = nil, custom_fields: MESSED_UP? = nil, days_until_due: Int? = nil, default_payment_method: String? = nil, default_source: String? = nil, default_tax_rates: MESSED_UP? = nil, description: String? = nil, discounts: MESSED_UP? = nil, due_date: Timestamp? = nil, expand: [String]? = nil, footer: String? = nil, metadata: MESSED_UP? = nil, statement_descriptor: String? = nil, transfer_data: MESSED_UP? = nil) {
			self.account_tax_ids = account_tax_ids
			self.application_fee_amount = application_fee_amount
			self.auto_advance = auto_advance
			self.collection_method = collection_method
			self.custom_fields = custom_fields
			self.days_until_due = days_until_due
			self.default_payment_method = default_payment_method
			self.default_source = default_source
			self.default_tax_rates = default_tax_rates
			self.description = description
			self.discounts = discounts
			self.due_date = due_date
			self.expand = expand
			self.footer = footer
			self.metadata = metadata
			self.statement_descriptor = statement_descriptor
			self.transfer_data = transfer_data
		}

		public enum CollectionMethodValues: String, Codable {
			case chargeAutomatically = "charge_automatically"
			case sendInvoice = "send_invoice"
		}
	}

}

/// Permanently deletes a one-off invoice draft. This cannot be undone. Attempts to delete invoices that are no longer in a draft state will fail; once an invoice has been finalized or if an invoice is for a subscription, it must be <a href="#void_invoice">voided</a>.
public struct DeleteInvoicesInvoice: StripeAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = DeletedInvoice
	public typealias paramType = Params
	public struct Params {
		let invoice: String

		public init(invoice: String) {
			self.invoice = invoice
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/invoices/\(inputs.invoice)"
	}
	public static var method: HTTPMethod { return .DELETE }

}

/// Stripe automatically finalizes drafts before sending and attempting payment on invoices. However, if you’d like to finalize a draft invoice manually, you can do so using this method.
public struct PostInvoicesInvoiceFinalize: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = Invoice
	public typealias paramType = Params
	public struct Params {
		let invoice: String

		public init(invoice: String) {
			self.invoice = invoice
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/invoices/\(inputs.invoice)/finalize"
	}

	public final class FormInput: Codable {
		/// Controls whether Stripe will perform [automatic collection](https://stripe.com/docs/billing/invoices/workflow/#auto_advance) of the invoice. When `false`, the invoice's state will not automatically advance without an explicit action.
		public var auto_advance: Bool?
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?

		public init(auto_advance: Bool? = nil, expand: [String]? = nil) {
			self.auto_advance = auto_advance
			self.expand = expand
		}
	}

}

/// When retrieving an invoice, you’ll get a <strong>lines</strong> property containing the total count of line items and the first handful of those items. There is also a URL where you can retrieve the full (paginated) list of line items.
public struct GetInvoicesInvoiceLines: StripeAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = InvoiceLinesList
	public typealias paramType = Params
	public struct Params {
		let ending_before: String
		let invoice: String
		let limit: Int
		let starting_after: String

		public init(ending_before: String, invoice: String, limit: Int, starting_after: String) {
			self.ending_before = ending_before
			self.invoice = invoice
			self.limit = limit
			self.starting_after = starting_after
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/invoices/\(inputs.invoice)/lines?ending_before=\(inputs.ending_before.urlEncoded))&limit=\(inputs.limit.urlEncoded))&starting_after=\(inputs.starting_after.urlEncoded))"
	}
	public static var method: HTTPMethod { return .GET }

	public final class InvoiceLinesList: Codable {
		/// Details about each object.
		public var data: [LineItem]
		/// True if this list has another page of items after this one that can be fetched.
		public var has_more: Bool
		/// String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
		public var object: ObjectValues
		/// The URL where this list can be accessed.
		public var url: String

		public init(data: [LineItem], has_more: Bool, object: ObjectValues, url: String) {
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

/// Marking an invoice as uncollectible is useful for keeping track of bad debts that can be written off for accounting purposes.
public struct PostInvoicesInvoiceMarkUncollectible: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = Invoice
	public typealias paramType = Params
	public struct Params {
		let invoice: String

		public init(invoice: String) {
			self.invoice = invoice
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/invoices/\(inputs.invoice)/mark_uncollectible"
	}

	public final class FormInput: Codable {
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?

		public init(expand: [String]? = nil) {
			self.expand = expand
		}
	}

}

/// Stripe automatically creates and then attempts to collect payment on invoices for customers on subscriptions according to your <a href="https://dashboard.stripe.com/account/billing/automatic">subscriptions settings</a>. However, if you’d like to attempt payment on an invoice out of the normal collection schedule or for some other reason, you can do so.
public struct PostInvoicesInvoicePay: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = Invoice
	public typealias paramType = Params
	public struct Params {
		let invoice: String

		public init(invoice: String) {
			self.invoice = invoice
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/invoices/\(inputs.invoice)/pay"
	}

	public final class FormInput: Codable {
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?
		/// In cases where the source used to pay the invoice has insufficient funds, passing `forgive=true` controls whether a charge should be attempted for the full amount available on the source, up to the amount to fully pay the invoice. This effectively forgives the difference between the amount available on the source and the amount due.   Passing `forgive=false` will fail the charge if the source hasn't been pre-funded with the right amount. An example for this case is with ACH Credit Transfers and wires: if the amount wired is less than the amount due by a small amount, you might want to forgive the difference. Defaults to `false`.
		public var forgive: Bool?
		/// Indicates if a customer is on or off-session while an invoice payment is attempted. Defaults to `true` (off-session).
		public var off_session: Bool?
		/// Boolean representing whether an invoice is paid outside of Stripe. This will result in no charge being made. Defaults to `false`.
		public var paid_out_of_band: Bool?
		/// A PaymentMethod to be charged. The PaymentMethod must be the ID of a PaymentMethod belonging to the customer associated with the invoice being paid.
		public var payment_method: String?
		/// A payment source to be charged. The source must be the ID of a source belonging to the customer associated with the invoice being paid.
		public var source: String?

		public init(expand: [String]? = nil, forgive: Bool? = nil, off_session: Bool? = nil, paid_out_of_band: Bool? = nil, payment_method: String? = nil, source: String? = nil) {
			self.expand = expand
			self.forgive = forgive
			self.off_session = off_session
			self.paid_out_of_band = paid_out_of_band
			self.payment_method = payment_method
			self.source = source
		}
	}

}

/// Stripe will automatically send invoices to customers according to your <a href="https://dashboard.stripe.com/account/billing/automatic">subscriptions settings</a>. However, if you’d like to manually send an invoice to your customer out of the normal schedule, you can do so. When sending invoices that have already been paid, there will be no reference to the payment in the email.  Requests made in test-mode result in no emails being sent, despite sending an <code>invoice.sent</code> event.
public struct PostInvoicesInvoiceSend: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = Invoice
	public typealias paramType = Params
	public struct Params {
		let invoice: String

		public init(invoice: String) {
			self.invoice = invoice
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/invoices/\(inputs.invoice)/send"
	}

	public final class FormInput: Codable {
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?

		public init(expand: [String]? = nil) {
			self.expand = expand
		}
	}

}

/// Mark a finalized invoice as void. This cannot be undone. Voiding an invoice is similar to <a href="#delete_invoice">deletion</a>, however it only applies to finalized invoices and maintains a papertrail where the invoice can still be found.
public struct PostInvoicesInvoiceVoid: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = Invoice
	public typealias paramType = Params
	public struct Params {
		let invoice: String

		public init(invoice: String) {
			self.invoice = invoice
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/invoices/\(inputs.invoice)/void"
	}

	public final class FormInput: Codable {
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?

		public init(expand: [String]? = nil) {
			self.expand = expand
		}
	}

}
