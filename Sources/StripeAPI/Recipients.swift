
/// Returns a list of your recipients. The recipients are returned sorted by creation date, with the most recently created recipients appearing first.
public struct GetRecipients: StripeAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = Output
	public typealias paramType = Params
	public struct Params {
		let ending_before: String
		let limit: Int
		let starting_after: String
		let type: String
		let verified: Bool

		public init(ending_before: String, limit: Int, starting_after: String, type: String, verified: Bool) {
			self.ending_before = ending_before
			self.limit = limit
			self.starting_after = starting_after
			self.type = type
			self.verified = verified
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/recipients?ending_before=\(inputs.ending_before.urlEncoded))&limit=\(inputs.limit.urlEncoded))&starting_after=\(inputs.starting_after.urlEncoded))&type=\(inputs.type.urlEncoded))&verified=\(inputs.verified.urlEncoded))"
	}
	public static var method: HTTPMethod { return .GET }

	public final class Output: Codable {
		public var data: [Recipient]
		/// True if this list has another page of items after this one that can be fetched.
		public var has_more: Bool
		/// String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
		public var object: ObjectValues
		/// The URL where this list can be accessed.
		public var url: String

		public init(data: [Recipient], has_more: Bool, object: ObjectValues, url: String) {
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

/// Creates a new <code>Recipient</code> object and verifies the recipient’s identity. Also verifies the recipient’s bank account information or debit card, if either is provided.
public struct PostRecipients: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = Recipient
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v1/recipients"
	}

	public final class FormInput: Codable {
		/// A bank account to attach to the recipient. You can provide either a token, like the ones returned by [Stripe.js](https://stripe.com/docs/stripe-js), or a dictionary containing a user's bank account details, with the options described below.
		public var bank_account: String?
		/// A U.S. Visa or MasterCard debit card (_not_ prepaid) to attach to the recipient. If the debit card is not valid, recipient creation will fail. You can provide either a token, like the ones returned by [Stripe.js](https://stripe.com/docs/stripe-js), or a dictionary containing a user's debit card details, with the options described below. Although not all information is required, the extra info helps prevent fraud.
		public var card: String?
		/// An arbitrary string which you can attach to a `Recipient` object. It is displayed alongside the recipient in the web interface.
		public var description: String?
		/// The recipient's email address. It is displayed alongside the recipient in the web interface, and can be useful for searching and tracking.
		public var email: String?
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?
		/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
		public var metadata: MESSED_UP?
		/// The recipient's full, legal name. For type `individual`, should be in the format `First Last`, `First Middle Last`, or `First M Last` (no prefixes or suffixes). For `corporation`, the full, incorporated name.
		public var name: String
		/// The recipient's tax ID, as a string. For type `individual`, the full SSN; for type `corporation`, the full EIN.
		public var tax_id: String?
		/// Type of the recipient: either `individual` or `corporation`.
		public var type: String

		public init(name: String, type: String, bank_account: String? = nil, card: String? = nil, description: String? = nil, email: String? = nil, expand: [String]? = nil, metadata: MESSED_UP? = nil, tax_id: String? = nil) {
			self.name = name
			self.type = type
			self.bank_account = bank_account
			self.card = card
			self.description = description
			self.email = email
			self.expand = expand
			self.metadata = metadata
			self.tax_id = tax_id
		}
	}

}

/// Retrieves the details of an existing recipient. You need only supply the unique recipient identifier that was returned upon recipient creation.
public struct GetRecipientsId: StripeAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = Recipient
	public typealias paramType = Params
	public struct Params {
		let id: String

		public init(id: String) {
			self.id = id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/recipients/\(inputs.id)"
	}
	public static var method: HTTPMethod { return .GET }

}

/// Updates the specified recipient by setting the values of the parameters passed. Any parameters not provided will be left unchanged.  If you update the name or tax ID, the identity verification will automatically be rerun. If you update the bank account, the bank account validation will automatically be rerun.
public struct PostRecipientsId: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = Recipient
	public typealias paramType = Params
	public struct Params {
		let id: String

		public init(id: String) {
			self.id = id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/recipients/\(inputs.id)"
	}

	public final class FormInput: Codable {
		/// A bank account to attach to the recipient. You can provide either a token, like the ones returned by [Stripe.js](https://stripe.com/docs/stripe-js), or a dictionary containing a user's bank account details, with the options described below.
		public var bank_account: String?
		/// A U.S. Visa or MasterCard debit card (not prepaid) to attach to the recipient. You can provide either a token, like the ones returned by [Stripe.js](https://stripe.com/docs/stripe-js), or a dictionary containing a user's debit card details, with the options described below. Passing `card` will create a new card, make it the new recipient default card, and delete the old recipient default (if one exists). If you want to add additional debit cards instead of replacing the existing default, use the [card creation API](https://stripe.com/docs/api#create_card). Whenever you attach a card to a recipient, Stripe will automatically validate the debit card.
		public var card: String?
		/// ID of the card to set as the recipient's new default for payouts.
		public var default_card: String?
		/// An arbitrary string which you can attach to a `Recipient` object. It is displayed alongside the recipient in the web interface.
		public var description: String?
		/// The recipient's email address. It is displayed alongside the recipient in the web interface, and can be useful for searching and tracking.
		public var email: String?
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?
		/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
		public var metadata: MESSED_UP?
		/// The recipient's full, legal name. For type `individual`, should be in the format `First Last`, `First Middle Last`, or `First M Last` (no prefixes or suffixes). For `corporation`, the full, incorporated name.
		public var name: String?
		/// The recipient's tax ID, as a string. For type `individual`, the full SSN; for type `corporation`, the full EIN.
		public var tax_id: String?

		public init(bank_account: String? = nil, card: String? = nil, default_card: String? = nil, description: String? = nil, email: String? = nil, expand: [String]? = nil, metadata: MESSED_UP? = nil, name: String? = nil, tax_id: String? = nil) {
			self.bank_account = bank_account
			self.card = card
			self.default_card = default_card
			self.description = description
			self.email = email
			self.expand = expand
			self.metadata = metadata
			self.name = name
			self.tax_id = tax_id
		}
	}

}

/// Permanently deletes a recipient. It cannot be undone.
public struct DeleteRecipientsId: StripeAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = DeletedRecipient
	public typealias paramType = Params
	public struct Params {
		let id: String

		public init(id: String) {
			self.id = id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/recipients/\(inputs.id)"
	}
	public static var method: HTTPMethod { return .DELETE }

}
