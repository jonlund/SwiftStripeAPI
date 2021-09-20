
/// Creates a single-use token that represents a bank account’s details. This token can be used with any API method in place of a bank account dictionary. This token can be used only once, by attaching it to a <a href="#accounts">Custom account</a>.
public struct PostTokens: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = Token
	public typealias paramType = AnyCodable
	public static func endpoint(for inputs: AnyCodable) throws -> String {
		return "/v1/tokens"
	}

	public final class FormInput: Codable {
		/// Information for the account this token will represent.
		public var account: ConnectJsAccountTokenSpecs?
		/// The bank account this token will represent.
		public var bank_account: TokenCreateBankAccount?
		public var card: AnyCodable?
		/// The customer (owned by the application's account) for which to create a token. This can be used only with an [OAuth access token](https://stripe.com/docs/connect/standard-accounts) or [Stripe-Account header](https://stripe.com/docs/connect/authentication). For more details, see [Cloning Saved Payment Methods](https://stripe.com/docs/connect/cloning-saved-payment-methods).
		public var customer: String?
		/// The updated CVC value this token will represent.
		public var cvc_update: CvcParams?
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?
		/// Information for the person this token will represent.
		public var person: PersonTokenSpecs?
		/// The PII this token will represent.
		public var pii: PiiTokenSpecs?

		public init(account: ConnectJsAccountTokenSpecs? = nil, bank_account: TokenCreateBankAccount? = nil, card: AnyCodable? = nil, customer: String? = nil, cvc_update: CvcParams? = nil, expand: [String]? = nil, person: PersonTokenSpecs? = nil, pii: PiiTokenSpecs? = nil) {
			self.account = account
			self.bank_account = bank_account
			self.card = card
			self.customer = customer
			self.cvc_update = cvc_update
			self.expand = expand
			self.person = person
			self.pii = pii
		}


		/// Information for the account this token will represent.
		public final class ConnectJsAccountTokenSpecs: Codable {
			public var business_type: BusinessTypeValues?
			public var company: CompanySpecs?
			public var individual: IndividualSpecs?
			public var tos_shown_and_accepted: Bool?

			/// Information for the account this token will represent.
			/// - Parameters:
			public init(business_type: BusinessTypeValues? = nil, company: CompanySpecs? = nil, individual: IndividualSpecs? = nil, tos_shown_and_accepted: Bool? = nil) {
				self.business_type = business_type
				self.company = company
				self.individual = individual
				self.tos_shown_and_accepted = tos_shown_and_accepted
			}


			public final class CompanySpecs: Codable {
				public var address: AddressSpecs?
				public var address_kana: JapanAddressKanaSpecs?
				public var address_kanji: JapanAddressKanjiSpecs?
				public var directors_provided: Bool?
				public var executives_provided: Bool?
				public var name: String?
				public var name_kana: String?
				public var name_kanji: String?
				public var owners_provided: Bool?
				public var phone: String?
				public var registration_number: String?
				public var structure: StructureValues?
				public var tax_id: String?
				public var tax_id_registrar: String?
				public var vat_id: String?
				public var verification: VerificationSpecs?

				public init(address: AddressSpecs? = nil, address_kana: JapanAddressKanaSpecs? = nil, address_kanji: JapanAddressKanjiSpecs? = nil, directors_provided: Bool? = nil, executives_provided: Bool? = nil, name: String? = nil, name_kana: String? = nil, name_kanji: String? = nil, owners_provided: Bool? = nil, phone: String? = nil, registration_number: String? = nil, structure: StructureValues? = nil, tax_id: String? = nil, tax_id_registrar: String? = nil, vat_id: String? = nil, verification: VerificationSpecs? = nil) {
					self.address = address
					self.address_kana = address_kana
					self.address_kanji = address_kanji
					self.directors_provided = directors_provided
					self.executives_provided = executives_provided
					self.name = name
					self.name_kana = name_kana
					self.name_kanji = name_kanji
					self.owners_provided = owners_provided
					self.phone = phone
					self.registration_number = registration_number
					self.structure = structure
					self.tax_id = tax_id
					self.tax_id_registrar = tax_id_registrar
					self.vat_id = vat_id
					self.verification = verification
				}


				public final class AddressSpecs: Codable {
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



				public final class JapanAddressKanaSpecs: Codable {
					public var city: String?
					public var country: String?
					public var line1: String?
					public var line2: String?
					public var postal_code: String?
					public var state: String?
					public var town: String?

					public init(city: String? = nil, country: String? = nil, line1: String? = nil, line2: String? = nil, postal_code: String? = nil, state: String? = nil, town: String? = nil) {
						self.city = city
						self.country = country
						self.line1 = line1
						self.line2 = line2
						self.postal_code = postal_code
						self.state = state
						self.town = town
					}
				}



				public final class JapanAddressKanjiSpecs: Codable {
					public var city: String?
					public var country: String?
					public var line1: String?
					public var line2: String?
					public var postal_code: String?
					public var state: String?
					public var town: String?

					public init(city: String? = nil, country: String? = nil, line1: String? = nil, line2: String? = nil, postal_code: String? = nil, state: String? = nil, town: String? = nil) {
						self.city = city
						self.country = country
						self.line1 = line1
						self.line2 = line2
						self.postal_code = postal_code
						self.state = state
						self.town = town
					}
				}



				public final class VerificationSpecs: Codable {
					public var document: VerificationDocumentSpecs?

					public init(document: VerificationDocumentSpecs? = nil) {
						self.document = document
					}


					public final class VerificationDocumentSpecs: Codable {
						public var back: String?
						public var front: String?

						public init(back: String? = nil, front: String? = nil) {
							self.back = back
							self.front = front
						}
					}

				}


				public enum StructureValues: String, Codable {
					case freeZoneEstablishment = "free_zone_establishment"
					case freeZoneLlc = "free_zone_llc"
					case governmentInstrumentality = "government_instrumentality"
					case governmentalUnit = "governmental_unit"
					case incorporatedNonProfit = "incorporated_non_profit"
					case limitedLiabilityPartnership = "limited_liability_partnership"
					case llc = "llc"
					case multiMemberLlc = "multi_member_llc"
					case privateCompany = "private_company"
					case privateCorporation = "private_corporation"
					case privatePartnership = "private_partnership"
					case publicCompany = "public_company"
					case publicCorporation = "public_corporation"
					case publicPartnership = "public_partnership"
					case singleMemberLlc = "single_member_llc"
					case soleEstablishment = "sole_establishment"
					case soleProprietorship = "sole_proprietorship"
					case taxExemptGovernmentInstrumentality = "tax_exempt_government_instrumentality"
					case unincorporatedAssociation = "unincorporated_association"
					case unincorporatedNonProfit = "unincorporated_non_profit"
				}
			}



			public final class IndividualSpecs: Codable {
				public var address: AddressSpecs?
				public var address_kana: JapanAddressKanaSpecs?
				public var address_kanji: JapanAddressKanjiSpecs?
				public var dob: AnyCodable?
				public var email: String?
				public var first_name: String?
				public var first_name_kana: String?
				public var first_name_kanji: String?
				public var full_name_aliases: [String]?
				public var gender: String?
				public var id_number: String?
				public var last_name: String?
				public var last_name_kana: String?
				public var last_name_kanji: String?
				public var maiden_name: String?
				public var metadata: AnyCodable?
				public var phone: String?
				public var political_exposure: PoliticalExposureValues?
				public var ssn_last_4: String?
				public var verification: PersonVerificationSpecs?

				public init(address: AddressSpecs? = nil, address_kana: JapanAddressKanaSpecs? = nil, address_kanji: JapanAddressKanjiSpecs? = nil, dob: AnyCodable? = nil, email: String? = nil, first_name: String? = nil, first_name_kana: String? = nil, first_name_kanji: String? = nil, full_name_aliases: [String]? = nil, gender: String? = nil, id_number: String? = nil, last_name: String? = nil, last_name_kana: String? = nil, last_name_kanji: String? = nil, maiden_name: String? = nil, metadata: AnyCodable? = nil, phone: String? = nil, political_exposure: PoliticalExposureValues? = nil, ssn_last_4: String? = nil, verification: PersonVerificationSpecs? = nil) {
					self.address = address
					self.address_kana = address_kana
					self.address_kanji = address_kanji
					self.dob = dob
					self.email = email
					self.first_name = first_name
					self.first_name_kana = first_name_kana
					self.first_name_kanji = first_name_kanji
					self.full_name_aliases = full_name_aliases
					self.gender = gender
					self.id_number = id_number
					self.last_name = last_name
					self.last_name_kana = last_name_kana
					self.last_name_kanji = last_name_kanji
					self.maiden_name = maiden_name
					self.metadata = metadata
					self.phone = phone
					self.political_exposure = political_exposure
					self.ssn_last_4 = ssn_last_4
					self.verification = verification
				}


				public final class AddressSpecs: Codable {
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



				public final class JapanAddressKanaSpecs: Codable {
					public var city: String?
					public var country: String?
					public var line1: String?
					public var line2: String?
					public var postal_code: String?
					public var state: String?
					public var town: String?

					public init(city: String? = nil, country: String? = nil, line1: String? = nil, line2: String? = nil, postal_code: String? = nil, state: String? = nil, town: String? = nil) {
						self.city = city
						self.country = country
						self.line1 = line1
						self.line2 = line2
						self.postal_code = postal_code
						self.state = state
						self.town = town
					}
				}



				public final class JapanAddressKanjiSpecs: Codable {
					public var city: String?
					public var country: String?
					public var line1: String?
					public var line2: String?
					public var postal_code: String?
					public var state: String?
					public var town: String?

					public init(city: String? = nil, country: String? = nil, line1: String? = nil, line2: String? = nil, postal_code: String? = nil, state: String? = nil, town: String? = nil) {
						self.city = city
						self.country = country
						self.line1 = line1
						self.line2 = line2
						self.postal_code = postal_code
						self.state = state
						self.town = town
					}
				}



				public final class PersonVerificationSpecs: Codable {
					public var additional_document: PersonVerificationDocumentSpecs?
					public var document: PersonVerificationDocumentSpecs?

					public init(additional_document: PersonVerificationDocumentSpecs? = nil, document: PersonVerificationDocumentSpecs? = nil) {
						self.additional_document = additional_document
						self.document = document
					}


					public final class PersonVerificationDocumentSpecs: Codable {
						public var back: String?
						public var front: String?

						public init(back: String? = nil, front: String? = nil) {
							self.back = back
							self.front = front
						}
					}

				}


				public enum PoliticalExposureValues: String, Codable {
					case existing = "existing"
					case none = "none"
				}
			}


			public enum BusinessTypeValues: String, Codable {
				case company = "company"
				case governmentEntity = "government_entity"
				case individual = "individual"
				case nonProfit = "non_profit"
			}
		}



		/// The updated CVC value this token will represent.
		public final class CvcParams: Codable {
			public var cvc: String

			/// The updated CVC value this token will represent.
			/// - Parameters:
			///   - cvc: 
			public init(cvc: String) {
				self.cvc = cvc
			}
		}



		/// Information for the person this token will represent.
		public final class PersonTokenSpecs: Codable {
			public var address: AddressSpecs?
			public var address_kana: JapanAddressKanaSpecs?
			public var address_kanji: JapanAddressKanjiSpecs?
			public var dob: AnyCodable?
			public var documents: PersonDocumentsSpecs?
			public var email: String?
			public var first_name: String?
			public var first_name_kana: String?
			public var first_name_kanji: String?
			public var full_name_aliases: [String]?
			public var gender: String?
			public var id_number: String?
			public var last_name: String?
			public var last_name_kana: String?
			public var last_name_kanji: String?
			public var maiden_name: String?
			public var metadata: AnyCodable?
			public var nationality: String?
			public var phone: String?
			public var political_exposure: String?
			public var relationship: RelationshipSpecs?
			public var ssn_last_4: String?
			public var verification: PersonVerificationSpecs?

			/// Information for the person this token will represent.
			/// - Parameters:
			public init(address: AddressSpecs? = nil, address_kana: JapanAddressKanaSpecs? = nil, address_kanji: JapanAddressKanjiSpecs? = nil, dob: AnyCodable? = nil, documents: PersonDocumentsSpecs? = nil, email: String? = nil, first_name: String? = nil, first_name_kana: String? = nil, first_name_kanji: String? = nil, full_name_aliases: [String]? = nil, gender: String? = nil, id_number: String? = nil, last_name: String? = nil, last_name_kana: String? = nil, last_name_kanji: String? = nil, maiden_name: String? = nil, metadata: AnyCodable? = nil, nationality: String? = nil, phone: String? = nil, political_exposure: String? = nil, relationship: RelationshipSpecs? = nil, ssn_last_4: String? = nil, verification: PersonVerificationSpecs? = nil) {
				self.address = address
				self.address_kana = address_kana
				self.address_kanji = address_kanji
				self.dob = dob
				self.documents = documents
				self.email = email
				self.first_name = first_name
				self.first_name_kana = first_name_kana
				self.first_name_kanji = first_name_kanji
				self.full_name_aliases = full_name_aliases
				self.gender = gender
				self.id_number = id_number
				self.last_name = last_name
				self.last_name_kana = last_name_kana
				self.last_name_kanji = last_name_kanji
				self.maiden_name = maiden_name
				self.metadata = metadata
				self.nationality = nationality
				self.phone = phone
				self.political_exposure = political_exposure
				self.relationship = relationship
				self.ssn_last_4 = ssn_last_4
				self.verification = verification
			}


			public final class AddressSpecs: Codable {
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



			public final class JapanAddressKanaSpecs: Codable {
				public var city: String?
				public var country: String?
				public var line1: String?
				public var line2: String?
				public var postal_code: String?
				public var state: String?
				public var town: String?

				public init(city: String? = nil, country: String? = nil, line1: String? = nil, line2: String? = nil, postal_code: String? = nil, state: String? = nil, town: String? = nil) {
					self.city = city
					self.country = country
					self.line1 = line1
					self.line2 = line2
					self.postal_code = postal_code
					self.state = state
					self.town = town
				}
			}



			public final class JapanAddressKanjiSpecs: Codable {
				public var city: String?
				public var country: String?
				public var line1: String?
				public var line2: String?
				public var postal_code: String?
				public var state: String?
				public var town: String?

				public init(city: String? = nil, country: String? = nil, line1: String? = nil, line2: String? = nil, postal_code: String? = nil, state: String? = nil, town: String? = nil) {
					self.city = city
					self.country = country
					self.line1 = line1
					self.line2 = line2
					self.postal_code = postal_code
					self.state = state
					self.town = town
				}
			}



			public final class PersonDocumentsSpecs: Codable {
				public var company_authorization: DocumentsParam?
				public var passport: DocumentsParam?
				public var visa: DocumentsParam?

				public init(company_authorization: DocumentsParam? = nil, passport: DocumentsParam? = nil, visa: DocumentsParam? = nil) {
					self.company_authorization = company_authorization
					self.passport = passport
					self.visa = visa
				}


				public final class DocumentsParam: Codable {
					public var files: [String]?

					public init(files: [String]? = nil) {
						self.files = files
					}
				}

			}



			public final class PersonVerificationSpecs: Codable {
				public var additional_document: PersonVerificationDocumentSpecs?
				public var document: PersonVerificationDocumentSpecs?

				public init(additional_document: PersonVerificationDocumentSpecs? = nil, document: PersonVerificationDocumentSpecs? = nil) {
					self.additional_document = additional_document
					self.document = document
				}


				public final class PersonVerificationDocumentSpecs: Codable {
					public var back: String?
					public var front: String?

					public init(back: String? = nil, front: String? = nil) {
						self.back = back
						self.front = front
					}
				}

			}



			public final class RelationshipSpecs: Codable {
				public var director: Bool?
				public var executive: Bool?
				public var owner: Bool?
				public var percent_ownership: StringNumber?
				public var representative: Bool?
				public var title: String?

				public init(director: Bool? = nil, executive: Bool? = nil, owner: Bool? = nil, percent_ownership: StringNumber? = nil, representative: Bool? = nil, title: String? = nil) {
					self.director = director
					self.executive = executive
					self.owner = owner
					self.percent_ownership = percent_ownership
					self.representative = representative
					self.title = title
				}
			}

		}



		/// The PII this token will represent.
		public final class PiiTokenSpecs: Codable {
			public var id_number: String?

			/// The PII this token will represent.
			/// - Parameters:
			public init(id_number: String? = nil) {
				self.id_number = id_number
			}
		}



		/// The bank account this token will represent.
		public final class TokenCreateBankAccount: Codable {
			public var account_holder_name: String?
			public var account_holder_type: AccountHolderTypeValues?
			public var account_number: String
			public var account_type: AccountTypeValues?
			public var country: String
			public var currency: String?
			public var routing_number: String?

			/// The bank account this token will represent.
			/// - Parameters:
			///   - account_number: 
			///   - country: 
			public init(account_number: String, country: String, account_holder_name: String? = nil, account_holder_type: AccountHolderTypeValues? = nil, account_type: AccountTypeValues? = nil, currency: String? = nil, routing_number: String? = nil) {
				self.account_number = account_number
				self.country = country
				self.account_holder_name = account_holder_name
				self.account_holder_type = account_holder_type
				self.account_type = account_type
				self.currency = currency
				self.routing_number = routing_number
			}

			public enum AccountHolderTypeValues: String, Codable {
				case company = "company"
				case individual = "individual"
			}

			public enum AccountTypeValues: String, Codable {
				case checking = "checking"
				case futsu = "futsu"
				case savings = "savings"
				case toza = "toza"
			}
		}

	}

}

/// Retrieves the token with the given ID.
public struct GetTokensToken: StripeAPIEndpoint {
	public typealias inputType = AnyCodable
	public typealias outputType = Token
	public typealias paramType = Params
	
	public struct Params {
		let token: String

		/// Initialize the request parameters
		/// - Parameter token: 
		public init(token: String) {
			self.token = token
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/tokens/\(inputs.token)"
	}
	public static var method: HTTPMethod { return .GET }

}
