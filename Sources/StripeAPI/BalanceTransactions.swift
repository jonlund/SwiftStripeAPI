
/// Returns a list of transactions that have contributed to the Stripe account balance (e.g., charges, transfers, and so forth). The transactions are returned in sorted order, with the most recent transactions appearing first.  Note that this endpoint was previously called “Balance history” and used the path <code>/v1/balance/history</code>.
public struct GetBalanceTransactions: StripeAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = BalanceTransactionsList
	public typealias paramType = Params
	public struct Params {
		let currency: String
		let ending_before: String
		let limit: Int
		let payout: String
		let source: String
		let starting_after: String
		let type: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/balance_transactions?currency=\(inputs.currency.urlEncoded))&ending_before=\(inputs.ending_before.urlEncoded))&limit=\(inputs.limit.urlEncoded))&payout=\(inputs.payout.urlEncoded))&source=\(inputs.source.urlEncoded))&starting_after=\(inputs.starting_after.urlEncoded))&type=\(inputs.type.urlEncoded))"
	}
	public static var method: HTTPMethod { return .GET }

	public final class BalanceTransactionsList: Codable {
		public var data: [BalanceTransaction]
		/// True if this list has another page of items after this one that can be fetched.
		public var has_more: Bool
		/// String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
		public var object: ObjectValues
		/// The URL where this list can be accessed.
		public var url: String

		public init(data: [BalanceTransaction], has_more: Bool, object: ObjectValues, url: String) {
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

/// Retrieves the balance transaction with the given ID.  Note that this endpoint previously used the path <code>/v1/balance/history/:id</code>.
public struct GetBalanceTransactionsId: StripeAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = BalanceTransaction
	public typealias paramType = Params
	public struct Params {
		let id: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/balance_transactions/\(inputs.id)"
	}
	public static var method: HTTPMethod { return .GET }

}
