
/// Returns a list of existing transfers sent to connected accounts. The transfers are returned in sorted order, with the most recently created transfers appearing first.
public struct GetTransfers: StripeAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = TransferList
	public typealias paramType = Params
	public struct Params {
		let destination: String
		let ending_before: String
		let limit: Int
		let starting_after: String
		let transfer_group: String

		public init(destination: String, ending_before: String, limit: Int, starting_after: String, transfer_group: String) {
			self.destination = destination
			self.ending_before = ending_before
			self.limit = limit
			self.starting_after = starting_after
			self.transfer_group = transfer_group
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/transfers?destination=\(inputs.destination.urlEncoded))&ending_before=\(inputs.ending_before.urlEncoded))&limit=\(inputs.limit.urlEncoded))&starting_after=\(inputs.starting_after.urlEncoded))&transfer_group=\(inputs.transfer_group.urlEncoded))"
	}
	public static var method: HTTPMethod { return .GET }

	public final class TransferList: Codable {
		/// Details about each object.
		public var data: [Transfer]
		/// True if this list has another page of items after this one that can be fetched.
		public var has_more: Bool
		/// String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
		public var object: ObjectValues
		/// The URL where this list can be accessed.
		public var url: String

		public init(data: [Transfer], has_more: Bool, object: ObjectValues, url: String) {
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

/// To send funds from your Stripe account to a connected account, you create a new transfer object. Your <a href="#balance">Stripe balance</a> must be able to cover the transfer amount, or you’ll receive an “Insufficient Funds” error.
public struct PostTransfers: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = Transfer
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v1/transfers"
	}

	public final class FormInput: Codable {
		/// A positive integer in %s representing how much to transfer.
		public var amount: Int?
		/// 3-letter [ISO code for currency](https://stripe.com/docs/payouts).
		public var currency: String
		/// An arbitrary string attached to the object. Often useful for displaying to users.
		public var description: String?
		/// The ID of a connected Stripe account. <a href="/docs/connect/charges-transfers">See the Connect documentation</a> for details.
		public var destination: String
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?
		/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
		public var metadata: Empty?
		/// You can use this parameter to transfer funds from a charge before they are added to your available balance. A pending balance will transfer immediately but the funds will not become available until the original charge becomes available. [See the Connect documentation](https://stripe.com/docs/connect/charges-transfers#transfer-availability) for details.
		public var source_transaction: String?
		/// The source balance to use for this transfer. One of `bank_account`, `card`, or `fpx`. For most users, this will default to `card`.
		public var source_type: SourceTypeValues?
		/// A string that identifies this transaction as part of a group. See the [Connect documentation](https://stripe.com/docs/connect/charges-transfers#transfer-options) for details.
		public var transfer_group: String?

		public init(currency: String, destination: String, amount: Int? = nil, description: String? = nil, expand: [String]? = nil, metadata: Empty? = nil, source_transaction: String? = nil, source_type: SourceTypeValues? = nil, transfer_group: String? = nil) {
			self.currency = currency
			self.destination = destination
			self.amount = amount
			self.description = description
			self.expand = expand
			self.metadata = metadata
			self.source_transaction = source_transaction
			self.source_type = source_type
			self.transfer_group = transfer_group
		}

		public enum SourceTypeValues: String, Codable {
			case bankAccount = "bank_account"
			case card = "card"
			case fpx = "fpx"
		}
	}

}

/// You can see a list of the reversals belonging to a specific transfer. Note that the 10 most recent reversals are always available by default on the transfer object. If you need more than those 10, you can use this API method and the <code>limit</code> and <code>starting_after</code> parameters to page through additional reversals.
public struct GetTransfersIdReversals: StripeAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = TransferReversalList
	public typealias paramType = Params
	public struct Params {
		let ending_before: String
		let id: String
		let limit: Int
		let starting_after: String

		public init(ending_before: String, id: String, limit: Int, starting_after: String) {
			self.ending_before = ending_before
			self.id = id
			self.limit = limit
			self.starting_after = starting_after
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/transfers/\(inputs.id)/reversals?ending_before=\(inputs.ending_before.urlEncoded))&limit=\(inputs.limit.urlEncoded))&starting_after=\(inputs.starting_after.urlEncoded))"
	}
	public static var method: HTTPMethod { return .GET }

	public final class TransferReversalList: Codable {
		/// Details about each object.
		public var data: [TransferReversal]
		/// True if this list has another page of items after this one that can be fetched.
		public var has_more: Bool
		/// String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
		public var object: ObjectValues
		/// The URL where this list can be accessed.
		public var url: String

		public init(data: [TransferReversal], has_more: Bool, object: ObjectValues, url: String) {
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

/// When you create a new reversal, you must specify a transfer to create it on.  When reversing transfers, you can optionally reverse part of the transfer. You can do so as many times as you wish until the entire transfer has been reversed.  Once entirely reversed, a transfer can’t be reversed again. This method will return an error when called on an already-reversed transfer, or when trying to reverse more money than is left on a transfer.
public struct PostTransfersIdReversals: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = TransferReversal
	public typealias paramType = Params
	public struct Params {
		let id: String

		public init(id: String) {
			self.id = id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/transfers/\(inputs.id)/reversals"
	}

	public final class FormInput: Codable {
		/// A positive integer in %s representing how much of this transfer to reverse. Can only reverse up to the unreversed amount remaining of the transfer. Partial transfer reversals are only allowed for transfers to Stripe Accounts. Defaults to the entire transfer amount.
		public var amount: Int?
		/// An arbitrary string which you can attach to a reversal object. It is displayed alongside the reversal in the Dashboard. This will be unset if you POST an empty value.
		public var description: String?
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?
		/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
		public var metadata: MESSED_UP?
		/// Boolean indicating whether the application fee should be refunded when reversing this transfer. If a full transfer reversal is given, the full application fee will be refunded. Otherwise, the application fee will be refunded with an amount proportional to the amount of the transfer reversed.
		public var refund_application_fee: Bool?

		public init(amount: Int? = nil, description: String? = nil, expand: [String]? = nil, metadata: MESSED_UP? = nil, refund_application_fee: Bool? = nil) {
			self.amount = amount
			self.description = description
			self.expand = expand
			self.metadata = metadata
			self.refund_application_fee = refund_application_fee
		}
	}

}

/// Retrieves the details of an existing transfer. Supply the unique transfer ID from either a transfer creation request or the transfer list, and Stripe will return the corresponding transfer information.
public struct GetTransfersTransfer: StripeAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = Transfer
	public typealias paramType = Params
	public struct Params {
		let transfer: String

		public init(transfer: String) {
			self.transfer = transfer
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/transfers/\(inputs.transfer)"
	}
	public static var method: HTTPMethod { return .GET }

}

/// Updates the specified transfer by setting the values of the parameters passed. Any parameters not provided will be left unchanged.  This request accepts only metadata as an argument.
public struct PostTransfersTransfer: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = Transfer
	public typealias paramType = Params
	public struct Params {
		let transfer: String

		public init(transfer: String) {
			self.transfer = transfer
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/transfers/\(inputs.transfer)"
	}

	public final class FormInput: Codable {
		/// An arbitrary string attached to the object. Often useful for displaying to users.
		public var description: String?
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?
		/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
		public var metadata: MESSED_UP?

		public init(description: String? = nil, expand: [String]? = nil, metadata: MESSED_UP? = nil) {
			self.description = description
			self.expand = expand
			self.metadata = metadata
		}
	}

}

/// By default, you can see the 10 most recent reversals stored directly on the transfer object, but you can also retrieve details about a specific reversal stored on the transfer.
public struct GetTransfersTransferReversalsId: StripeAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = TransferReversal
	public typealias paramType = Params
	public struct Params {
		let id: String
		let transfer: String

		public init(id: String, transfer: String) {
			self.id = id
			self.transfer = transfer
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/transfers/\(inputs.transfer)/reversals/\(inputs.id)"
	}
	public static var method: HTTPMethod { return .GET }

}

/// Updates the specified reversal by setting the values of the parameters passed. Any parameters not provided will be left unchanged.  This request only accepts metadata and description as arguments.
public struct PostTransfersTransferReversalsId: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = TransferReversal
	public typealias paramType = Params
	public struct Params {
		let id: String
		let transfer: String

		public init(id: String, transfer: String) {
			self.id = id
			self.transfer = transfer
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/transfers/\(inputs.transfer)/reversals/\(inputs.id)"
	}

	public final class FormInput: Codable {
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?
		/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
		public var metadata: MESSED_UP?

		public init(expand: [String]? = nil, metadata: MESSED_UP? = nil) {
			self.expand = expand
			self.metadata = metadata
		}
	}

}
