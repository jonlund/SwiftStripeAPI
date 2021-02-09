
/// Creates a new source object.
public struct PostSources: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = Source
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v1/sources"
	}

	public class FormInput: Codable {
		/// Amount associated with the source. This is the amount for which the source will be chargeable once ready. Required for `single_use` sources. Not supported for `receiver` type sources, where charge amount may not be specified until funds land.
		public var amount: Int?
		/// Three-letter [ISO code for the currency](https://stripe.com/docs/currencies) associated with the source. This is the currency for which the source will be chargeable once ready.
		public var currency: String?
		/// The `Customer` to whom the original source is attached to. Must be set when the original source is not a `Source` (e.g., `Card`).
		public var customer: String?
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?
		/// The authentication `flow` of the source to create. `flow` is one of `redirect`, `receiver`, `code_verification`, `none`. It is generally inferred unless a type supports multiple flows.
		public var flow: FlowValues?
		/// Information about a mandate possibility attached to a source object (generally for bank debits) as well as its acceptance status.
		public var mandate: MandateParams?
		public var metadata: String?
		/// The source to share.
		public var original_source: String?
		/// Information about the owner of the payment instrument that may be used or required by particular source types.
		public var owner: Owner?
		/// Optional parameters for the receiver flow. Can be set only if the source is a receiver (`flow` is `receiver`).
		public var receiver: ReceiverParams?
		/// Parameters required for the redirect flow. Required if the source is authenticated by a redirect (`flow` is `redirect`).
		public var redirect: RedirectParams?
		/// Information about the items and shipping associated with the source. Required for transactional credit (for example Klarna) sources before you can charge it.
		public var source_order: ShallowOrderSpecs?
		/// An arbitrary string to be displayed on your customer's statement. As an example, if your website is `RunClub` and the item you're charging for is a race ticket, you may want to specify a `statement_descriptor` of `RunClub 5K race ticket.` While many payment types will display this information, some may not display it at all.
		public var statement_descriptor: String?
		/// An optional token used to create the source. When passed, token properties will override source parameters.
		public var token: String?
		/// The `type` of the source to create. Required unless `customer` and `original_source` are specified (see the [Cloning card Sources](https://stripe.com/docs/sources/connect#cloning-card-sources) guide)
		public var type: String?
		public var usage: UsageValues?

		public init(amount: Int? = nil, currency: String? = nil, customer: String? = nil, expand: [String]? = nil, flow: FlowValues? = nil, mandate: MandateParams? = nil, metadata: String? = nil, original_source: String? = nil, owner: Owner? = nil, receiver: ReceiverParams? = nil, redirect: RedirectParams? = nil, source_order: ShallowOrderSpecs? = nil, statement_descriptor: String? = nil, token: String? = nil, type: String? = nil, usage: UsageValues? = nil) {
			self.amount = amount
			self.currency = currency
			self.customer = customer
			self.expand = expand
			self.flow = flow
			self.mandate = mandate
			self.metadata = metadata
			self.original_source = original_source
			self.owner = owner
			self.receiver = receiver
			self.redirect = redirect
			self.source_order = source_order
			self.statement_descriptor = statement_descriptor
			self.token = token
			self.type = type
			self.usage = usage
		}


		/// Information about a mandate possibility attached to a source object (generally for bank debits) as well as its acceptance status.
		public class MandateParams: Codable {
			public var acceptance: MandateAcceptanceParams?
			public var amount: Int?
			public var currency: String?
			public var interval: IntervalValues?
			public var notification_method: NotificationMethodValues?

			/// Information about a mandate possibility attached to a source object (generally for bank debits) as well as its acceptance status.
			/// - Parameters:
			public init(acceptance: MandateAcceptanceParams? = nil, amount: Int? = nil, currency: String? = nil, interval: IntervalValues? = nil, notification_method: NotificationMethodValues? = nil) {
				self.acceptance = acceptance
				self.amount = amount
				self.currency = currency
				self.interval = interval
				self.notification_method = notification_method
			}


			public class MandateAcceptanceParams: Codable {
				public var date: Timestamp?
				public var ip: String?
				public var offline: MandateOfflineAcceptanceParams?
				public var online: MandateOnlineAcceptanceParams?
				public var status: StatusValues
				public var type: TypeValues?
				public var user_agent: String?

				public init(status: StatusValues, date: Timestamp? = nil, ip: String? = nil, offline: MandateOfflineAcceptanceParams? = nil, online: MandateOnlineAcceptanceParams? = nil, type: TypeValues? = nil, user_agent: String? = nil) {
					self.status = status
					self.date = date
					self.ip = ip
					self.offline = offline
					self.online = online
					self.type = type
					self.user_agent = user_agent
				}


				public class MandateOfflineAcceptanceParams: Codable {
					public var contact_email: String

					public init(contact_email: String) {
						self.contact_email = contact_email
					}
				}



				public class MandateOnlineAcceptanceParams: Codable {
					public var date: Timestamp?
					public var ip: String?
					public var user_agent: String?

					public init(date: Timestamp? = nil, ip: String? = nil, user_agent: String? = nil) {
						self.date = date
						self.ip = ip
						self.user_agent = user_agent
					}
				}


				public enum StatusValues: String, Codable {
					case accepted = "accepted"
					case pending = "pending"
					case refused = "refused"
					case revoked = "revoked"
				}

				public enum TypeValues: String, Codable {
					case offline = "offline"
					case online = "online"
				}
			}


			public enum IntervalValues: String, Codable {
				case oneTime = "one_time"
				case scheduled = "scheduled"
				case variable = "variable"
			}

			public enum NotificationMethodValues: String, Codable {
				case deprecatedNone = "deprecated_none"
				case email = "email"
				case manual = "manual"
				case none = "none"
				case stripeEmail = "stripe_email"
			}
		}



		/// Information about the owner of the payment instrument that may be used or required by particular source types.
		public class Owner: Codable {
			public var address: SourceAddress?
			public var email: String?
			public var name: String?
			public var phone: String?

			/// Information about the owner of the payment instrument that may be used or required by particular source types.
			/// - Parameters:
			public init(address: SourceAddress? = nil, email: String? = nil, name: String? = nil, phone: String? = nil) {
				self.address = address
				self.email = email
				self.name = name
				self.phone = phone
			}


			public class SourceAddress: Codable {
				public var city: String?
				public var country: String?
				public var line1: String?
				public var line2: String?
				public var postal_code: String?
				public var state: String?

				public init(city: String? = nil, country: String? = nil, line1: String? = nil, line2: String? = nil, postal_code: String? = nil, state: String? = nil) {
					self.city = city
					self.country = country
					self.line1 = line1
					self.line2 = line2
					self.postal_code = postal_code
					self.state = state
				}
			}

		}



		/// Optional parameters for the receiver flow. Can be set only if the source is a receiver (`flow` is `receiver`).
		public class ReceiverParams: Codable {
			public var refund_attributes_method: RefundAttributesMethodValues?

			/// Optional parameters for the receiver flow. Can be set only if the source is a receiver (`flow` is `receiver`).
			/// - Parameters:
			public init(refund_attributes_method: RefundAttributesMethodValues? = nil) {
				self.refund_attributes_method = refund_attributes_method
			}

			public enum RefundAttributesMethodValues: String, Codable {
				case email = "email"
				case manual = "manual"
				case none = "none"
			}
		}



		/// Parameters required for the redirect flow. Required if the source is authenticated by a redirect (`flow` is `redirect`).
		public class RedirectParams: Codable {
			public var return_url: String

			/// Parameters required for the redirect flow. Required if the source is authenticated by a redirect (`flow` is `redirect`).
			/// - Parameters:
			///   - return_url: 
			public init(return_url: String) {
				self.return_url = return_url
			}
		}



		/// Information about the items and shipping associated with the source. Required for transactional credit (for example Klarna) sources before you can charge it.
		public class ShallowOrderSpecs: Codable {
			public var items: MESSED_UP?
			public var shipping: OrderShipping?

			/// Information about the items and shipping associated with the source. Required for transactional credit (for example Klarna) sources before you can charge it.
			/// - Parameters:
			public init(items: MESSED_UP? = nil, shipping: OrderShipping? = nil) {
				self.items = items
				self.shipping = shipping
			}


			public class OrderShipping: Codable {
				public var address: Address
				public var carrier: String?
				public var name: String?
				public var phone: String?
				public var tracking_number: String?

				public init(address: Address, carrier: String? = nil, name: String? = nil, phone: String? = nil, tracking_number: String? = nil) {
					self.address = address
					self.carrier = carrier
					self.name = name
					self.phone = phone
					self.tracking_number = tracking_number
				}


				public class Address: Codable {
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


		public enum FlowValues: String, Codable {
			case codeVerification = "code_verification"
			case none = "none"
			case receiver = "receiver"
			case redirect = "redirect"
		}

		public enum UsageValues: String, Codable {
			case reusable = "reusable"
			case singleUse = "single_use"
		}
	}

}

/// Retrieves an existing source object. Supply the unique source ID from a source creation request and Stripe will return the corresponding up-to-date source object information.
public struct GetSourcesSource: StripeAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = Source
	public typealias paramType = Params
	public struct Params {
		let client_secret: String
		let source: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/sources/\(inputs.source)?client_secret=\(inputs.client_secret.urlEncoded))"
	}
	public static var method: HTTPMethod { return .GET }

}

/// Updates the specified source by setting the values of the parameters passed. Any parameters not provided will be left unchanged.  This request accepts the <code>metadata</code> and <code>owner</code> as arguments. It is also possible to update type specific information for selected payment methods. Please refer to our <a href="/docs/sources">payment method guides</a> for more detail.
public struct PostSourcesSource: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = Source
	public typealias paramType = Params
	public struct Params {
		let source: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/sources/\(inputs.source)"
	}

	public class FormInput: Codable {
		/// Amount associated with the source.
		public var amount: Int?
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?
		/// Information about a mandate possibility attached to a source object (generally for bank debits) as well as its acceptance status.
		public var mandate: MandateParams?
		/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
		public var metadata: MESSED_UP?
		/// Information about the owner of the payment instrument that may be used or required by particular source types.
		public var owner: Owner?
		/// Information about the items and shipping associated with the source. Required for transactional credit (for example Klarna) sources before you can charge it.
		public var source_order: OrderParams?

		public init(amount: Int? = nil, expand: [String]? = nil, mandate: MandateParams? = nil, metadata: MESSED_UP? = nil, owner: Owner? = nil, source_order: OrderParams? = nil) {
			self.amount = amount
			self.expand = expand
			self.mandate = mandate
			self.metadata = metadata
			self.owner = owner
			self.source_order = source_order
		}


		/// Information about a mandate possibility attached to a source object (generally for bank debits) as well as its acceptance status.
		public class MandateParams: Codable {
			public var acceptance: MandateAcceptanceParams?
			public var amount: Int?
			public var currency: String?
			public var interval: IntervalValues?
			public var notification_method: NotificationMethodValues?

			/// Information about a mandate possibility attached to a source object (generally for bank debits) as well as its acceptance status.
			/// - Parameters:
			public init(acceptance: MandateAcceptanceParams? = nil, amount: Int? = nil, currency: String? = nil, interval: IntervalValues? = nil, notification_method: NotificationMethodValues? = nil) {
				self.acceptance = acceptance
				self.amount = amount
				self.currency = currency
				self.interval = interval
				self.notification_method = notification_method
			}


			public class MandateAcceptanceParams: Codable {
				public var date: Timestamp?
				public var ip: String?
				public var offline: MandateOfflineAcceptanceParams?
				public var online: MandateOnlineAcceptanceParams?
				public var status: StatusValues
				public var type: TypeValues?
				public var user_agent: String?

				public init(status: StatusValues, date: Timestamp? = nil, ip: String? = nil, offline: MandateOfflineAcceptanceParams? = nil, online: MandateOnlineAcceptanceParams? = nil, type: TypeValues? = nil, user_agent: String? = nil) {
					self.status = status
					self.date = date
					self.ip = ip
					self.offline = offline
					self.online = online
					self.type = type
					self.user_agent = user_agent
				}


				public class MandateOfflineAcceptanceParams: Codable {
					public var contact_email: String

					public init(contact_email: String) {
						self.contact_email = contact_email
					}
				}



				public class MandateOnlineAcceptanceParams: Codable {
					public var date: Timestamp?
					public var ip: String?
					public var user_agent: String?

					public init(date: Timestamp? = nil, ip: String? = nil, user_agent: String? = nil) {
						self.date = date
						self.ip = ip
						self.user_agent = user_agent
					}
				}


				public enum StatusValues: String, Codable {
					case accepted = "accepted"
					case pending = "pending"
					case refused = "refused"
					case revoked = "revoked"
				}

				public enum TypeValues: String, Codable {
					case offline = "offline"
					case online = "online"
				}
			}


			public enum IntervalValues: String, Codable {
				case oneTime = "one_time"
				case scheduled = "scheduled"
				case variable = "variable"
			}

			public enum NotificationMethodValues: String, Codable {
				case deprecatedNone = "deprecated_none"
				case email = "email"
				case manual = "manual"
				case none = "none"
				case stripeEmail = "stripe_email"
			}
		}



		/// Information about the items and shipping associated with the source. Required for transactional credit (for example Klarna) sources before you can charge it.
		public class OrderParams: Codable {
			public var items: MESSED_UP?
			public var shipping: OrderShipping?

			/// Information about the items and shipping associated with the source. Required for transactional credit (for example Klarna) sources before you can charge it.
			/// - Parameters:
			public init(items: MESSED_UP? = nil, shipping: OrderShipping? = nil) {
				self.items = items
				self.shipping = shipping
			}


			public class OrderShipping: Codable {
				public var address: Address
				public var carrier: String?
				public var name: String?
				public var phone: String?
				public var tracking_number: String?

				public init(address: Address, carrier: String? = nil, name: String? = nil, phone: String? = nil, tracking_number: String? = nil) {
					self.address = address
					self.carrier = carrier
					self.name = name
					self.phone = phone
					self.tracking_number = tracking_number
				}


				public class Address: Codable {
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



		/// Information about the owner of the payment instrument that may be used or required by particular source types.
		public class Owner: Codable {
			public var address: SourceAddress?
			public var email: String?
			public var name: String?
			public var phone: String?

			/// Information about the owner of the payment instrument that may be used or required by particular source types.
			/// - Parameters:
			public init(address: SourceAddress? = nil, email: String? = nil, name: String? = nil, phone: String? = nil) {
				self.address = address
				self.email = email
				self.name = name
				self.phone = phone
			}


			public class SourceAddress: Codable {
				public var city: String?
				public var country: String?
				public var line1: String?
				public var line2: String?
				public var postal_code: String?
				public var state: String?

				public init(city: String? = nil, country: String? = nil, line1: String? = nil, line2: String? = nil, postal_code: String? = nil, state: String? = nil) {
					self.city = city
					self.country = country
					self.line1 = line1
					self.line2 = line2
					self.postal_code = postal_code
					self.state = state
				}
			}

		}

	}

}

/// Retrieves a new Source MandateNotification.
public struct GetSourcesSourceMandateNotificationsMandateNotification: StripeAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = SourceMandateNotification
	public typealias paramType = Params
	public struct Params {
		let mandate_notification: String
		let source: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/sources/\(inputs.source)/mandate_notifications/\(inputs.mandate_notification)"
	}
	public static var method: HTTPMethod { return .GET }

}

/// List source transactions for a given source.
public struct GetSourcesSourceSourceTransactions: StripeAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = ApmsSourcesSourceTransactionList
	public typealias paramType = Params
	public struct Params {
		let ending_before: String
		let limit: Int
		let source: String
		let starting_after: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/sources/\(inputs.source)/source_transactions?ending_before=\(inputs.ending_before.urlEncoded))&limit=\(inputs.limit.urlEncoded))&starting_after=\(inputs.starting_after.urlEncoded))"
	}
	public static var method: HTTPMethod { return .GET }

	public class ApmsSourcesSourceTransactionList: Codable {
		public var data: [SourceTransaction]
		/// True if this list has another page of items after this one that can be fetched.
		public var has_more: Bool
		/// String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
		public var object: ObjectValues
		/// The URL where this list can be accessed.
		public var url: String

		public init(data: [SourceTransaction], has_more: Bool, object: ObjectValues, url: String) {
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

/// Retrieve an existing source transaction object. Supply the unique source ID from a source creation request and the source transaction ID and Stripe will return the corresponding up-to-date source object information.
public struct GetSourcesSourceSourceTransactionsSourceTransaction: StripeAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = SourceTransaction
	public typealias paramType = Params
	public struct Params {
		let source: String
		let source_transaction: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/sources/\(inputs.source)/source_transactions/\(inputs.source_transaction)"
	}
	public static var method: HTTPMethod { return .GET }

}

/// Verify a given source.
public struct PostSourcesSourceVerify: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = Source
	public typealias paramType = Params
	public struct Params {
		let source: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/sources/\(inputs.source)/verify"
	}

	public class FormInput: Codable {
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?
		/// The values needed to verify the source.
		public var values: [String]

		public init(values: [String], expand: [String]? = nil) {
			self.values = values
			self.expand = expand
		}
	}

}
