
/// Retrieves the details of an account.
public struct GetAccount: StripeAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = Account
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v1/account"
	}
	public static var method: HTTPMethod { return .GET }

}

/// Updates a connected <a href="/docs/connect/accounts">Express or Custom account</a> by setting the values of the parameters passed. Any parameters not provided are left unchanged. Most parameters can be changed only for Custom accounts. (These are marked <strong>Custom Only</strong> below.) Parameters marked <strong>Custom and Express</strong> are supported by both account types.  To update your own account, use the <a href="https://dashboard.stripe.com/account">Dashboard</a>. Refer to our <a href="/docs/connect/updating-accounts">Connect</a> documentation to learn more about updating accounts.
public struct PostAccount: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = Account
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v1/account"
	}

	public class FormInput: Codable {
		/// An [account token](https://stripe.com/docs/api#create_account_token), used to securely provide details to the account.
		public var account_token: String?
		/// Either a token, like the ones returned by [Stripe.js](https://stripe.com/docs/stripe.js), or a dictionary containing a user's bank account details.
		public var bank_account: MESSED_UP?
		/// Business information about the account.
		public var business_profile: BusinessProfileSpecs?
		/// The business type.
		public var business_type: BusinessTypeValues?
		/// Each key of the dictionary represents a capability, and each capability maps to its settings (e.g. whether it has been requested or not). Each capability will be inactive until you have provided its specific requirements and Stripe has verified them. An account may have some of its requested capabilities be active and some be inactive.
		public var capabilities: CapabilitiesParam?
		/// Information about the company or business. This field is available for any `business_type`.
		public var company: CompanySpecs?
		/// Three-letter ISO currency code representing the default currency for the account. This must be a currency that [Stripe supports in the account's country](https://stripe.com/docs/payouts).
		public var default_currency: String?
		/// Documents that may be submitted to satisfy various informational requests.
		public var documents: DocumentsSpecs?
		/// The email address of the account holder. This is only to make the account easier to identify to you. Stripe will never directly email Custom accounts.
		public var email: String?
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?
		/// A card or bank account to attach to the account for receiving [payouts](https://stripe.com/docs/connect/bank-debit-card-payouts) (you won’t be able to use it for top-ups). You can provide either a token, like the ones returned by [Stripe.js](https://stripe.com/docs/stripe.js), or a dictionary, as documented in the `external_account` parameter for [bank account](https://stripe.com/docs/api#account_create_bank_account) creation. <br><br>By default, providing an external account sets it as the new default external account for its currency, and deletes the old default if one exists. To add additional external accounts without replacing the existing default for the currency, use the bank account or card creation API.
		public var external_account: String?
		/// Information about the person represented by the account. This field is null unless `business_type` is set to `individual`.
		public var individual: IndividualSpecs?
		/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
		public var metadata: MESSED_UP?
		/// Options for customizing how the account functions within Stripe.
		public var settings: SettingsSpecs?
		/// Details on the account's acceptance of the [Stripe Services Agreement](https://stripe.com/docs/connect/updating-accounts#tos-acceptance).
		public var tos_acceptance: TosAcceptanceSpecs?

		public init(account_token: String? = nil, bank_account: MESSED_UP? = nil, business_profile: BusinessProfileSpecs? = nil, business_type: BusinessTypeValues? = nil, capabilities: CapabilitiesParam? = nil, company: CompanySpecs? = nil, default_currency: String? = nil, documents: DocumentsSpecs? = nil, email: String? = nil, expand: [String]? = nil, external_account: String? = nil, individual: IndividualSpecs? = nil, metadata: MESSED_UP? = nil, settings: SettingsSpecs? = nil, tos_acceptance: TosAcceptanceSpecs? = nil) {
			self.account_token = account_token
			self.bank_account = bank_account
			self.business_profile = business_profile
			self.business_type = business_type
			self.capabilities = capabilities
			self.company = company
			self.default_currency = default_currency
			self.documents = documents
			self.email = email
			self.expand = expand
			self.external_account = external_account
			self.individual = individual
			self.metadata = metadata
			self.settings = settings
			self.tos_acceptance = tos_acceptance
		}


		/// Documents that may be submitted to satisfy various informational requests.
		public class DocumentsSpecs: Codable {
			public var bank_account_ownership_verification: DocumentsParam?
			public var company_license: DocumentsParam?
			public var company_memorandum_of_association: DocumentsParam?
			public var company_ministerial_decree: DocumentsParam?
			public var company_registration_verification: DocumentsParam?
			public var company_tax_id_verification: DocumentsParam?

			/// Documents that may be submitted to satisfy various informational requests.
			/// - Parameters:
			public init(bank_account_ownership_verification: DocumentsParam? = nil, company_license: DocumentsParam? = nil, company_memorandum_of_association: DocumentsParam? = nil, company_ministerial_decree: DocumentsParam? = nil, company_registration_verification: DocumentsParam? = nil, company_tax_id_verification: DocumentsParam? = nil) {
				self.bank_account_ownership_verification = bank_account_ownership_verification
				self.company_license = company_license
				self.company_memorandum_of_association = company_memorandum_of_association
				self.company_ministerial_decree = company_ministerial_decree
				self.company_registration_verification = company_registration_verification
				self.company_tax_id_verification = company_tax_id_verification
			}


			public class DocumentsParam: Codable {
				public var files: [String]?

				public init(files: [String]? = nil) {
					self.files = files
				}
			}

		}



		/// Each key of the dictionary represents a capability, and each capability maps to its settings (e.g. whether it has been requested or not). Each capability will be inactive until you have provided its specific requirements and Stripe has verified them. An account may have some of its requested capabilities be active and some be inactive.
		public class CapabilitiesParam: Codable {
			public var au_becs_debit_payments: CapabilityParam?
			public var bacs_debit_payments: CapabilityParam?
			public var bancontact_payments: CapabilityParam?
			public var card_issuing: CapabilityParam?
			public var card_payments: CapabilityParam?
			public var cartes_bancaires_payments: CapabilityParam?
			public var eps_payments: CapabilityParam?
			public var fpx_payments: CapabilityParam?
			public var giropay_payments: CapabilityParam?
			public var grabpay_payments: CapabilityParam?
			public var ideal_payments: CapabilityParam?
			public var jcb_payments: CapabilityParam?
			public var legacy_payments: CapabilityParam?
			public var oxxo_payments: CapabilityParam?
			public var p24_payments: CapabilityParam?
			public var sepa_debit_payments: CapabilityParam?
			public var sofort_payments: CapabilityParam?
			public var tax_reporting_us_1099_k: CapabilityParam?
			public var tax_reporting_us_1099_misc: CapabilityParam?
			public var transfers: CapabilityParam?

			/// Each key of the dictionary represents a capability, and each capability maps to its settings (e.g. whether it has been requested or not). Each capability will be inactive until you have provided its specific requirements and Stripe has verified them. An account may have some of its requested capabilities be active and some be inactive.
			/// - Parameters:
			public init(au_becs_debit_payments: CapabilityParam? = nil, bacs_debit_payments: CapabilityParam? = nil, bancontact_payments: CapabilityParam? = nil, card_issuing: CapabilityParam? = nil, card_payments: CapabilityParam? = nil, cartes_bancaires_payments: CapabilityParam? = nil, eps_payments: CapabilityParam? = nil, fpx_payments: CapabilityParam? = nil, giropay_payments: CapabilityParam? = nil, grabpay_payments: CapabilityParam? = nil, ideal_payments: CapabilityParam? = nil, jcb_payments: CapabilityParam? = nil, legacy_payments: CapabilityParam? = nil, oxxo_payments: CapabilityParam? = nil, p24_payments: CapabilityParam? = nil, sepa_debit_payments: CapabilityParam? = nil, sofort_payments: CapabilityParam? = nil, tax_reporting_us_1099_k: CapabilityParam? = nil, tax_reporting_us_1099_misc: CapabilityParam? = nil, transfers: CapabilityParam? = nil) {
				self.au_becs_debit_payments = au_becs_debit_payments
				self.bacs_debit_payments = bacs_debit_payments
				self.bancontact_payments = bancontact_payments
				self.card_issuing = card_issuing
				self.card_payments = card_payments
				self.cartes_bancaires_payments = cartes_bancaires_payments
				self.eps_payments = eps_payments
				self.fpx_payments = fpx_payments
				self.giropay_payments = giropay_payments
				self.grabpay_payments = grabpay_payments
				self.ideal_payments = ideal_payments
				self.jcb_payments = jcb_payments
				self.legacy_payments = legacy_payments
				self.oxxo_payments = oxxo_payments
				self.p24_payments = p24_payments
				self.sepa_debit_payments = sepa_debit_payments
				self.sofort_payments = sofort_payments
				self.tax_reporting_us_1099_k = tax_reporting_us_1099_k
				self.tax_reporting_us_1099_misc = tax_reporting_us_1099_misc
				self.transfers = transfers
			}


			public class CapabilityParam: Codable {
				public var requested: Bool?

				public init(requested: Bool? = nil) {
					self.requested = requested
				}
			}

		}



		/// Information about the person represented by the account. This field is null unless `business_type` is set to `individual`.
		public class IndividualSpecs: Codable {
			public var address: AddressSpecs?
			public var address_kana: JapanAddressKanaSpecs?
			public var address_kanji: JapanAddressKanjiSpecs?
			public var dob: MESSED_UP?
			public var email: String?
			public var first_name: String?
			public var first_name_kana: String?
			public var first_name_kanji: String?
			public var gender: String?
			public var id_number: String?
			public var last_name: String?
			public var last_name_kana: String?
			public var last_name_kanji: String?
			public var maiden_name: String?
			public var metadata: MESSED_UP?
			public var phone: String?
			public var political_exposure: PoliticalExposureValues?
			public var ssn_last_4: String?
			public var verification: PersonVerificationSpecs?

			/// Information about the person represented by the account. This field is null unless `business_type` is set to `individual`.
			/// - Parameters:
			public init(address: AddressSpecs? = nil, address_kana: JapanAddressKanaSpecs? = nil, address_kanji: JapanAddressKanjiSpecs? = nil, dob: MESSED_UP? = nil, email: String? = nil, first_name: String? = nil, first_name_kana: String? = nil, first_name_kanji: String? = nil, gender: String? = nil, id_number: String? = nil, last_name: String? = nil, last_name_kana: String? = nil, last_name_kanji: String? = nil, maiden_name: String? = nil, metadata: MESSED_UP? = nil, phone: String? = nil, political_exposure: PoliticalExposureValues? = nil, ssn_last_4: String? = nil, verification: PersonVerificationSpecs? = nil) {
				self.address = address
				self.address_kana = address_kana
				self.address_kanji = address_kanji
				self.dob = dob
				self.email = email
				self.first_name = first_name
				self.first_name_kana = first_name_kana
				self.first_name_kanji = first_name_kanji
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


			public class JapanAddressKanaSpecs: Codable {
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



			public class JapanAddressKanjiSpecs: Codable {
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



			public class AddressSpecs: Codable {
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



			public class PersonVerificationSpecs: Codable {
				public var additional_document: PersonVerificationDocumentSpecs?
				public var document: PersonVerificationDocumentSpecs?

				public init(additional_document: PersonVerificationDocumentSpecs? = nil, document: PersonVerificationDocumentSpecs? = nil) {
					self.additional_document = additional_document
					self.document = document
				}


				public class PersonVerificationDocumentSpecs: Codable {
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



		/// Details on the account's acceptance of the [Stripe Services Agreement](https://stripe.com/docs/connect/updating-accounts#tos-acceptance).
		public class TosAcceptanceSpecs: Codable {
			public var date: Timestamp?
			public var ip: String?
			public var service_agreement: String?
			public var user_agent: String?

			/// Details on the account's acceptance of the [Stripe Services Agreement](https://stripe.com/docs/connect/updating-accounts#tos-acceptance).
			/// - Parameters:
			public init(date: Timestamp? = nil, ip: String? = nil, service_agreement: String? = nil, user_agent: String? = nil) {
				self.date = date
				self.ip = ip
				self.service_agreement = service_agreement
				self.user_agent = user_agent
			}
		}



		/// Business information about the account.
		public class BusinessProfileSpecs: Codable {
			public var mcc: String?
			public var name: String?
			public var product_description: String?
			public var support_address: AddressSpecs?
			public var support_email: String?
			public var support_phone: String?
			public var support_url: String?
			public var url: String?

			/// Business information about the account.
			/// - Parameters:
			public init(mcc: String? = nil, name: String? = nil, product_description: String? = nil, support_address: AddressSpecs? = nil, support_email: String? = nil, support_phone: String? = nil, support_url: String? = nil, url: String? = nil) {
				self.mcc = mcc
				self.name = name
				self.product_description = product_description
				self.support_address = support_address
				self.support_email = support_email
				self.support_phone = support_phone
				self.support_url = support_url
				self.url = url
			}


			public class AddressSpecs: Codable {
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



		/// Options for customizing how the account functions within Stripe.
		public class SettingsSpecs: Codable {
			public var branding: BrandingSettingsSpecs?
			public var card_payments: CardPaymentsSettingsSpecs?
			public var payments: PaymentsSettingsSpecs?
			public var payouts: PayoutSettingsSpecs?

			/// Options for customizing how the account functions within Stripe.
			/// - Parameters:
			public init(branding: BrandingSettingsSpecs? = nil, card_payments: CardPaymentsSettingsSpecs? = nil, payments: PaymentsSettingsSpecs? = nil, payouts: PayoutSettingsSpecs? = nil) {
				self.branding = branding
				self.card_payments = card_payments
				self.payments = payments
				self.payouts = payouts
			}


			public class PaymentsSettingsSpecs: Codable {
				public var statement_descriptor: String?
				public var statement_descriptor_kana: String?
				public var statement_descriptor_kanji: String?

				public init(statement_descriptor: String? = nil, statement_descriptor_kana: String? = nil, statement_descriptor_kanji: String? = nil) {
					self.statement_descriptor = statement_descriptor
					self.statement_descriptor_kana = statement_descriptor_kana
					self.statement_descriptor_kanji = statement_descriptor_kanji
				}
			}



			public class BrandingSettingsSpecs: Codable {
				public var icon: String?
				public var logo: String?
				public var primary_color: String?
				public var secondary_color: String?

				public init(icon: String? = nil, logo: String? = nil, primary_color: String? = nil, secondary_color: String? = nil) {
					self.icon = icon
					self.logo = logo
					self.primary_color = primary_color
					self.secondary_color = secondary_color
				}
			}



			public class CardPaymentsSettingsSpecs: Codable {
				public var decline_on: DeclineChargeOnSpecs?
				public var statement_descriptor_prefix: String?

				public init(decline_on: DeclineChargeOnSpecs? = nil, statement_descriptor_prefix: String? = nil) {
					self.decline_on = decline_on
					self.statement_descriptor_prefix = statement_descriptor_prefix
				}


				public class DeclineChargeOnSpecs: Codable {
					public var avs_failure: Bool?
					public var cvc_failure: Bool?

					public init(avs_failure: Bool? = nil, cvc_failure: Bool? = nil) {
						self.avs_failure = avs_failure
						self.cvc_failure = cvc_failure
					}
				}

			}



			public class PayoutSettingsSpecs: Codable {
				public var debit_negative_balances: Bool?
				public var schedule: TransferScheduleSpecs?
				public var statement_descriptor: String?

				public init(debit_negative_balances: Bool? = nil, schedule: TransferScheduleSpecs? = nil, statement_descriptor: String? = nil) {
					self.debit_negative_balances = debit_negative_balances
					self.schedule = schedule
					self.statement_descriptor = statement_descriptor
				}


				public class TransferScheduleSpecs: Codable {
					public var delay_days: String?
					public var interval: IntervalValues?
					public var monthly_anchor: Int?
					public var weekly_anchor: WeeklyAnchorValues?

					public init(delay_days: String? = nil, interval: IntervalValues? = nil, monthly_anchor: Int? = nil, weekly_anchor: WeeklyAnchorValues? = nil) {
						self.delay_days = delay_days
						self.interval = interval
						self.monthly_anchor = monthly_anchor
						self.weekly_anchor = weekly_anchor
					}

					public enum IntervalValues: String, Codable {
						case daily = "daily"
						case manual = "manual"
						case monthly = "monthly"
						case weekly = "weekly"
					}

					public enum WeeklyAnchorValues: String, Codable {
						case friday = "friday"
						case monday = "monday"
						case saturday = "saturday"
						case sunday = "sunday"
						case thursday = "thursday"
						case tuesday = "tuesday"
						case wednesday = "wednesday"
					}
				}

			}

		}



		/// Information about the company or business. This field is available for any `business_type`.
		public class CompanySpecs: Codable {
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

			/// Information about the company or business. This field is available for any `business_type`.
			/// - Parameters:
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


			public class JapanAddressKanaSpecs: Codable {
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



			public class VerificationSpecs: Codable {
				public var document: VerificationDocumentSpecs?

				public init(document: VerificationDocumentSpecs? = nil) {
					self.document = document
				}


				public class VerificationDocumentSpecs: Codable {
					public var back: String?
					public var front: String?

					public init(back: String? = nil, front: String? = nil) {
						self.back = back
						self.front = front
					}
				}

			}



			public class JapanAddressKanjiSpecs: Codable {
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



			public class AddressSpecs: Codable {
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


			public enum StructureValues: String, Codable {
				case governmentInstrumentality = "government_instrumentality"
				case governmentalUnit = "governmental_unit"
				case incorporatedNonProfit = "incorporated_non_profit"
				case limitedLiabilityPartnership = "limited_liability_partnership"
				case multiMemberLlc = "multi_member_llc"
				case privateCompany = "private_company"
				case privateCorporation = "private_corporation"
				case privatePartnership = "private_partnership"
				case publicCompany = "public_company"
				case publicCorporation = "public_corporation"
				case publicPartnership = "public_partnership"
				case soleProprietorship = "sole_proprietorship"
				case taxExemptGovernmentInstrumentality = "tax_exempt_government_instrumentality"
				case unincorporatedAssociation = "unincorporated_association"
				case unincorporatedNonProfit = "unincorporated_non_profit"
			}
		}


		public enum BusinessTypeValues: String, Codable {
			case company = "company"
			case governmentEntity = "government_entity"
			case individual = "individual"
			case nonProfit = "non_profit"
		}
	}

}

/// With <a href="/docs/connect">Connect</a>, you can delete Custom or Express accounts you manage.  Accounts created using test-mode keys can be deleted at any time. Accounts created using live-mode keys can only be deleted once all balances are zero.  If you want to delete your own account, use the <a href="https://dashboard.stripe.com/account">account information tab in your account settings</a> instead.
public struct DeleteAccount: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = DeletedAccount
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v1/account"
	}
	public static var method: HTTPMethod { return .DELETE }

	public class FormInput: Codable {
		public var account: String?

		public init(account: String? = nil) {
			self.account = account
		}
	}

}

/// Create an external account for a given account.
public struct PostAccountBankAccounts: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = ExternalAccount
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v1/account/bank_accounts"
	}

	public class FormInput: Codable {
		/// Either a token, like the ones returned by [Stripe.js](https://stripe.com/docs/stripe.js), or a dictionary containing a user's bank account details.
		public var bank_account: MESSED_UP?
		/// When set to true, or if this is the first external account added in this currency, this account becomes the default external account for its currency.
		public var default_for_currency: Bool?
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?
		/// Please refer to full [documentation](https://stripe.com/docs/api) instead.
		public var external_account: String?
		/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
		public var metadata: String?

		public init(bank_account: MESSED_UP? = nil, default_for_currency: Bool? = nil, expand: [String]? = nil, external_account: String? = nil, metadata: String? = nil) {
			self.bank_account = bank_account
			self.default_for_currency = default_for_currency
			self.expand = expand
			self.external_account = external_account
			self.metadata = metadata
		}
	}

}

/// Retrieve a specified external account for a given account.
public struct GetAccountBankAccountsId: StripeAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = ExternalAccount
	public typealias paramType = Params
	public struct Params {
		let id: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/account/bank_accounts/\(inputs.id)"
	}
	public static var method: HTTPMethod { return .GET }

}

/// Updates the metadata, account holder name, and account holder type of a bank account belonging to a <a href="/docs/connect/custom-accounts">Custom account</a>, and optionally sets it as the default for its currency. Other bank account details are not editable by design.  You can re-enable a disabled bank account by performing an update call without providing any arguments or changes.
public struct PostAccountBankAccountsId: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = ExternalAccount
	public typealias paramType = Params
	public struct Params {
		let id: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/account/bank_accounts/\(inputs.id)"
	}

	public class FormInput: Codable {
		/// The name of the person or business that owns the bank account.
		public var account_holder_name: String?
		/// The type of entity that holds the account. This can be either `individual` or `company`.
		public var account_holder_type: AccountHolderTypeValues?
		/// City/District/Suburb/Town/Village.
		public var address_city: String?
		/// Billing address country, if provided when creating card.
		public var address_country: String?
		/// Address line 1 (Street address/PO Box/Company name).
		public var address_line1: String?
		/// Address line 2 (Apartment/Suite/Unit/Building).
		public var address_line2: String?
		/// State/County/Province/Region.
		public var address_state: String?
		/// ZIP or postal code.
		public var address_zip: String?
		/// When set to true, this becomes the default external account for its currency.
		public var default_for_currency: Bool?
		/// Two digit number representing the card’s expiration month.
		public var exp_month: String?
		/// Four digit number representing the card’s expiration year.
		public var exp_year: String?
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?
		/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
		public var metadata: MESSED_UP?
		/// Cardholder name.
		public var name: String?

		public init(account_holder_name: String? = nil, account_holder_type: AccountHolderTypeValues? = nil, address_city: String? = nil, address_country: String? = nil, address_line1: String? = nil, address_line2: String? = nil, address_state: String? = nil, address_zip: String? = nil, default_for_currency: Bool? = nil, exp_month: String? = nil, exp_year: String? = nil, expand: [String]? = nil, metadata: MESSED_UP? = nil, name: String? = nil) {
			self.account_holder_name = account_holder_name
			self.account_holder_type = account_holder_type
			self.address_city = address_city
			self.address_country = address_country
			self.address_line1 = address_line1
			self.address_line2 = address_line2
			self.address_state = address_state
			self.address_zip = address_zip
			self.default_for_currency = default_for_currency
			self.exp_month = exp_month
			self.exp_year = exp_year
			self.expand = expand
			self.metadata = metadata
			self.name = name
		}

		public enum AccountHolderTypeValues: String, Codable {
			case company = "company"
			case individual = "individual"
		}
	}

}

/// Delete a specified external account for a given account.
public struct DeleteAccountBankAccountsId: StripeAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = DeletedExternalAccount
	public typealias paramType = Params
	public struct Params {
		let id: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/account/bank_accounts/\(inputs.id)"
	}
	public static var method: HTTPMethod { return .DELETE }

}

/// Returns a list of capabilities associated with the account. The capabilities are returned sorted by creation date, with the most recent capability appearing first.
public struct GetAccountCapabilities: StripeAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = ListAccountCapability
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v1/account/capabilities"
	}
	public static var method: HTTPMethod { return .GET }

	public class ListAccountCapability: Codable {
		public var data: [Capability]
		/// True if this list has another page of items after this one that can be fetched.
		public var has_more: Bool
		/// String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
		public var object: ObjectValues
		/// The URL where this list can be accessed.
		public var url: String

		public init(data: [Capability], has_more: Bool, object: ObjectValues, url: String) {
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

/// Retrieves information about the specified Account Capability.
public struct GetAccountCapabilitiesCapability: StripeAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = Capability
	public typealias paramType = Params
	public struct Params {
		let capability: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/account/capabilities/\(inputs.capability)"
	}
	public static var method: HTTPMethod { return .GET }

}

/// Updates an existing Account Capability.
public struct PostAccountCapabilitiesCapability: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = Capability
	public typealias paramType = Params
	public struct Params {
		let capability: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/account/capabilities/\(inputs.capability)"
	}

	public class FormInput: Codable {
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?
		/// Passing true requests the capability for the account, if it is not already requested. A requested capability may not immediately become active. Any requirements to activate the capability are returned in the `requirements` arrays.
		public var requested: Bool?

		public init(expand: [String]? = nil, requested: Bool? = nil) {
			self.expand = expand
			self.requested = requested
		}
	}

}

/// List external accounts for an account.
public struct GetAccountExternalAccounts: StripeAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = ExternalAccountList
	public typealias paramType = Params
	public struct Params {
		let starting_after: String
		let ending_before: String
		let limit: Int
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/account/external_accounts?starting_after=\(inputs.starting_after.urlEncoded))&limit=\(inputs.limit.urlEncoded))&ending_before=\(inputs.ending_before.urlEncoded))"
	}
	public static var method: HTTPMethod { return .GET }

	public class ExternalAccountList: Codable {
		/// The list contains all external accounts that have been attached to the Stripe account. These may be bank accounts or cards.
		public var data: [BankAccount]
		/// True if this list has another page of items after this one that can be fetched.
		public var has_more: Bool
		/// String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
		public var object: ObjectValues
		/// The URL where this list can be accessed.
		public var url: String

		public init(data: [BankAccount], has_more: Bool, object: ObjectValues, url: String) {
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

/// Create an external account for a given account.
public struct PostAccountExternalAccounts: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = ExternalAccount
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v1/account/external_accounts"
	}

	public class FormInput: Codable {
		/// Either a token, like the ones returned by [Stripe.js](https://stripe.com/docs/stripe.js), or a dictionary containing a user's bank account details.
		public var bank_account: MESSED_UP?
		/// When set to true, or if this is the first external account added in this currency, this account becomes the default external account for its currency.
		public var default_for_currency: Bool?
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?
		/// Please refer to full [documentation](https://stripe.com/docs/api) instead.
		public var external_account: String?
		/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
		public var metadata: String?

		public init(bank_account: MESSED_UP? = nil, default_for_currency: Bool? = nil, expand: [String]? = nil, external_account: String? = nil, metadata: String? = nil) {
			self.bank_account = bank_account
			self.default_for_currency = default_for_currency
			self.expand = expand
			self.external_account = external_account
			self.metadata = metadata
		}
	}

}

/// Retrieve a specified external account for a given account.
public struct GetAccountExternalAccountsId: StripeAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = ExternalAccount
	public typealias paramType = Params
	public struct Params {
		let id: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/account/external_accounts/\(inputs.id)"
	}
	public static var method: HTTPMethod { return .GET }

}

/// Updates the metadata, account holder name, and account holder type of a bank account belonging to a <a href="/docs/connect/custom-accounts">Custom account</a>, and optionally sets it as the default for its currency. Other bank account details are not editable by design.  You can re-enable a disabled bank account by performing an update call without providing any arguments or changes.
public struct PostAccountExternalAccountsId: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = ExternalAccount
	public typealias paramType = Params
	public struct Params {
		let id: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/account/external_accounts/\(inputs.id)"
	}

	public class FormInput: Codable {
		/// The name of the person or business that owns the bank account.
		public var account_holder_name: String?
		/// The type of entity that holds the account. This can be either `individual` or `company`.
		public var account_holder_type: AccountHolderTypeValues?
		/// City/District/Suburb/Town/Village.
		public var address_city: String?
		/// Billing address country, if provided when creating card.
		public var address_country: String?
		/// Address line 1 (Street address/PO Box/Company name).
		public var address_line1: String?
		/// Address line 2 (Apartment/Suite/Unit/Building).
		public var address_line2: String?
		/// State/County/Province/Region.
		public var address_state: String?
		/// ZIP or postal code.
		public var address_zip: String?
		/// When set to true, this becomes the default external account for its currency.
		public var default_for_currency: Bool?
		/// Two digit number representing the card’s expiration month.
		public var exp_month: String?
		/// Four digit number representing the card’s expiration year.
		public var exp_year: String?
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?
		/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
		public var metadata: MESSED_UP?
		/// Cardholder name.
		public var name: String?

		public init(account_holder_name: String? = nil, account_holder_type: AccountHolderTypeValues? = nil, address_city: String? = nil, address_country: String? = nil, address_line1: String? = nil, address_line2: String? = nil, address_state: String? = nil, address_zip: String? = nil, default_for_currency: Bool? = nil, exp_month: String? = nil, exp_year: String? = nil, expand: [String]? = nil, metadata: MESSED_UP? = nil, name: String? = nil) {
			self.account_holder_name = account_holder_name
			self.account_holder_type = account_holder_type
			self.address_city = address_city
			self.address_country = address_country
			self.address_line1 = address_line1
			self.address_line2 = address_line2
			self.address_state = address_state
			self.address_zip = address_zip
			self.default_for_currency = default_for_currency
			self.exp_month = exp_month
			self.exp_year = exp_year
			self.expand = expand
			self.metadata = metadata
			self.name = name
		}

		public enum AccountHolderTypeValues: String, Codable {
			case company = "company"
			case individual = "individual"
		}
	}

}

/// Delete a specified external account for a given account.
public struct DeleteAccountExternalAccountsId: StripeAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = DeletedExternalAccount
	public typealias paramType = Params
	public struct Params {
		let id: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/account/external_accounts/\(inputs.id)"
	}
	public static var method: HTTPMethod { return .DELETE }

}

/// Creates a single-use login link for an Express account to access their Stripe dashboard.  <strong>You may only create login links for <a href="/docs/connect/express-accounts">Express accounts</a> connected to your platform</strong>.
public struct PostAccountLoginLinks: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = LoginLink
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v1/account/login_links"
	}

	public class FormInput: Codable {
		public var account: String
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?
		/// Where to redirect the user after they log out of their dashboard.
		public var redirect_url: String?

		public init(account: String, expand: [String]? = nil, redirect_url: String? = nil) {
			self.account = account
			self.expand = expand
			self.redirect_url = redirect_url
		}
	}

}

/// Invalidates all sessions for a light account, for a platform to use during platform logout.  <strong>You may only log out <a href="/docs/connect/express-accounts">Express accounts</a> connected to your platform</strong>.
public struct PutAccountLogout: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = LightAccountLogout
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v1/account/logout"
	}
	public static var method: HTTPMethod { return .PUT }

	public class FormInput: Codable {
		public var account: String
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?

		public init(account: String, expand: [String]? = nil) {
			self.account = account
			self.expand = expand
		}
	}

}

/// Returns a list of people associated with the account’s legal entity. The people are returned sorted by creation date, with the most recent people appearing first.
public struct GetAccountPeople: StripeAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = Output
	public typealias paramType = Params
	public struct Params {
		let starting_after: String
		let ending_before: String
		let limit: Int
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/account/people?limit=\(inputs.limit.urlEncoded))&starting_after=\(inputs.starting_after.urlEncoded))&ending_before=\(inputs.ending_before.urlEncoded))"
	}
	public static var method: HTTPMethod { return .GET }

	public class Output: Codable {
		public var data: [Person]
		/// True if this list has another page of items after this one that can be fetched.
		public var has_more: Bool
		/// String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
		public var object: ObjectValues
		/// The URL where this list can be accessed.
		public var url: String

		public init(data: [Person], has_more: Bool, object: ObjectValues, url: String) {
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

/// Creates a new person.
public struct PostAccountPeople: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = Person
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v1/account/people"
	}

	public class FormInput: Codable {
		public var account: String?
		/// The person's address.
		public var address: AddressSpecs?
		/// The Kana variation of the person's address (Japan only).
		public var address_kana: JapanAddressKanaSpecs?
		/// The Kanji variation of the person's address (Japan only).
		public var address_kanji: JapanAddressKanjiSpecs?
		/// The person's date of birth.
		public var dob: MESSED_UP?
		/// The person's email address.
		public var email: String?
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?
		/// The person's first name.
		public var first_name: String?
		/// The Kana variation of the person's first name (Japan only).
		public var first_name_kana: String?
		/// The Kanji variation of the person's first name (Japan only).
		public var first_name_kanji: String?
		/// The person's gender (International regulations require either "male" or "female").
		public var gender: String?
		/// The person's ID number, as appropriate for their country. For example, a social security number in the U.S., social insurance number in Canada, etc. Instead of the number itself, you can also provide a [PII token provided by Stripe.js](https://stripe.com/docs/stripe.js#collecting-pii-data).
		public var id_number: String?
		/// The person's last name.
		public var last_name: String?
		/// The Kana variation of the person's last name (Japan only).
		public var last_name_kana: String?
		/// The Kanji variation of the person's last name (Japan only).
		public var last_name_kanji: String?
		/// The person's maiden name.
		public var maiden_name: String?
		/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
		public var metadata: MESSED_UP?
		/// A [person token](https://stripe.com/docs/connect/account-tokens), used to securely provide details to the person.
		public var person_token: String?
		/// The person's phone number.
		public var phone: String?
		/// Indicates if the person or any of their representatives, family members, or other closely related persons, declares that they hold or have held an important public job or function, in any jurisdiction.
		public var political_exposure: String?
		/// The relationship that this person has with the account's legal entity.
		public var relationship: RelationshipSpecs?
		/// The last four digits of the person's Social Security number (U.S. only).
		public var ssn_last_4: String?
		/// The person's verification status.
		public var verification: PersonVerificationSpecs?

		public init(account: String? = nil, address: AddressSpecs? = nil, address_kana: JapanAddressKanaSpecs? = nil, address_kanji: JapanAddressKanjiSpecs? = nil, dob: MESSED_UP? = nil, email: String? = nil, expand: [String]? = nil, first_name: String? = nil, first_name_kana: String? = nil, first_name_kanji: String? = nil, gender: String? = nil, id_number: String? = nil, last_name: String? = nil, last_name_kana: String? = nil, last_name_kanji: String? = nil, maiden_name: String? = nil, metadata: MESSED_UP? = nil, person_token: String? = nil, phone: String? = nil, political_exposure: String? = nil, relationship: RelationshipSpecs? = nil, ssn_last_4: String? = nil, verification: PersonVerificationSpecs? = nil) {
			self.account = account
			self.address = address
			self.address_kana = address_kana
			self.address_kanji = address_kanji
			self.dob = dob
			self.email = email
			self.expand = expand
			self.first_name = first_name
			self.first_name_kana = first_name_kana
			self.first_name_kanji = first_name_kanji
			self.gender = gender
			self.id_number = id_number
			self.last_name = last_name
			self.last_name_kana = last_name_kana
			self.last_name_kanji = last_name_kanji
			self.maiden_name = maiden_name
			self.metadata = metadata
			self.person_token = person_token
			self.phone = phone
			self.political_exposure = political_exposure
			self.relationship = relationship
			self.ssn_last_4 = ssn_last_4
			self.verification = verification
		}


		/// The Kana variation of the person's address (Japan only).
		public class JapanAddressKanaSpecs: Codable {
			public var city: String?
			public var country: String?
			public var line1: String?
			public var line2: String?
			public var postal_code: String?
			public var state: String?
			public var town: String?

			/// The Kana variation of the person's address (Japan only).
			/// - Parameters:
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



		/// The Kanji variation of the person's address (Japan only).
		public class JapanAddressKanjiSpecs: Codable {
			public var city: String?
			public var country: String?
			public var line1: String?
			public var line2: String?
			public var postal_code: String?
			public var state: String?
			public var town: String?

			/// The Kanji variation of the person's address (Japan only).
			/// - Parameters:
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



		/// The relationship that this person has with the account's legal entity.
		public class RelationshipSpecs: Codable {
			public var director: Bool?
			public var executive: Bool?
			public var owner: Bool?
			public var percent_ownership: StringNumber?
			public var representative: Bool?
			public var title: String?

			/// The relationship that this person has with the account's legal entity.
			/// - Parameters:
			public init(director: Bool? = nil, executive: Bool? = nil, owner: Bool? = nil, percent_ownership: StringNumber? = nil, representative: Bool? = nil, title: String? = nil) {
				self.director = director
				self.executive = executive
				self.owner = owner
				self.percent_ownership = percent_ownership
				self.representative = representative
				self.title = title
			}
		}



		/// The person's address.
		public class AddressSpecs: Codable {
			public var city: String?
			public var country: String?
			public var line1: String?
			public var line2: String?
			public var postal_code: String?
			public var state: String?

			/// The person's address.
			/// - Parameters:
			public init(city: String? = nil, country: String? = nil, line1: String? = nil, line2: String? = nil, postal_code: String? = nil, state: String? = nil) {
				self.city = city
				self.country = country
				self.line1 = line1
				self.line2 = line2
				self.postal_code = postal_code
				self.state = state
			}
		}



		/// The person's verification status.
		public class PersonVerificationSpecs: Codable {
			public var additional_document: PersonVerificationDocumentSpecs?
			public var document: PersonVerificationDocumentSpecs?

			/// The person's verification status.
			/// - Parameters:
			public init(additional_document: PersonVerificationDocumentSpecs? = nil, document: PersonVerificationDocumentSpecs? = nil) {
				self.additional_document = additional_document
				self.document = document
			}


			public class PersonVerificationDocumentSpecs: Codable {
				public var back: String?
				public var front: String?

				public init(back: String? = nil, front: String? = nil) {
					self.back = back
					self.front = front
				}
			}

		}

	}

}

/// Retrieves an existing person.
public struct GetAccountPeoplePerson: StripeAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = Person
	public typealias paramType = Params
	public struct Params {
		let person: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/account/people/\(inputs.person)"
	}
	public static var method: HTTPMethod { return .GET }

}

/// Updates an existing person.
public struct PostAccountPeoplePerson: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = Person
	public typealias paramType = Params
	public struct Params {
		let person: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/account/people/\(inputs.person)"
	}

	public class FormInput: Codable {
		public var account: String?
		/// The person's address.
		public var address: AddressSpecs?
		/// The Kana variation of the person's address (Japan only).
		public var address_kana: JapanAddressKanaSpecs?
		/// The Kanji variation of the person's address (Japan only).
		public var address_kanji: JapanAddressKanjiSpecs?
		/// The person's date of birth.
		public var dob: MESSED_UP?
		/// The person's email address.
		public var email: String?
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?
		/// The person's first name.
		public var first_name: String?
		/// The Kana variation of the person's first name (Japan only).
		public var first_name_kana: String?
		/// The Kanji variation of the person's first name (Japan only).
		public var first_name_kanji: String?
		/// The person's gender (International regulations require either "male" or "female").
		public var gender: String?
		/// The person's ID number, as appropriate for their country. For example, a social security number in the U.S., social insurance number in Canada, etc. Instead of the number itself, you can also provide a [PII token provided by Stripe.js](https://stripe.com/docs/stripe.js#collecting-pii-data).
		public var id_number: String?
		/// The person's last name.
		public var last_name: String?
		/// The Kana variation of the person's last name (Japan only).
		public var last_name_kana: String?
		/// The Kanji variation of the person's last name (Japan only).
		public var last_name_kanji: String?
		/// The person's maiden name.
		public var maiden_name: String?
		/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
		public var metadata: MESSED_UP?
		/// A [person token](https://stripe.com/docs/connect/account-tokens), used to securely provide details to the person.
		public var person_token: String?
		/// The person's phone number.
		public var phone: String?
		/// Indicates if the person or any of their representatives, family members, or other closely related persons, declares that they hold or have held an important public job or function, in any jurisdiction.
		public var political_exposure: String?
		/// The relationship that this person has with the account's legal entity.
		public var relationship: RelationshipSpecs?
		/// The last four digits of the person's Social Security number (U.S. only).
		public var ssn_last_4: String?
		/// The person's verification status.
		public var verification: PersonVerificationSpecs?

		public init(account: String? = nil, address: AddressSpecs? = nil, address_kana: JapanAddressKanaSpecs? = nil, address_kanji: JapanAddressKanjiSpecs? = nil, dob: MESSED_UP? = nil, email: String? = nil, expand: [String]? = nil, first_name: String? = nil, first_name_kana: String? = nil, first_name_kanji: String? = nil, gender: String? = nil, id_number: String? = nil, last_name: String? = nil, last_name_kana: String? = nil, last_name_kanji: String? = nil, maiden_name: String? = nil, metadata: MESSED_UP? = nil, person_token: String? = nil, phone: String? = nil, political_exposure: String? = nil, relationship: RelationshipSpecs? = nil, ssn_last_4: String? = nil, verification: PersonVerificationSpecs? = nil) {
			self.account = account
			self.address = address
			self.address_kana = address_kana
			self.address_kanji = address_kanji
			self.dob = dob
			self.email = email
			self.expand = expand
			self.first_name = first_name
			self.first_name_kana = first_name_kana
			self.first_name_kanji = first_name_kanji
			self.gender = gender
			self.id_number = id_number
			self.last_name = last_name
			self.last_name_kana = last_name_kana
			self.last_name_kanji = last_name_kanji
			self.maiden_name = maiden_name
			self.metadata = metadata
			self.person_token = person_token
			self.phone = phone
			self.political_exposure = political_exposure
			self.relationship = relationship
			self.ssn_last_4 = ssn_last_4
			self.verification = verification
		}


		/// The Kanji variation of the person's address (Japan only).
		public class JapanAddressKanjiSpecs: Codable {
			public var city: String?
			public var country: String?
			public var line1: String?
			public var line2: String?
			public var postal_code: String?
			public var state: String?
			public var town: String?

			/// The Kanji variation of the person's address (Japan only).
			/// - Parameters:
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



		/// The Kana variation of the person's address (Japan only).
		public class JapanAddressKanaSpecs: Codable {
			public var city: String?
			public var country: String?
			public var line1: String?
			public var line2: String?
			public var postal_code: String?
			public var state: String?
			public var town: String?

			/// The Kana variation of the person's address (Japan only).
			/// - Parameters:
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



		/// The relationship that this person has with the account's legal entity.
		public class RelationshipSpecs: Codable {
			public var director: Bool?
			public var executive: Bool?
			public var owner: Bool?
			public var percent_ownership: StringNumber?
			public var representative: Bool?
			public var title: String?

			/// The relationship that this person has with the account's legal entity.
			/// - Parameters:
			public init(director: Bool? = nil, executive: Bool? = nil, owner: Bool? = nil, percent_ownership: StringNumber? = nil, representative: Bool? = nil, title: String? = nil) {
				self.director = director
				self.executive = executive
				self.owner = owner
				self.percent_ownership = percent_ownership
				self.representative = representative
				self.title = title
			}
		}



		/// The person's address.
		public class AddressSpecs: Codable {
			public var city: String?
			public var country: String?
			public var line1: String?
			public var line2: String?
			public var postal_code: String?
			public var state: String?

			/// The person's address.
			/// - Parameters:
			public init(city: String? = nil, country: String? = nil, line1: String? = nil, line2: String? = nil, postal_code: String? = nil, state: String? = nil) {
				self.city = city
				self.country = country
				self.line1 = line1
				self.line2 = line2
				self.postal_code = postal_code
				self.state = state
			}
		}



		/// The person's verification status.
		public class PersonVerificationSpecs: Codable {
			public var additional_document: PersonVerificationDocumentSpecs?
			public var document: PersonVerificationDocumentSpecs?

			/// The person's verification status.
			/// - Parameters:
			public init(additional_document: PersonVerificationDocumentSpecs? = nil, document: PersonVerificationDocumentSpecs? = nil) {
				self.additional_document = additional_document
				self.document = document
			}


			public class PersonVerificationDocumentSpecs: Codable {
				public var back: String?
				public var front: String?

				public init(back: String? = nil, front: String? = nil) {
					self.back = back
					self.front = front
				}
			}

		}

	}

}

/// Deletes an existing person’s relationship to the account’s legal entity. Any person with a relationship for an account can be deleted through the API, except if the person is the <code>account_opener</code>. If your integration is using the <code>executive</code> parameter, you cannot delete the only verified <code>executive</code> on file.
public struct DeleteAccountPeoplePerson: StripeAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = DeletedPerson
	public typealias paramType = Params
	public struct Params {
		let person: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/account/people/\(inputs.person)"
	}
	public static var method: HTTPMethod { return .DELETE }

}

/// Returns a list of people associated with the account’s legal entity. The people are returned sorted by creation date, with the most recent people appearing first.
public struct GetAccountPersons: StripeAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = Output
	public typealias paramType = Params
	public struct Params {
		let limit: Int
		let starting_after: String
		let ending_before: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/account/persons?limit=\(inputs.limit.urlEncoded))&ending_before=\(inputs.ending_before.urlEncoded))&starting_after=\(inputs.starting_after.urlEncoded))"
	}
	public static var method: HTTPMethod { return .GET }

	public class Output: Codable {
		public var data: [Person]
		/// True if this list has another page of items after this one that can be fetched.
		public var has_more: Bool
		/// String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
		public var object: ObjectValues
		/// The URL where this list can be accessed.
		public var url: String

		public init(data: [Person], has_more: Bool, object: ObjectValues, url: String) {
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

/// Creates a new person.
public struct PostAccountPersons: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = Person
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v1/account/persons"
	}

	public class FormInput: Codable {
		public var account: String?
		/// The person's address.
		public var address: AddressSpecs?
		/// The Kana variation of the person's address (Japan only).
		public var address_kana: JapanAddressKanaSpecs?
		/// The Kanji variation of the person's address (Japan only).
		public var address_kanji: JapanAddressKanjiSpecs?
		/// The person's date of birth.
		public var dob: MESSED_UP?
		/// The person's email address.
		public var email: String?
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?
		/// The person's first name.
		public var first_name: String?
		/// The Kana variation of the person's first name (Japan only).
		public var first_name_kana: String?
		/// The Kanji variation of the person's first name (Japan only).
		public var first_name_kanji: String?
		/// The person's gender (International regulations require either "male" or "female").
		public var gender: String?
		/// The person's ID number, as appropriate for their country. For example, a social security number in the U.S., social insurance number in Canada, etc. Instead of the number itself, you can also provide a [PII token provided by Stripe.js](https://stripe.com/docs/stripe.js#collecting-pii-data).
		public var id_number: String?
		/// The person's last name.
		public var last_name: String?
		/// The Kana variation of the person's last name (Japan only).
		public var last_name_kana: String?
		/// The Kanji variation of the person's last name (Japan only).
		public var last_name_kanji: String?
		/// The person's maiden name.
		public var maiden_name: String?
		/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
		public var metadata: MESSED_UP?
		/// A [person token](https://stripe.com/docs/connect/account-tokens), used to securely provide details to the person.
		public var person_token: String?
		/// The person's phone number.
		public var phone: String?
		/// Indicates if the person or any of their representatives, family members, or other closely related persons, declares that they hold or have held an important public job or function, in any jurisdiction.
		public var political_exposure: String?
		/// The relationship that this person has with the account's legal entity.
		public var relationship: RelationshipSpecs?
		/// The last four digits of the person's Social Security number (U.S. only).
		public var ssn_last_4: String?
		/// The person's verification status.
		public var verification: PersonVerificationSpecs?

		public init(account: String? = nil, address: AddressSpecs? = nil, address_kana: JapanAddressKanaSpecs? = nil, address_kanji: JapanAddressKanjiSpecs? = nil, dob: MESSED_UP? = nil, email: String? = nil, expand: [String]? = nil, first_name: String? = nil, first_name_kana: String? = nil, first_name_kanji: String? = nil, gender: String? = nil, id_number: String? = nil, last_name: String? = nil, last_name_kana: String? = nil, last_name_kanji: String? = nil, maiden_name: String? = nil, metadata: MESSED_UP? = nil, person_token: String? = nil, phone: String? = nil, political_exposure: String? = nil, relationship: RelationshipSpecs? = nil, ssn_last_4: String? = nil, verification: PersonVerificationSpecs? = nil) {
			self.account = account
			self.address = address
			self.address_kana = address_kana
			self.address_kanji = address_kanji
			self.dob = dob
			self.email = email
			self.expand = expand
			self.first_name = first_name
			self.first_name_kana = first_name_kana
			self.first_name_kanji = first_name_kanji
			self.gender = gender
			self.id_number = id_number
			self.last_name = last_name
			self.last_name_kana = last_name_kana
			self.last_name_kanji = last_name_kanji
			self.maiden_name = maiden_name
			self.metadata = metadata
			self.person_token = person_token
			self.phone = phone
			self.political_exposure = political_exposure
			self.relationship = relationship
			self.ssn_last_4 = ssn_last_4
			self.verification = verification
		}


		/// The relationship that this person has with the account's legal entity.
		public class RelationshipSpecs: Codable {
			public var director: Bool?
			public var executive: Bool?
			public var owner: Bool?
			public var percent_ownership: StringNumber?
			public var representative: Bool?
			public var title: String?

			/// The relationship that this person has with the account's legal entity.
			/// - Parameters:
			public init(director: Bool? = nil, executive: Bool? = nil, owner: Bool? = nil, percent_ownership: StringNumber? = nil, representative: Bool? = nil, title: String? = nil) {
				self.director = director
				self.executive = executive
				self.owner = owner
				self.percent_ownership = percent_ownership
				self.representative = representative
				self.title = title
			}
		}



		/// The person's verification status.
		public class PersonVerificationSpecs: Codable {
			public var additional_document: PersonVerificationDocumentSpecs?
			public var document: PersonVerificationDocumentSpecs?

			/// The person's verification status.
			/// - Parameters:
			public init(additional_document: PersonVerificationDocumentSpecs? = nil, document: PersonVerificationDocumentSpecs? = nil) {
				self.additional_document = additional_document
				self.document = document
			}


			public class PersonVerificationDocumentSpecs: Codable {
				public var back: String?
				public var front: String?

				public init(back: String? = nil, front: String? = nil) {
					self.back = back
					self.front = front
				}
			}

		}



		/// The Kanji variation of the person's address (Japan only).
		public class JapanAddressKanjiSpecs: Codable {
			public var city: String?
			public var country: String?
			public var line1: String?
			public var line2: String?
			public var postal_code: String?
			public var state: String?
			public var town: String?

			/// The Kanji variation of the person's address (Japan only).
			/// - Parameters:
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



		/// The person's address.
		public class AddressSpecs: Codable {
			public var city: String?
			public var country: String?
			public var line1: String?
			public var line2: String?
			public var postal_code: String?
			public var state: String?

			/// The person's address.
			/// - Parameters:
			public init(city: String? = nil, country: String? = nil, line1: String? = nil, line2: String? = nil, postal_code: String? = nil, state: String? = nil) {
				self.city = city
				self.country = country
				self.line1 = line1
				self.line2 = line2
				self.postal_code = postal_code
				self.state = state
			}
		}



		/// The Kana variation of the person's address (Japan only).
		public class JapanAddressKanaSpecs: Codable {
			public var city: String?
			public var country: String?
			public var line1: String?
			public var line2: String?
			public var postal_code: String?
			public var state: String?
			public var town: String?

			/// The Kana variation of the person's address (Japan only).
			/// - Parameters:
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

	}

}

/// Retrieves an existing person.
public struct GetAccountPersonsPerson: StripeAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = Person
	public typealias paramType = Params
	public struct Params {
		let person: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/account/persons/\(inputs.person)"
	}
	public static var method: HTTPMethod { return .GET }

}

/// Updates an existing person.
public struct PostAccountPersonsPerson: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = Person
	public typealias paramType = Params
	public struct Params {
		let person: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/account/persons/\(inputs.person)"
	}

	public class FormInput: Codable {
		public var account: String?
		/// The person's address.
		public var address: AddressSpecs?
		/// The Kana variation of the person's address (Japan only).
		public var address_kana: JapanAddressKanaSpecs?
		/// The Kanji variation of the person's address (Japan only).
		public var address_kanji: JapanAddressKanjiSpecs?
		/// The person's date of birth.
		public var dob: MESSED_UP?
		/// The person's email address.
		public var email: String?
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?
		/// The person's first name.
		public var first_name: String?
		/// The Kana variation of the person's first name (Japan only).
		public var first_name_kana: String?
		/// The Kanji variation of the person's first name (Japan only).
		public var first_name_kanji: String?
		/// The person's gender (International regulations require either "male" or "female").
		public var gender: String?
		/// The person's ID number, as appropriate for their country. For example, a social security number in the U.S., social insurance number in Canada, etc. Instead of the number itself, you can also provide a [PII token provided by Stripe.js](https://stripe.com/docs/stripe.js#collecting-pii-data).
		public var id_number: String?
		/// The person's last name.
		public var last_name: String?
		/// The Kana variation of the person's last name (Japan only).
		public var last_name_kana: String?
		/// The Kanji variation of the person's last name (Japan only).
		public var last_name_kanji: String?
		/// The person's maiden name.
		public var maiden_name: String?
		/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
		public var metadata: MESSED_UP?
		/// A [person token](https://stripe.com/docs/connect/account-tokens), used to securely provide details to the person.
		public var person_token: String?
		/// The person's phone number.
		public var phone: String?
		/// Indicates if the person or any of their representatives, family members, or other closely related persons, declares that they hold or have held an important public job or function, in any jurisdiction.
		public var political_exposure: String?
		/// The relationship that this person has with the account's legal entity.
		public var relationship: RelationshipSpecs?
		/// The last four digits of the person's Social Security number (U.S. only).
		public var ssn_last_4: String?
		/// The person's verification status.
		public var verification: PersonVerificationSpecs?

		public init(account: String? = nil, address: AddressSpecs? = nil, address_kana: JapanAddressKanaSpecs? = nil, address_kanji: JapanAddressKanjiSpecs? = nil, dob: MESSED_UP? = nil, email: String? = nil, expand: [String]? = nil, first_name: String? = nil, first_name_kana: String? = nil, first_name_kanji: String? = nil, gender: String? = nil, id_number: String? = nil, last_name: String? = nil, last_name_kana: String? = nil, last_name_kanji: String? = nil, maiden_name: String? = nil, metadata: MESSED_UP? = nil, person_token: String? = nil, phone: String? = nil, political_exposure: String? = nil, relationship: RelationshipSpecs? = nil, ssn_last_4: String? = nil, verification: PersonVerificationSpecs? = nil) {
			self.account = account
			self.address = address
			self.address_kana = address_kana
			self.address_kanji = address_kanji
			self.dob = dob
			self.email = email
			self.expand = expand
			self.first_name = first_name
			self.first_name_kana = first_name_kana
			self.first_name_kanji = first_name_kanji
			self.gender = gender
			self.id_number = id_number
			self.last_name = last_name
			self.last_name_kana = last_name_kana
			self.last_name_kanji = last_name_kanji
			self.maiden_name = maiden_name
			self.metadata = metadata
			self.person_token = person_token
			self.phone = phone
			self.political_exposure = political_exposure
			self.relationship = relationship
			self.ssn_last_4 = ssn_last_4
			self.verification = verification
		}


		/// The relationship that this person has with the account's legal entity.
		public class RelationshipSpecs: Codable {
			public var director: Bool?
			public var executive: Bool?
			public var owner: Bool?
			public var percent_ownership: StringNumber?
			public var representative: Bool?
			public var title: String?

			/// The relationship that this person has with the account's legal entity.
			/// - Parameters:
			public init(director: Bool? = nil, executive: Bool? = nil, owner: Bool? = nil, percent_ownership: StringNumber? = nil, representative: Bool? = nil, title: String? = nil) {
				self.director = director
				self.executive = executive
				self.owner = owner
				self.percent_ownership = percent_ownership
				self.representative = representative
				self.title = title
			}
		}



		/// The person's verification status.
		public class PersonVerificationSpecs: Codable {
			public var additional_document: PersonVerificationDocumentSpecs?
			public var document: PersonVerificationDocumentSpecs?

			/// The person's verification status.
			/// - Parameters:
			public init(additional_document: PersonVerificationDocumentSpecs? = nil, document: PersonVerificationDocumentSpecs? = nil) {
				self.additional_document = additional_document
				self.document = document
			}


			public class PersonVerificationDocumentSpecs: Codable {
				public var back: String?
				public var front: String?

				public init(back: String? = nil, front: String? = nil) {
					self.back = back
					self.front = front
				}
			}

		}



		/// The Kanji variation of the person's address (Japan only).
		public class JapanAddressKanjiSpecs: Codable {
			public var city: String?
			public var country: String?
			public var line1: String?
			public var line2: String?
			public var postal_code: String?
			public var state: String?
			public var town: String?

			/// The Kanji variation of the person's address (Japan only).
			/// - Parameters:
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



		/// The person's address.
		public class AddressSpecs: Codable {
			public var city: String?
			public var country: String?
			public var line1: String?
			public var line2: String?
			public var postal_code: String?
			public var state: String?

			/// The person's address.
			/// - Parameters:
			public init(city: String? = nil, country: String? = nil, line1: String? = nil, line2: String? = nil, postal_code: String? = nil, state: String? = nil) {
				self.city = city
				self.country = country
				self.line1 = line1
				self.line2 = line2
				self.postal_code = postal_code
				self.state = state
			}
		}



		/// The Kana variation of the person's address (Japan only).
		public class JapanAddressKanaSpecs: Codable {
			public var city: String?
			public var country: String?
			public var line1: String?
			public var line2: String?
			public var postal_code: String?
			public var state: String?
			public var town: String?

			/// The Kana variation of the person's address (Japan only).
			/// - Parameters:
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

	}

}

/// Deletes an existing person’s relationship to the account’s legal entity. Any person with a relationship for an account can be deleted through the API, except if the person is the <code>account_opener</code>. If your integration is using the <code>executive</code> parameter, you cannot delete the only verified <code>executive</code> on file.
public struct DeleteAccountPersonsPerson: StripeAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = DeletedPerson
	public typealias paramType = Params
	public struct Params {
		let person: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/account/persons/\(inputs.person)"
	}
	public static var method: HTTPMethod { return .DELETE }

}
