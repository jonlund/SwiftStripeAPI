
/// Returns a list of credit notes.
public struct GetCreditNotes: StripeAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = CreditNotesList
	public typealias paramType = Params
	public struct Params {
		let customer: String
		let ending_before: String
		let invoice: String
		let limit: Int
		let starting_after: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/credit_notes?customer=\(inputs.customer.urlEncoded))&ending_before=\(inputs.ending_before.urlEncoded))&invoice=\(inputs.invoice.urlEncoded))&limit=\(inputs.limit.urlEncoded))&starting_after=\(inputs.starting_after.urlEncoded))"
	}
	public static var method: HTTPMethod { return .GET }

	public final class CreditNotesList: Codable {
		public var data: [CreditNote]
		/// True if this list has another page of items after this one that can be fetched.
		public var has_more: Bool
		/// String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
		public var object: ObjectValues
		/// The URL where this list can be accessed.
		public var url: String

		public init(data: [CreditNote], has_more: Bool, object: ObjectValues, url: String) {
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

/// Issue a credit note to adjust the amount of a finalized invoice. For a <code>status=open</code> invoice, a credit note reduces its <code>amount_due</code>. For a <code>status=paid</code> invoice, a credit note does not affect its <code>amount_due</code>. Instead, it can result in any combination of the following:  <ul> <li>Refund: create a new refund (using <code>refund_amount</code>) or link an existing refund (using <code>refund</code>).</li> <li>Customer balance credit: credit the customer’s balance (using <code>credit_amount</code>) which will be automatically applied to their next invoice when it’s finalized.</li> <li>Outside of Stripe credit: record the amount that is or will be credited outside of Stripe (using <code>out_of_band_amount</code>).</li> </ul>  For post-payment credit notes the sum of the refund, credit and outside of Stripe amounts must equal the credit note total.  You may issue multiple credit notes for an invoice. Each credit note will increment the invoice’s <code>pre_payment_credit_notes_amount</code> or <code>post_payment_credit_notes_amount</code> depending on its <code>status</code> at the time of credit note creation.
public struct PostCreditNotes: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = CreditNote
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v1/credit_notes"
	}

	public final class FormInput: Codable {
		/// The integer amount in %s representing the total amount of the credit note.
		public var amount: Int?
		/// The integer amount in %s representing the amount to credit the customer's balance, which will be automatically applied to their next invoice.
		public var credit_amount: Int?
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?
		/// ID of the invoice.
		public var invoice: String
		/// Line items that make up the credit note.
		public var lines: MESSED_UP?
		/// The credit note's memo appears on the credit note PDF.
		public var memo: String?
		/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
		public var metadata: String?
		/// The integer amount in %s representing the amount that is credited outside of Stripe.
		public var out_of_band_amount: Int?
		/// Reason for issuing this credit note, one of `duplicate`, `fraudulent`, `order_change`, or `product_unsatisfactory`
		public var reason: ReasonValues?
		/// ID of an existing refund to link this credit note to.
		public var refund: String?
		/// The integer amount in %s representing the amount to refund. If set, a refund will be created for the charge associated with the invoice.
		public var refund_amount: Int?

		public init(invoice: String, amount: Int? = nil, credit_amount: Int? = nil, expand: [String]? = nil, lines: MESSED_UP? = nil, memo: String? = nil, metadata: String? = nil, out_of_band_amount: Int? = nil, reason: ReasonValues? = nil, refund: String? = nil, refund_amount: Int? = nil) {
			self.invoice = invoice
			self.amount = amount
			self.credit_amount = credit_amount
			self.expand = expand
			self.lines = lines
			self.memo = memo
			self.metadata = metadata
			self.out_of_band_amount = out_of_band_amount
			self.reason = reason
			self.refund = refund
			self.refund_amount = refund_amount
		}

		public enum ReasonValues: String, Codable {
			case duplicate = "duplicate"
			case fraudulent = "fraudulent"
			case orderChange = "order_change"
			case productUnsatisfactory = "product_unsatisfactory"
		}
	}

}

/// Get a preview of a credit note without creating it.
public struct GetCreditNotesPreview: StripeAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = CreditNote
	public typealias paramType = Params
	public struct Params {
		let amount: Int
		let credit_amount: Int
		let invoice: String
		let memo: String
		let out_of_band_amount: Int
		let reason: String
		let refund: String
		let refund_amount: Int
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/credit_notes/preview?amount=\(inputs.amount.urlEncoded))&credit_amount=\(inputs.credit_amount.urlEncoded))&invoice=\(inputs.invoice.urlEncoded))&memo=\(inputs.memo.urlEncoded))&out_of_band_amount=\(inputs.out_of_band_amount.urlEncoded))&reason=\(inputs.reason.urlEncoded))&refund=\(inputs.refund.urlEncoded))&refund_amount=\(inputs.refund_amount.urlEncoded))"
	}
	public static var method: HTTPMethod { return .GET }

}

/// When retrieving a credit note preview, you’ll get a <strong>lines</strong> property containing the first handful of those items. This URL you can retrieve the full (paginated) list of line items.
public struct GetCreditNotesPreviewLines: StripeAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = CreditNoteLinesList
	public typealias paramType = Params
	public struct Params {
		let amount: Int
		let credit_amount: Int
		let ending_before: String
		let invoice: String
		let limit: Int
		let memo: String
		let out_of_band_amount: Int
		let reason: String
		let refund: String
		let refund_amount: Int
		let starting_after: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/credit_notes/preview/lines?amount=\(inputs.amount.urlEncoded))&credit_amount=\(inputs.credit_amount.urlEncoded))&ending_before=\(inputs.ending_before.urlEncoded))&invoice=\(inputs.invoice.urlEncoded))&limit=\(inputs.limit.urlEncoded))&memo=\(inputs.memo.urlEncoded))&out_of_band_amount=\(inputs.out_of_band_amount.urlEncoded))&reason=\(inputs.reason.urlEncoded))&refund=\(inputs.refund.urlEncoded))&refund_amount=\(inputs.refund_amount.urlEncoded))&starting_after=\(inputs.starting_after.urlEncoded))"
	}
	public static var method: HTTPMethod { return .GET }

	public final class CreditNoteLinesList: Codable {
		/// Details about each object.
		public var data: [CreditNoteLineItem]
		/// True if this list has another page of items after this one that can be fetched.
		public var has_more: Bool
		/// String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
		public var object: ObjectValues
		/// The URL where this list can be accessed.
		public var url: String

		public init(data: [CreditNoteLineItem], has_more: Bool, object: ObjectValues, url: String) {
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

/// When retrieving a credit note, you’ll get a <strong>lines</strong> property containing the the first handful of those items. There is also a URL where you can retrieve the full (paginated) list of line items.
public struct GetCreditNotesCreditNoteLines: StripeAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = CreditNoteLinesList
	public typealias paramType = Params
	public struct Params {
		let credit_note: String
		let ending_before: String
		let limit: Int
		let starting_after: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/credit_notes/\(inputs.credit_note)/lines?ending_before=\(inputs.ending_before.urlEncoded))&limit=\(inputs.limit.urlEncoded))&starting_after=\(inputs.starting_after.urlEncoded))"
	}
	public static var method: HTTPMethod { return .GET }

	public final class CreditNoteLinesList: Codable {
		/// Details about each object.
		public var data: [CreditNoteLineItem]
		/// True if this list has another page of items after this one that can be fetched.
		public var has_more: Bool
		/// String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
		public var object: ObjectValues
		/// The URL where this list can be accessed.
		public var url: String

		public init(data: [CreditNoteLineItem], has_more: Bool, object: ObjectValues, url: String) {
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

/// Retrieves the credit note object with the given identifier.
public struct GetCreditNotesId: StripeAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = CreditNote
	public typealias paramType = Params
	public struct Params {
		let id: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/credit_notes/\(inputs.id)"
	}
	public static var method: HTTPMethod { return .GET }

}

/// Updates an existing credit note.
public struct PostCreditNotesId: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = CreditNote
	public typealias paramType = Params
	public struct Params {
		let id: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/credit_notes/\(inputs.id)"
	}

	public final class FormInput: Codable {
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?
		/// Credit note memo.
		public var memo: String?
		/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
		public var metadata: String?

		public init(expand: [String]? = nil, memo: String? = nil, metadata: String? = nil) {
			self.expand = expand
			self.memo = memo
			self.metadata = metadata
		}
	}

}

/// Marks a credit note as void. Learn more about <a href="/docs/billing/invoices/credit-notes#voiding">voiding credit notes</a>.
public struct PostCreditNotesIdVoid: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = CreditNote
	public typealias paramType = Params
	public struct Params {
		let id: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/credit_notes/\(inputs.id)/void"
	}

	public final class FormInput: Codable {
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?

		public init(expand: [String]? = nil) {
			self.expand = expand
		}
	}

}
