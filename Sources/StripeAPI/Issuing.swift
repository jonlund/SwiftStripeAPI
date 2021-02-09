
/// Returns a list of Issuing <code>Authorization</code> objects. The objects are sorted in descending order by creation date, with the most recently created object appearing first.
public struct GetIssuingAuthorizations: StripeAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = Output
	public typealias paramType = Params
	public struct Params {
		let card: String
		let cardholder: String
		let ending_before: String
		let limit: Int
		let starting_after: String
		let status: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/issuing/authorizations?card=\(inputs.card.urlEncoded))&cardholder=\(inputs.cardholder.urlEncoded))&ending_before=\(inputs.ending_before.urlEncoded))&limit=\(inputs.limit.urlEncoded))&starting_after=\(inputs.starting_after.urlEncoded))&status=\(inputs.status.urlEncoded))"
	}
	public static var method: HTTPMethod { return .GET }

	public final class Output: Codable {
		public var data: [IssuingAuthorization]
		/// True if this list has another page of items after this one that can be fetched.
		public var has_more: Bool
		/// String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
		public var object: ObjectValues
		/// The URL where this list can be accessed.
		public var url: String

		public init(data: [IssuingAuthorization], has_more: Bool, object: ObjectValues, url: String) {
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

/// Retrieves an Issuing <code>Authorization</code> object.
public struct GetIssuingAuthorizationsAuthorization: StripeAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = IssuingAuthorization
	public typealias paramType = Params
	public struct Params {
		let authorization: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/issuing/authorizations/\(inputs.authorization)"
	}
	public static var method: HTTPMethod { return .GET }

}

/// Updates the specified Issuing <code>Authorization</code> object by setting the values of the parameters passed. Any parameters not provided will be left unchanged.
public struct PostIssuingAuthorizationsAuthorization: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = IssuingAuthorization
	public typealias paramType = Params
	public struct Params {
		let authorization: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/issuing/authorizations/\(inputs.authorization)"
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

/// Approves a pending Issuing <code>Authorization</code> object. This request should be made within the timeout window of the <a href="/docs/issuing/controls/real-time-authorizations">real-time authorization</a> flow.
public struct PostIssuingAuthorizationsAuthorizationApprove: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = IssuingAuthorization
	public typealias paramType = Params
	public struct Params {
		let authorization: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/issuing/authorizations/\(inputs.authorization)/approve"
	}

	public final class FormInput: Codable {
		/// If the authorization's `pending_request.is_amount_controllable` property is `true`, you may provide this value to control how much to hold for the authorization. Must be positive (use [`decline`](https://stripe.com/docs/api/issuing/authorizations/decline) to decline an authorization request).
		public var amount: Int?
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?
		/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
		public var metadata: MESSED_UP?

		public init(amount: Int? = nil, expand: [String]? = nil, metadata: MESSED_UP? = nil) {
			self.amount = amount
			self.expand = expand
			self.metadata = metadata
		}
	}

}

/// Declines a pending Issuing <code>Authorization</code> object. This request should be made within the timeout window of the <a href="/docs/issuing/controls/real-time-authorizations">real time authorization</a> flow.
public struct PostIssuingAuthorizationsAuthorizationDecline: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = IssuingAuthorization
	public typealias paramType = Params
	public struct Params {
		let authorization: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/issuing/authorizations/\(inputs.authorization)/decline"
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

/// Returns a list of Issuing <code>Cardholder</code> objects. The objects are sorted in descending order by creation date, with the most recently created object appearing first.
public struct GetIssuingCardholders: StripeAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = Output
	public typealias paramType = Params
	public struct Params {
		let email: String
		let ending_before: String
		let limit: Int
		let phone_number: String
		let starting_after: String
		let status: String
		let type: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/issuing/cardholders?email=\(inputs.email.urlEncoded))&ending_before=\(inputs.ending_before.urlEncoded))&limit=\(inputs.limit.urlEncoded))&phone_number=\(inputs.phone_number.urlEncoded))&starting_after=\(inputs.starting_after.urlEncoded))&status=\(inputs.status.urlEncoded))&type=\(inputs.type.urlEncoded))"
	}
	public static var method: HTTPMethod { return .GET }

	public final class Output: Codable {
		public var data: [IssuingCardholder]
		/// True if this list has another page of items after this one that can be fetched.
		public var has_more: Bool
		/// String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
		public var object: ObjectValues
		/// The URL where this list can be accessed.
		public var url: String

		public init(data: [IssuingCardholder], has_more: Bool, object: ObjectValues, url: String) {
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

/// Creates a new Issuing <code>Cardholder</code> object that can be issued cards.
public struct PostIssuingCardholders: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = IssuingCardholder
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v1/issuing/cardholders"
	}

	public final class FormInput: Codable {
		/// The cardholder's billing address.
		public var billing: BillingSpecs
		/// Additional information about a `company` cardholder.
		public var company: CompanyParam?
		/// The cardholder's email address.
		public var email: String?
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?
		/// Additional information about an `individual` cardholder.
		public var individual: IndividualParam?
		/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
		public var metadata: String?
		/// The cardholder's name. This will be printed on cards issued to them.
		public var name: String
		/// The cardholder's phone number. This will be transformed to [E.164](https://en.wikipedia.org/wiki/E.164) if it is not provided in that format already.
		public var phone_number: String?
		/// Rules that control spending across this cardholder's cards. Refer to our [documentation](https://stripe.com/docs/issuing/controls/spending-controls) for more details.
		public var spending_controls: AuthorizationControlsParamV2?
		/// Specifies whether to permit authorizations on this cardholder's cards. Defaults to `active`.
		public var status: StatusValues?
		/// One of `individual` or `company`.
		public var type: TypeValues

		public init(billing: BillingSpecs, name: String, type: TypeValues, company: CompanyParam? = nil, email: String? = nil, expand: [String]? = nil, individual: IndividualParam? = nil, metadata: String? = nil, phone_number: String? = nil, spending_controls: AuthorizationControlsParamV2? = nil, status: StatusValues? = nil) {
			self.billing = billing
			self.name = name
			self.type = type
			self.company = company
			self.email = email
			self.expand = expand
			self.individual = individual
			self.metadata = metadata
			self.phone_number = phone_number
			self.spending_controls = spending_controls
			self.status = status
		}


		/// Rules that control spending across this cardholder's cards. Refer to our [documentation](https://stripe.com/docs/issuing/controls/spending-controls) for more details.
		public final class AuthorizationControlsParamV2: Codable {
			public var allowed_categories: [String]?
			public var blocked_categories: [String]?
			public var spending_limits: MESSED_UP?
			public var spending_limits_currency: String?

			/// Rules that control spending across this cardholder's cards. Refer to our [documentation](https://stripe.com/docs/issuing/controls/spending-controls) for more details.
			/// - Parameters:
			public init(allowed_categories: [String]? = nil, blocked_categories: [String]? = nil, spending_limits: MESSED_UP? = nil, spending_limits_currency: String? = nil) {
				self.allowed_categories = allowed_categories
				self.blocked_categories = blocked_categories
				self.spending_limits = spending_limits
				self.spending_limits_currency = spending_limits_currency
			}
		}



		/// The cardholder's billing address.
		public final class BillingSpecs: Codable {
			public var address: RequiredAddress

			/// The cardholder's billing address.
			/// - Parameters:
			///   - address: 
			public init(address: RequiredAddress) {
				self.address = address
			}


			public final class RequiredAddress: Codable {
				public var city: String
				public var country: String
				public var line1: String
				public var line2: String?
				public var postal_code: String
				public var state: String?

				public init(city: String, country: String, line1: String, postal_code: String, line2: String? = nil, state: String? = nil) {
					self.city = city
					self.country = country
					self.line1 = line1
					self.postal_code = postal_code
					self.line2 = line2
					self.state = state
				}
			}

		}



		/// Additional information about a `company` cardholder.
		public final class CompanyParam: Codable {
			public var tax_id: String?

			/// Additional information about a `company` cardholder.
			/// - Parameters:
			public init(tax_id: String? = nil) {
				self.tax_id = tax_id
			}
		}



		/// Additional information about an `individual` cardholder.
		public final class IndividualParam: Codable {
			public var dob: DateOfBirthSpecs?
			public var first_name: String
			public var last_name: String
			public var verification: PersonVerificationParam?

			/// Additional information about an `individual` cardholder.
			/// - Parameters:
			///   - first_name: 
			///   - last_name: 
			public init(first_name: String, last_name: String, dob: DateOfBirthSpecs? = nil, verification: PersonVerificationParam? = nil) {
				self.first_name = first_name
				self.last_name = last_name
				self.dob = dob
				self.verification = verification
			}


			public final class DateOfBirthSpecs: Codable {
				public var day: Int
				public var month: Int
				public var year: Int

				public init(day: Int, month: Int, year: Int) {
					self.day = day
					self.month = month
					self.year = year
				}
			}



			public final class PersonVerificationParam: Codable {
				public var document: PersonVerificationDocumentParam?

				public init(document: PersonVerificationDocumentParam? = nil) {
					self.document = document
				}


				public final class PersonVerificationDocumentParam: Codable {
					public var back: String?
					public var front: String?

					public init(back: String? = nil, front: String? = nil) {
						self.back = back
						self.front = front
					}
				}

			}

		}


		public enum StatusValues: String, Codable {
			case active = "active"
			case inactive = "inactive"
		}

		public enum TypeValues: String, Codable {
			case company = "company"
			case individual = "individual"
		}
	}

}

/// Retrieves an Issuing <code>Cardholder</code> object.
public struct GetIssuingCardholdersCardholder: StripeAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = IssuingCardholder
	public typealias paramType = Params
	public struct Params {
		let cardholder: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/issuing/cardholders/\(inputs.cardholder)"
	}
	public static var method: HTTPMethod { return .GET }

}

/// Updates the specified Issuing <code>Cardholder</code> object by setting the values of the parameters passed. Any parameters not provided will be left unchanged.
public struct PostIssuingCardholdersCardholder: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = IssuingCardholder
	public typealias paramType = Params
	public struct Params {
		let cardholder: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/issuing/cardholders/\(inputs.cardholder)"
	}

	public final class FormInput: Codable {
		/// The cardholder's billing address.
		public var billing: BillingSpecs?
		/// Additional information about a `company` cardholder.
		public var company: CompanyParam?
		/// The cardholder's email address.
		public var email: String?
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?
		/// Additional information about an `individual` cardholder.
		public var individual: IndividualParam?
		/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
		public var metadata: String?
		/// The cardholder's phone number.
		public var phone_number: String?
		/// Rules that control spending across this cardholder's cards. Refer to our [documentation](https://stripe.com/docs/issuing/controls/spending-controls) for more details.
		public var spending_controls: AuthorizationControlsParamV2?
		/// Specifies whether to permit authorizations on this cardholder's cards.
		public var status: StatusValues?

		public init(billing: BillingSpecs? = nil, company: CompanyParam? = nil, email: String? = nil, expand: [String]? = nil, individual: IndividualParam? = nil, metadata: String? = nil, phone_number: String? = nil, spending_controls: AuthorizationControlsParamV2? = nil, status: StatusValues? = nil) {
			self.billing = billing
			self.company = company
			self.email = email
			self.expand = expand
			self.individual = individual
			self.metadata = metadata
			self.phone_number = phone_number
			self.spending_controls = spending_controls
			self.status = status
		}


		/// Rules that control spending across this cardholder's cards. Refer to our [documentation](https://stripe.com/docs/issuing/controls/spending-controls) for more details.
		public final class AuthorizationControlsParamV2: Codable {
			public var allowed_categories: [String]?
			public var blocked_categories: [String]?
			public var spending_limits: MESSED_UP?
			public var spending_limits_currency: String?

			/// Rules that control spending across this cardholder's cards. Refer to our [documentation](https://stripe.com/docs/issuing/controls/spending-controls) for more details.
			/// - Parameters:
			public init(allowed_categories: [String]? = nil, blocked_categories: [String]? = nil, spending_limits: MESSED_UP? = nil, spending_limits_currency: String? = nil) {
				self.allowed_categories = allowed_categories
				self.blocked_categories = blocked_categories
				self.spending_limits = spending_limits
				self.spending_limits_currency = spending_limits_currency
			}
		}



		/// The cardholder's billing address.
		public final class BillingSpecs: Codable {
			public var address: RequiredAddress

			/// The cardholder's billing address.
			/// - Parameters:
			///   - address: 
			public init(address: RequiredAddress) {
				self.address = address
			}


			public final class RequiredAddress: Codable {
				public var city: String
				public var country: String
				public var line1: String
				public var line2: String?
				public var postal_code: String
				public var state: String?

				public init(city: String, country: String, line1: String, postal_code: String, line2: String? = nil, state: String? = nil) {
					self.city = city
					self.country = country
					self.line1 = line1
					self.postal_code = postal_code
					self.line2 = line2
					self.state = state
				}
			}

		}



		/// Additional information about a `company` cardholder.
		public final class CompanyParam: Codable {
			public var tax_id: String?

			/// Additional information about a `company` cardholder.
			/// - Parameters:
			public init(tax_id: String? = nil) {
				self.tax_id = tax_id
			}
		}



		/// Additional information about an `individual` cardholder.
		public final class IndividualParam: Codable {
			public var dob: DateOfBirthSpecs?
			public var first_name: String
			public var last_name: String
			public var verification: PersonVerificationParam?

			/// Additional information about an `individual` cardholder.
			/// - Parameters:
			///   - first_name: 
			///   - last_name: 
			public init(first_name: String, last_name: String, dob: DateOfBirthSpecs? = nil, verification: PersonVerificationParam? = nil) {
				self.first_name = first_name
				self.last_name = last_name
				self.dob = dob
				self.verification = verification
			}


			public final class DateOfBirthSpecs: Codable {
				public var day: Int
				public var month: Int
				public var year: Int

				public init(day: Int, month: Int, year: Int) {
					self.day = day
					self.month = month
					self.year = year
				}
			}



			public final class PersonVerificationParam: Codable {
				public var document: PersonVerificationDocumentParam?

				public init(document: PersonVerificationDocumentParam? = nil) {
					self.document = document
				}


				public final class PersonVerificationDocumentParam: Codable {
					public var back: String?
					public var front: String?

					public init(back: String? = nil, front: String? = nil) {
						self.back = back
						self.front = front
					}
				}

			}

		}


		public enum StatusValues: String, Codable {
			case active = "active"
			case inactive = "inactive"
		}
	}

}

/// Returns a list of Issuing <code>Card</code> objects. The objects are sorted in descending order by creation date, with the most recently created object appearing first.
public struct GetIssuingCards: StripeAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = Output
	public typealias paramType = Params
	public struct Params {
		let cardholder: String
		let ending_before: String
		let exp_month: Int
		let exp_year: Int
		let last4: String
		let limit: Int
		let starting_after: String
		let status: String
		let type: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/issuing/cards?cardholder=\(inputs.cardholder.urlEncoded))&ending_before=\(inputs.ending_before.urlEncoded))&exp_month=\(inputs.exp_month.urlEncoded))&exp_year=\(inputs.exp_year.urlEncoded))&last4=\(inputs.last4.urlEncoded))&limit=\(inputs.limit.urlEncoded))&starting_after=\(inputs.starting_after.urlEncoded))&status=\(inputs.status.urlEncoded))&type=\(inputs.type.urlEncoded))"
	}
	public static var method: HTTPMethod { return .GET }

	public final class Output: Codable {
		public var data: [IssuingCard]
		/// True if this list has another page of items after this one that can be fetched.
		public var has_more: Bool
		/// String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
		public var object: ObjectValues
		/// The URL where this list can be accessed.
		public var url: String

		public init(data: [IssuingCard], has_more: Bool, object: ObjectValues, url: String) {
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

/// Creates an Issuing <code>Card</code> object.
public struct PostIssuingCards: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = IssuingCard
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v1/issuing/cards"
	}

	public final class FormInput: Codable {
		/// The [Cardholder](https://stripe.com/docs/api#issuing_cardholder_object) object with which the card will be associated.
		public var cardholder: String?
		/// The currency for the card. This currently must be `usd`.
		public var currency: String
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?
		/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
		public var metadata: String?
		/// The card this is meant to be a replacement for (if any).
		public var replacement_for: String?
		/// If `replacement_for` is specified, this should indicate why that card is being replaced.
		public var replacement_reason: ReplacementReasonValues?
		/// The address where the card will be shipped.
		public var shipping: ShippingSpecs?
		/// Rules that control spending for this card. Refer to our [documentation](https://stripe.com/docs/issuing/controls/spending-controls) for more details.
		public var spending_controls: AuthorizationControlsParam?
		/// Whether authorizations can be approved on this card. Defaults to `inactive`.
		public var status: StatusValues?
		/// The type of card to issue. Possible values are `physical` or `virtual`.
		public var type: TypeValues

		public init(currency: String, type: TypeValues, cardholder: String? = nil, expand: [String]? = nil, metadata: String? = nil, replacement_for: String? = nil, replacement_reason: ReplacementReasonValues? = nil, shipping: ShippingSpecs? = nil, spending_controls: AuthorizationControlsParam? = nil, status: StatusValues? = nil) {
			self.currency = currency
			self.type = type
			self.cardholder = cardholder
			self.expand = expand
			self.metadata = metadata
			self.replacement_for = replacement_for
			self.replacement_reason = replacement_reason
			self.shipping = shipping
			self.spending_controls = spending_controls
			self.status = status
		}


		/// Rules that control spending for this card. Refer to our [documentation](https://stripe.com/docs/issuing/controls/spending-controls) for more details.
		public final class AuthorizationControlsParam: Codable {
			public var allowed_categories: [String]?
			public var blocked_categories: [String]?
			public var spending_limits: MESSED_UP?

			/// Rules that control spending for this card. Refer to our [documentation](https://stripe.com/docs/issuing/controls/spending-controls) for more details.
			/// - Parameters:
			public init(allowed_categories: [String]? = nil, blocked_categories: [String]? = nil, spending_limits: MESSED_UP? = nil) {
				self.allowed_categories = allowed_categories
				self.blocked_categories = blocked_categories
				self.spending_limits = spending_limits
			}
		}



		/// The address where the card will be shipped.
		public final class ShippingSpecs: Codable {
			public var address: RequiredAddress
			public var name: String
			public var service: ServiceValues?
			public var type: TypeValues?

			/// The address where the card will be shipped.
			/// - Parameters:
			///   - address: 
			///   - name: 
			public init(address: RequiredAddress, name: String, service: ServiceValues? = nil, type: TypeValues? = nil) {
				self.address = address
				self.name = name
				self.service = service
				self.type = type
			}


			public final class RequiredAddress: Codable {
				public var city: String
				public var country: String
				public var line1: String
				public var line2: String?
				public var postal_code: String
				public var state: String?

				public init(city: String, country: String, line1: String, postal_code: String, line2: String? = nil, state: String? = nil) {
					self.city = city
					self.country = country
					self.line1 = line1
					self.postal_code = postal_code
					self.line2 = line2
					self.state = state
				}
			}


			public enum ServiceValues: String, Codable {
				case express = "express"
				case priority = "priority"
				case standard = "standard"
			}

			public enum TypeValues: String, Codable {
				case bulk = "bulk"
				case individual = "individual"
			}
		}


		public enum ReplacementReasonValues: String, Codable {
			case damaged = "damaged"
			case expired = "expired"
			case lost = "lost"
			case stolen = "stolen"
		}

		public enum StatusValues: String, Codable {
			case active = "active"
			case inactive = "inactive"
		}

		public enum TypeValues: String, Codable {
			case physical = "physical"
			case virtual = "virtual"
		}
	}

}

/// Retrieves an Issuing <code>Card</code> object.
public struct GetIssuingCardsCard: StripeAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = IssuingCard
	public typealias paramType = Params
	public struct Params {
		let card: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/issuing/cards/\(inputs.card)"
	}
	public static var method: HTTPMethod { return .GET }

}

/// Updates the specified Issuing <code>Card</code> object by setting the values of the parameters passed. Any parameters not provided will be left unchanged.
public struct PostIssuingCardsCard: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = IssuingCard
	public typealias paramType = Params
	public struct Params {
		let card: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/issuing/cards/\(inputs.card)"
	}

	public final class FormInput: Codable {
		/// Reason why the `status` of this card is `canceled`.
		public var cancellation_reason: CancellationReasonValues?
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?
		/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
		public var metadata: MESSED_UP?
		/// Rules that control spending for this card. Refer to our [documentation](https://stripe.com/docs/issuing/controls/spending-controls) for more details.
		public var spending_controls: AuthorizationControlsParam?
		/// Dictates whether authorizations can be approved on this card. If this card is being canceled because it was lost or stolen, this information should be provided as `cancellation_reason`.
		public var status: StatusValues?

		public init(cancellation_reason: CancellationReasonValues? = nil, expand: [String]? = nil, metadata: MESSED_UP? = nil, spending_controls: AuthorizationControlsParam? = nil, status: StatusValues? = nil) {
			self.cancellation_reason = cancellation_reason
			self.expand = expand
			self.metadata = metadata
			self.spending_controls = spending_controls
			self.status = status
		}


		/// Rules that control spending for this card. Refer to our [documentation](https://stripe.com/docs/issuing/controls/spending-controls) for more details.
		public final class AuthorizationControlsParam: Codable {
			public var allowed_categories: [String]?
			public var blocked_categories: [String]?
			public var spending_limits: MESSED_UP?

			/// Rules that control spending for this card. Refer to our [documentation](https://stripe.com/docs/issuing/controls/spending-controls) for more details.
			/// - Parameters:
			public init(allowed_categories: [String]? = nil, blocked_categories: [String]? = nil, spending_limits: MESSED_UP? = nil) {
				self.allowed_categories = allowed_categories
				self.blocked_categories = blocked_categories
				self.spending_limits = spending_limits
			}
		}


		public enum CancellationReasonValues: String, Codable {
			case lost = "lost"
			case stolen = "stolen"
		}

		public enum StatusValues: String, Codable {
			case active = "active"
			case canceled = "canceled"
			case inactive = "inactive"
		}
	}

}

/// Returns a list of Issuing <code>Dispute</code> objects. The objects are sorted in descending order by creation date, with the most recently created object appearing first.
public struct GetIssuingDisputes: StripeAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = IssuingDisputeList
	public typealias paramType = Params
	public struct Params {
		let ending_before: String
		let limit: Int
		let starting_after: String
		let status: String
		let transaction: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/issuing/disputes?ending_before=\(inputs.ending_before.urlEncoded))&limit=\(inputs.limit.urlEncoded))&starting_after=\(inputs.starting_after.urlEncoded))&status=\(inputs.status.urlEncoded))&transaction=\(inputs.transaction.urlEncoded))"
	}
	public static var method: HTTPMethod { return .GET }

	public final class IssuingDisputeList: Codable {
		public var data: [IssuingDispute]
		/// True if this list has another page of items after this one that can be fetched.
		public var has_more: Bool
		/// String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
		public var object: ObjectValues
		/// The URL where this list can be accessed.
		public var url: String

		public init(data: [IssuingDispute], has_more: Bool, object: ObjectValues, url: String) {
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

/// Creates an Issuing <code>Dispute</code> object. Individual pieces of evidence within the <code>evidence</code> object are optional at this point. Stripe only validates that required evidence is present during submission. Refer to <a href="/docs/issuing/purchases/disputes#dispute-reasons-and-evidence">Dispute reasons and evidence</a> for more details about evidence requirements.
public struct PostIssuingDisputes: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = IssuingDispute
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v1/issuing/disputes"
	}

	public final class FormInput: Codable {
		/// Evidence provided for the dispute.
		public var evidence: EvidenceParam?
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?
		/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
		public var metadata: String?
		/// The ID of the issuing transaction to create a dispute for.
		public var transaction: String

		public init(transaction: String, evidence: EvidenceParam? = nil, expand: [String]? = nil, metadata: String? = nil) {
			self.transaction = transaction
			self.evidence = evidence
			self.expand = expand
			self.metadata = metadata
		}


		/// Evidence provided for the dispute.
		public final class EvidenceParam: Codable {
			public var canceled: MESSED_UP?
			public var duplicate: MESSED_UP?
			public var fraudulent: MESSED_UP?
			public var merchandise_not_as_described: MESSED_UP?
			public var not_received: MESSED_UP?
			public var other: MESSED_UP?
			public var reason: ReasonValues?
			public var service_not_as_described: MESSED_UP?

			/// Evidence provided for the dispute.
			/// - Parameters:
			public init(canceled: MESSED_UP? = nil, duplicate: MESSED_UP? = nil, fraudulent: MESSED_UP? = nil, merchandise_not_as_described: MESSED_UP? = nil, not_received: MESSED_UP? = nil, other: MESSED_UP? = nil, reason: ReasonValues? = nil, service_not_as_described: MESSED_UP? = nil) {
				self.canceled = canceled
				self.duplicate = duplicate
				self.fraudulent = fraudulent
				self.merchandise_not_as_described = merchandise_not_as_described
				self.not_received = not_received
				self.other = other
				self.reason = reason
				self.service_not_as_described = service_not_as_described
			}

			public enum ReasonValues: String, Codable {
				case canceled = "canceled"
				case duplicate = "duplicate"
				case fraudulent = "fraudulent"
				case merchandiseNotAsDescribed = "merchandise_not_as_described"
				case notReceived = "not_received"
				case other = "other"
				case serviceNotAsDescribed = "service_not_as_described"
			}
		}

	}

}

/// Retrieves an Issuing <code>Dispute</code> object.
public struct GetIssuingDisputesDispute: StripeAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = IssuingDispute
	public typealias paramType = Params
	public struct Params {
		let dispute: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/issuing/disputes/\(inputs.dispute)"
	}
	public static var method: HTTPMethod { return .GET }

}

/// Updates the specified Issuing <code>Dispute</code> object by setting the values of the parameters passed. Any parameters not provided will be left unchanged. Properties on the <code>evidence</code> object can be unset by passing in an empty string.
public struct PostIssuingDisputesDispute: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = IssuingDispute
	public typealias paramType = Params
	public struct Params {
		let dispute: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/issuing/disputes/\(inputs.dispute)"
	}

	public final class FormInput: Codable {
		/// Evidence provided for the dispute.
		public var evidence: EvidenceParam?
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?
		/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
		public var metadata: MESSED_UP?

		public init(evidence: EvidenceParam? = nil, expand: [String]? = nil, metadata: MESSED_UP? = nil) {
			self.evidence = evidence
			self.expand = expand
			self.metadata = metadata
		}


		/// Evidence provided for the dispute.
		public final class EvidenceParam: Codable {
			public var canceled: MESSED_UP?
			public var duplicate: MESSED_UP?
			public var fraudulent: MESSED_UP?
			public var merchandise_not_as_described: MESSED_UP?
			public var not_received: MESSED_UP?
			public var other: MESSED_UP?
			public var reason: ReasonValues?
			public var service_not_as_described: MESSED_UP?

			/// Evidence provided for the dispute.
			/// - Parameters:
			public init(canceled: MESSED_UP? = nil, duplicate: MESSED_UP? = nil, fraudulent: MESSED_UP? = nil, merchandise_not_as_described: MESSED_UP? = nil, not_received: MESSED_UP? = nil, other: MESSED_UP? = nil, reason: ReasonValues? = nil, service_not_as_described: MESSED_UP? = nil) {
				self.canceled = canceled
				self.duplicate = duplicate
				self.fraudulent = fraudulent
				self.merchandise_not_as_described = merchandise_not_as_described
				self.not_received = not_received
				self.other = other
				self.reason = reason
				self.service_not_as_described = service_not_as_described
			}

			public enum ReasonValues: String, Codable {
				case canceled = "canceled"
				case duplicate = "duplicate"
				case fraudulent = "fraudulent"
				case merchandiseNotAsDescribed = "merchandise_not_as_described"
				case notReceived = "not_received"
				case other = "other"
				case serviceNotAsDescribed = "service_not_as_described"
			}
		}

	}

}

/// Submits an Issuing <code>Dispute</code> to the card network. Stripe validates that all evidence fields required for the dispute’s reason are present. For more details, see <a href="/docs/issuing/purchases/disputes#dispute-reasons-and-evidence">Dispute reasons and evidence</a>.
public struct PostIssuingDisputesDisputeSubmit: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = IssuingDispute
	public typealias paramType = Params
	public struct Params {
		let dispute: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/issuing/disputes/\(inputs.dispute)/submit"
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

/// Returns a list of Issuing <code>Settlement</code> objects. The objects are sorted in descending order by creation date, with the most recently created object appearing first.
public struct GetIssuingSettlements: StripeAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = Output
	public typealias paramType = Params
	public struct Params {
		let ending_before: String
		let limit: Int
		let starting_after: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/issuing/settlements?ending_before=\(inputs.ending_before.urlEncoded))&limit=\(inputs.limit.urlEncoded))&starting_after=\(inputs.starting_after.urlEncoded))"
	}
	public static var method: HTTPMethod { return .GET }

	public final class Output: Codable {
		public var data: [IssuingSettlement]
		/// True if this list has another page of items after this one that can be fetched.
		public var has_more: Bool
		/// String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
		public var object: ObjectValues
		/// The URL where this list can be accessed.
		public var url: String

		public init(data: [IssuingSettlement], has_more: Bool, object: ObjectValues, url: String) {
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

/// Retrieves an Issuing <code>Settlement</code> object.
public struct GetIssuingSettlementsSettlement: StripeAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = IssuingSettlement
	public typealias paramType = Params
	public struct Params {
		let settlement: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/issuing/settlements/\(inputs.settlement)"
	}
	public static var method: HTTPMethod { return .GET }

}

/// Updates the specified Issuing <code>Settlement</code> object by setting the values of the parameters passed. Any parameters not provided will be left unchanged.
public struct PostIssuingSettlementsSettlement: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = IssuingSettlement
	public typealias paramType = Params
	public struct Params {
		let settlement: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/issuing/settlements/\(inputs.settlement)"
	}

	public final class FormInput: Codable {
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?
		/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
		public var metadata: String?

		public init(expand: [String]? = nil, metadata: String? = nil) {
			self.expand = expand
			self.metadata = metadata
		}
	}

}

/// Returns a list of Issuing <code>Transaction</code> objects. The objects are sorted in descending order by creation date, with the most recently created object appearing first.
public struct GetIssuingTransactions: StripeAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = Output
	public typealias paramType = Params
	public struct Params {
		let card: String
		let cardholder: String
		let ending_before: String
		let limit: Int
		let starting_after: String
		let type: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/issuing/transactions?card=\(inputs.card.urlEncoded))&cardholder=\(inputs.cardholder.urlEncoded))&ending_before=\(inputs.ending_before.urlEncoded))&limit=\(inputs.limit.urlEncoded))&starting_after=\(inputs.starting_after.urlEncoded))&type=\(inputs.type.urlEncoded))"
	}
	public static var method: HTTPMethod { return .GET }

	public final class Output: Codable {
		public var data: [IssuingTransaction]
		/// True if this list has another page of items after this one that can be fetched.
		public var has_more: Bool
		/// String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
		public var object: ObjectValues
		/// The URL where this list can be accessed.
		public var url: String

		public init(data: [IssuingTransaction], has_more: Bool, object: ObjectValues, url: String) {
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

/// Retrieves an Issuing <code>Transaction</code> object.
public struct GetIssuingTransactionsTransaction: StripeAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = IssuingTransaction
	public typealias paramType = Params
	public struct Params {
		let transaction: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/issuing/transactions/\(inputs.transaction)"
	}
	public static var method: HTTPMethod { return .GET }

}

/// Updates the specified Issuing <code>Transaction</code> object by setting the values of the parameters passed. Any parameters not provided will be left unchanged.
public struct PostIssuingTransactionsTransaction: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = IssuingTransaction
	public typealias paramType = Params
	public struct Params {
		let transaction: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/issuing/transactions/\(inputs.transaction)"
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
