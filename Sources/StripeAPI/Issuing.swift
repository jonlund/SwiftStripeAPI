
/// Returns a list of Issuing <code>Authorization</code> objects. The objects are sorted in descending order by creation date, with the most recently created object appearing first.
public struct GetIssuingAuthorizations: StripeAPIEndpoint {
	public typealias inputType = AnyCodable
	public typealias outputType = Output
	public typealias paramType = Params
	
	public struct Params {
		let card: String?
		let cardholder: String?
		let ending_before: String?
		let limit: Int?
		let starting_after: String?
		let status: String?

		/// Initialize the request parameters
		/// - Parameter card: Only return authorizations that belong to the given card.
		/// - Parameter cardholder: Only return authorizations that belong to the given cardholder.
		/// - Parameter ending_before: A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list.
		/// - Parameter limit: A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10.
		/// - Parameter starting_after: A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list.
		/// - Parameter status: Only return authorizations with the given status. One of `pending`, `closed`, or `reversed`.
		public init(card: String? = nil, cardholder: String? = nil, ending_before: String? = nil, limit: Int? = nil, starting_after: String? = nil, status: String? = nil) {
			self.card = card
			self.cardholder = cardholder
			self.ending_before = ending_before
			self.limit = limit
			self.starting_after = starting_after
			self.status = status
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		var params = [String]()
		if let a = inputs.card?.urlEncoded { params.append("card=\(a)") }
		if let a = inputs.cardholder?.urlEncoded { params.append("cardholder=\(a)") }
		if let a = inputs.ending_before?.urlEncoded { params.append("ending_before=\(a)") }
		if let a = inputs.limit?.urlEncoded { params.append("limit=\(a)") }
		if let a = inputs.starting_after?.urlEncoded { params.append("starting_after=\(a)") }
		if let a = inputs.status?.urlEncoded { params.append("status=\(a)") }
		let query = params.joined(separator: "&")
		return "/v1/issuing/authorizations?\(query)"
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
	public typealias inputType = AnyCodable
	public typealias outputType = IssuingAuthorization
	public typealias paramType = Params
	
	public struct Params {
		let authorization: String

		/// Initialize the request parameters
		/// - Parameter authorization: 
		public init(authorization: String) {
			self.authorization = authorization
		}
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

		/// Initialize the request parameters
		/// - Parameter authorization: 
		public init(authorization: String) {
			self.authorization = authorization
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/issuing/authorizations/\(inputs.authorization)"
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

/// Approves a pending Issuing <code>Authorization</code> object. This request should be made within the timeout window of the <a href="/docs/issuing/controls/real-time-authorizations">real-time authorization</a> flow.
public struct PostIssuingAuthorizationsAuthorizationApprove: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = IssuingAuthorization
	public typealias paramType = Params
	
	public struct Params {
		let authorization: String

		/// Initialize the request parameters
		/// - Parameter authorization: 
		public init(authorization: String) {
			self.authorization = authorization
		}
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
		public var metadata: AnyCodable?

		public init(amount: Int? = nil, expand: [String]? = nil, metadata: AnyCodable? = nil) {
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

		/// Initialize the request parameters
		/// - Parameter authorization: 
		public init(authorization: String) {
			self.authorization = authorization
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/issuing/authorizations/\(inputs.authorization)/decline"
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

/// Returns a list of Issuing <code>Cardholder</code> objects. The objects are sorted in descending order by creation date, with the most recently created object appearing first.
public struct GetIssuingCardholders: StripeAPIEndpoint {
	public typealias inputType = AnyCodable
	public typealias outputType = Output
	public typealias paramType = Params
	
	public struct Params {
		let email: String?
		let ending_before: String?
		let limit: Int?
		let phone_number: String?
		let starting_after: String?
		let status: String?
		let type: String?

		/// Initialize the request parameters
		/// - Parameter email: Only return cardholders that have the given email address.
		/// - Parameter ending_before: A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list.
		/// - Parameter limit: A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10.
		/// - Parameter phone_number: Only return cardholders that have the given phone number.
		/// - Parameter starting_after: A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list.
		/// - Parameter status: Only return cardholders that have the given status. One of `active`, `inactive`, or `blocked`.
		/// - Parameter type: Only return cardholders that have the given type. One of `individual` or `company`.
		public init(email: String? = nil, ending_before: String? = nil, limit: Int? = nil, phone_number: String? = nil, starting_after: String? = nil, status: String? = nil, type: String? = nil) {
			self.email = email
			self.ending_before = ending_before
			self.limit = limit
			self.phone_number = phone_number
			self.starting_after = starting_after
			self.status = status
			self.type = type
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		var params = [String]()
		if let a = inputs.email?.urlEncoded { params.append("email=\(a)") }
		if let a = inputs.ending_before?.urlEncoded { params.append("ending_before=\(a)") }
		if let a = inputs.limit?.urlEncoded { params.append("limit=\(a)") }
		if let a = inputs.phone_number?.urlEncoded { params.append("phone_number=\(a)") }
		if let a = inputs.starting_after?.urlEncoded { params.append("starting_after=\(a)") }
		if let a = inputs.status?.urlEncoded { params.append("status=\(a)") }
		if let a = inputs.type?.urlEncoded { params.append("type=\(a)") }
		let query = params.joined(separator: "&")
		return "/v1/issuing/cardholders?\(query)"
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
	public typealias paramType = AnyCodable
	public static func endpoint(for inputs: AnyCodable) throws -> String {
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
		public var metadata: AnyCodable?
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

		public init(billing: BillingSpecs, name: String, type: TypeValues, company: CompanyParam? = nil, email: String? = nil, expand: [String]? = nil, individual: IndividualParam? = nil, metadata: AnyCodable? = nil, phone_number: String? = nil, spending_controls: AuthorizationControlsParamV2? = nil, status: StatusValues? = nil) {
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
			public var spending_limits: AnyCodable?
			public var spending_limits_currency: String?

			/// Rules that control spending across this cardholder's cards. Refer to our [documentation](https://stripe.com/docs/issuing/controls/spending-controls) for more details.
			/// - Parameters:
			public init(allowed_categories: [String]? = nil, blocked_categories: [String]? = nil, spending_limits: AnyCodable? = nil, spending_limits_currency: String? = nil) {
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
	public typealias inputType = AnyCodable
	public typealias outputType = IssuingCardholder
	public typealias paramType = Params
	
	public struct Params {
		let cardholder: String

		/// Initialize the request parameters
		/// - Parameter cardholder: 
		public init(cardholder: String) {
			self.cardholder = cardholder
		}
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

		/// Initialize the request parameters
		/// - Parameter cardholder: 
		public init(cardholder: String) {
			self.cardholder = cardholder
		}
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
		public var metadata: AnyCodable?
		/// The cardholder's phone number.
		public var phone_number: String?
		/// Rules that control spending across this cardholder's cards. Refer to our [documentation](https://stripe.com/docs/issuing/controls/spending-controls) for more details.
		public var spending_controls: AuthorizationControlsParamV2?
		/// Specifies whether to permit authorizations on this cardholder's cards.
		public var status: StatusValues?

		public init(billing: BillingSpecs? = nil, company: CompanyParam? = nil, email: String? = nil, expand: [String]? = nil, individual: IndividualParam? = nil, metadata: AnyCodable? = nil, phone_number: String? = nil, spending_controls: AuthorizationControlsParamV2? = nil, status: StatusValues? = nil) {
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
			public var spending_limits: AnyCodable?
			public var spending_limits_currency: String?

			/// Rules that control spending across this cardholder's cards. Refer to our [documentation](https://stripe.com/docs/issuing/controls/spending-controls) for more details.
			/// - Parameters:
			public init(allowed_categories: [String]? = nil, blocked_categories: [String]? = nil, spending_limits: AnyCodable? = nil, spending_limits_currency: String? = nil) {
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
	public typealias inputType = AnyCodable
	public typealias outputType = Output
	public typealias paramType = Params
	
	public struct Params {
		let cardholder: String?
		let ending_before: String?
		let exp_month: Int?
		let exp_year: Int?
		let last4: String?
		let limit: Int?
		let starting_after: String?
		let status: String?
		let type: String?

		/// Initialize the request parameters
		/// - Parameter cardholder: Only return cards belonging to the Cardholder with the provided ID.
		/// - Parameter ending_before: A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list.
		/// - Parameter exp_month: Only return cards that have the given expiration month.
		/// - Parameter exp_year: Only return cards that have the given expiration year.
		/// - Parameter last4: Only return cards that have the given last four digits.
		/// - Parameter limit: A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10.
		/// - Parameter starting_after: A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list.
		/// - Parameter status: Only return cards that have the given status. One of `active`, `inactive`, or `canceled`.
		/// - Parameter type: Only return cards that have the given type. One of `virtual` or `physical`.
		public init(cardholder: String? = nil, ending_before: String? = nil, exp_month: Int? = nil, exp_year: Int? = nil, last4: String? = nil, limit: Int? = nil, starting_after: String? = nil, status: String? = nil, type: String? = nil) {
			self.cardholder = cardholder
			self.ending_before = ending_before
			self.exp_month = exp_month
			self.exp_year = exp_year
			self.last4 = last4
			self.limit = limit
			self.starting_after = starting_after
			self.status = status
			self.type = type
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		var params = [String]()
		if let a = inputs.cardholder?.urlEncoded { params.append("cardholder=\(a)") }
		if let a = inputs.ending_before?.urlEncoded { params.append("ending_before=\(a)") }
		if let a = inputs.exp_month?.urlEncoded { params.append("exp_month=\(a)") }
		if let a = inputs.exp_year?.urlEncoded { params.append("exp_year=\(a)") }
		if let a = inputs.last4?.urlEncoded { params.append("last4=\(a)") }
		if let a = inputs.limit?.urlEncoded { params.append("limit=\(a)") }
		if let a = inputs.starting_after?.urlEncoded { params.append("starting_after=\(a)") }
		if let a = inputs.status?.urlEncoded { params.append("status=\(a)") }
		if let a = inputs.type?.urlEncoded { params.append("type=\(a)") }
		let query = params.joined(separator: "&")
		return "/v1/issuing/cards?\(query)"
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
	public typealias paramType = AnyCodable
	public static func endpoint(for inputs: AnyCodable) throws -> String {
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
		public var metadata: AnyCodable?
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

		public init(currency: String, type: TypeValues, cardholder: String? = nil, expand: [String]? = nil, metadata: AnyCodable? = nil, replacement_for: String? = nil, replacement_reason: ReplacementReasonValues? = nil, shipping: ShippingSpecs? = nil, spending_controls: AuthorizationControlsParam? = nil, status: StatusValues? = nil) {
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
			public var spending_limits: AnyCodable?

			/// Rules that control spending for this card. Refer to our [documentation](https://stripe.com/docs/issuing/controls/spending-controls) for more details.
			/// - Parameters:
			public init(allowed_categories: [String]? = nil, blocked_categories: [String]? = nil, spending_limits: AnyCodable? = nil) {
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
	public typealias inputType = AnyCodable
	public typealias outputType = IssuingCard
	public typealias paramType = Params
	
	public struct Params {
		let card: String

		/// Initialize the request parameters
		/// - Parameter card: 
		public init(card: String) {
			self.card = card
		}
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

		/// Initialize the request parameters
		/// - Parameter card: 
		public init(card: String) {
			self.card = card
		}
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
		public var metadata: AnyCodable?
		/// Rules that control spending for this card. Refer to our [documentation](https://stripe.com/docs/issuing/controls/spending-controls) for more details.
		public var spending_controls: AuthorizationControlsParam?
		/// Dictates whether authorizations can be approved on this card. If this card is being canceled because it was lost or stolen, this information should be provided as `cancellation_reason`.
		public var status: StatusValues?

		public init(cancellation_reason: CancellationReasonValues? = nil, expand: [String]? = nil, metadata: AnyCodable? = nil, spending_controls: AuthorizationControlsParam? = nil, status: StatusValues? = nil) {
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
			public var spending_limits: AnyCodable?

			/// Rules that control spending for this card. Refer to our [documentation](https://stripe.com/docs/issuing/controls/spending-controls) for more details.
			/// - Parameters:
			public init(allowed_categories: [String]? = nil, blocked_categories: [String]? = nil, spending_limits: AnyCodable? = nil) {
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
	public typealias inputType = AnyCodable
	public typealias outputType = IssuingDisputeList
	public typealias paramType = Params
	
	public struct Params {
		let ending_before: String?
		let limit: Int?
		let starting_after: String?
		let status: String?
		let transaction: String?

		/// Initialize the request parameters
		/// - Parameter ending_before: A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list.
		/// - Parameter limit: A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10.
		/// - Parameter starting_after: A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list.
		/// - Parameter status: Select Issuing disputes with the given status.
		/// - Parameter transaction: Select the Issuing dispute for the given transaction.
		public init(ending_before: String? = nil, limit: Int? = nil, starting_after: String? = nil, status: String? = nil, transaction: String? = nil) {
			self.ending_before = ending_before
			self.limit = limit
			self.starting_after = starting_after
			self.status = status
			self.transaction = transaction
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		var params = [String]()
		if let a = inputs.ending_before?.urlEncoded { params.append("ending_before=\(a)") }
		if let a = inputs.limit?.urlEncoded { params.append("limit=\(a)") }
		if let a = inputs.starting_after?.urlEncoded { params.append("starting_after=\(a)") }
		if let a = inputs.status?.urlEncoded { params.append("status=\(a)") }
		if let a = inputs.transaction?.urlEncoded { params.append("transaction=\(a)") }
		let query = params.joined(separator: "&")
		return "/v1/issuing/disputes?\(query)"
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
	public typealias paramType = AnyCodable
	public static func endpoint(for inputs: AnyCodable) throws -> String {
		return "/v1/issuing/disputes"
	}

	public final class FormInput: Codable {
		/// Evidence provided for the dispute.
		public var evidence: EvidenceParam?
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?
		/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
		public var metadata: AnyCodable?
		/// The ID of the issuing transaction to create a dispute for.
		public var transaction: String

		public init(transaction: String, evidence: EvidenceParam? = nil, expand: [String]? = nil, metadata: AnyCodable? = nil) {
			self.transaction = transaction
			self.evidence = evidence
			self.expand = expand
			self.metadata = metadata
		}


		/// Evidence provided for the dispute.
		public final class EvidenceParam: Codable {
			public var canceled: AnyCodable?
			public var duplicate: AnyCodable?
			public var fraudulent: AnyCodable?
			public var merchandise_not_as_described: AnyCodable?
			public var not_received: AnyCodable?
			public var other: AnyCodable?
			public var reason: ReasonValues?
			public var service_not_as_described: AnyCodable?

			/// Evidence provided for the dispute.
			/// - Parameters:
			public init(canceled: AnyCodable? = nil, duplicate: AnyCodable? = nil, fraudulent: AnyCodable? = nil, merchandise_not_as_described: AnyCodable? = nil, not_received: AnyCodable? = nil, other: AnyCodable? = nil, reason: ReasonValues? = nil, service_not_as_described: AnyCodable? = nil) {
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
	public typealias inputType = AnyCodable
	public typealias outputType = IssuingDispute
	public typealias paramType = Params
	
	public struct Params {
		let dispute: String

		/// Initialize the request parameters
		/// - Parameter dispute: 
		public init(dispute: String) {
			self.dispute = dispute
		}
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

		/// Initialize the request parameters
		/// - Parameter dispute: 
		public init(dispute: String) {
			self.dispute = dispute
		}
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
		public var metadata: AnyCodable?

		public init(evidence: EvidenceParam? = nil, expand: [String]? = nil, metadata: AnyCodable? = nil) {
			self.evidence = evidence
			self.expand = expand
			self.metadata = metadata
		}


		/// Evidence provided for the dispute.
		public final class EvidenceParam: Codable {
			public var canceled: AnyCodable?
			public var duplicate: AnyCodable?
			public var fraudulent: AnyCodable?
			public var merchandise_not_as_described: AnyCodable?
			public var not_received: AnyCodable?
			public var other: AnyCodable?
			public var reason: ReasonValues?
			public var service_not_as_described: AnyCodable?

			/// Evidence provided for the dispute.
			/// - Parameters:
			public init(canceled: AnyCodable? = nil, duplicate: AnyCodable? = nil, fraudulent: AnyCodable? = nil, merchandise_not_as_described: AnyCodable? = nil, not_received: AnyCodable? = nil, other: AnyCodable? = nil, reason: ReasonValues? = nil, service_not_as_described: AnyCodable? = nil) {
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

		/// Initialize the request parameters
		/// - Parameter dispute: 
		public init(dispute: String) {
			self.dispute = dispute
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/issuing/disputes/\(inputs.dispute)/submit"
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

/// Returns a list of Issuing <code>Settlement</code> objects. The objects are sorted in descending order by creation date, with the most recently created object appearing first.
public struct GetIssuingSettlements: StripeAPIEndpoint {
	public typealias inputType = AnyCodable
	public typealias outputType = Output
	public typealias paramType = Params
	
	public struct Params {
		let ending_before: String?
		let limit: Int?
		let starting_after: String?

		/// Initialize the request parameters
		/// - Parameter ending_before: A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list.
		/// - Parameter limit: A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10.
		/// - Parameter starting_after: A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list.
		public init(ending_before: String? = nil, limit: Int? = nil, starting_after: String? = nil) {
			self.ending_before = ending_before
			self.limit = limit
			self.starting_after = starting_after
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		var params = [String]()
		if let a = inputs.ending_before?.urlEncoded { params.append("ending_before=\(a)") }
		if let a = inputs.limit?.urlEncoded { params.append("limit=\(a)") }
		if let a = inputs.starting_after?.urlEncoded { params.append("starting_after=\(a)") }
		let query = params.joined(separator: "&")
		return "/v1/issuing/settlements?\(query)"
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
	public typealias inputType = AnyCodable
	public typealias outputType = IssuingSettlement
	public typealias paramType = Params
	
	public struct Params {
		let settlement: String

		/// Initialize the request parameters
		/// - Parameter settlement: 
		public init(settlement: String) {
			self.settlement = settlement
		}
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

		/// Initialize the request parameters
		/// - Parameter settlement: 
		public init(settlement: String) {
			self.settlement = settlement
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/issuing/settlements/\(inputs.settlement)"
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

/// Returns a list of Issuing <code>Transaction</code> objects. The objects are sorted in descending order by creation date, with the most recently created object appearing first.
public struct GetIssuingTransactions: StripeAPIEndpoint {
	public typealias inputType = AnyCodable
	public typealias outputType = Output
	public typealias paramType = Params
	
	public struct Params {
		let card: String?
		let cardholder: String?
		let ending_before: String?
		let limit: Int?
		let starting_after: String?
		let type: String?

		/// Initialize the request parameters
		/// - Parameter card: Only return transactions that belong to the given card.
		/// - Parameter cardholder: Only return transactions that belong to the given cardholder.
		/// - Parameter ending_before: A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list.
		/// - Parameter limit: A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10.
		/// - Parameter starting_after: A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list.
		/// - Parameter type: Only return transactions that have the given type. One of `capture` or `refund`.
		public init(card: String? = nil, cardholder: String? = nil, ending_before: String? = nil, limit: Int? = nil, starting_after: String? = nil, type: String? = nil) {
			self.card = card
			self.cardholder = cardholder
			self.ending_before = ending_before
			self.limit = limit
			self.starting_after = starting_after
			self.type = type
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		var params = [String]()
		if let a = inputs.card?.urlEncoded { params.append("card=\(a)") }
		if let a = inputs.cardholder?.urlEncoded { params.append("cardholder=\(a)") }
		if let a = inputs.ending_before?.urlEncoded { params.append("ending_before=\(a)") }
		if let a = inputs.limit?.urlEncoded { params.append("limit=\(a)") }
		if let a = inputs.starting_after?.urlEncoded { params.append("starting_after=\(a)") }
		if let a = inputs.type?.urlEncoded { params.append("type=\(a)") }
		let query = params.joined(separator: "&")
		return "/v1/issuing/transactions?\(query)"
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
	public typealias inputType = AnyCodable
	public typealias outputType = IssuingTransaction
	public typealias paramType = Params
	
	public struct Params {
		let transaction: String

		/// Initialize the request parameters
		/// - Parameter transaction: 
		public init(transaction: String) {
			self.transaction = transaction
		}
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

		/// Initialize the request parameters
		/// - Parameter transaction: 
		public init(transaction: String) {
			self.transaction = transaction
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/issuing/transactions/\(inputs.transaction)"
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
