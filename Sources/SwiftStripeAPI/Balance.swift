
/// Retrieves the current account balance, based on the authentication that was used to make the request.  For a sample request, see <a href="/docs/connect/account-balances#accounting-for-negative-balances">Accounting for negative balances</a>.
public struct GetBalance: StripeAPIEndpoint {
	public typealias inputType = AnyCodable
	public typealias outputType = Balance
	public typealias paramType = AnyCodable
	public static func endpoint(for inputs: AnyCodable) throws -> String {
		return "/v1/balance"
	}
	public static var method: HTTPMethod { return .GET }

}

/// Returns a list of transactions that have contributed to the Stripe account balance (e.g., charges, transfers, and so forth). The transactions are returned in sorted order, with the most recent transactions appearing first.  Note that this endpoint was previously called “Balance history” and used the path <code>/v1/balance/history</code>.
public struct GetBalanceHistory: StripeAPIEndpoint {
	public typealias inputType = AnyCodable
	public typealias outputType = BalanceTransactionsList
	public typealias paramType = Params
	
	public struct Params {
		let currency: String?
		let ending_before: String?
		let limit: Int?
		let payout: String?
		let source: String?
		let starting_after: String?
		let type: String?

		/// Initialize the request parameters
		/// - Parameter currency: Only return transactions in a certain currency. Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
		/// - Parameter ending_before: A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list.
		/// - Parameter limit: A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10.
		/// - Parameter payout: For automatic Stripe payouts only, only returns transactions that were paid out on the specified payout ID.
		/// - Parameter source: Only returns the original transaction.
		/// - Parameter starting_after: A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list.
		/// - Parameter type: Only returns transactions of the given type. One of: `adjustment`, `advance`, `advance_funding`, `anticipation_repayment`, `application_fee`, `application_fee_refund`, `charge`, `connect_collection_transfer`, `contribution`, `issuing_authorization_hold`, `issuing_authorization_release`, `issuing_dispute`, `issuing_transaction`, `payment`, `payment_failure_refund`, `payment_refund`, `payout`, `payout_cancel`, `payout_failure`, `refund`, `refund_failure`, `reserve_transaction`, `reserved_funds`, `stripe_fee`, `stripe_fx_fee`, `tax_fee`, `topup`, `topup_reversal`, `transfer`, `transfer_cancel`, `transfer_failure`, or `transfer_refund`.
		public init(currency: String? = nil, ending_before: String? = nil, limit: Int? = nil, payout: String? = nil, source: String? = nil, starting_after: String? = nil, type: String? = nil) {
			self.currency = currency
			self.ending_before = ending_before
			self.limit = limit
			self.payout = payout
			self.source = source
			self.starting_after = starting_after
			self.type = type
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		var params = [String]()
		if let a = inputs.currency?.urlEncoded { params.append("currency=\(a)") }
		if let a = inputs.ending_before?.urlEncoded { params.append("ending_before=\(a)") }
		if let a = inputs.limit?.urlEncoded { params.append("limit=\(a)") }
		if let a = inputs.payout?.urlEncoded { params.append("payout=\(a)") }
		if let a = inputs.source?.urlEncoded { params.append("source=\(a)") }
		if let a = inputs.starting_after?.urlEncoded { params.append("starting_after=\(a)") }
		if let a = inputs.type?.urlEncoded { params.append("type=\(a)") }
		let query = params.joined(separator: "&")
		return "/v1/balance/history?\(query)"
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
public struct GetBalanceHistoryId: StripeAPIEndpoint {
	public typealias inputType = AnyCodable
	public typealias outputType = BalanceTransaction
	public typealias paramType = Params
	
	public struct Params {
		let id: String

		/// Initialize the request parameters
		/// - Parameter id: 
		public init(id: String) {
			self.id = id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/balance/history/\(inputs.id)"
	}
	public static var method: HTTPMethod { return .GET }

}
