
/// Returns a list of existing payouts sent to third-party bank accounts or that Stripe has sent you. The payouts are returned in sorted order, with the most recently created payouts appearing first.
public struct GetPayouts: StripeAPIEndpoint {
	public typealias inputType = AnyCodable
	public typealias outputType = PayoutList
	public typealias paramType = Params
	
	public struct Params {
		let destination: String?
		let ending_before: String?
		let limit: Int?
		let starting_after: String?
		let status: String?

		/// Initialize the request parameters
		/// - Parameter destination: The ID of an external account - only return payouts sent to this external account.
		/// - Parameter ending_before: A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list.
		/// - Parameter limit: A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10.
		/// - Parameter starting_after: A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list.
		/// - Parameter status: Only return payouts that have the given status: `pending`, `paid`, `failed`, or `canceled`.
		public init(destination: String? = nil, ending_before: String? = nil, limit: Int? = nil, starting_after: String? = nil, status: String? = nil) {
			self.destination = destination
			self.ending_before = ending_before
			self.limit = limit
			self.starting_after = starting_after
			self.status = status
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		var params = [String]()
		if let a = inputs.destination?.urlEncoded { params.append("destination=\(a)") }
		if let a = inputs.ending_before?.urlEncoded { params.append("ending_before=\(a)") }
		if let a = inputs.limit?.urlEncoded { params.append("limit=\(a)") }
		if let a = inputs.starting_after?.urlEncoded { params.append("starting_after=\(a)") }
		if let a = inputs.status?.urlEncoded { params.append("status=\(a)") }
		let query = params.joined(separator: "&")
		return "/v1/payouts?\(query)"
	}
	public static var method: HTTPMethod { return .GET }

	public final class PayoutList: Codable {
		public var data: [Payout]
		/// True if this list has another page of items after this one that can be fetched.
		public var has_more: Bool
		/// String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
		public var object: ObjectValues
		/// The URL where this list can be accessed.
		public var url: String

		public init(data: [Payout], has_more: Bool, object: ObjectValues, url: String) {
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

/// To send funds to your own bank account, you create a new payout object. Your <a href="#balance">Stripe balance</a> must be able to cover the payout amount, or you’ll receive an “Insufficient Funds” error.  If your API key is in test mode, money won’t actually be sent, though everything else will occur as if in live mode.  If you are creating a manual payout on a Stripe account that uses multiple payment source types, you’ll need to specify the source type balance that the payout should draw from. The <a href="#balance_object">balance object</a> details available and pending amounts by source type.
public struct PostPayouts: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = Payout
	public typealias paramType = AnyCodable
	public static func endpoint(for inputs: AnyCodable) throws -> String {
		return "/v1/payouts"
	}

	public final class FormInput: Codable {
		/// A positive integer in cents representing how much to payout.
		public var amount: Int
		/// Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
		public var currency: String
		/// An arbitrary string attached to the object. Often useful for displaying to users.
		public var description: String?
		/// The ID of a bank account or a card to send the payout to. If no destination is supplied, the default external account for the specified currency will be used.
		public var destination: String?
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?
		/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
		public var metadata: AnyCodable?
		/// The method used to send this payout, which can be `standard` or `instant`. `instant` is only supported for payouts to debit cards. (See [Instant payouts for marketplaces for more information](https://stripe.com/blog/instant-payouts-for-marketplaces).)
		public var method: MethodValues?
		/// The balance type of your Stripe balance to draw this payout from. Balances for different payment sources are kept separately. You can find the amounts with the balances API. One of `bank_account`, `card`, or `fpx`.
		public var source_type: SourceTypeValues?
		/// A string to be displayed on the recipient's bank or card statement. This may be at most 22 characters. Attempting to use a `statement_descriptor` longer than 22 characters will return an error. Note: Most banks will truncate this information and/or display it inconsistently. Some may not display it at all.
		public var statement_descriptor: String?

		public init(amount: Int, currency: String, description: String? = nil, destination: String? = nil, expand: [String]? = nil, metadata: AnyCodable? = nil, method: MethodValues? = nil, source_type: SourceTypeValues? = nil, statement_descriptor: String? = nil) {
			self.amount = amount
			self.currency = currency
			self.description = description
			self.destination = destination
			self.expand = expand
			self.metadata = metadata
			self.method = method
			self.source_type = source_type
			self.statement_descriptor = statement_descriptor
		}

		public enum MethodValues: String, Codable {
			case instant = "instant"
			case standard = "standard"
		}

		public enum SourceTypeValues: String, Codable {
			case bankAccount = "bank_account"
			case card = "card"
			case fpx = "fpx"
		}
	}

}

/// Retrieves the details of an existing payout. Supply the unique payout ID from either a payout creation request or the payout list, and Stripe will return the corresponding payout information.
public struct GetPayoutsPayout: StripeAPIEndpoint {
	public typealias inputType = AnyCodable
	public typealias outputType = Payout
	public typealias paramType = Params
	
	public struct Params {
		let payout: String

		/// Initialize the request parameters
		/// - Parameter payout: 
		public init(payout: String) {
			self.payout = payout
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/payouts/\(inputs.payout)"
	}
	public static var method: HTTPMethod { return .GET }

}

/// Updates the specified payout by setting the values of the parameters passed. Any parameters not provided will be left unchanged. This request accepts only the metadata as arguments.
public struct PostPayoutsPayout: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = Payout
	public typealias paramType = Params
	
	public struct Params {
		let payout: String

		/// Initialize the request parameters
		/// - Parameter payout: 
		public init(payout: String) {
			self.payout = payout
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/payouts/\(inputs.payout)"
	}

	public final class FormInput: Codable {
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?
		/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
		public var metadata: AnyCodable?

		public init(expand: [String]? = nil, metadata: AnyCodable? = nil) {
			self.expand = expand
			self.metadata = metadata
		}
	}

}

/// A previously created payout can be canceled if it has not yet been paid out. Funds will be refunded to your available balance. You may not cancel automatic Stripe payouts.
public struct PostPayoutsPayoutCancel: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = Payout
	public typealias paramType = Params
	
	public struct Params {
		let payout: String

		/// Initialize the request parameters
		/// - Parameter payout: 
		public init(payout: String) {
			self.payout = payout
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/payouts/\(inputs.payout)/cancel"
	}

	public final class FormInput: Codable {
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?

		public init(expand: [String]? = nil) {
			self.expand = expand
		}
	}

}

/// Reverses a payout by debiting the destination bank account. Only payouts for connected accounts to US bank accounts may be reversed at this time. If the payout is in the <code>pending</code> status, <code>/v1/payouts/:id/cancel</code> should be used instead.  By requesting a reversal via <code>/v1/payouts/:id/reverse</code>, you confirm that the authorized signatory of the selected bank account has authorized the debit on the bank account and that no other authorization is required.
public struct PostPayoutsPayoutReverse: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = Payout
	public typealias paramType = Params
	
	public struct Params {
		let payout: String

		/// Initialize the request parameters
		/// - Parameter payout: 
		public init(payout: String) {
			self.payout = payout
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/payouts/\(inputs.payout)/reverse"
	}

	public final class FormInput: Codable {
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?
		/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
		public var metadata: AnyCodable?

		public init(expand: [String]? = nil, metadata: AnyCodable? = nil) {
			self.expand = expand
			self.metadata = metadata
		}
	}

}
