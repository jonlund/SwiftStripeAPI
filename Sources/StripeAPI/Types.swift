/// This File Automatically Generated

/// Information about this version of this API
public struct StripeAPIInfo: Codable {
	static let version: String = "2020-08-27"
	static let server: String = "https://api.stripe.com/"
}

/// This is an object representing a Stripe account. You can retrieve it to see properties on the account like its current e-mail address or if the account is enabled yet to make live charges.  Some properties, marked below, are available only to platforms that want to [create and manage Express or Custom accounts](https://stripe.com/docs/connect/accounts).
public class Account: Codable {
	/// Business information about the account.
	public var business_profile: AccountBusinessProfile?
	/// The business type.
	public var business_type: BusinessTypeValues?
	public var capabilities: AccountCapabilities?
	/// Whether the account can create live charges.
	public var charges_enabled: Bool?
	public var company: LegalEntityCompany?
	/// The account's country.
	public var country: String?
	/// Time at which the object was created. Measured in seconds since the Unix epoch.
	public var created: Timestamp?
	/// Three-letter ISO currency code representing the default currency for the account. This must be a currency that [Stripe supports in the account's country](https://stripe.com/docs/payouts).
	public var default_currency: String?
	/// Whether account details have been submitted. Standard accounts cannot receive payouts before this is true.
	public var details_submitted: Bool?
	/// The primary user's email address.
	public var email: String?
	/// External accounts (bank accounts and debit cards) currently attached to this account
	public var external_accounts: ExternalAccountList?
	/// Unique identifier for the object.
	public var id: String
	public var individual: Person?
	/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
	public var metadata: String?
	/// String representing the object's type. Objects of the same type share the same value.
	public var object: ObjectValues
	/// Whether Stripe can send payouts to this account.
	public var payouts_enabled: Bool?
	public var requirements: AccountRequirements?
	/// Options for customizing how the account functions within Stripe.
	public var settings: AccountSettings?
	public var tos_acceptance: AccountTosAcceptance?
	/// The Stripe account type. Can be `standard`, `express`, or `custom`.
	public var type: TypeValues?

	/// This is an object representing a Stripe account. You can retrieve it to see properties on the account like its current e-mail address or if the account is enabled yet to make live charges.  Some properties, marked below, are available only to platforms that want to [create and manage Express or Custom accounts](https://stripe.com/docs/connect/accounts).
	/// - Parameters:
	///   - business_profile: Business information about the account.
	///   - business_type: The business type.
	///   - charges_enabled: Whether the account can create live charges.
	///   - country: The account's country.
	///   - created: Time at which the object was created. Measured in seconds since the Unix epoch.
	///   - default_currency: Three-letter ISO currency code representing the default currency for the account. This must be a currency that [Stripe supports in the account's country](https://stripe.com/docs/payouts).
	///   - details_submitted: Whether account details have been submitted. Standard accounts cannot receive payouts before this is true.
	///   - email: The primary user's email address.
	///   - external_accounts: External accounts (bank accounts and debit cards) currently attached to this account
	///   - id: Unique identifier for the object.
	///   - metadata: Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
	///   - object: String representing the object's type. Objects of the same type share the same value.
	///   - payouts_enabled: Whether Stripe can send payouts to this account.
	///   - settings: Options for customizing how the account functions within Stripe.
	///   - type: The Stripe account type. Can be `standard`, `express`, or `custom`.
	public init(id: String, object: ObjectValues, business_profile: AccountBusinessProfile? = nil, business_type: BusinessTypeValues? = nil, capabilities: AccountCapabilities? = nil, charges_enabled: Bool? = nil, company: LegalEntityCompany? = nil, country: String? = nil, created: Timestamp? = nil, default_currency: String? = nil, details_submitted: Bool? = nil, email: String? = nil, external_accounts: ExternalAccountList? = nil, individual: Person? = nil, metadata: String? = nil, payouts_enabled: Bool? = nil, requirements: AccountRequirements? = nil, settings: AccountSettings? = nil, tos_acceptance: AccountTosAcceptance? = nil, type: TypeValues? = nil) {
		self.id = id
		self.object = object
		self.business_profile = business_profile
		self.business_type = business_type
		self.capabilities = capabilities
		self.charges_enabled = charges_enabled
		self.company = company
		self.country = country
		self.created = created
		self.default_currency = default_currency
		self.details_submitted = details_submitted
		self.email = email
		self.external_accounts = external_accounts
		self.individual = individual
		self.metadata = metadata
		self.payouts_enabled = payouts_enabled
		self.requirements = requirements
		self.settings = settings
		self.tos_acceptance = tos_acceptance
		self.type = type
	}


	/// External accounts (bank accounts and debit cards) currently attached to this account
	public class ExternalAccountList: Codable {
		/// The list contains all external accounts that have been attached to the Stripe account. These may be bank accounts or cards.
		public var data: [BankAccount]
		/// True if this list has another page of items after this one that can be fetched.
		public var has_more: Bool
		/// String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
		public var object: ObjectValues
		/// The URL where this list can be accessed.
		public var url: String

		/// External accounts (bank accounts and debit cards) currently attached to this account
		/// - Parameters:
		///   - data: The list contains all external accounts that have been attached to the Stripe account. These may be bank accounts or cards.
		///   - has_more: True if this list has another page of items after this one that can be fetched.
		///   - object: String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
		///   - url: The URL where this list can be accessed.
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


	public enum TypeValues: String, Codable {
		case custom = "custom"
		case express = "express"
		case standard = "standard"
	}

	public enum BusinessTypeValues: String, Codable {
		case company = "company"
		case governmentEntity = "government_entity"
		case individual = "individual"
		case nonProfit = "non_profit"
	}

	public enum ObjectValues: String, Codable {
		case account = "account"
	}
}

public class AccountBacsDebitPaymentsSettings: Codable {
	/// The Bacs Direct Debit Display Name for this account. For payments made with Bacs Direct Debit, this will appear on the mandate, and as the statement descriptor.
	public var display_name: String?

	public init(display_name: String? = nil) {
		self.display_name = display_name
	}
}

public class AccountBrandingSettings: Codable {
	/// (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) An icon for the account. Must be square and at least 128px x 128px.
	public var icon: String?
	/// (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) A logo for the account that will be used in Checkout instead of the icon and without the account's name next to it if provided. Must be at least 128px x 128px.
	public var logo: String?
	/// A CSS hex color value representing the primary branding color for this account
	public var primary_color: String?
	/// A CSS hex color value representing the secondary branding color for this account
	public var secondary_color: String?

	public init(icon: String? = nil, logo: String? = nil, primary_color: String? = nil, secondary_color: String? = nil) {
		self.icon = icon
		self.logo = logo
		self.primary_color = primary_color
		self.secondary_color = secondary_color
	}
}

public class AccountBusinessProfile: Codable {
	/// [The merchant category code for the account](https://stripe.com/docs/connect/setting-mcc). MCCs are used to classify businesses based on the goods or services they provide.
	public var mcc: String?
	/// The customer-facing business name.
	public var name: String?
	/// Internal-only description of the product sold or service provided by the business. It's used by Stripe for risk and underwriting purposes.
	public var product_description: String?
	/// A publicly available mailing address for sending support issues to.
	public var support_address: Address?
	/// A publicly available email address for sending support issues to.
	public var support_email: String?
	/// A publicly available phone number to call with support issues.
	public var support_phone: String?
	/// A publicly available website for handling support issues.
	public var support_url: String?
	/// The business's publicly available website.
	public var url: String?

	public init(mcc: String? = nil, name: String? = nil, product_description: String? = nil, support_address: Address? = nil, support_email: String? = nil, support_phone: String? = nil, support_url: String? = nil, url: String? = nil) {
		self.mcc = mcc
		self.name = name
		self.product_description = product_description
		self.support_address = support_address
		self.support_email = support_email
		self.support_phone = support_phone
		self.support_url = support_url
		self.url = url
	}
}

public class AccountCapabilities: Codable {
	/// The status of the BECS Direct Debit (AU) payments capability of the account, or whether the account can directly process BECS Direct Debit (AU) charges.
	public var au_becs_debit_payments: AuBecsDebitPaymentsValues?
	/// The status of the Bacs Direct Debits payments capability of the account, or whether the account can directly process Bacs Direct Debits charges.
	public var bacs_debit_payments: BacsDebitPaymentsValues?
	/// The status of the Bancontact payments capability of the account, or whether the account can directly process Bancontact charges.
	public var bancontact_payments: BancontactPaymentsValues?
	/// The status of the card issuing capability of the account, or whether you can use Issuing to distribute funds on cards
	public var card_issuing: CardIssuingValues?
	/// The status of the card payments capability of the account, or whether the account can directly process credit and debit card charges.
	public var card_payments: CardPaymentsValues?
	/// The status of the Cartes Bancaires payments capability of the account, or whether the account can directly process Cartes Bancaires card charges in EUR currency.
	public var cartes_bancaires_payments: CartesBancairesPaymentsValues?
	/// The status of the EPS payments capability of the account, or whether the account can directly process EPS charges.
	public var eps_payments: EpsPaymentsValues?
	/// The status of the FPX payments capability of the account, or whether the account can directly process FPX charges.
	public var fpx_payments: FpxPaymentsValues?
	/// The status of the giropay payments capability of the account, or whether the account can directly process giropay charges.
	public var giropay_payments: GiropayPaymentsValues?
	/// The status of the GrabPay payments capability of the account, or whether the account can directly process GrabPay charges.
	public var grabpay_payments: GrabpayPaymentsValues?
	/// The status of the iDEAL payments capability of the account, or whether the account can directly process iDEAL charges.
	public var ideal_payments: IdealPaymentsValues?
	/// The status of the JCB payments capability of the account, or whether the account (Japan only) can directly process JCB credit card charges in JPY currency.
	public var jcb_payments: JcbPaymentsValues?
	/// The status of the legacy payments capability of the account.
	public var legacy_payments: LegacyPaymentsValues?
	/// The status of the OXXO payments capability of the account, or whether the account can directly process OXXO charges.
	public var oxxo_payments: OxxoPaymentsValues?
	/// The status of the P24 payments capability of the account, or whether the account can directly process P24 charges.
	public var p24_payments: P24PaymentsValues?
	/// The status of the SEPA Direct Debits payments capability of the account, or whether the account can directly process SEPA Direct Debits charges.
	public var sepa_debit_payments: SepaDebitPaymentsValues?
	/// The status of the Sofort payments capability of the account, or whether the account can directly process Sofort charges.
	public var sofort_payments: SofortPaymentsValues?
	/// The status of the tax reporting 1099-K (US) capability of the account.
	public var tax_reporting_us_1099_k: TaxReportingUs1099KValues?
	/// The status of the tax reporting 1099-MISC (US) capability of the account.
	public var tax_reporting_us_1099_misc: TaxReportingUs1099MiscValues?
	/// The status of the transfers capability of the account, or whether your platform can transfer funds to the account.
	public var transfers: TransfersValues?

	public init(au_becs_debit_payments: AuBecsDebitPaymentsValues? = nil, bacs_debit_payments: BacsDebitPaymentsValues? = nil, bancontact_payments: BancontactPaymentsValues? = nil, card_issuing: CardIssuingValues? = nil, card_payments: CardPaymentsValues? = nil, cartes_bancaires_payments: CartesBancairesPaymentsValues? = nil, eps_payments: EpsPaymentsValues? = nil, fpx_payments: FpxPaymentsValues? = nil, giropay_payments: GiropayPaymentsValues? = nil, grabpay_payments: GrabpayPaymentsValues? = nil, ideal_payments: IdealPaymentsValues? = nil, jcb_payments: JcbPaymentsValues? = nil, legacy_payments: LegacyPaymentsValues? = nil, oxxo_payments: OxxoPaymentsValues? = nil, p24_payments: P24PaymentsValues? = nil, sepa_debit_payments: SepaDebitPaymentsValues? = nil, sofort_payments: SofortPaymentsValues? = nil, tax_reporting_us_1099_k: TaxReportingUs1099KValues? = nil, tax_reporting_us_1099_misc: TaxReportingUs1099MiscValues? = nil, transfers: TransfersValues? = nil) {
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

	public enum CartesBancairesPaymentsValues: String, Codable {
		case active = "active"
		case inactive = "inactive"
		case pending = "pending"
	}

	public enum JcbPaymentsValues: String, Codable {
		case active = "active"
		case inactive = "inactive"
		case pending = "pending"
	}

	public enum IdealPaymentsValues: String, Codable {
		case active = "active"
		case inactive = "inactive"
		case pending = "pending"
	}

	public enum GiropayPaymentsValues: String, Codable {
		case active = "active"
		case inactive = "inactive"
		case pending = "pending"
	}

	public enum OxxoPaymentsValues: String, Codable {
		case active = "active"
		case inactive = "inactive"
		case pending = "pending"
	}

	public enum P24PaymentsValues: String, Codable {
		case active = "active"
		case inactive = "inactive"
		case pending = "pending"
	}

	public enum GrabpayPaymentsValues: String, Codable {
		case active = "active"
		case inactive = "inactive"
		case pending = "pending"
	}

	public enum FpxPaymentsValues: String, Codable {
		case active = "active"
		case inactive = "inactive"
		case pending = "pending"
	}

	public enum AuBecsDebitPaymentsValues: String, Codable {
		case active = "active"
		case inactive = "inactive"
		case pending = "pending"
	}

	public enum CardIssuingValues: String, Codable {
		case active = "active"
		case inactive = "inactive"
		case pending = "pending"
	}

	public enum SepaDebitPaymentsValues: String, Codable {
		case active = "active"
		case inactive = "inactive"
		case pending = "pending"
	}

	public enum TaxReportingUs1099MiscValues: String, Codable {
		case active = "active"
		case inactive = "inactive"
		case pending = "pending"
	}

	public enum TaxReportingUs1099KValues: String, Codable {
		case active = "active"
		case inactive = "inactive"
		case pending = "pending"
	}

	public enum TransfersValues: String, Codable {
		case active = "active"
		case inactive = "inactive"
		case pending = "pending"
	}

	public enum BancontactPaymentsValues: String, Codable {
		case active = "active"
		case inactive = "inactive"
		case pending = "pending"
	}

	public enum EpsPaymentsValues: String, Codable {
		case active = "active"
		case inactive = "inactive"
		case pending = "pending"
	}

	public enum LegacyPaymentsValues: String, Codable {
		case active = "active"
		case inactive = "inactive"
		case pending = "pending"
	}

	public enum SofortPaymentsValues: String, Codable {
		case active = "active"
		case inactive = "inactive"
		case pending = "pending"
	}

	public enum BacsDebitPaymentsValues: String, Codable {
		case active = "active"
		case inactive = "inactive"
		case pending = "pending"
	}

	public enum CardPaymentsValues: String, Codable {
		case active = "active"
		case inactive = "inactive"
		case pending = "pending"
	}
}

public class AccountCapabilityRequirements: Codable {
	/// The date the fields in `currently_due` must be collected by to keep the capability enabled for the account.
	public var current_deadline: Timestamp?
	/// The fields that need to be collected to keep the capability enabled. If not collected by the `current_deadline`, these fields appear in `past_due` as well, and the capability is disabled.
	public var currently_due: [String]
	/// If the capability is disabled, this string describes why. Possible values are `requirement.fields_needed`, `pending.onboarding`, `pending.review`, `rejected_fraud`, or `rejected.other`.
	public var disabled_reason: String?
	/// The fields that are `currently_due` and need to be collected again because validation or verification failed for some reason.
	public var errors: [AccountRequirementsError]
	/// The fields that need to be collected assuming all volume thresholds are reached. As they become required, these fields appear in `currently_due` as well, and the `current_deadline` is set.
	public var eventually_due: [String]
	/// The fields that weren't collected by the `current_deadline`. These fields need to be collected to enable the capability for the account.
	public var past_due: [String]
	/// Fields that may become required depending on the results of verification or review. An empty array unless an asynchronous verification is pending. If verification fails, the fields in this array become required and move to `currently_due` or `past_due`.
	public var pending_verification: [String]

	public init(currently_due: [String], errors: [AccountRequirementsError], eventually_due: [String], past_due: [String], pending_verification: [String], current_deadline: Timestamp? = nil, disabled_reason: String? = nil) {
		self.currently_due = currently_due
		self.errors = errors
		self.eventually_due = eventually_due
		self.past_due = past_due
		self.pending_verification = pending_verification
		self.current_deadline = current_deadline
		self.disabled_reason = disabled_reason
	}
}

public class AccountCardPaymentsSettings: Codable {
	public var decline_on: AccountDeclineChargeOn?
	/// The default text that appears on credit card statements when a charge is made. This field prefixes any dynamic `statement_descriptor` specified on the charge. `statement_descriptor_prefix` is useful for maximizing descriptor space for the dynamic portion.
	public var statement_descriptor_prefix: String?

	public init(decline_on: AccountDeclineChargeOn? = nil, statement_descriptor_prefix: String? = nil) {
		self.decline_on = decline_on
		self.statement_descriptor_prefix = statement_descriptor_prefix
	}
}

public class AccountDashboardSettings: Codable {
	/// The display name for this account. This is used on the Stripe Dashboard to differentiate between accounts.
	public var display_name: String?
	/// The timezone used in the Stripe Dashboard for this account. A list of possible time zone values is maintained at the [IANA Time Zone Database](http://www.iana.org/time-zones).
	public var timezone: String?

	public init(display_name: String? = nil, timezone: String? = nil) {
		self.display_name = display_name
		self.timezone = timezone
	}
}

public class AccountDeclineChargeOn: Codable {
	/// Whether Stripe automatically declines charges with an incorrect ZIP or postal code. This setting only applies when a ZIP or postal code is provided and they fail bank verification.
	public var avs_failure: Bool
	/// Whether Stripe automatically declines charges with an incorrect CVC. This setting only applies when a CVC is provided and it fails bank verification.
	public var cvc_failure: Bool

	public init(avs_failure: Bool, cvc_failure: Bool) {
		self.avs_failure = avs_failure
		self.cvc_failure = cvc_failure
	}
}

/// Account Links are the means by which a Connect platform grants a connected account permission to access Stripe-hosted applications, such as Connect Onboarding.  Related guide: [Connect Onboarding](https://stripe.com/docs/connect/connect-onboarding).
public class AccountLink: Codable {
	/// Time at which the object was created. Measured in seconds since the Unix epoch.
	public var created: Timestamp
	/// The timestamp at which this account link will expire.
	public var expires_at: Timestamp
	/// String representing the object's type. Objects of the same type share the same value.
	public var object: ObjectValues
	/// The URL for the account link.
	public var url: String

	/// Account Links are the means by which a Connect platform grants a connected account permission to access Stripe-hosted applications, such as Connect Onboarding.  Related guide: [Connect Onboarding](https://stripe.com/docs/connect/connect-onboarding).
	/// - Parameters:
	///   - created: Time at which the object was created. Measured in seconds since the Unix epoch.
	///   - expires_at: The timestamp at which this account link will expire.
	///   - object: String representing the object's type. Objects of the same type share the same value.
	///   - url: The URL for the account link.
	public init(created: Timestamp, expires_at: Timestamp, object: ObjectValues, url: String) {
		self.created = created
		self.expires_at = expires_at
		self.object = object
		self.url = url
	}

	public enum ObjectValues: String, Codable {
		case accountLink = "account_link"
	}
}

public class AccountPaymentsSettings: Codable {
	/// The default text that appears on credit card statements when a charge is made. This field prefixes any dynamic `statement_descriptor` specified on the charge.
	public var statement_descriptor: String?
	/// The Kana variation of the default text that appears on credit card statements when a charge is made (Japan only)
	public var statement_descriptor_kana: String?
	/// The Kanji variation of the default text that appears on credit card statements when a charge is made (Japan only)
	public var statement_descriptor_kanji: String?

	public init(statement_descriptor: String? = nil, statement_descriptor_kana: String? = nil, statement_descriptor_kanji: String? = nil) {
		self.statement_descriptor = statement_descriptor
		self.statement_descriptor_kana = statement_descriptor_kana
		self.statement_descriptor_kanji = statement_descriptor_kanji
	}
}

public class AccountPayoutSettings: Codable {
	/// A Boolean indicating if Stripe should try to reclaim negative balances from an attached bank account. See our [Understanding Connect Account Balances](https://stripe.com/docs/connect/account-balances) documentation for details. Default value is `true` for Express accounts and `false` for Custom accounts.
	public var debit_negative_balances: Bool
	public var schedule: TransferSchedule
	/// The text that appears on the bank account statement for payouts. If not set, this defaults to the platform's bank descriptor as set in the Dashboard.
	public var statement_descriptor: String?

	public init(debit_negative_balances: Bool, schedule: TransferSchedule, statement_descriptor: String? = nil) {
		self.debit_negative_balances = debit_negative_balances
		self.schedule = schedule
		self.statement_descriptor = statement_descriptor
	}
}

public class AccountRequirements: Codable {
	/// The date the fields in `currently_due` must be collected by to keep payouts enabled for the account. These fields might block payouts sooner if the next threshold is reached before these fields are collected.
	public var current_deadline: Timestamp?
	/// The fields that need to be collected to keep the account enabled. If not collected by the `current_deadline`, these fields appear in `past_due` as well, and the account is disabled.
	public var currently_due: [String]??
	/// If the account is disabled, this string describes why the account can’t create charges or receive payouts. Can be `requirements.past_due`, `requirements.pending_verification`, `rejected.fraud`, `rejected.terms_of_service`, `rejected.listed`, `rejected.other`, `listed`, `under_review`, or `other`.
	public var disabled_reason: String?
	/// The fields that are `currently_due` and need to be collected again because validation or verification failed for some reason.
	public var errors: [AccountRequirementsError]??
	/// The fields that need to be collected assuming all volume thresholds are reached. As they become required, these fields appear in `currently_due` as well, and the `current_deadline` is set.
	public var eventually_due: [String]??
	/// The fields that weren't collected by the `current_deadline`. These fields need to be collected to re-enable the account.
	public var past_due: [String]??
	/// Fields that may become required depending on the results of verification or review. An empty array unless an asynchronous verification is pending. If verification fails, the fields in this array become required and move to `currently_due` or `past_due`.
	public var pending_verification: [String]??

	public init(current_deadline: Timestamp? = nil, currently_due: [String]?? = nil, disabled_reason: String? = nil, errors: [AccountRequirementsError]?? = nil, eventually_due: [String]?? = nil, past_due: [String]?? = nil, pending_verification: [String]?? = nil) {
		self.current_deadline = current_deadline
		self.currently_due = currently_due
		self.disabled_reason = disabled_reason
		self.errors = errors
		self.eventually_due = eventually_due
		self.past_due = past_due
		self.pending_verification = pending_verification
	}
}

public class AccountRequirementsError: Codable {
	/// The code for the type of error.
	public var code: CodeValues
	/// An informative message that indicates the error type and provides additional details about the error.
	public var reason: String
	/// The specific user onboarding requirement field (in the requirements hash) that needs to be resolved.
	public var requirement: String

	public init(code: CodeValues, reason: String, requirement: String) {
		self.code = code
		self.reason = reason
		self.requirement = requirement
	}

	public enum CodeValues: String, Codable {
		case invalidAddressCityStatePostalCode = "invalid_address_city_state_postal_code"
		case invalidStreetAddress = "invalid_street_address"
		case invalidValueOther = "invalid_value_other"
		case verificationDocumentAddressMismatch = "verification_document_address_mismatch"
		case verificationDocumentAddressMissing = "verification_document_address_missing"
		case verificationDocumentCorrupt = "verification_document_corrupt"
		case verificationDocumentCountryNotSupported = "verification_document_country_not_supported"
		case verificationDocumentDobMismatch = "verification_document_dob_mismatch"
		case verificationDocumentDuplicateType = "verification_document_duplicate_type"
		case verificationDocumentExpired = "verification_document_expired"
		case verificationDocumentFailedCopy = "verification_document_failed_copy"
		case verificationDocumentFailedGreyscale = "verification_document_failed_greyscale"
		case verificationDocumentFailedOther = "verification_document_failed_other"
		case verificationDocumentFailedTestMode = "verification_document_failed_test_mode"
		case verificationDocumentFraudulent = "verification_document_fraudulent"
		case verificationDocumentIdNumberMismatch = "verification_document_id_number_mismatch"
		case verificationDocumentIdNumberMissing = "verification_document_id_number_missing"
		case verificationDocumentIncomplete = "verification_document_incomplete"
		case verificationDocumentInvalid = "verification_document_invalid"
		case verificationDocumentIssueOrExpiryDateMissing = "verification_document_issue_or_expiry_date_missing"
		case verificationDocumentManipulated = "verification_document_manipulated"
		case verificationDocumentMissingBack = "verification_document_missing_back"
		case verificationDocumentMissingFront = "verification_document_missing_front"
		case verificationDocumentNameMismatch = "verification_document_name_mismatch"
		case verificationDocumentNameMissing = "verification_document_name_missing"
		case verificationDocumentNationalityMismatch = "verification_document_nationality_mismatch"
		case verificationDocumentNotReadable = "verification_document_not_readable"
		case verificationDocumentNotSigned = "verification_document_not_signed"
		case verificationDocumentNotUploaded = "verification_document_not_uploaded"
		case verificationDocumentPhotoMismatch = "verification_document_photo_mismatch"
		case verificationDocumentTooLarge = "verification_document_too_large"
		case verificationDocumentTypeNotSupported = "verification_document_type_not_supported"
		case verificationFailedAddressMatch = "verification_failed_address_match"
		case verificationFailedBusinessIecNumber = "verification_failed_business_iec_number"
		case verificationFailedDocumentMatch = "verification_failed_document_match"
		case verificationFailedIdNumberMatch = "verification_failed_id_number_match"
		case verificationFailedKeyedIdentity = "verification_failed_keyed_identity"
		case verificationFailedKeyedMatch = "verification_failed_keyed_match"
		case verificationFailedNameMatch = "verification_failed_name_match"
		case verificationFailedOther = "verification_failed_other"
		case verificationFailedTaxIdMatch = "verification_failed_tax_id_match"
		case verificationFailedTaxIdNotIssued = "verification_failed_tax_id_not_issued"
	}
}

public class AccountSepaDebitPaymentsSettings: Codable {
	/// SEPA creditor identifier that identifies the company making the payment.
	public var creditor_id: String?

	public init(creditor_id: String? = nil) {
		self.creditor_id = creditor_id
	}
}

public class AccountSettings: Codable {
	public var bacs_debit_payments: AccountBacsDebitPaymentsSettings?
	public var branding: AccountBrandingSettings
	public var card_payments: AccountCardPaymentsSettings
	public var dashboard: AccountDashboardSettings
	public var payments: AccountPaymentsSettings
	public var payouts: AccountPayoutSettings?
	public var sepa_debit_payments: AccountSepaDebitPaymentsSettings?

	public init(branding: AccountBrandingSettings, card_payments: AccountCardPaymentsSettings, dashboard: AccountDashboardSettings, payments: AccountPaymentsSettings, bacs_debit_payments: AccountBacsDebitPaymentsSettings? = nil, payouts: AccountPayoutSettings? = nil, sepa_debit_payments: AccountSepaDebitPaymentsSettings? = nil) {
		self.branding = branding
		self.card_payments = card_payments
		self.dashboard = dashboard
		self.payments = payments
		self.bacs_debit_payments = bacs_debit_payments
		self.payouts = payouts
		self.sepa_debit_payments = sepa_debit_payments
	}
}

public class AccountTosAcceptance: Codable {
	/// The Unix timestamp marking when the account representative accepted their service agreement
	public var date: Timestamp?
	/// The IP address from which the account representative accepted their service agreement
	public var ip: String?
	/// The user's service agreement type
	public var service_agreement: String?
	/// The user agent of the browser from which the account representative accepted their service agreement
	public var user_agent: String?

	public init(date: Timestamp? = nil, ip: String? = nil, service_agreement: String? = nil, user_agent: String? = nil) {
		self.date = date
		self.ip = ip
		self.service_agreement = service_agreement
		self.user_agent = user_agent
	}
}

public class Address: Codable {
	/// City, district, suburb, town, or village.
	public var city: String?
	/// Two-letter country code ([ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)).
	public var country: String?
	/// Address line 1 (e.g., street, PO Box, or company name).
	public var line1: String?
	/// Address line 2 (e.g., apartment, suite, unit, or building).
	public var line2: String?
	/// ZIP or postal code.
	public var postal_code: String?
	/// State, county, province, or region.
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

public class AlipayAccount: Codable {
	/// Time at which the object was created. Measured in seconds since the Unix epoch.
	public var created: Timestamp
	/// The ID of the customer associated with this Alipay Account.
	public var customer: String?
	/// Uniquely identifies the account and will be the same across all Alipay account objects that are linked to the same Alipay account.
	public var fingerprint: String
	/// Unique identifier for the object.
	public var id: String
	/// Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
	public var livemode: Bool
	/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
	public var metadata: String?
	/// String representing the object's type. Objects of the same type share the same value.
	public var object: ObjectValues
	/// If the Alipay account object is not reusable, the exact amount that you can create a charge for.
	public var payment_amount: Int?
	/// If the Alipay account object is not reusable, the exact currency that you can create a charge for.
	public var payment_currency: String?
	/// True if you can create multiple payments using this account. If the account is reusable, then you can freely choose the amount of each payment.
	public var reusable: Bool
	/// Whether this Alipay account object has ever been used for a payment.
	public var used: Bool
	/// The username for the Alipay account.
	public var username: String

	public init(created: Timestamp, fingerprint: String, id: String, livemode: Bool, object: ObjectValues, reusable: Bool, used: Bool, username: String, customer: String? = nil, metadata: String? = nil, payment_amount: Int? = nil, payment_currency: String? = nil) {
		self.created = created
		self.fingerprint = fingerprint
		self.id = id
		self.livemode = livemode
		self.object = object
		self.reusable = reusable
		self.used = used
		self.username = username
		self.customer = customer
		self.metadata = metadata
		self.payment_amount = payment_amount
		self.payment_currency = payment_currency
	}

	public enum ObjectValues: String, Codable {
		case alipayAccount = "alipay_account"
	}
}

public class ApiErrors: Codable {
	/// For card errors, the ID of the failed charge.
	public var charge: String?
	/// For some errors that could be handled programmatically, a short string indicating the [error code](https://stripe.com/docs/error-codes) reported.
	public var code: String?
	/// For card errors resulting from a card issuer decline, a short string indicating the [card issuer's reason for the decline](https://stripe.com/docs/declines#issuer-declines) if they provide one.
	public var decline_code: String?
	/// A URL to more information about the [error code](https://stripe.com/docs/error-codes) reported.
	public var doc_url: String?
	/// A human-readable message providing more details about the error. For card errors, these messages can be shown to your users.
	public var message: String?
	/// If the error is parameter-specific, the parameter related to the error. For example, you can use this to display a message near the correct form field.
	public var param: String?
	public var payment_intent: PaymentIntent?
	public var payment_method: PaymentMethod?
	/// If the error is specific to the type of payment method, the payment method type that had a problem. This field is only populated for invoice-related errors.
	public var payment_method_type: String?
	public var setup_intent: SetupIntent?
	/// The source object for errors returned on a request involving a source.
	public var source: BankAccount?
	/// The type of error returned. One of `api_connection_error`, `api_error`, `authentication_error`, `card_error`, `idempotency_error`, `invalid_request_error`, or `rate_limit_error`
	public var type: TypeValues

	public init(type: TypeValues, charge: String? = nil, code: String? = nil, decline_code: String? = nil, doc_url: String? = nil, message: String? = nil, param: String? = nil, payment_intent: PaymentIntent? = nil, payment_method: PaymentMethod? = nil, payment_method_type: String? = nil, setup_intent: SetupIntent? = nil, source: BankAccount? = nil) {
		self.type = type
		self.charge = charge
		self.code = code
		self.decline_code = decline_code
		self.doc_url = doc_url
		self.message = message
		self.param = param
		self.payment_intent = payment_intent
		self.payment_method = payment_method
		self.payment_method_type = payment_method_type
		self.setup_intent = setup_intent
		self.source = source
	}

	public enum TypeValues: String, Codable {
		case apiConnectionError = "api_connection_error"
		case apiError = "api_error"
		case authenticationError = "authentication_error"
		case cardError = "card_error"
		case idempotencyError = "idempotency_error"
		case invalidRequestError = "invalid_request_error"
		case rateLimitError = "rate_limit_error"
	}
}

public class ApplePayDomain: Codable {
	/// Time at which the object was created. Measured in seconds since the Unix epoch.
	public var created: Timestamp
	public var domain_name: String
	/// Unique identifier for the object.
	public var id: String
	/// Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
	public var livemode: Bool
	/// String representing the object's type. Objects of the same type share the same value.
	public var object: ObjectValues

	public init(created: Timestamp, domain_name: String, id: String, livemode: Bool, object: ObjectValues) {
		self.created = created
		self.domain_name = domain_name
		self.id = id
		self.livemode = livemode
		self.object = object
	}

	public enum ObjectValues: String, Codable {
		case applePayDomain = "apple_pay_domain"
	}
}

public class Application: Codable {
	/// Unique identifier for the object.
	public var id: String
	/// The name of the application.
	public var name: String?
	/// String representing the object's type. Objects of the same type share the same value.
	public var object: ObjectValues

	public init(id: String, object: ObjectValues, name: String? = nil) {
		self.id = id
		self.object = object
		self.name = name
	}

	public enum ObjectValues: String, Codable {
		case application = "application"
	}
}

public class ApplicationFee: Codable {
	/// ID of the Stripe account this fee was taken from.
	public var account: String
	/// Amount earned, in %s.
	public var amount: Int
	/// Amount in %s refunded (can be less than the amount attribute on the fee if a partial refund was issued)
	public var amount_refunded: Int
	/// ID of the Connect application that earned the fee.
	public var application: String
	/// Balance transaction that describes the impact of this collected application fee on your account balance (not including refunds).
	public var balance_transaction: String?
	/// ID of the charge that the application fee was taken from.
	public var charge: String
	/// Time at which the object was created. Measured in seconds since the Unix epoch.
	public var created: Timestamp
	/// Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
	public var currency: String
	/// Unique identifier for the object.
	public var id: String
	/// Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
	public var livemode: Bool
	/// String representing the object's type. Objects of the same type share the same value.
	public var object: ObjectValues
	/// ID of the corresponding charge on the platform account, if this fee was the result of a charge using the `destination` parameter.
	public var originating_transaction: String?
	/// Whether the fee has been fully refunded. If the fee is only partially refunded, this attribute will still be false.
	public var refunded: Bool
	/// A list of refunds that have been applied to the fee.
	public var refunds: FeeRefundList

	public init(account: String, amount: Int, amount_refunded: Int, application: String, charge: String, created: Timestamp, currency: String, id: String, livemode: Bool, object: ObjectValues, refunded: Bool, refunds: FeeRefundList, balance_transaction: String? = nil, originating_transaction: String? = nil) {
		self.account = account
		self.amount = amount
		self.amount_refunded = amount_refunded
		self.application = application
		self.charge = charge
		self.created = created
		self.currency = currency
		self.id = id
		self.livemode = livemode
		self.object = object
		self.refunded = refunded
		self.refunds = refunds
		self.balance_transaction = balance_transaction
		self.originating_transaction = originating_transaction
	}


	/// A list of refunds that have been applied to the fee.
	public class FeeRefundList: Codable {
		/// Details about each object.
		public var data: [FeeRefund]
		/// True if this list has another page of items after this one that can be fetched.
		public var has_more: Bool
		/// String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
		public var object: ObjectValues
		/// The URL where this list can be accessed.
		public var url: String

		/// A list of refunds that have been applied to the fee.
		/// - Parameters:
		///   - data: Details about each object.
		///   - has_more: True if this list has another page of items after this one that can be fetched.
		///   - object: String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
		///   - url: The URL where this list can be accessed.
		public init(data: [FeeRefund], has_more: Bool, object: ObjectValues, url: String) {
			self.data = data
			self.has_more = has_more
			self.object = object
			self.url = url
		}

		public enum ObjectValues: String, Codable {
			case list = "list"
		}
	}


	public enum ObjectValues: String, Codable {
		case applicationFee = "application_fee"
	}
}

/// This is an object representing your Stripe balance. You can retrieve it to see the balance currently on your Stripe account.  You can also retrieve the balance history, which contains a list of [transactions](https://stripe.com/docs/reporting/balance-transaction-types) that contributed to the balance (charges, payouts, and so forth).  The available and pending amounts for each currency are broken down further by payment source types.  Related guide: [Understanding Connect Account Balances](https://stripe.com/docs/connect/account-balances).
public class Balance: Codable {
	/// Funds that are available to be transferred or paid out, whether automatically by Stripe or explicitly via the [Transfers API](https://stripe.com/docs/api#transfers) or [Payouts API](https://stripe.com/docs/api#payouts). The available balance for each currency and payment type can be found in the `source_types` property.
	public var available: [BalanceAmount]
	/// Funds held due to negative balances on connected Custom accounts. The connect reserve balance for each currency and payment type can be found in the `source_types` property.
	public var connect_reserved: [BalanceAmount]?
	/// Funds that can be paid out using Instant Payouts.
	public var instant_available: [BalanceAmount]?
	public var issuing: BalanceDetail?
	/// Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
	public var livemode: Bool
	/// String representing the object's type. Objects of the same type share the same value.
	public var object: ObjectValues
	/// Funds that are not yet available in the balance, due to the 7-day rolling pay cycle. The pending balance for each currency, and for each payment type, can be found in the `source_types` property.
	public var pending: [BalanceAmount]

	/// This is an object representing your Stripe balance. You can retrieve it to see the balance currently on your Stripe account.  You can also retrieve the balance history, which contains a list of [transactions](https://stripe.com/docs/reporting/balance-transaction-types) that contributed to the balance (charges, payouts, and so forth).  The available and pending amounts for each currency are broken down further by payment source types.  Related guide: [Understanding Connect Account Balances](https://stripe.com/docs/connect/account-balances).
	/// - Parameters:
	///   - available: Funds that are available to be transferred or paid out, whether automatically by Stripe or explicitly via the [Transfers API](https://stripe.com/docs/api#transfers) or [Payouts API](https://stripe.com/docs/api#payouts). The available balance for each currency and payment type can be found in the `source_types` property.
	///   - connect_reserved: Funds held due to negative balances on connected Custom accounts. The connect reserve balance for each currency and payment type can be found in the `source_types` property.
	///   - instant_available: Funds that can be paid out using Instant Payouts.
	///   - livemode: Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
	///   - object: String representing the object's type. Objects of the same type share the same value.
	///   - pending: Funds that are not yet available in the balance, due to the 7-day rolling pay cycle. The pending balance for each currency, and for each payment type, can be found in the `source_types` property.
	public init(available: [BalanceAmount], livemode: Bool, object: ObjectValues, pending: [BalanceAmount], connect_reserved: [BalanceAmount]? = nil, instant_available: [BalanceAmount]? = nil, issuing: BalanceDetail? = nil) {
		self.available = available
		self.livemode = livemode
		self.object = object
		self.pending = pending
		self.connect_reserved = connect_reserved
		self.instant_available = instant_available
		self.issuing = issuing
	}

	public enum ObjectValues: String, Codable {
		case balance = "balance"
	}
}

public class BalanceAmount: Codable {
	/// Balance amount.
	public var amount: Int
	/// Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
	public var currency: String
	public var source_types: BalanceAmountBySourceType?

	public init(amount: Int, currency: String, source_types: BalanceAmountBySourceType? = nil) {
		self.amount = amount
		self.currency = currency
		self.source_types = source_types
	}
}

public class BalanceAmountBySourceType: Codable {
	/// Amount for bank account.
	public var bank_account: Int?
	/// Amount for card.
	public var card: Int?
	/// Amount for FPX.
	public var fpx: Int?

	public init(bank_account: Int? = nil, card: Int? = nil, fpx: Int? = nil) {
		self.bank_account = bank_account
		self.card = card
		self.fpx = fpx
	}
}

public class BalanceDetail: Codable {
	/// Funds that are available for use.
	public var available: [BalanceAmount]

	public init(available: [BalanceAmount]) {
		self.available = available
	}
}

/// Balance transactions represent funds moving through your Stripe account. They're created for every type of transaction that comes into or flows out of your Stripe account balance.  Related guide: [Balance Transaction Types](https://stripe.com/docs/reports/balance-transaction-types).
public class BalanceTransaction: Codable {
	/// Gross amount of the transaction, in %s.
	public var amount: Int
	/// The date the transaction's net funds will become available in the Stripe balance.
	public var available_on: Timestamp
	/// Time at which the object was created. Measured in seconds since the Unix epoch.
	public var created: Timestamp
	/// Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
	public var currency: String
	/// An arbitrary string attached to the object. Often useful for displaying to users.
	public var description: String?
	/// The exchange rate used, if applicable, for this transaction. Specifically, if money was converted from currency A to currency B, then the `amount` in currency A, times `exchange_rate`, would be the `amount` in currency B. For example, suppose you charged a customer 10.00 EUR. Then the PaymentIntent's `amount` would be `1000` and `currency` would be `eur`. Suppose this was converted into 12.34 USD in your Stripe account. Then the BalanceTransaction's `amount` would be `1234`, `currency` would be `usd`, and `exchange_rate` would be `1.234`.
	public var exchange_rate: StringNumber?
	/// Fees (in %s) paid for this transaction.
	public var fee: Int
	/// Detailed breakdown of fees (in %s) paid for this transaction.
	public var fee_details: [Fee]
	/// Unique identifier for the object.
	public var id: String
	/// Net amount of the transaction, in %s.
	public var net: Int
	/// String representing the object's type. Objects of the same type share the same value.
	public var object: ObjectValues
	/// [Learn more](https://stripe.com/docs/reports/reporting-categories) about how reporting categories can help you understand balance transactions from an accounting perspective.
	public var reporting_category: String
	/// The Stripe object to which this transaction is related.
	public var source: String?
	/// If the transaction's net funds are available in the Stripe balance yet. Either `available` or `pending`.
	public var status: String
	/// Transaction type: `adjustment`, `advance`, `advance_funding`, `anticipation_repayment`, `application_fee`, `application_fee_refund`, `charge`, `connect_collection_transfer`, `contribution`, `issuing_authorization_hold`, `issuing_authorization_release`, `issuing_dispute`, `issuing_transaction`, `payment`, `payment_failure_refund`, `payment_refund`, `payout`, `payout_cancel`, `payout_failure`, `refund`, `refund_failure`, `reserve_transaction`, `reserved_funds`, `stripe_fee`, `stripe_fx_fee`, `tax_fee`, `topup`, `topup_reversal`, `transfer`, `transfer_cancel`, `transfer_failure`, or `transfer_refund`. [Learn more](https://stripe.com/docs/reports/balance-transaction-types) about balance transaction types and what they represent. If you are looking to classify transactions for accounting purposes, you might want to consider `reporting_category` instead.
	public var type: TypeValues

	/// Balance transactions represent funds moving through your Stripe account. They're created for every type of transaction that comes into or flows out of your Stripe account balance.  Related guide: [Balance Transaction Types](https://stripe.com/docs/reports/balance-transaction-types).
	/// - Parameters:
	///   - amount: Gross amount of the transaction, in %s.
	///   - available_on: The date the transaction's net funds will become available in the Stripe balance.
	///   - created: Time at which the object was created. Measured in seconds since the Unix epoch.
	///   - currency: Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
	///   - description: An arbitrary string attached to the object. Often useful for displaying to users.
	///   - exchange_rate: The exchange rate used, if applicable, for this transaction. Specifically, if money was converted from currency A to currency B, then the `amount` in currency A, times `exchange_rate`, would be the `amount` in currency B. For example, suppose you charged a customer 10.00 EUR. Then the PaymentIntent's `amount` would be `1000` and `currency` would be `eur`. Suppose this was converted into 12.34 USD in your Stripe account. Then the BalanceTransaction's `amount` would be `1234`, `currency` would be `usd`, and `exchange_rate` would be `1.234`.
	///   - fee: Fees (in %s) paid for this transaction.
	///   - fee_details: Detailed breakdown of fees (in %s) paid for this transaction.
	///   - id: Unique identifier for the object.
	///   - net: Net amount of the transaction, in %s.
	///   - object: String representing the object's type. Objects of the same type share the same value.
	///   - reporting_category: [Learn more](https://stripe.com/docs/reports/reporting-categories) about how reporting categories can help you understand balance transactions from an accounting perspective.
	///   - source: The Stripe object to which this transaction is related.
	///   - status: If the transaction's net funds are available in the Stripe balance yet. Either `available` or `pending`.
	///   - type: Transaction type: `adjustment`, `advance`, `advance_funding`, `anticipation_repayment`, `application_fee`, `application_fee_refund`, `charge`, `connect_collection_transfer`, `contribution`, `issuing_authorization_hold`, `issuing_authorization_release`, `issuing_dispute`, `issuing_transaction`, `payment`, `payment_failure_refund`, `payment_refund`, `payout`, `payout_cancel`, `payout_failure`, `refund`, `refund_failure`, `reserve_transaction`, `reserved_funds`, `stripe_fee`, `stripe_fx_fee`, `tax_fee`, `topup`, `topup_reversal`, `transfer`, `transfer_cancel`, `transfer_failure`, or `transfer_refund`. [Learn more](https://stripe.com/docs/reports/balance-transaction-types) about balance transaction types and what they represent. If you are looking to classify transactions for accounting purposes, you might want to consider `reporting_category` instead.
	public init(amount: Int, available_on: Timestamp, created: Timestamp, currency: String, fee: Int, fee_details: [Fee], id: String, net: Int, object: ObjectValues, reporting_category: String, status: String, type: TypeValues, description: String? = nil, exchange_rate: StringNumber? = nil, source: String? = nil) {
		self.amount = amount
		self.available_on = available_on
		self.created = created
		self.currency = currency
		self.fee = fee
		self.fee_details = fee_details
		self.id = id
		self.net = net
		self.object = object
		self.reporting_category = reporting_category
		self.status = status
		self.type = type
		self.description = description
		self.exchange_rate = exchange_rate
		self.source = source
	}

	public enum TypeValues: String, Codable {
		case adjustment = "adjustment"
		case advance = "advance"
		case advanceFunding = "advance_funding"
		case anticipationRepayment = "anticipation_repayment"
		case applicationFee = "application_fee"
		case applicationFeeRefund = "application_fee_refund"
		case charge = "charge"
		case connectCollectionTransfer = "connect_collection_transfer"
		case contribution = "contribution"
		case issuingAuthorizationHold = "issuing_authorization_hold"
		case issuingAuthorizationRelease = "issuing_authorization_release"
		case issuingDispute = "issuing_dispute"
		case issuingTransaction = "issuing_transaction"
		case payment = "payment"
		case paymentFailureRefund = "payment_failure_refund"
		case paymentRefund = "payment_refund"
		case payout = "payout"
		case payoutCancel = "payout_cancel"
		case payoutFailure = "payout_failure"
		case refund = "refund"
		case refundFailure = "refund_failure"
		case reserveTransaction = "reserve_transaction"
		case reservedFunds = "reserved_funds"
		case stripeFee = "stripe_fee"
		case stripeFxFee = "stripe_fx_fee"
		case taxFee = "tax_fee"
		case topup = "topup"
		case topupReversal = "topup_reversal"
		case transfer = "transfer"
		case transferCancel = "transfer_cancel"
		case transferFailure = "transfer_failure"
		case transferRefund = "transfer_refund"
	}

	public enum ObjectValues: String, Codable {
		case balanceTransaction = "balance_transaction"
	}
}

/// These bank accounts are payment methods on `Customer` objects.  On the other hand [External Accounts](https://stripe.com/docs/api#external_accounts) are transfer destinations on `Account` objects for [Custom accounts](https://stripe.com/docs/connect/custom-accounts). They can be bank accounts or debit cards as well, and are documented in the links above.  Related guide: [Bank Debits and Transfers](https://stripe.com/docs/payments/bank-debits-transfers).
public class BankAccount: Codable {
	/// The ID of the account that the bank account is associated with.
	public var account: String?
	/// The name of the person or business that owns the bank account.
	public var account_holder_name: String?
	/// The type of entity that holds the account. This can be either `individual` or `company`.
	public var account_holder_type: String?
	/// A set of available payout methods for this bank account. Only values from this set should be passed as the `method` when creating a payout.
	public var available_payout_methods: [String]??
	/// Name of the bank associated with the routing number (e.g., `WELLS FARGO`).
	public var bank_name: String?
	/// Two-letter ISO code representing the country the bank account is located in.
	public var country: String
	/// Three-letter [ISO code for the currency](https://stripe.com/docs/payouts) paid out to the bank account.
	public var currency: String
	/// The ID of the customer that the bank account is associated with.
	public var customer: String?
	/// Whether this bank account is the default external account for its currency.
	public var default_for_currency: Bool?
	/// Uniquely identifies this particular bank account. You can use this attribute to check whether two bank accounts are the same.
	public var fingerprint: String?
	/// Unique identifier for the object.
	public var id: String
	/// The last four digits of the bank account number.
	public var last4: String
	/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
	public var metadata: String?
	/// String representing the object's type. Objects of the same type share the same value.
	public var object: ObjectValues
	/// The routing transit number for the bank account.
	public var routing_number: String?
	/// For bank accounts, possible values are `new`, `validated`, `verified`, `verification_failed`, or `errored`. A bank account that hasn't had any activity or validation performed is `new`. If Stripe can determine that the bank account exists, its status will be `validated`. Note that there often isn’t enough information to know (e.g., for smaller credit unions), and the validation is not always run. If customer bank account verification has succeeded, the bank account status will be `verified`. If the verification failed for any reason, such as microdeposit failure, the status will be `verification_failed`. If a transfer sent to this bank account fails, we'll set the status to `errored` and will not continue to send transfers until the bank details are updated.  For external accounts, possible values are `new` and `errored`. Validations aren't run against external accounts because they're only used for payouts. This means the other statuses don't apply. If a transfer fails, the status is set to `errored` and transfers are stopped until account details are updated.
	public var status: String

	/// These bank accounts are payment methods on `Customer` objects.  On the other hand [External Accounts](https://stripe.com/docs/api#external_accounts) are transfer destinations on `Account` objects for [Custom accounts](https://stripe.com/docs/connect/custom-accounts). They can be bank accounts or debit cards as well, and are documented in the links above.  Related guide: [Bank Debits and Transfers](https://stripe.com/docs/payments/bank-debits-transfers).
	/// - Parameters:
	///   - account: The ID of the account that the bank account is associated with.
	///   - account_holder_name: The name of the person or business that owns the bank account.
	///   - account_holder_type: The type of entity that holds the account. This can be either `individual` or `company`.
	///   - available_payout_methods: A set of available payout methods for this bank account. Only values from this set should be passed as the `method` when creating a payout.
	///   - bank_name: Name of the bank associated with the routing number (e.g., `WELLS FARGO`).
	///   - country: Two-letter ISO code representing the country the bank account is located in.
	///   - currency: Three-letter [ISO code for the currency](https://stripe.com/docs/payouts) paid out to the bank account.
	///   - customer: The ID of the customer that the bank account is associated with.
	///   - default_for_currency: Whether this bank account is the default external account for its currency.
	///   - fingerprint: Uniquely identifies this particular bank account. You can use this attribute to check whether two bank accounts are the same.
	///   - id: Unique identifier for the object.
	///   - last4: The last four digits of the bank account number.
	///   - metadata: Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
	///   - object: String representing the object's type. Objects of the same type share the same value.
	///   - routing_number: The routing transit number for the bank account.
	///   - status: For bank accounts, possible values are `new`, `validated`, `verified`, `verification_failed`, or `errored`. A bank account that hasn't had any activity or validation performed is `new`. If Stripe can determine that the bank account exists, its status will be `validated`. Note that there often isn’t enough information to know (e.g., for smaller credit unions), and the validation is not always run. If customer bank account verification has succeeded, the bank account status will be `verified`. If the verification failed for any reason, such as microdeposit failure, the status will be `verification_failed`. If a transfer sent to this bank account fails, we'll set the status to `errored` and will not continue to send transfers until the bank details are updated.  For external accounts, possible values are `new` and `errored`. Validations aren't run against external accounts because they're only used for payouts. This means the other statuses don't apply. If a transfer fails, the status is set to `errored` and transfers are stopped until account details are updated.
	public init(country: String, currency: String, id: String, last4: String, object: ObjectValues, status: String, account: String? = nil, account_holder_name: String? = nil, account_holder_type: String? = nil, available_payout_methods: [String]?? = nil, bank_name: String? = nil, customer: String? = nil, default_for_currency: Bool? = nil, fingerprint: String? = nil, metadata: String? = nil, routing_number: String? = nil) {
		self.country = country
		self.currency = currency
		self.id = id
		self.last4 = last4
		self.object = object
		self.status = status
		self.account = account
		self.account_holder_name = account_holder_name
		self.account_holder_type = account_holder_type
		self.available_payout_methods = available_payout_methods
		self.bank_name = bank_name
		self.customer = customer
		self.default_for_currency = default_for_currency
		self.fingerprint = fingerprint
		self.metadata = metadata
		self.routing_number = routing_number
	}

	public enum ObjectValues: String, Codable {
		case bankAccount = "bank_account"
	}
}

public class BillingDetails: Codable {
	/// Billing address.
	public var address: Address?
	/// Email address.
	public var email: String?
	/// Full name.
	public var name: String?
	/// Billing phone number (including extension).
	public var phone: String?

	public init(address: Address? = nil, email: String? = nil, name: String? = nil, phone: String? = nil) {
		self.address = address
		self.email = email
		self.name = name
		self.phone = phone
	}
}

/// A session describes the instantiation of the customer portal for a particular customer. By visiting the session's URL, the customer can manage their subscriptions and billing details. For security reasons, sessions are short-lived and will expire if the customer does not visit the URL. Create sessions on-demand when customers intend to manage their subscriptions and billing details.  Integration guide: [Billing customer portal](https://stripe.com/docs/billing/subscriptions/integrating-customer-portal).
public class BillingPortalSession: Codable {
	/// Time at which the object was created. Measured in seconds since the Unix epoch.
	public var created: Timestamp
	/// The ID of the customer for this session.
	public var customer: String
	/// Unique identifier for the object.
	public var id: String
	/// Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
	public var livemode: Bool
	/// String representing the object's type. Objects of the same type share the same value.
	public var object: ObjectValues
	/// The URL to which Stripe should send customers when they click on the link to return to your website.
	public var return_url: String
	/// The short-lived URL of the session giving customers access to the customer portal.
	public var url: String

	/// A session describes the instantiation of the customer portal for a particular customer. By visiting the session's URL, the customer can manage their subscriptions and billing details. For security reasons, sessions are short-lived and will expire if the customer does not visit the URL. Create sessions on-demand when customers intend to manage their subscriptions and billing details.  Integration guide: [Billing customer portal](https://stripe.com/docs/billing/subscriptions/integrating-customer-portal).
	/// - Parameters:
	///   - created: Time at which the object was created. Measured in seconds since the Unix epoch.
	///   - customer: The ID of the customer for this session.
	///   - id: Unique identifier for the object.
	///   - livemode: Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
	///   - object: String representing the object's type. Objects of the same type share the same value.
	///   - return_url: The URL to which Stripe should send customers when they click on the link to return to your website.
	///   - url: The short-lived URL of the session giving customers access to the customer portal.
	public init(created: Timestamp, customer: String, id: String, livemode: Bool, object: ObjectValues, return_url: String, url: String) {
		self.created = created
		self.customer = customer
		self.id = id
		self.livemode = livemode
		self.object = object
		self.return_url = return_url
		self.url = url
	}

	public enum ObjectValues: String, Codable {
		case billingPortalSession = "billing_portal.session"
	}
}

public class BitcoinReceiver: Codable {
	/// True when this bitcoin receiver has received a non-zero amount of bitcoin.
	public var active: Bool
	/// The amount of `currency` that you are collecting as payment.
	public var amount: Int
	/// The amount of `currency` to which `bitcoin_amount_received` has been converted.
	public var amount_received: Int
	/// The amount of bitcoin that the customer should send to fill the receiver. The `bitcoin_amount` is denominated in Satoshi: there are 10^8 Satoshi in one bitcoin.
	public var bitcoin_amount: Int
	/// The amount of bitcoin that has been sent by the customer to this receiver.
	public var bitcoin_amount_received: Int
	/// This URI can be displayed to the customer as a clickable link (to activate their bitcoin client) or as a QR code (for mobile wallets).
	public var bitcoin_uri: String
	/// Time at which the object was created. Measured in seconds since the Unix epoch.
	public var created: Timestamp
	/// Three-letter [ISO code for the currency](https://stripe.com/docs/currencies) to which the bitcoin will be converted.
	public var currency: String
	/// The customer ID of the bitcoin receiver.
	public var customer: String?
	/// An arbitrary string attached to the object. Often useful for displaying to users.
	public var description: String?
	/// The customer's email address, set by the API call that creates the receiver.
	public var email: String?
	/// This flag is initially false and updates to true when the customer sends the `bitcoin_amount` to this receiver.
	public var filled: Bool
	/// Unique identifier for the object.
	public var id: String
	/// A bitcoin address that is specific to this receiver. The customer can send bitcoin to this address to fill the receiver.
	public var inbound_address: String
	/// Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
	public var livemode: Bool
	/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
	public var metadata: String?
	/// String representing the object's type. Objects of the same type share the same value.
	public var object: ObjectValues
	/// The ID of the payment created from the receiver, if any. Hidden when viewing the receiver with a publishable key.
	public var payment: String?
	/// The refund address of this bitcoin receiver.
	public var refund_address: String?
	/// A list with one entry for each time that the customer sent bitcoin to the receiver. Hidden when viewing the receiver with a publishable key.
	public var transactions: BitcoinTransactionList?
	/// This receiver contains uncaptured funds that can be used for a payment or refunded.
	public var uncaptured_funds: Bool
	/// Indicate if this source is used for payment.
	public var used_for_payment: Bool?

	public init(active: Bool, amount: Int, amount_received: Int, bitcoin_amount: Int, bitcoin_amount_received: Int, bitcoin_uri: String, created: Timestamp, currency: String, filled: Bool, id: String, inbound_address: String, livemode: Bool, object: ObjectValues, uncaptured_funds: Bool, customer: String? = nil, description: String? = nil, email: String? = nil, metadata: String? = nil, payment: String? = nil, refund_address: String? = nil, transactions: BitcoinTransactionList? = nil, used_for_payment: Bool? = nil) {
		self.active = active
		self.amount = amount
		self.amount_received = amount_received
		self.bitcoin_amount = bitcoin_amount
		self.bitcoin_amount_received = bitcoin_amount_received
		self.bitcoin_uri = bitcoin_uri
		self.created = created
		self.currency = currency
		self.filled = filled
		self.id = id
		self.inbound_address = inbound_address
		self.livemode = livemode
		self.object = object
		self.uncaptured_funds = uncaptured_funds
		self.customer = customer
		self.description = description
		self.email = email
		self.metadata = metadata
		self.payment = payment
		self.refund_address = refund_address
		self.transactions = transactions
		self.used_for_payment = used_for_payment
	}


	/// A list with one entry for each time that the customer sent bitcoin to the receiver. Hidden when viewing the receiver with a publishable key.
	public class BitcoinTransactionList: Codable {
		/// Details about each object.
		public var data: [BitcoinTransaction]
		/// True if this list has another page of items after this one that can be fetched.
		public var has_more: Bool
		/// String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
		public var object: ObjectValues
		/// The URL where this list can be accessed.
		public var url: String

		/// A list with one entry for each time that the customer sent bitcoin to the receiver. Hidden when viewing the receiver with a publishable key.
		/// - Parameters:
		///   - data: Details about each object.
		///   - has_more: True if this list has another page of items after this one that can be fetched.
		///   - object: String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
		///   - url: The URL where this list can be accessed.
		public init(data: [BitcoinTransaction], has_more: Bool, object: ObjectValues, url: String) {
			self.data = data
			self.has_more = has_more
			self.object = object
			self.url = url
		}

		public enum ObjectValues: String, Codable {
			case list = "list"
		}
	}


	public enum ObjectValues: String, Codable {
		case bitcoinReceiver = "bitcoin_receiver"
	}
}

public class BitcoinTransaction: Codable {
	/// The amount of `currency` that the transaction was converted to in real-time.
	public var amount: Int
	/// The amount of bitcoin contained in the transaction.
	public var bitcoin_amount: Int
	/// Time at which the object was created. Measured in seconds since the Unix epoch.
	public var created: Timestamp
	/// Three-letter [ISO code for the currency](https://stripe.com/docs/currencies) to which this transaction was converted.
	public var currency: String
	/// Unique identifier for the object.
	public var id: String
	/// String representing the object's type. Objects of the same type share the same value.
	public var object: ObjectValues
	/// The receiver to which this transaction was sent.
	public var receiver: String

	public init(amount: Int, bitcoin_amount: Int, created: Timestamp, currency: String, id: String, object: ObjectValues, receiver: String) {
		self.amount = amount
		self.bitcoin_amount = bitcoin_amount
		self.created = created
		self.currency = currency
		self.id = id
		self.object = object
		self.receiver = receiver
	}

	public enum ObjectValues: String, Codable {
		case bitcoinTransaction = "bitcoin_transaction"
	}
}

/// This is an object representing a capability for a Stripe account.  Related guide: [Account capabilities](https://stripe.com/docs/connect/account-capabilities).
public class Capability: Codable {
	/// The account for which the capability enables functionality.
	public var account: String
	/// The identifier for the capability.
	public var id: String
	/// String representing the object's type. Objects of the same type share the same value.
	public var object: ObjectValues
	/// Whether the capability has been requested.
	public var requested: Bool
	/// Time at which the capability was requested. Measured in seconds since the Unix epoch.
	public var requested_at: Timestamp?
	public var requirements: AccountCapabilityRequirements?
	/// The status of the capability. Can be `active`, `inactive`, `pending`, or `unrequested`.
	public var status: StatusValues

	/// This is an object representing a capability for a Stripe account.  Related guide: [Account capabilities](https://stripe.com/docs/connect/account-capabilities).
	/// - Parameters:
	///   - account: The account for which the capability enables functionality.
	///   - id: The identifier for the capability.
	///   - object: String representing the object's type. Objects of the same type share the same value.
	///   - requested: Whether the capability has been requested.
	///   - requested_at: Time at which the capability was requested. Measured in seconds since the Unix epoch.
	///   - status: The status of the capability. Can be `active`, `inactive`, `pending`, or `unrequested`.
	public init(account: String, id: String, object: ObjectValues, requested: Bool, status: StatusValues, requested_at: Timestamp? = nil, requirements: AccountCapabilityRequirements? = nil) {
		self.account = account
		self.id = id
		self.object = object
		self.requested = requested
		self.status = status
		self.requested_at = requested_at
		self.requirements = requirements
	}

	public enum ObjectValues: String, Codable {
		case capability = "capability"
	}

	public enum StatusValues: String, Codable {
		case active = "active"
		case disabled = "disabled"
		case inactive = "inactive"
		case pending = "pending"
		case unrequested = "unrequested"
	}
}

/// You can store multiple cards on a customer in order to charge the customer later. You can also store multiple debit cards on a recipient in order to transfer to those cards later.  Related guide: [Card Payments with Sources](https://stripe.com/docs/sources/cards).
public class Card: Codable {
	/// The account this card belongs to. This attribute will not be in the card object if the card belongs to a customer or recipient instead.
	public var account: String?
	/// City/District/Suburb/Town/Village.
	public var address_city: String?
	/// Billing address country, if provided when creating card.
	public var address_country: String?
	/// Address line 1 (Street address/PO Box/Company name).
	public var address_line1: String?
	/// If `address_line1` was provided, results of the check: `pass`, `fail`, `unavailable`, or `unchecked`.
	public var address_line1_check: String?
	/// Address line 2 (Apartment/Suite/Unit/Building).
	public var address_line2: String?
	/// State/County/Province/Region.
	public var address_state: String?
	/// ZIP or postal code.
	public var address_zip: String?
	/// If `address_zip` was provided, results of the check: `pass`, `fail`, `unavailable`, or `unchecked`.
	public var address_zip_check: String?
	/// A set of available payout methods for this card. Only values from this set should be passed as the `method` when creating a payout.
	public var available_payout_methods: [String]??
	/// Card brand. Can be `American Express`, `Diners Club`, `Discover`, `JCB`, `MasterCard`, `UnionPay`, `Visa`, or `Unknown`.
	public var brand: String
	/// Two-letter ISO code representing the country of the card. You could use this attribute to get a sense of the international breakdown of cards you've collected.
	public var country: String?
	/// Three-letter [ISO code for currency](https://stripe.com/docs/payouts). Only applicable on accounts (not customers or recipients). The card can be used as a transfer destination for funds in this currency.
	public var currency: String?
	/// The customer that this card belongs to. This attribute will not be in the card object if the card belongs to an account or recipient instead.
	public var customer: String?
	/// If a CVC was provided, results of the check: `pass`, `fail`, `unavailable`, or `unchecked`. A result of unchecked indicates that CVC was provided but hasn't been checked yet. Checks are typically performed when attaching a card to a Customer object, or when creating a charge. For more details, see [Check if a card is valid without a charge](https://support.stripe.com/questions/check-if-a-card-is-valid-without-a-charge).
	public var cvc_check: String?
	/// Whether this card is the default external account for its currency.
	public var default_for_currency: Bool?
	/// (For tokenized numbers only.) The last four digits of the device account number.
	public var dynamic_last4: String?
	/// Two-digit number representing the card's expiration month.
	public var exp_month: Int
	/// Four-digit number representing the card's expiration year.
	public var exp_year: Int
	/// Uniquely identifies this particular card number. You can use this attribute to check whether two customers who’ve signed up with you are using the same card number, for example. For payment methods that tokenize card information (Apple Pay, Google Pay), the tokenized number might be provided instead of the underlying card number.
	public var fingerprint: String?
	/// Card funding type. Can be `credit`, `debit`, `prepaid`, or `unknown`.
	public var funding: String
	/// Unique identifier for the object.
	public var id: String
	/// The last four digits of the card.
	public var last4: String
	/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
	public var metadata: String?
	/// Cardholder name.
	public var name: String?
	/// String representing the object's type. Objects of the same type share the same value.
	public var object: ObjectValues
	/// The recipient that this card belongs to. This attribute will not be in the card object if the card belongs to a customer or account instead.
	public var recipient: String?
	/// If the card number is tokenized, this is the method that was used. Can be `android_pay` (includes Google Pay), `apple_pay`, `masterpass`, `visa_checkout`, or null.
	public var tokenization_method: String?

	/// You can store multiple cards on a customer in order to charge the customer later. You can also store multiple debit cards on a recipient in order to transfer to those cards later.  Related guide: [Card Payments with Sources](https://stripe.com/docs/sources/cards).
	/// - Parameters:
	///   - account: The account this card belongs to. This attribute will not be in the card object if the card belongs to a customer or recipient instead.
	///   - address_city: City/District/Suburb/Town/Village.
	///   - address_country: Billing address country, if provided when creating card.
	///   - address_line1: Address line 1 (Street address/PO Box/Company name).
	///   - address_line1_check: If `address_line1` was provided, results of the check: `pass`, `fail`, `unavailable`, or `unchecked`.
	///   - address_line2: Address line 2 (Apartment/Suite/Unit/Building).
	///   - address_state: State/County/Province/Region.
	///   - address_zip: ZIP or postal code.
	///   - address_zip_check: If `address_zip` was provided, results of the check: `pass`, `fail`, `unavailable`, or `unchecked`.
	///   - available_payout_methods: A set of available payout methods for this card. Only values from this set should be passed as the `method` when creating a payout.
	///   - brand: Card brand. Can be `American Express`, `Diners Club`, `Discover`, `JCB`, `MasterCard`, `UnionPay`, `Visa`, or `Unknown`.
	///   - country: Two-letter ISO code representing the country of the card. You could use this attribute to get a sense of the international breakdown of cards you've collected.
	///   - currency: Three-letter [ISO code for currency](https://stripe.com/docs/payouts). Only applicable on accounts (not customers or recipients). The card can be used as a transfer destination for funds in this currency.
	///   - customer: The customer that this card belongs to. This attribute will not be in the card object if the card belongs to an account or recipient instead.
	///   - cvc_check: If a CVC was provided, results of the check: `pass`, `fail`, `unavailable`, or `unchecked`. A result of unchecked indicates that CVC was provided but hasn't been checked yet. Checks are typically performed when attaching a card to a Customer object, or when creating a charge. For more details, see [Check if a card is valid without a charge](https://support.stripe.com/questions/check-if-a-card-is-valid-without-a-charge).
	///   - default_for_currency: Whether this card is the default external account for its currency.
	///   - dynamic_last4: (For tokenized numbers only.) The last four digits of the device account number.
	///   - exp_month: Two-digit number representing the card's expiration month.
	///   - exp_year: Four-digit number representing the card's expiration year.
	///   - fingerprint: Uniquely identifies this particular card number. You can use this attribute to check whether two customers who’ve signed up with you are using the same card number, for example. For payment methods that tokenize card information (Apple Pay, Google Pay), the tokenized number might be provided instead of the underlying card number.
	///   - funding: Card funding type. Can be `credit`, `debit`, `prepaid`, or `unknown`.
	///   - id: Unique identifier for the object.
	///   - last4: The last four digits of the card.
	///   - metadata: Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
	///   - name: Cardholder name.
	///   - object: String representing the object's type. Objects of the same type share the same value.
	///   - recipient: The recipient that this card belongs to. This attribute will not be in the card object if the card belongs to a customer or account instead.
	///   - tokenization_method: If the card number is tokenized, this is the method that was used. Can be `android_pay` (includes Google Pay), `apple_pay`, `masterpass`, `visa_checkout`, or null.
	public init(brand: String, exp_month: Int, exp_year: Int, funding: String, id: String, last4: String, object: ObjectValues, account: String? = nil, address_city: String? = nil, address_country: String? = nil, address_line1: String? = nil, address_line1_check: String? = nil, address_line2: String? = nil, address_state: String? = nil, address_zip: String? = nil, address_zip_check: String? = nil, available_payout_methods: [String]?? = nil, country: String? = nil, currency: String? = nil, customer: String? = nil, cvc_check: String? = nil, default_for_currency: Bool? = nil, dynamic_last4: String? = nil, fingerprint: String? = nil, metadata: String? = nil, name: String? = nil, recipient: String? = nil, tokenization_method: String? = nil) {
		self.brand = brand
		self.exp_month = exp_month
		self.exp_year = exp_year
		self.funding = funding
		self.id = id
		self.last4 = last4
		self.object = object
		self.account = account
		self.address_city = address_city
		self.address_country = address_country
		self.address_line1 = address_line1
		self.address_line1_check = address_line1_check
		self.address_line2 = address_line2
		self.address_state = address_state
		self.address_zip = address_zip
		self.address_zip_check = address_zip_check
		self.available_payout_methods = available_payout_methods
		self.country = country
		self.currency = currency
		self.customer = customer
		self.cvc_check = cvc_check
		self.default_for_currency = default_for_currency
		self.dynamic_last4 = dynamic_last4
		self.fingerprint = fingerprint
		self.metadata = metadata
		self.name = name
		self.recipient = recipient
		self.tokenization_method = tokenization_method
	}

	public enum ObjectValues: String, Codable {
		case card = "card"
	}
}

public class CardGeneratedFromPaymentMethodDetails: Codable {
	public var card_present: PaymentMethodDetailsCardPresent?
	/// The type of payment method transaction-specific details from the transaction that generated this `card` payment method. Always `card_present`.
	public var type: String

	public init(type: String, card_present: PaymentMethodDetailsCardPresent? = nil) {
		self.type = type
		self.card_present = card_present
	}
}

public class CardMandatePaymentMethodDetails: Codable {

	public init() {
	}
}

/// To charge a credit or a debit card, you create a `Charge` object. You can retrieve and refund individual charges as well as list all charges. Charges are identified by a unique, random ID.  Related guide: [Accept a payment with the Charges API](https://stripe.com/docs/payments/accept-a-payment-charges).
public class Charge: Codable {
	/// Amount intended to be collected by this payment. A positive integer representing how much to charge in the [smallest currency unit](https://stripe.com/docs/currencies#zero-decimal) (e.g., 100 cents to charge $1.00 or 100 to charge ¥100, a zero-decimal currency). The minimum amount is $0.50 US or [equivalent in charge currency](https://stripe.com/docs/currencies#minimum-and-maximum-charge-amounts). The amount value supports up to eight digits (e.g., a value of 99999999 for a USD charge of $999,999.99).
	public var amount: Int
	/// Amount in %s captured (can be less than the amount attribute on the charge if a partial capture was made).
	public var amount_captured: Int
	/// Amount in %s refunded (can be less than the amount attribute on the charge if a partial refund was issued).
	public var amount_refunded: Int
	/// ID of the Connect application that created the charge.
	public var application: String?
	/// The application fee (if any) for the charge. [See the Connect documentation](https://stripe.com/docs/connect/direct-charges#collecting-fees) for details.
	public var application_fee: String?
	/// The amount of the application fee (if any) requested for the charge. [See the Connect documentation](https://stripe.com/docs/connect/direct-charges#collecting-fees) for details.
	public var application_fee_amount: Int?
	/// ID of the balance transaction that describes the impact of this charge on your account balance (not including refunds or disputes).
	public var balance_transaction: String?
	public var billing_details: BillingDetails
	/// The full statement descriptor that is passed to card networks, and that is displayed on your customers' credit card and bank statements. Allows you to see what the statement descriptor looks like after the static and dynamic portions are combined.
	public var calculated_statement_descriptor: String?
	/// If the charge was created without capturing, this Boolean represents whether it is still uncaptured or has since been captured.
	public var captured: Bool
	/// Time at which the object was created. Measured in seconds since the Unix epoch.
	public var created: Timestamp
	/// Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
	public var currency: String
	/// ID of the customer this charge is for if one exists.
	public var customer: String?
	/// An arbitrary string attached to the object. Often useful for displaying to users.
	public var description: String?
	/// Whether the charge has been disputed.
	public var disputed: Bool
	/// Error code explaining reason for charge failure if available (see [the errors section](https://stripe.com/docs/api#errors) for a list of codes).
	public var failure_code: String?
	/// Message to user further explaining reason for charge failure if available.
	public var failure_message: String?
	/// Information on fraud assessments for the charge.
	public var fraud_details: ChargeFraudDetails?
	/// Unique identifier for the object.
	public var id: String
	/// ID of the invoice this charge is for if one exists.
	public var invoice: String?
	/// Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
	public var livemode: Bool
	/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
	public var metadata: String
	/// String representing the object's type. Objects of the same type share the same value.
	public var object: ObjectValues
	/// The account (if any) the charge was made on behalf of without triggering an automatic transfer. See the [Connect documentation](https://stripe.com/docs/connect/charges-transfers) for details.
	public var on_behalf_of: String?
	/// ID of the order this charge is for if one exists.
	public var order: String?
	/// Details about whether the payment was accepted, and why. See [understanding declines](https://stripe.com/docs/declines) for details.
	public var outcome: ChargeOutcome?
	/// `true` if the charge succeeded, or was successfully authorized for later capture.
	public var paid: Bool
	/// ID of the PaymentIntent associated with this charge, if one exists.
	public var payment_intent: String?
	/// ID of the payment method used in this charge.
	public var payment_method: String?
	/// Details about the payment method at the time of the transaction.
	public var payment_method_details: PaymentMethodDetails?
	/// This is the email address that the receipt for this charge was sent to.
	public var receipt_email: String?
	/// This is the transaction number that appears on email receipts sent for this charge. This attribute will be `null` until a receipt has been sent.
	public var receipt_number: String?
	/// This is the URL to view the receipt for this charge. The receipt is kept up-to-date to the latest state of the charge, including any refunds. If the charge is for an Invoice, the receipt will be stylized as an Invoice receipt.
	public var receipt_url: String?
	/// Whether the charge has been fully refunded. If the charge is only partially refunded, this attribute will still be false.
	public var refunded: Bool
	/// A list of refunds that have been applied to the charge.
	public var refunds: RefundList
	/// ID of the review associated with this charge if one exists.
	public var review: String?
	/// Shipping information for the charge.
	public var shipping: Shipping?
	/// The transfer ID which created this charge. Only present if the charge came from another Stripe account. [See the Connect documentation](https://stripe.com/docs/connect/destination-charges) for details.
	public var source_transfer: String?
	/// For card charges, use `statement_descriptor_suffix` instead. Otherwise, you can use this value as the complete description of a charge on your customers’ statements. Must contain at least one letter, maximum 22 characters.
	public var statement_descriptor: String?
	/// Provides information about the charge that customers see on their statements. Concatenated with the prefix (shortened descriptor) or statement descriptor that’s set on the account to form the complete statement descriptor. Maximum 22 characters for the concatenated descriptor.
	public var statement_descriptor_suffix: String?
	/// The status of the payment is either `succeeded`, `pending`, or `failed`.
	public var status: String
	/// ID of the transfer to the `destination` account (only applicable if the charge was created using the `destination` parameter).
	public var transfer: String?
	/// An optional dictionary including the account to automatically transfer to as part of a destination charge. [See the Connect documentation](https://stripe.com/docs/connect/destination-charges) for details.
	public var transfer_data: ChargeTransferData?
	/// A string that identifies this transaction as part of a group. See the [Connect documentation](https://stripe.com/docs/connect/charges-transfers#transfer-options) for details.
	public var transfer_group: String?

	/// To charge a credit or a debit card, you create a `Charge` object. You can retrieve and refund individual charges as well as list all charges. Charges are identified by a unique, random ID.  Related guide: [Accept a payment with the Charges API](https://stripe.com/docs/payments/accept-a-payment-charges).
	/// - Parameters:
	///   - amount: Amount intended to be collected by this payment. A positive integer representing how much to charge in the [smallest currency unit](https://stripe.com/docs/currencies#zero-decimal) (e.g., 100 cents to charge $1.00 or 100 to charge ¥100, a zero-decimal currency). The minimum amount is $0.50 US or [equivalent in charge currency](https://stripe.com/docs/currencies#minimum-and-maximum-charge-amounts). The amount value supports up to eight digits (e.g., a value of 99999999 for a USD charge of $999,999.99).
	///   - amount_captured: Amount in %s captured (can be less than the amount attribute on the charge if a partial capture was made).
	///   - amount_refunded: Amount in %s refunded (can be less than the amount attribute on the charge if a partial refund was issued).
	///   - application: ID of the Connect application that created the charge.
	///   - application_fee: The application fee (if any) for the charge. [See the Connect documentation](https://stripe.com/docs/connect/direct-charges#collecting-fees) for details.
	///   - application_fee_amount: The amount of the application fee (if any) requested for the charge. [See the Connect documentation](https://stripe.com/docs/connect/direct-charges#collecting-fees) for details.
	///   - balance_transaction: ID of the balance transaction that describes the impact of this charge on your account balance (not including refunds or disputes).
	///   - billing_details: 
	///   - calculated_statement_descriptor: The full statement descriptor that is passed to card networks, and that is displayed on your customers' credit card and bank statements. Allows you to see what the statement descriptor looks like after the static and dynamic portions are combined.
	///   - captured: If the charge was created without capturing, this Boolean represents whether it is still uncaptured or has since been captured.
	///   - created: Time at which the object was created. Measured in seconds since the Unix epoch.
	///   - currency: Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
	///   - customer: ID of the customer this charge is for if one exists.
	///   - description: An arbitrary string attached to the object. Often useful for displaying to users.
	///   - disputed: Whether the charge has been disputed.
	///   - failure_code: Error code explaining reason for charge failure if available (see [the errors section](https://stripe.com/docs/api#errors) for a list of codes).
	///   - failure_message: Message to user further explaining reason for charge failure if available.
	///   - fraud_details: Information on fraud assessments for the charge.
	///   - id: Unique identifier for the object.
	///   - invoice: ID of the invoice this charge is for if one exists.
	///   - livemode: Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
	///   - metadata: Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
	///   - object: String representing the object's type. Objects of the same type share the same value.
	///   - on_behalf_of: The account (if any) the charge was made on behalf of without triggering an automatic transfer. See the [Connect documentation](https://stripe.com/docs/connect/charges-transfers) for details.
	///   - order: ID of the order this charge is for if one exists.
	///   - outcome: Details about whether the payment was accepted, and why. See [understanding declines](https://stripe.com/docs/declines) for details.
	///   - paid: `true` if the charge succeeded, or was successfully authorized for later capture.
	///   - payment_intent: ID of the PaymentIntent associated with this charge, if one exists.
	///   - payment_method: ID of the payment method used in this charge.
	///   - payment_method_details: Details about the payment method at the time of the transaction.
	///   - receipt_email: This is the email address that the receipt for this charge was sent to.
	///   - receipt_number: This is the transaction number that appears on email receipts sent for this charge. This attribute will be `null` until a receipt has been sent.
	///   - receipt_url: This is the URL to view the receipt for this charge. The receipt is kept up-to-date to the latest state of the charge, including any refunds. If the charge is for an Invoice, the receipt will be stylized as an Invoice receipt.
	///   - refunded: Whether the charge has been fully refunded. If the charge is only partially refunded, this attribute will still be false.
	///   - refunds: A list of refunds that have been applied to the charge.
	///   - review: ID of the review associated with this charge if one exists.
	///   - shipping: Shipping information for the charge.
	///   - source_transfer: The transfer ID which created this charge. Only present if the charge came from another Stripe account. [See the Connect documentation](https://stripe.com/docs/connect/destination-charges) for details.
	///   - statement_descriptor: For card charges, use `statement_descriptor_suffix` instead. Otherwise, you can use this value as the complete description of a charge on your customers’ statements. Must contain at least one letter, maximum 22 characters.
	///   - statement_descriptor_suffix: Provides information about the charge that customers see on their statements. Concatenated with the prefix (shortened descriptor) or statement descriptor that’s set on the account to form the complete statement descriptor. Maximum 22 characters for the concatenated descriptor.
	///   - status: The status of the payment is either `succeeded`, `pending`, or `failed`.
	///   - transfer: ID of the transfer to the `destination` account (only applicable if the charge was created using the `destination` parameter).
	///   - transfer_data: An optional dictionary including the account to automatically transfer to as part of a destination charge. [See the Connect documentation](https://stripe.com/docs/connect/destination-charges) for details.
	///   - transfer_group: A string that identifies this transaction as part of a group. See the [Connect documentation](https://stripe.com/docs/connect/charges-transfers#transfer-options) for details.
	public init(amount: Int, amount_captured: Int, amount_refunded: Int, billing_details: BillingDetails, captured: Bool, created: Timestamp, currency: String, disputed: Bool, id: String, livemode: Bool, metadata: String, object: ObjectValues, paid: Bool, refunded: Bool, refunds: RefundList, status: String, application: String? = nil, application_fee: String? = nil, application_fee_amount: Int? = nil, balance_transaction: String? = nil, calculated_statement_descriptor: String? = nil, customer: String? = nil, description: String? = nil, failure_code: String? = nil, failure_message: String? = nil, fraud_details: ChargeFraudDetails? = nil, invoice: String? = nil, on_behalf_of: String? = nil, order: String? = nil, outcome: ChargeOutcome? = nil, payment_intent: String? = nil, payment_method: String? = nil, payment_method_details: PaymentMethodDetails? = nil, receipt_email: String? = nil, receipt_number: String? = nil, receipt_url: String? = nil, review: String? = nil, shipping: Shipping? = nil, source_transfer: String? = nil, statement_descriptor: String? = nil, statement_descriptor_suffix: String? = nil, transfer: String? = nil, transfer_data: ChargeTransferData? = nil, transfer_group: String? = nil) {
		self.amount = amount
		self.amount_captured = amount_captured
		self.amount_refunded = amount_refunded
		self.billing_details = billing_details
		self.captured = captured
		self.created = created
		self.currency = currency
		self.disputed = disputed
		self.id = id
		self.livemode = livemode
		self.metadata = metadata
		self.object = object
		self.paid = paid
		self.refunded = refunded
		self.refunds = refunds
		self.status = status
		self.application = application
		self.application_fee = application_fee
		self.application_fee_amount = application_fee_amount
		self.balance_transaction = balance_transaction
		self.calculated_statement_descriptor = calculated_statement_descriptor
		self.customer = customer
		self.description = description
		self.failure_code = failure_code
		self.failure_message = failure_message
		self.fraud_details = fraud_details
		self.invoice = invoice
		self.on_behalf_of = on_behalf_of
		self.order = order
		self.outcome = outcome
		self.payment_intent = payment_intent
		self.payment_method = payment_method
		self.payment_method_details = payment_method_details
		self.receipt_email = receipt_email
		self.receipt_number = receipt_number
		self.receipt_url = receipt_url
		self.review = review
		self.shipping = shipping
		self.source_transfer = source_transfer
		self.statement_descriptor = statement_descriptor
		self.statement_descriptor_suffix = statement_descriptor_suffix
		self.transfer = transfer
		self.transfer_data = transfer_data
		self.transfer_group = transfer_group
	}


	/// A list of refunds that have been applied to the charge.
	public class RefundList: Codable {
		/// Details about each object.
		public var data: [Refund]
		/// True if this list has another page of items after this one that can be fetched.
		public var has_more: Bool
		/// String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
		public var object: ObjectValues
		/// The URL where this list can be accessed.
		public var url: String

		/// A list of refunds that have been applied to the charge.
		/// - Parameters:
		///   - data: Details about each object.
		///   - has_more: True if this list has another page of items after this one that can be fetched.
		///   - object: String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
		///   - url: The URL where this list can be accessed.
		public init(data: [Refund], has_more: Bool, object: ObjectValues, url: String) {
			self.data = data
			self.has_more = has_more
			self.object = object
			self.url = url
		}

		public enum ObjectValues: String, Codable {
			case list = "list"
		}
	}


	public enum ObjectValues: String, Codable {
		case charge = "charge"
	}
}

public class ChargeFraudDetails: Codable {
	/// Assessments from Stripe. If set, the value is `fraudulent`.
	public var stripe_report: String?
	/// Assessments reported by you. If set, possible values of are `safe` and `fraudulent`.
	public var user_report: String?

	public init(stripe_report: String? = nil, user_report: String? = nil) {
		self.stripe_report = stripe_report
		self.user_report = user_report
	}
}

public class ChargeOutcome: Codable {
	/// Possible values are `approved_by_network`, `declined_by_network`, `not_sent_to_network`, and `reversed_after_approval`. The value `reversed_after_approval` indicates the payment was [blocked by Stripe](https://stripe.com/docs/declines#blocked-payments) after bank authorization, and may temporarily appear as "pending" on a cardholder's statement.
	public var network_status: String?
	/// An enumerated value providing a more detailed explanation of the outcome's `type`. Charges blocked by Radar's default block rule have the value `highest_risk_level`. Charges placed in review by Radar's default review rule have the value `elevated_risk_level`. Charges authorized, blocked, or placed in review by custom rules have the value `rule`. See [understanding declines](https://stripe.com/docs/declines) for more details.
	public var reason: String?
	/// Stripe Radar's evaluation of the riskiness of the payment. Possible values for evaluated payments are `normal`, `elevated`, `highest`. For non-card payments, and card-based payments predating the public assignment of risk levels, this field will have the value `not_assessed`. In the event of an error in the evaluation, this field will have the value `unknown`. This field is only available with Radar.
	public var risk_level: String?
	/// Stripe Radar's evaluation of the riskiness of the payment. Possible values for evaluated payments are between 0 and 100. For non-card payments, card-based payments predating the public assignment of risk scores, or in the event of an error during evaluation, this field will not be present. This field is only available with Radar for Fraud Teams.
	public var risk_score: Int?
	/// The ID of the Radar rule that matched the payment, if applicable.
	public var rule: String?
	/// A human-readable description of the outcome type and reason, designed for you (the recipient of the payment), not your customer.
	public var seller_message: String?
	/// Possible values are `authorized`, `manual_review`, `issuer_declined`, `blocked`, and `invalid`. See [understanding declines](https://stripe.com/docs/declines) and [Radar reviews](https://stripe.com/docs/radar/reviews) for details.
	public var type: String

	public init(type: String, network_status: String? = nil, reason: String? = nil, risk_level: String? = nil, risk_score: Int? = nil, rule: String? = nil, seller_message: String? = nil) {
		self.type = type
		self.network_status = network_status
		self.reason = reason
		self.risk_level = risk_level
		self.risk_score = risk_score
		self.rule = rule
		self.seller_message = seller_message
	}
}

public class ChargeTransferData: Codable {
	/// The amount transferred to the destination account, if specified. By default, the entire charge amount is transferred to the destination account.
	public var amount: Int?
	/// ID of an existing, connected Stripe account to transfer funds to if `transfer_data` was specified in the charge request.
	public var destination: String

	public init(destination: String, amount: Int? = nil) {
		self.destination = destination
		self.amount = amount
	}
}

/// A Checkout Session represents your customer's session as they pay for one-time purchases or subscriptions through [Checkout](https://stripe.com/docs/payments/checkout). We recommend creating a new Session each time your customer attempts to pay.  Once payment is successful, the Checkout Session will contain a reference to the [Customer](https://stripe.com/docs/api/customers), and either the successful [PaymentIntent](https://stripe.com/docs/api/payment_intents) or an active [Subscription](https://stripe.com/docs/api/subscriptions).  You can create a Checkout Session on your server and pass its ID to the client to begin Checkout.  Related guide: [Checkout Server Quickstart](https://stripe.com/docs/payments/checkout/api).
public class CheckoutSession: Codable {
	/// Enables user redeemable promotion codes.
	public var allow_promotion_codes: Bool?
	/// Total of all items before discounts or taxes are applied.
	public var amount_subtotal: Int?
	/// Total of all items after discounts and taxes are applied.
	public var amount_total: Int?
	/// Describes whether Checkout should collect the customer's billing address.
	public var billing_address_collection: BillingAddressCollectionValues?
	/// The URL the customer will be directed to if they decide to cancel payment and return to your website.
	public var cancel_url: String
	/// A unique string to reference the Checkout Session. This can be a customer ID, a cart ID, or similar, and can be used to reconcile the Session with your internal systems.
	public var client_reference_id: String?
	/// Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
	public var currency: String?
	/// The ID of the customer for this Session. For Checkout Sessions in `payment` or `subscription` mode, Checkout will create a new customer object based on information provided during the payment flow unless an existing customer was provided when the Session was created.
	public var customer: String?
	/// The customer details including the customer's tax exempt status and the customer's tax IDs.
	public var customer_details: PaymentPagesCheckoutSessionCustomerDetails?
	/// If provided, this value will be used when the Customer object is created. If not provided, customers will be asked to enter their email address. Use this parameter to prefill customer data if you already have an email on file. To access information about the customer once the payment flow is complete, use the `customer` attribute.
	public var customer_email: String?
	/// Unique identifier for the object. Used to pass to `redirectToCheckout` in Stripe.js.
	public var id: String
	/// The line items purchased by the customer.
	public var line_items: PaymentPagesCheckoutSessionListLineItems?
	/// Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
	public var livemode: Bool
	/// The IETF language tag of the locale Checkout is displayed in. If blank or `auto`, the browser's locale is used.
	public var locale: LocaleValues?
	/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
	public var metadata: String?
	/// The mode of the Checkout Session.
	public var mode: ModeValues
	/// String representing the object's type. Objects of the same type share the same value.
	public var object: ObjectValues
	/// The ID of the PaymentIntent for Checkout Sessions in `payment` mode.
	public var payment_intent: String?
	/// A list of the types of payment methods (e.g. card) this Checkout Session is allowed to accept.
	public var payment_method_types: [String]
	/// The payment status of the Checkout Session, one of `paid`, `unpaid`, or `no_payment_required`. You can use this value to decide when to fulfill your customer's order.
	public var payment_status: PaymentStatusValues
	/// The ID of the SetupIntent for Checkout Sessions in `setup` mode.
	public var setup_intent: String?
	/// Shipping information for this Checkout Session.
	public var shipping: Shipping?
	/// When set, provides configuration for Checkout to collect a shipping address from a customer.
	public var shipping_address_collection: PaymentPagesPaymentPageResourcesShippingAddressCollection?
	/// Describes the type of transaction being performed by Checkout in order to customize relevant text on the page, such as the submit button. `submit_type` can only be specified on Checkout Sessions in `payment` mode, but not Checkout Sessions in `subscription` or `setup` mode.
	public var submit_type: SubmitTypeValues?
	/// The ID of the subscription for Checkout Sessions in `subscription` mode.
	public var subscription: String?
	/// The URL the customer will be directed to after the payment or subscription creation is successful.
	public var success_url: String
	/// Tax and discount details for the computed total amount.
	public var total_details: PaymentPagesCheckoutSessionTotalDetails?

	/// A Checkout Session represents your customer's session as they pay for one-time purchases or subscriptions through [Checkout](https://stripe.com/docs/payments/checkout). We recommend creating a new Session each time your customer attempts to pay.  Once payment is successful, the Checkout Session will contain a reference to the [Customer](https://stripe.com/docs/api/customers), and either the successful [PaymentIntent](https://stripe.com/docs/api/payment_intents) or an active [Subscription](https://stripe.com/docs/api/subscriptions).  You can create a Checkout Session on your server and pass its ID to the client to begin Checkout.  Related guide: [Checkout Server Quickstart](https://stripe.com/docs/payments/checkout/api).
	/// - Parameters:
	///   - allow_promotion_codes: Enables user redeemable promotion codes.
	///   - amount_subtotal: Total of all items before discounts or taxes are applied.
	///   - amount_total: Total of all items after discounts and taxes are applied.
	///   - billing_address_collection: Describes whether Checkout should collect the customer's billing address.
	///   - cancel_url: The URL the customer will be directed to if they decide to cancel payment and return to your website.
	///   - client_reference_id: A unique string to reference the Checkout Session. This can be a customer ID, a cart ID, or similar, and can be used to reconcile the Session with your internal systems.
	///   - currency: Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
	///   - customer: The ID of the customer for this Session. For Checkout Sessions in `payment` or `subscription` mode, Checkout will create a new customer object based on information provided during the payment flow unless an existing customer was provided when the Session was created.
	///   - customer_details: The customer details including the customer's tax exempt status and the customer's tax IDs.
	///   - customer_email: If provided, this value will be used when the Customer object is created. If not provided, customers will be asked to enter their email address. Use this parameter to prefill customer data if you already have an email on file. To access information about the customer once the payment flow is complete, use the `customer` attribute.
	///   - id: Unique identifier for the object. Used to pass to `redirectToCheckout` in Stripe.js.
	///   - line_items: The line items purchased by the customer.
	///   - livemode: Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
	///   - locale: The IETF language tag of the locale Checkout is displayed in. If blank or `auto`, the browser's locale is used.
	///   - metadata: Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
	///   - mode: The mode of the Checkout Session.
	///   - object: String representing the object's type. Objects of the same type share the same value.
	///   - payment_intent: The ID of the PaymentIntent for Checkout Sessions in `payment` mode.
	///   - payment_method_types: A list of the types of payment methods (e.g. card) this Checkout Session is allowed to accept.
	///   - payment_status: The payment status of the Checkout Session, one of `paid`, `unpaid`, or `no_payment_required`. You can use this value to decide when to fulfill your customer's order.
	///   - setup_intent: The ID of the SetupIntent for Checkout Sessions in `setup` mode.
	///   - shipping: Shipping information for this Checkout Session.
	///   - shipping_address_collection: When set, provides configuration for Checkout to collect a shipping address from a customer.
	///   - submit_type: Describes the type of transaction being performed by Checkout in order to customize relevant text on the page, such as the submit button. `submit_type` can only be specified on Checkout Sessions in `payment` mode, but not Checkout Sessions in `subscription` or `setup` mode.
	///   - subscription: The ID of the subscription for Checkout Sessions in `subscription` mode.
	///   - success_url: The URL the customer will be directed to after the payment or subscription creation is successful.
	///   - total_details: Tax and discount details for the computed total amount.
	public init(cancel_url: String, id: String, livemode: Bool, mode: ModeValues, object: ObjectValues, payment_method_types: [String], payment_status: PaymentStatusValues, success_url: String, allow_promotion_codes: Bool? = nil, amount_subtotal: Int? = nil, amount_total: Int? = nil, billing_address_collection: BillingAddressCollectionValues? = nil, client_reference_id: String? = nil, currency: String? = nil, customer: String? = nil, customer_details: PaymentPagesCheckoutSessionCustomerDetails? = nil, customer_email: String? = nil, line_items: PaymentPagesCheckoutSessionListLineItems? = nil, locale: LocaleValues? = nil, metadata: String? = nil, payment_intent: String? = nil, setup_intent: String? = nil, shipping: Shipping? = nil, shipping_address_collection: PaymentPagesPaymentPageResourcesShippingAddressCollection? = nil, submit_type: SubmitTypeValues? = nil, subscription: String? = nil, total_details: PaymentPagesCheckoutSessionTotalDetails? = nil) {
		self.cancel_url = cancel_url
		self.id = id
		self.livemode = livemode
		self.mode = mode
		self.object = object
		self.payment_method_types = payment_method_types
		self.payment_status = payment_status
		self.success_url = success_url
		self.allow_promotion_codes = allow_promotion_codes
		self.amount_subtotal = amount_subtotal
		self.amount_total = amount_total
		self.billing_address_collection = billing_address_collection
		self.client_reference_id = client_reference_id
		self.currency = currency
		self.customer = customer
		self.customer_details = customer_details
		self.customer_email = customer_email
		self.line_items = line_items
		self.locale = locale
		self.metadata = metadata
		self.payment_intent = payment_intent
		self.setup_intent = setup_intent
		self.shipping = shipping
		self.shipping_address_collection = shipping_address_collection
		self.submit_type = submit_type
		self.subscription = subscription
		self.total_details = total_details
	}


	/// The line items purchased by the customer.
	public class PaymentPagesCheckoutSessionListLineItems: Codable {
		/// Details about each object.
		public var data: [Item]
		/// True if this list has another page of items after this one that can be fetched.
		public var has_more: Bool
		/// String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
		public var object: ObjectValues
		/// The URL where this list can be accessed.
		public var url: String

		/// The line items purchased by the customer.
		/// - Parameters:
		///   - data: Details about each object.
		///   - has_more: True if this list has another page of items after this one that can be fetched.
		///   - object: String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
		///   - url: The URL where this list can be accessed.
		public init(data: [Item], has_more: Bool, object: ObjectValues, url: String) {
			self.data = data
			self.has_more = has_more
			self.object = object
			self.url = url
		}

		public enum ObjectValues: String, Codable {
			case list = "list"
		}
	}


	public enum SubmitTypeValues: String, Codable {
		case auto = "auto"
		case book = "book"
		case donate = "donate"
		case pay = "pay"
	}

	public enum ModeValues: String, Codable {
		case payment = "payment"
		case setup = "setup"
		case subscription = "subscription"
	}

	public enum BillingAddressCollectionValues: String, Codable {
		case auto = "auto"
		case required = "required"
	}

	public enum ObjectValues: String, Codable {
		case checkoutSession = "checkout.session"
	}

	public enum LocaleValues: String, Codable {
		case auto = "auto"
		case bg = "bg"
		case cs = "cs"
		case da = "da"
		case de = "de"
		case el = "el"
		case en = "en"
		case enMinusGb = "en-GB"
		case es = "es"
		case esMinus419 = "es-419"
		case et = "et"
		case fi = "fi"
		case fr = "fr"
		case frMinusCa = "fr-CA"
		case hu = "hu"
		case id = "id"
		case it = "it"
		case ja = "ja"
		case lt = "lt"
		case lv = "lv"
		case ms = "ms"
		case mt = "mt"
		case nb = "nb"
		case nl = "nl"
		case pl = "pl"
		case pt = "pt"
		case ptMinusBr = "pt-BR"
		case ro = "ro"
		case ru = "ru"
		case sk = "sk"
		case sl = "sl"
		case sv = "sv"
		case tr = "tr"
		case zh = "zh"
		case zhMinusHk = "zh-HK"
		case zhMinusTw = "zh-TW"
	}

	public enum PaymentStatusValues: String, Codable {
		case noPaymentRequired = "no_payment_required"
		case paid = "paid"
		case unpaid = "unpaid"
	}
}

public class ConnectCollectionTransfer: Codable {
	/// Amount transferred, in %s.
	public var amount: Int
	/// Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
	public var currency: String
	/// ID of the account that funds are being collected for.
	public var destination: String
	/// Unique identifier for the object.
	public var id: String
	/// Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
	public var livemode: Bool
	/// String representing the object's type. Objects of the same type share the same value.
	public var object: ObjectValues

	public init(amount: Int, currency: String, destination: String, id: String, livemode: Bool, object: ObjectValues) {
		self.amount = amount
		self.currency = currency
		self.destination = destination
		self.id = id
		self.livemode = livemode
		self.object = object
	}

	public enum ObjectValues: String, Codable {
		case connectCollectionTransfer = "connect_collection_transfer"
	}
}

/// Stripe needs to collect certain pieces of information about each account created. These requirements can differ depending on the account's country. The Country Specs API makes these rules available to your integration.  You can also view the information from this API call as [an online guide](/docs/connect/required-verification-information).
public class CountrySpec: Codable {
	/// The default currency for this country. This applies to both payment methods and bank accounts.
	public var default_currency: String
	/// Unique identifier for the object. Represented as the ISO country code for this country.
	public var id: String
	/// String representing the object's type. Objects of the same type share the same value.
	public var object: ObjectValues
	/// Currencies that can be accepted in the specific country (for transfers).
	public var supported_bank_account_currencies: String
	/// Currencies that can be accepted in the specified country (for payments).
	public var supported_payment_currencies: [String]
	/// Payment methods available in the specified country. You may need to enable some payment methods (e.g., [ACH](https://stripe.com/docs/ach)) on your account before they appear in this list. The `stripe` payment method refers to [charging through your platform](https://stripe.com/docs/connect/destination-charges).
	public var supported_payment_methods: [String]
	/// Countries that can accept transfers from the specified country.
	public var supported_transfer_countries: [String]
	public var verification_fields: CountrySpecVerificationFields

	/// Stripe needs to collect certain pieces of information about each account created. These requirements can differ depending on the account's country. The Country Specs API makes these rules available to your integration.  You can also view the information from this API call as [an online guide](/docs/connect/required-verification-information).
	/// - Parameters:
	///   - default_currency: The default currency for this country. This applies to both payment methods and bank accounts.
	///   - id: Unique identifier for the object. Represented as the ISO country code for this country.
	///   - object: String representing the object's type. Objects of the same type share the same value.
	///   - supported_bank_account_currencies: Currencies that can be accepted in the specific country (for transfers).
	///   - supported_payment_currencies: Currencies that can be accepted in the specified country (for payments).
	///   - supported_payment_methods: Payment methods available in the specified country. You may need to enable some payment methods (e.g., [ACH](https://stripe.com/docs/ach)) on your account before they appear in this list. The `stripe` payment method refers to [charging through your platform](https://stripe.com/docs/connect/destination-charges).
	///   - supported_transfer_countries: Countries that can accept transfers from the specified country.
	///   - verification_fields: 
	public init(default_currency: String, id: String, object: ObjectValues, supported_bank_account_currencies: String, supported_payment_currencies: [String], supported_payment_methods: [String], supported_transfer_countries: [String], verification_fields: CountrySpecVerificationFields) {
		self.default_currency = default_currency
		self.id = id
		self.object = object
		self.supported_bank_account_currencies = supported_bank_account_currencies
		self.supported_payment_currencies = supported_payment_currencies
		self.supported_payment_methods = supported_payment_methods
		self.supported_transfer_countries = supported_transfer_countries
		self.verification_fields = verification_fields
	}

	public enum ObjectValues: String, Codable {
		case countrySpec = "country_spec"
	}
}

public class CountrySpecVerificationFieldDetails: Codable {
	/// Additional fields which are only required for some users.
	public var additional: [String]
	/// Fields which every account must eventually provide.
	public var minimum: [String]

	public init(additional: [String], minimum: [String]) {
		self.additional = additional
		self.minimum = minimum
	}
}

public class CountrySpecVerificationFields: Codable {
	public var company: CountrySpecVerificationFieldDetails
	public var individual: CountrySpecVerificationFieldDetails

	public init(company: CountrySpecVerificationFieldDetails, individual: CountrySpecVerificationFieldDetails) {
		self.company = company
		self.individual = individual
	}
}

/// A coupon contains information about a percent-off or amount-off discount you might want to apply to a customer. Coupons may be applied to [invoices](https://stripe.com/docs/api#invoices) or [orders](https://stripe.com/docs/api#create_order-coupon). Coupons do not work with conventional one-off [charges](https://stripe.com/docs/api#create_charge).
public class Coupon: Codable {
	/// Amount (in the `currency` specified) that will be taken off the subtotal of any invoices for this customer.
	public var amount_off: Int?
	public var applies_to: CouponAppliesTo?
	/// Time at which the object was created. Measured in seconds since the Unix epoch.
	public var created: Timestamp
	/// If `amount_off` has been set, the three-letter [ISO code for the currency](https://stripe.com/docs/currencies) of the amount to take off.
	public var currency: String?
	/// One of `forever`, `once`, and `repeating`. Describes how long a customer who applies this coupon will get the discount.
	public var duration: DurationValues
	/// If `duration` is `repeating`, the number of months the coupon applies. Null if coupon `duration` is `forever` or `once`.
	public var duration_in_months: Int?
	/// Unique identifier for the object.
	public var id: String
	/// Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
	public var livemode: Bool
	/// Maximum number of times this coupon can be redeemed, in total, across all customers, before it is no longer valid.
	public var max_redemptions: Int?
	/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
	public var metadata: String?
	/// Name of the coupon displayed to customers on for instance invoices or receipts.
	public var name: String?
	/// String representing the object's type. Objects of the same type share the same value.
	public var object: ObjectValues
	/// Percent that will be taken off the subtotal of any invoices for this customer for the duration of the coupon. For example, a coupon with percent_off of 50 will make a %s100 invoice %s50 instead.
	public var percent_off: StringNumber?
	/// Date after which the coupon can no longer be redeemed.
	public var redeem_by: Timestamp?
	/// Number of times this coupon has been applied to a customer.
	public var times_redeemed: Int
	/// Taking account of the above properties, whether this coupon can still be applied to a customer.
	public var valid: Bool

	/// A coupon contains information about a percent-off or amount-off discount you might want to apply to a customer. Coupons may be applied to [invoices](https://stripe.com/docs/api#invoices) or [orders](https://stripe.com/docs/api#create_order-coupon). Coupons do not work with conventional one-off [charges](https://stripe.com/docs/api#create_charge).
	/// - Parameters:
	///   - amount_off: Amount (in the `currency` specified) that will be taken off the subtotal of any invoices for this customer.
	///   - created: Time at which the object was created. Measured in seconds since the Unix epoch.
	///   - currency: If `amount_off` has been set, the three-letter [ISO code for the currency](https://stripe.com/docs/currencies) of the amount to take off.
	///   - duration: One of `forever`, `once`, and `repeating`. Describes how long a customer who applies this coupon will get the discount.
	///   - duration_in_months: If `duration` is `repeating`, the number of months the coupon applies. Null if coupon `duration` is `forever` or `once`.
	///   - id: Unique identifier for the object.
	///   - livemode: Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
	///   - max_redemptions: Maximum number of times this coupon can be redeemed, in total, across all customers, before it is no longer valid.
	///   - metadata: Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
	///   - name: Name of the coupon displayed to customers on for instance invoices or receipts.
	///   - object: String representing the object's type. Objects of the same type share the same value.
	///   - percent_off: Percent that will be taken off the subtotal of any invoices for this customer for the duration of the coupon. For example, a coupon with percent_off of 50 will make a %s100 invoice %s50 instead.
	///   - redeem_by: Date after which the coupon can no longer be redeemed.
	///   - times_redeemed: Number of times this coupon has been applied to a customer.
	///   - valid: Taking account of the above properties, whether this coupon can still be applied to a customer.
	public init(created: Timestamp, duration: DurationValues, id: String, livemode: Bool, object: ObjectValues, times_redeemed: Int, valid: Bool, amount_off: Int? = nil, applies_to: CouponAppliesTo? = nil, currency: String? = nil, duration_in_months: Int? = nil, max_redemptions: Int? = nil, metadata: String? = nil, name: String? = nil, percent_off: StringNumber? = nil, redeem_by: Timestamp? = nil) {
		self.created = created
		self.duration = duration
		self.id = id
		self.livemode = livemode
		self.object = object
		self.times_redeemed = times_redeemed
		self.valid = valid
		self.amount_off = amount_off
		self.applies_to = applies_to
		self.currency = currency
		self.duration_in_months = duration_in_months
		self.max_redemptions = max_redemptions
		self.metadata = metadata
		self.name = name
		self.percent_off = percent_off
		self.redeem_by = redeem_by
	}

	public enum DurationValues: String, Codable {
		case forever = "forever"
		case once = "once"
		case repeating = "repeating"
	}

	public enum ObjectValues: String, Codable {
		case coupon = "coupon"
	}
}

public class CouponAppliesTo: Codable {
	/// A list of product IDs this coupon applies to
	public var products: [String]

	public init(products: [String]) {
		self.products = products
	}
}

/// Issue a credit note to adjust an invoice's amount after the invoice is finalized.  Related guide: [Credit Notes](https://stripe.com/docs/billing/invoices/credit-notes).
public class CreditNote: Codable {
	/// The integer amount in %s representing the total amount of the credit note, including tax.
	public var amount: Int
	/// Time at which the object was created. Measured in seconds since the Unix epoch.
	public var created: Timestamp
	/// Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
	public var currency: String
	/// ID of the customer.
	public var customer: String
	/// Customer balance transaction related to this credit note.
	public var customer_balance_transaction: String?
	/// The integer amount in %s representing the total amount of discount that was credited.
	public var discount_amount: Int
	/// The aggregate amounts calculated per discount for all line items.
	public var discount_amounts: [DiscountsResourceDiscountAmount]
	/// Unique identifier for the object.
	public var id: String
	/// ID of the invoice.
	public var invoice: String
	/// Line items that make up the credit note
	public var lines: CreditNoteLinesList
	/// Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
	public var livemode: Bool
	/// Customer-facing text that appears on the credit note PDF.
	public var memo: String?
	/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
	public var metadata: String?
	/// A unique number that identifies this particular credit note and appears on the PDF of the credit note and its associated invoice.
	public var number: String
	/// String representing the object's type. Objects of the same type share the same value.
	public var object: ObjectValues
	/// Amount that was credited outside of Stripe.
	public var out_of_band_amount: Int?
	/// The link to download the PDF of the credit note.
	public var pdf: String
	/// Reason for issuing this credit note, one of `duplicate`, `fraudulent`, `order_change`, or `product_unsatisfactory`
	public var reason: ReasonValues?
	/// Refund related to this credit note.
	public var refund: String?
	/// Status of this credit note, one of `issued` or `void`. Learn more about [voiding credit notes](https://stripe.com/docs/billing/invoices/credit-notes#voiding).
	public var status: StatusValues
	/// The integer amount in %s representing the amount of the credit note, excluding tax and invoice level discounts.
	public var subtotal: Int
	/// The aggregate amounts calculated per tax rate for all line items.
	public var tax_amounts: [CreditNoteTaxAmount]
	/// The integer amount in %s representing the total amount of the credit note, including tax and all discount.
	public var total: Int
	/// Type of this credit note, one of `pre_payment` or `post_payment`. A `pre_payment` credit note means it was issued when the invoice was open. A `post_payment` credit note means it was issued when the invoice was paid.
	public var type: TypeValues
	/// The time that the credit note was voided.
	public var voided_at: Timestamp?

	/// Issue a credit note to adjust an invoice's amount after the invoice is finalized.  Related guide: [Credit Notes](https://stripe.com/docs/billing/invoices/credit-notes).
	/// - Parameters:
	///   - amount: The integer amount in %s representing the total amount of the credit note, including tax.
	///   - created: Time at which the object was created. Measured in seconds since the Unix epoch.
	///   - currency: Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
	///   - customer: ID of the customer.
	///   - customer_balance_transaction: Customer balance transaction related to this credit note.
	///   - discount_amount: The integer amount in %s representing the total amount of discount that was credited.
	///   - discount_amounts: The aggregate amounts calculated per discount for all line items.
	///   - id: Unique identifier for the object.
	///   - invoice: ID of the invoice.
	///   - lines: Line items that make up the credit note
	///   - livemode: Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
	///   - memo: Customer-facing text that appears on the credit note PDF.
	///   - metadata: Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
	///   - number: A unique number that identifies this particular credit note and appears on the PDF of the credit note and its associated invoice.
	///   - object: String representing the object's type. Objects of the same type share the same value.
	///   - out_of_band_amount: Amount that was credited outside of Stripe.
	///   - pdf: The link to download the PDF of the credit note.
	///   - reason: Reason for issuing this credit note, one of `duplicate`, `fraudulent`, `order_change`, or `product_unsatisfactory`
	///   - refund: Refund related to this credit note.
	///   - status: Status of this credit note, one of `issued` or `void`. Learn more about [voiding credit notes](https://stripe.com/docs/billing/invoices/credit-notes#voiding).
	///   - subtotal: The integer amount in %s representing the amount of the credit note, excluding tax and invoice level discounts.
	///   - tax_amounts: The aggregate amounts calculated per tax rate for all line items.
	///   - total: The integer amount in %s representing the total amount of the credit note, including tax and all discount.
	///   - type: Type of this credit note, one of `pre_payment` or `post_payment`. A `pre_payment` credit note means it was issued when the invoice was open. A `post_payment` credit note means it was issued when the invoice was paid.
	///   - voided_at: The time that the credit note was voided.
	public init(amount: Int, created: Timestamp, currency: String, customer: String, discount_amount: Int, discount_amounts: [DiscountsResourceDiscountAmount], id: String, invoice: String, lines: CreditNoteLinesList, livemode: Bool, number: String, object: ObjectValues, pdf: String, status: StatusValues, subtotal: Int, tax_amounts: [CreditNoteTaxAmount], total: Int, type: TypeValues, customer_balance_transaction: String? = nil, memo: String? = nil, metadata: String? = nil, out_of_band_amount: Int? = nil, reason: ReasonValues? = nil, refund: String? = nil, voided_at: Timestamp? = nil) {
		self.amount = amount
		self.created = created
		self.currency = currency
		self.customer = customer
		self.discount_amount = discount_amount
		self.discount_amounts = discount_amounts
		self.id = id
		self.invoice = invoice
		self.lines = lines
		self.livemode = livemode
		self.number = number
		self.object = object
		self.pdf = pdf
		self.status = status
		self.subtotal = subtotal
		self.tax_amounts = tax_amounts
		self.total = total
		self.type = type
		self.customer_balance_transaction = customer_balance_transaction
		self.memo = memo
		self.metadata = metadata
		self.out_of_band_amount = out_of_band_amount
		self.reason = reason
		self.refund = refund
		self.voided_at = voided_at
	}


	/// Line items that make up the credit note
	public class CreditNoteLinesList: Codable {
		/// Details about each object.
		public var data: [CreditNoteLineItem]
		/// True if this list has another page of items after this one that can be fetched.
		public var has_more: Bool
		/// String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
		public var object: ObjectValues
		/// The URL where this list can be accessed.
		public var url: String

		/// Line items that make up the credit note
		/// - Parameters:
		///   - data: Details about each object.
		///   - has_more: True if this list has another page of items after this one that can be fetched.
		///   - object: String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
		///   - url: The URL where this list can be accessed.
		public init(data: [CreditNoteLineItem], has_more: Bool, object: ObjectValues, url: String) {
			self.data = data
			self.has_more = has_more
			self.object = object
			self.url = url
		}

		public enum ObjectValues: String, Codable {
			case list = "list"
		}
	}


	public enum StatusValues: String, Codable {
		case issued = "issued"
		case void = "void"
	}

	public enum ReasonValues: String, Codable {
		case duplicate = "duplicate"
		case fraudulent = "fraudulent"
		case orderChange = "order_change"
		case productUnsatisfactory = "product_unsatisfactory"
	}

	public enum ObjectValues: String, Codable {
		case creditNote = "credit_note"
	}

	public enum TypeValues: String, Codable {
		case postPayment = "post_payment"
		case prePayment = "pre_payment"
	}
}

public class CreditNoteLineItem: Codable {
	/// The integer amount in %s representing the gross amount being credited for this line item, excluding (exclusive) tax and discounts.
	public var amount: Int
	/// Description of the item being credited.
	public var description: String?
	/// The integer amount in %s representing the discount being credited for this line item.
	public var discount_amount: Int
	/// The amount of discount calculated per discount for this line item
	public var discount_amounts: [DiscountsResourceDiscountAmount]
	/// Unique identifier for the object.
	public var id: String
	/// ID of the invoice line item being credited
	public var invoice_line_item: String?
	/// Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
	public var livemode: Bool
	/// String representing the object's type. Objects of the same type share the same value.
	public var object: ObjectValues
	/// The number of units of product being credited.
	public var quantity: Int?
	/// The amount of tax calculated per tax rate for this line item
	public var tax_amounts: [CreditNoteTaxAmount]
	/// The tax rates which apply to the line item.
	public var tax_rates: [TaxRate]
	/// The type of the credit note line item, one of `invoice_line_item` or `custom_line_item`. When the type is `invoice_line_item` there is an additional `invoice_line_item` property on the resource the value of which is the id of the credited line item on the invoice.
	public var type: TypeValues
	/// The cost of each unit of product being credited.
	public var unit_amount: Int?
	/// Same as `unit_amount`, but contains a decimal value with at most 12 decimal places.
	public var unit_amount_decimal: StringNumber?

	public init(amount: Int, discount_amount: Int, discount_amounts: [DiscountsResourceDiscountAmount], id: String, livemode: Bool, object: ObjectValues, tax_amounts: [CreditNoteTaxAmount], tax_rates: [TaxRate], type: TypeValues, description: String? = nil, invoice_line_item: String? = nil, quantity: Int? = nil, unit_amount: Int? = nil, unit_amount_decimal: StringNumber? = nil) {
		self.amount = amount
		self.discount_amount = discount_amount
		self.discount_amounts = discount_amounts
		self.id = id
		self.livemode = livemode
		self.object = object
		self.tax_amounts = tax_amounts
		self.tax_rates = tax_rates
		self.type = type
		self.description = description
		self.invoice_line_item = invoice_line_item
		self.quantity = quantity
		self.unit_amount = unit_amount
		self.unit_amount_decimal = unit_amount_decimal
	}

	public enum ObjectValues: String, Codable {
		case creditNoteLineItem = "credit_note_line_item"
	}

	public enum TypeValues: String, Codable {
		case customLineItem = "custom_line_item"
		case invoiceLineItem = "invoice_line_item"
	}
}

public class CreditNoteTaxAmount: Codable {
	/// The amount, in %s, of the tax.
	public var amount: Int
	/// Whether this tax amount is inclusive or exclusive.
	public var inclusive: Bool
	/// The tax rate that was applied to get this tax amount.
	public var tax_rate: String

	public init(amount: Int, inclusive: Bool, tax_rate: String) {
		self.amount = amount
		self.inclusive = inclusive
		self.tax_rate = tax_rate
	}
}

/// `Customer` objects allow you to perform recurring charges, and to track multiple charges, that are associated with the same customer. The API allows you to create, delete, and update your customers. You can retrieve individual customers as well as a list of all your customers.  Related guide: [Save a card during payment](https://stripe.com/docs/payments/save-during-payment).
public class Customer: Codable {
	/// The customer's address.
	public var address: Address?
	/// Current balance, if any, being stored on the customer. If negative, the customer has credit to apply to their next invoice. If positive, the customer has an amount owed that will be added to their next invoice. The balance does not refer to any unpaid invoices; it solely takes into account amounts that have yet to be successfully applied to any invoice. This balance is only taken into account as invoices are finalized.
	public var balance: Int?
	/// Time at which the object was created. Measured in seconds since the Unix epoch.
	public var created: Timestamp
	/// Three-letter [ISO code for the currency](https://stripe.com/docs/currencies) the customer can be charged in for recurring billing purposes.
	public var currency: String?
	/// ID of the default payment source for the customer.  If you are using payment methods created via the PaymentMethods API, see the [invoice_settings.default_payment_method](https://stripe.com/docs/api/customers/object#customer_object-invoice_settings-default_payment_method) field instead.
	public var default_source: String?
	/// When the customer's latest invoice is billed by charging automatically, `delinquent` is `true` if the invoice's latest charge failed. When the customer's latest invoice is billed by sending an invoice, `delinquent` is `true` if the invoice isn't paid by its due date.  If an invoice is marked uncollectible by [dunning](https://stripe.com/docs/billing/automatic-collection), `delinquent` doesn't get reset to `false`.
	public var delinquent: Bool?
	/// An arbitrary string attached to the object. Often useful for displaying to users.
	public var description: String?
	/// Describes the current discount active on the customer, if there is one.
	public var discount: Discount?
	/// The customer's email address.
	public var email: String?
	/// Unique identifier for the object.
	public var id: String
	/// The prefix for the customer used to generate unique invoice numbers.
	public var invoice_prefix: String?
	public var invoice_settings: InvoiceSettingCustomerSetting?
	/// Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
	public var livemode: Bool
	/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
	public var metadata: String?
	/// The customer's full name or business name.
	public var name: String?
	/// The suffix of the customer's next invoice number, e.g., 0001.
	public var next_invoice_sequence: Int?
	/// String representing the object's type. Objects of the same type share the same value.
	public var object: ObjectValues
	/// The customer's phone number.
	public var phone: String?
	/// The customer's preferred locales (languages), ordered by preference.
	public var preferred_locales: [String]??
	/// Mailing and shipping address for the customer. Appears on invoices emailed to this customer.
	public var shipping: Shipping?
	/// The customer's payment sources, if any.
	public var sources: ApmsSourcesSourceList?
	/// The customer's current subscriptions, if any.
	public var subscriptions: SubscriptionList?
	/// Describes the customer's tax exemption status. One of `none`, `exempt`, or `reverse`. When set to `reverse`, invoice and receipt PDFs include the text **"Reverse charge"**.
	public var tax_exempt: TaxExemptValues?
	/// The customer's tax IDs.
	public var tax_ids: TaxIDsList?

	/// `Customer` objects allow you to perform recurring charges, and to track multiple charges, that are associated with the same customer. The API allows you to create, delete, and update your customers. You can retrieve individual customers as well as a list of all your customers.  Related guide: [Save a card during payment](https://stripe.com/docs/payments/save-during-payment).
	/// - Parameters:
	///   - address: The customer's address.
	///   - balance: Current balance, if any, being stored on the customer. If negative, the customer has credit to apply to their next invoice. If positive, the customer has an amount owed that will be added to their next invoice. The balance does not refer to any unpaid invoices; it solely takes into account amounts that have yet to be successfully applied to any invoice. This balance is only taken into account as invoices are finalized.
	///   - created: Time at which the object was created. Measured in seconds since the Unix epoch.
	///   - currency: Three-letter [ISO code for the currency](https://stripe.com/docs/currencies) the customer can be charged in for recurring billing purposes.
	///   - default_source: ID of the default payment source for the customer.  If you are using payment methods created via the PaymentMethods API, see the [invoice_settings.default_payment_method](https://stripe.com/docs/api/customers/object#customer_object-invoice_settings-default_payment_method) field instead.
	///   - delinquent: When the customer's latest invoice is billed by charging automatically, `delinquent` is `true` if the invoice's latest charge failed. When the customer's latest invoice is billed by sending an invoice, `delinquent` is `true` if the invoice isn't paid by its due date.  If an invoice is marked uncollectible by [dunning](https://stripe.com/docs/billing/automatic-collection), `delinquent` doesn't get reset to `false`.
	///   - description: An arbitrary string attached to the object. Often useful for displaying to users.
	///   - discount: Describes the current discount active on the customer, if there is one.
	///   - email: The customer's email address.
	///   - id: Unique identifier for the object.
	///   - invoice_prefix: The prefix for the customer used to generate unique invoice numbers.
	///   - livemode: Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
	///   - metadata: Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
	///   - name: The customer's full name or business name.
	///   - next_invoice_sequence: The suffix of the customer's next invoice number, e.g., 0001.
	///   - object: String representing the object's type. Objects of the same type share the same value.
	///   - phone: The customer's phone number.
	///   - preferred_locales: The customer's preferred locales (languages), ordered by preference.
	///   - shipping: Mailing and shipping address for the customer. Appears on invoices emailed to this customer.
	///   - sources: The customer's payment sources, if any.
	///   - subscriptions: The customer's current subscriptions, if any.
	///   - tax_exempt: Describes the customer's tax exemption status. One of `none`, `exempt`, or `reverse`. When set to `reverse`, invoice and receipt PDFs include the text **"Reverse charge"**.
	///   - tax_ids: The customer's tax IDs.
	public init(created: Timestamp, id: String, livemode: Bool, object: ObjectValues, address: Address? = nil, balance: Int? = nil, currency: String? = nil, default_source: String? = nil, delinquent: Bool? = nil, description: String? = nil, discount: Discount? = nil, email: String? = nil, invoice_prefix: String? = nil, invoice_settings: InvoiceSettingCustomerSetting? = nil, metadata: String? = nil, name: String? = nil, next_invoice_sequence: Int? = nil, phone: String? = nil, preferred_locales: [String]?? = nil, shipping: Shipping? = nil, sources: ApmsSourcesSourceList? = nil, subscriptions: SubscriptionList? = nil, tax_exempt: TaxExemptValues? = nil, tax_ids: TaxIDsList? = nil) {
		self.created = created
		self.id = id
		self.livemode = livemode
		self.object = object
		self.address = address
		self.balance = balance
		self.currency = currency
		self.default_source = default_source
		self.delinquent = delinquent
		self.description = description
		self.discount = discount
		self.email = email
		self.invoice_prefix = invoice_prefix
		self.invoice_settings = invoice_settings
		self.metadata = metadata
		self.name = name
		self.next_invoice_sequence = next_invoice_sequence
		self.phone = phone
		self.preferred_locales = preferred_locales
		self.shipping = shipping
		self.sources = sources
		self.subscriptions = subscriptions
		self.tax_exempt = tax_exempt
		self.tax_ids = tax_ids
	}


	/// The customer's tax IDs.
	public class TaxIDsList: Codable {
		/// Details about each object.
		public var data: [TaxId]
		/// True if this list has another page of items after this one that can be fetched.
		public var has_more: Bool
		/// String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
		public var object: ObjectValues
		/// The URL where this list can be accessed.
		public var url: String

		/// The customer's tax IDs.
		/// - Parameters:
		///   - data: Details about each object.
		///   - has_more: True if this list has another page of items after this one that can be fetched.
		///   - object: String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
		///   - url: The URL where this list can be accessed.
		public init(data: [TaxId], has_more: Bool, object: ObjectValues, url: String) {
			self.data = data
			self.has_more = has_more
			self.object = object
			self.url = url
		}

		public enum ObjectValues: String, Codable {
			case list = "list"
		}
	}



	/// The customer's payment sources, if any.
	public class ApmsSourcesSourceList: Codable {
		/// Details about each object.
		public var data: [AlipayAccount]
		/// True if this list has another page of items after this one that can be fetched.
		public var has_more: Bool
		/// String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
		public var object: ObjectValues
		/// The URL where this list can be accessed.
		public var url: String

		/// The customer's payment sources, if any.
		/// - Parameters:
		///   - data: Details about each object.
		///   - has_more: True if this list has another page of items after this one that can be fetched.
		///   - object: String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
		///   - url: The URL where this list can be accessed.
		public init(data: [AlipayAccount], has_more: Bool, object: ObjectValues, url: String) {
			self.data = data
			self.has_more = has_more
			self.object = object
			self.url = url
		}

		public enum ObjectValues: String, Codable {
			case list = "list"
		}
	}



	/// The customer's current subscriptions, if any.
	public class SubscriptionList: Codable {
		/// Details about each object.
		public var data: [Subscription]
		/// True if this list has another page of items after this one that can be fetched.
		public var has_more: Bool
		/// String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
		public var object: ObjectValues
		/// The URL where this list can be accessed.
		public var url: String

		/// The customer's current subscriptions, if any.
		/// - Parameters:
		///   - data: Details about each object.
		///   - has_more: True if this list has another page of items after this one that can be fetched.
		///   - object: String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
		///   - url: The URL where this list can be accessed.
		public init(data: [Subscription], has_more: Bool, object: ObjectValues, url: String) {
			self.data = data
			self.has_more = has_more
			self.object = object
			self.url = url
		}

		public enum ObjectValues: String, Codable {
			case list = "list"
		}
	}


	public enum ObjectValues: String, Codable {
		case customer = "customer"
	}

	public enum TaxExemptValues: String, Codable {
		case exempt = "exempt"
		case none = "none"
		case reverse = "reverse"
	}
}

public class CustomerAcceptance: Codable {
	/// The time at which the customer accepted the Mandate.
	public var accepted_at: Timestamp?
	public var offline: OfflineAcceptance?
	public var online: OnlineAcceptance?
	/// The type of customer acceptance information included with the Mandate. One of `online` or `offline`.
	public var type: TypeValues

	public init(type: TypeValues, accepted_at: Timestamp? = nil, offline: OfflineAcceptance? = nil, online: OnlineAcceptance? = nil) {
		self.type = type
		self.accepted_at = accepted_at
		self.offline = offline
		self.online = online
	}

	public enum TypeValues: String, Codable {
		case offline = "offline"
		case online = "online"
	}
}

/// Each customer has a [`balance`](https://stripe.com/docs/api/customers/object#customer_object-balance) value, which denotes a debit or credit that's automatically applied to their next invoice upon finalization. You may modify the value directly by using the [update customer API](https://stripe.com/docs/api/customers/update), or by creating a Customer Balance Transaction, which increments or decrements the customer's `balance` by the specified `amount`.  Related guide: [Customer Balance](https://stripe.com/docs/billing/customer/balance) to learn more.
public class CustomerBalanceTransaction: Codable {
	/// The amount of the transaction. A negative value is a credit for the customer's balance, and a positive value is a debit to the customer's `balance`.
	public var amount: Int
	/// Time at which the object was created. Measured in seconds since the Unix epoch.
	public var created: Timestamp
	/// The ID of the credit note (if any) related to the transaction.
	public var credit_note: String?
	/// Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
	public var currency: String
	/// The ID of the customer the transaction belongs to.
	public var customer: String
	/// An arbitrary string attached to the object. Often useful for displaying to users.
	public var description: String?
	/// The customer's `balance` after the transaction was applied. A negative value decreases the amount due on the customer's next invoice. A positive value increases the amount due on the customer's next invoice.
	public var ending_balance: Int
	/// Unique identifier for the object.
	public var id: String
	/// The ID of the invoice (if any) related to the transaction.
	public var invoice: String?
	/// Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
	public var livemode: Bool
	/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
	public var metadata: String?
	/// String representing the object's type. Objects of the same type share the same value.
	public var object: ObjectValues
	/// Transaction type: `adjustment`, `applied_to_invoice`, `credit_note`, `initial`, `invoice_too_large`, `invoice_too_small`, `unspent_receiver_credit`, or `unapplied_from_invoice`. See the [Customer Balance page](https://stripe.com/docs/billing/customer/balance#types) to learn more about transaction types.
	public var type: TypeValues

	/// Each customer has a [`balance`](https://stripe.com/docs/api/customers/object#customer_object-balance) value, which denotes a debit or credit that's automatically applied to their next invoice upon finalization. You may modify the value directly by using the [update customer API](https://stripe.com/docs/api/customers/update), or by creating a Customer Balance Transaction, which increments or decrements the customer's `balance` by the specified `amount`.  Related guide: [Customer Balance](https://stripe.com/docs/billing/customer/balance) to learn more.
	/// - Parameters:
	///   - amount: The amount of the transaction. A negative value is a credit for the customer's balance, and a positive value is a debit to the customer's `balance`.
	///   - created: Time at which the object was created. Measured in seconds since the Unix epoch.
	///   - credit_note: The ID of the credit note (if any) related to the transaction.
	///   - currency: Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
	///   - customer: The ID of the customer the transaction belongs to.
	///   - description: An arbitrary string attached to the object. Often useful for displaying to users.
	///   - ending_balance: The customer's `balance` after the transaction was applied. A negative value decreases the amount due on the customer's next invoice. A positive value increases the amount due on the customer's next invoice.
	///   - id: Unique identifier for the object.
	///   - invoice: The ID of the invoice (if any) related to the transaction.
	///   - livemode: Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
	///   - metadata: Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
	///   - object: String representing the object's type. Objects of the same type share the same value.
	///   - type: Transaction type: `adjustment`, `applied_to_invoice`, `credit_note`, `initial`, `invoice_too_large`, `invoice_too_small`, `unspent_receiver_credit`, or `unapplied_from_invoice`. See the [Customer Balance page](https://stripe.com/docs/billing/customer/balance#types) to learn more about transaction types.
	public init(amount: Int, created: Timestamp, currency: String, customer: String, ending_balance: Int, id: String, livemode: Bool, object: ObjectValues, type: TypeValues, credit_note: String? = nil, description: String? = nil, invoice: String? = nil, metadata: String? = nil) {
		self.amount = amount
		self.created = created
		self.currency = currency
		self.customer = customer
		self.ending_balance = ending_balance
		self.id = id
		self.livemode = livemode
		self.object = object
		self.type = type
		self.credit_note = credit_note
		self.description = description
		self.invoice = invoice
		self.metadata = metadata
	}

	public enum TypeValues: String, Codable {
		case adjustment = "adjustment"
		case appliedToInvoice = "applied_to_invoice"
		case creditNote = "credit_note"
		case initial = "initial"
		case invoiceTooLarge = "invoice_too_large"
		case invoiceTooSmall = "invoice_too_small"
		case migration = "migration"
		case unappliedFromInvoice = "unapplied_from_invoice"
		case unspentReceiverCredit = "unspent_receiver_credit"
	}

	public enum ObjectValues: String, Codable {
		case customerBalanceTransaction = "customer_balance_transaction"
	}
}

public class DeletedAccount: Codable {
	/// Always true for a deleted object
	public var deleted: Bool
	/// Unique identifier for the object.
	public var id: String
	/// String representing the object's type. Objects of the same type share the same value.
	public var object: ObjectValues

	public init(deleted: Bool, id: String, object: ObjectValues) {
		self.deleted = deleted
		self.id = id
		self.object = object
	}

	public enum ObjectValues: String, Codable {
		case account = "account"
	}
}

public class DeletedAlipayAccount: Codable {
	/// Always true for a deleted object
	public var deleted: Bool
	/// Unique identifier for the object.
	public var id: String
	/// String representing the object's type. Objects of the same type share the same value.
	public var object: ObjectValues

	public init(deleted: Bool, id: String, object: ObjectValues) {
		self.deleted = deleted
		self.id = id
		self.object = object
	}

	public enum ObjectValues: String, Codable {
		case alipayAccount = "alipay_account"
	}
}

public class DeletedApplePayDomain: Codable {
	/// Always true for a deleted object
	public var deleted: Bool
	/// Unique identifier for the object.
	public var id: String
	/// String representing the object's type. Objects of the same type share the same value.
	public var object: ObjectValues

	public init(deleted: Bool, id: String, object: ObjectValues) {
		self.deleted = deleted
		self.id = id
		self.object = object
	}

	public enum ObjectValues: String, Codable {
		case applePayDomain = "apple_pay_domain"
	}
}

public class DeletedBankAccount: Codable {
	/// Three-letter [ISO code for the currency](https://stripe.com/docs/payouts) paid out to the bank account.
	public var currency: String?
	/// Always true for a deleted object
	public var deleted: Bool
	/// Unique identifier for the object.
	public var id: String
	/// String representing the object's type. Objects of the same type share the same value.
	public var object: ObjectValues

	public init(deleted: Bool, id: String, object: ObjectValues, currency: String? = nil) {
		self.deleted = deleted
		self.id = id
		self.object = object
		self.currency = currency
	}

	public enum ObjectValues: String, Codable {
		case bankAccount = "bank_account"
	}
}

public class DeletedBitcoinReceiver: Codable {
	/// Always true for a deleted object
	public var deleted: Bool
	/// Unique identifier for the object.
	public var id: String
	/// String representing the object's type. Objects of the same type share the same value.
	public var object: ObjectValues

	public init(deleted: Bool, id: String, object: ObjectValues) {
		self.deleted = deleted
		self.id = id
		self.object = object
	}

	public enum ObjectValues: String, Codable {
		case bitcoinReceiver = "bitcoin_receiver"
	}
}

public class DeletedCard: Codable {
	/// Three-letter [ISO code for the currency](https://stripe.com/docs/payouts) paid out to the bank account.
	public var currency: String?
	/// Always true for a deleted object
	public var deleted: Bool
	/// Unique identifier for the object.
	public var id: String
	/// String representing the object's type. Objects of the same type share the same value.
	public var object: ObjectValues

	public init(deleted: Bool, id: String, object: ObjectValues, currency: String? = nil) {
		self.deleted = deleted
		self.id = id
		self.object = object
		self.currency = currency
	}

	public enum ObjectValues: String, Codable {
		case card = "card"
	}
}

public class DeletedCoupon: Codable {
	/// Always true for a deleted object
	public var deleted: Bool
	/// Unique identifier for the object.
	public var id: String
	/// String representing the object's type. Objects of the same type share the same value.
	public var object: ObjectValues

	public init(deleted: Bool, id: String, object: ObjectValues) {
		self.deleted = deleted
		self.id = id
		self.object = object
	}

	public enum ObjectValues: String, Codable {
		case coupon = "coupon"
	}
}

public class DeletedCustomer: Codable {
	/// Always true for a deleted object
	public var deleted: Bool
	/// Unique identifier for the object.
	public var id: String
	/// String representing the object's type. Objects of the same type share the same value.
	public var object: ObjectValues

	public init(deleted: Bool, id: String, object: ObjectValues) {
		self.deleted = deleted
		self.id = id
		self.object = object
	}

	public enum ObjectValues: String, Codable {
		case customer = "customer"
	}
}

public class DeletedDiscount: Codable {
	/// The Checkout session that this coupon is applied to, if it is applied to a particular session in payment mode. Will not be present for subscription mode.
	public var checkout_session: String?
	public var coupon: Coupon
	/// The ID of the customer associated with this discount.
	public var customer: String?
	/// Always true for a deleted object
	public var deleted: Bool
	/// The ID of the discount object. Discounts cannot be fetched by ID. Use `expand[]=discounts` in API calls to expand discount IDs in an array.
	public var id: String
	/// The invoice that the discount's coupon was applied to, if it was applied directly to a particular invoice.
	public var invoice: String?
	/// The invoice item `id` (or invoice line item `id` for invoice line items of type='subscription') that the discount's coupon was applied to, if it was applied directly to a particular invoice item or invoice line item.
	public var invoice_item: String?
	/// String representing the object's type. Objects of the same type share the same value.
	public var object: ObjectValues
	/// The promotion code applied to create this discount.
	public var promotion_code: String?
	/// Date that the coupon was applied.
	public var start: Timestamp
	/// The subscription that this coupon is applied to, if it is applied to a particular subscription.
	public var subscription: String?

	public init(coupon: Coupon, deleted: Bool, id: String, object: ObjectValues, start: Timestamp, checkout_session: String? = nil, customer: String? = nil, invoice: String? = nil, invoice_item: String? = nil, promotion_code: String? = nil, subscription: String? = nil) {
		self.coupon = coupon
		self.deleted = deleted
		self.id = id
		self.object = object
		self.start = start
		self.checkout_session = checkout_session
		self.customer = customer
		self.invoice = invoice
		self.invoice_item = invoice_item
		self.promotion_code = promotion_code
		self.subscription = subscription
	}

	public enum ObjectValues: String, Codable {
		case discount = "discount"
	}
}

public class DeletedExternalAccount: Codable {
}

public class DeletedInvoice: Codable {
	/// Always true for a deleted object
	public var deleted: Bool
	/// Unique identifier for the object.
	public var id: String
	/// String representing the object's type. Objects of the same type share the same value.
	public var object: ObjectValues

	public init(deleted: Bool, id: String, object: ObjectValues) {
		self.deleted = deleted
		self.id = id
		self.object = object
	}

	public enum ObjectValues: String, Codable {
		case invoice = "invoice"
	}
}

public class DeletedInvoiceitem: Codable {
	/// Always true for a deleted object
	public var deleted: Bool
	/// Unique identifier for the object.
	public var id: String
	/// String representing the object's type. Objects of the same type share the same value.
	public var object: ObjectValues

	public init(deleted: Bool, id: String, object: ObjectValues) {
		self.deleted = deleted
		self.id = id
		self.object = object
	}

	public enum ObjectValues: String, Codable {
		case invoiceitem = "invoiceitem"
	}
}

public class DeletedPaymentSource: Codable {
}

public class DeletedPerson: Codable {
	/// Always true for a deleted object
	public var deleted: Bool
	/// Unique identifier for the object.
	public var id: String
	/// String representing the object's type. Objects of the same type share the same value.
	public var object: ObjectValues

	public init(deleted: Bool, id: String, object: ObjectValues) {
		self.deleted = deleted
		self.id = id
		self.object = object
	}

	public enum ObjectValues: String, Codable {
		case person = "person"
	}
}

public class DeletedPlan: Codable {
	/// Always true for a deleted object
	public var deleted: Bool
	/// Unique identifier for the object.
	public var id: String
	/// String representing the object's type. Objects of the same type share the same value.
	public var object: ObjectValues

	public init(deleted: Bool, id: String, object: ObjectValues) {
		self.deleted = deleted
		self.id = id
		self.object = object
	}

	public enum ObjectValues: String, Codable {
		case plan = "plan"
	}
}

public class DeletedPrice: Codable {
	/// Always true for a deleted object
	public var deleted: Bool
	/// Unique identifier for the object.
	public var id: String
	/// String representing the object's type. Objects of the same type share the same value.
	public var object: ObjectValues

	public init(deleted: Bool, id: String, object: ObjectValues) {
		self.deleted = deleted
		self.id = id
		self.object = object
	}

	public enum ObjectValues: String, Codable {
		case price = "price"
	}
}

public class DeletedProduct: Codable {
	/// Always true for a deleted object
	public var deleted: Bool
	/// Unique identifier for the object.
	public var id: String
	/// String representing the object's type. Objects of the same type share the same value.
	public var object: ObjectValues

	public init(deleted: Bool, id: String, object: ObjectValues) {
		self.deleted = deleted
		self.id = id
		self.object = object
	}

	public enum ObjectValues: String, Codable {
		case product = "product"
	}
}

public class DeletedRadarValueList: Codable {
	/// Always true for a deleted object
	public var deleted: Bool
	/// Unique identifier for the object.
	public var id: String
	/// String representing the object's type. Objects of the same type share the same value.
	public var object: ObjectValues

	public init(deleted: Bool, id: String, object: ObjectValues) {
		self.deleted = deleted
		self.id = id
		self.object = object
	}

	public enum ObjectValues: String, Codable {
		case radarValueList = "radar.value_list"
	}
}

public class DeletedRadarValueListItem: Codable {
	/// Always true for a deleted object
	public var deleted: Bool
	/// Unique identifier for the object.
	public var id: String
	/// String representing the object's type. Objects of the same type share the same value.
	public var object: ObjectValues

	public init(deleted: Bool, id: String, object: ObjectValues) {
		self.deleted = deleted
		self.id = id
		self.object = object
	}

	public enum ObjectValues: String, Codable {
		case radarValueListItem = "radar.value_list_item"
	}
}

public class DeletedRecipient: Codable {
	/// Always true for a deleted object
	public var deleted: Bool
	/// Unique identifier for the object.
	public var id: String
	/// String representing the object's type. Objects of the same type share the same value.
	public var object: ObjectValues

	public init(deleted: Bool, id: String, object: ObjectValues) {
		self.deleted = deleted
		self.id = id
		self.object = object
	}

	public enum ObjectValues: String, Codable {
		case recipient = "recipient"
	}
}

public class DeletedSku: Codable {
	/// Always true for a deleted object
	public var deleted: Bool
	/// Unique identifier for the object.
	public var id: String
	/// String representing the object's type. Objects of the same type share the same value.
	public var object: ObjectValues

	public init(deleted: Bool, id: String, object: ObjectValues) {
		self.deleted = deleted
		self.id = id
		self.object = object
	}

	public enum ObjectValues: String, Codable {
		case sku = "sku"
	}
}

public class DeletedSubscriptionItem: Codable {
	/// Always true for a deleted object
	public var deleted: Bool
	/// Unique identifier for the object.
	public var id: String
	/// String representing the object's type. Objects of the same type share the same value.
	public var object: ObjectValues

	public init(deleted: Bool, id: String, object: ObjectValues) {
		self.deleted = deleted
		self.id = id
		self.object = object
	}

	public enum ObjectValues: String, Codable {
		case subscriptionItem = "subscription_item"
	}
}

public class DeletedTaxId: Codable {
	/// Always true for a deleted object
	public var deleted: Bool
	/// Unique identifier for the object.
	public var id: String
	/// String representing the object's type. Objects of the same type share the same value.
	public var object: ObjectValues

	public init(deleted: Bool, id: String, object: ObjectValues) {
		self.deleted = deleted
		self.id = id
		self.object = object
	}

	public enum ObjectValues: String, Codable {
		case taxId = "tax_id"
	}
}

public class DeletedTerminalLocation: Codable {
	/// Always true for a deleted object
	public var deleted: Bool
	/// Unique identifier for the object.
	public var id: String
	/// String representing the object's type. Objects of the same type share the same value.
	public var object: ObjectValues

	public init(deleted: Bool, id: String, object: ObjectValues) {
		self.deleted = deleted
		self.id = id
		self.object = object
	}

	public enum ObjectValues: String, Codable {
		case terminalLocation = "terminal.location"
	}
}

public class DeletedTerminalReader: Codable {
	/// Always true for a deleted object
	public var deleted: Bool
	/// Unique identifier for the object.
	public var id: String
	/// String representing the object's type. Objects of the same type share the same value.
	public var object: ObjectValues

	public init(deleted: Bool, id: String, object: ObjectValues) {
		self.deleted = deleted
		self.id = id
		self.object = object
	}

	public enum ObjectValues: String, Codable {
		case terminalReader = "terminal.reader"
	}
}

public class DeletedWebhookEndpoint: Codable {
	/// Always true for a deleted object
	public var deleted: Bool
	/// Unique identifier for the object.
	public var id: String
	/// String representing the object's type. Objects of the same type share the same value.
	public var object: ObjectValues

	public init(deleted: Bool, id: String, object: ObjectValues) {
		self.deleted = deleted
		self.id = id
		self.object = object
	}

	public enum ObjectValues: String, Codable {
		case webhookEndpoint = "webhook_endpoint"
	}
}

public class DeliveryEstimate: Codable {
	/// If `type` is `"exact"`, `date` will be the expected delivery date in the format YYYY-MM-DD.
	public var date: String?
	/// If `type` is `"range"`, `earliest` will be be the earliest delivery date in the format YYYY-MM-DD.
	public var earliest: String?
	/// If `type` is `"range"`, `latest` will be the latest delivery date in the format YYYY-MM-DD.
	public var latest: String?
	/// The type of estimate. Must be either `"range"` or `"exact"`.
	public var type: String

	public init(type: String, date: String? = nil, earliest: String? = nil, latest: String? = nil) {
		self.type = type
		self.date = date
		self.earliest = earliest
		self.latest = latest
	}
}

/// A discount represents the actual application of a coupon to a particular customer. It contains information about when the discount began and when it will end.  Related guide: [Applying Discounts to Subscriptions](https://stripe.com/docs/billing/subscriptions/discounts).
public class Discount: Codable {
	/// The Checkout session that this coupon is applied to, if it is applied to a particular session in payment mode. Will not be present for subscription mode.
	public var checkout_session: String?
	public var coupon: Coupon
	/// The ID of the customer associated with this discount.
	public var customer: String?
	/// If the coupon has a duration of `repeating`, the date that this discount will end. If the coupon has a duration of `once` or `forever`, this attribute will be null.
	public var end: Timestamp?
	/// The ID of the discount object. Discounts cannot be fetched by ID. Use `expand[]=discounts` in API calls to expand discount IDs in an array.
	public var id: String
	/// The invoice that the discount's coupon was applied to, if it was applied directly to a particular invoice.
	public var invoice: String?
	/// The invoice item `id` (or invoice line item `id` for invoice line items of type='subscription') that the discount's coupon was applied to, if it was applied directly to a particular invoice item or invoice line item.
	public var invoice_item: String?
	/// String representing the object's type. Objects of the same type share the same value.
	public var object: ObjectValues
	/// The promotion code applied to create this discount.
	public var promotion_code: String?
	/// Date that the coupon was applied.
	public var start: Timestamp
	/// The subscription that this coupon is applied to, if it is applied to a particular subscription.
	public var subscription: String?

	/// A discount represents the actual application of a coupon to a particular customer. It contains information about when the discount began and when it will end.  Related guide: [Applying Discounts to Subscriptions](https://stripe.com/docs/billing/subscriptions/discounts).
	/// - Parameters:
	///   - checkout_session: The Checkout session that this coupon is applied to, if it is applied to a particular session in payment mode. Will not be present for subscription mode.
	///   - coupon: 
	///   - customer: The ID of the customer associated with this discount.
	///   - end: If the coupon has a duration of `repeating`, the date that this discount will end. If the coupon has a duration of `once` or `forever`, this attribute will be null.
	///   - id: The ID of the discount object. Discounts cannot be fetched by ID. Use `expand[]=discounts` in API calls to expand discount IDs in an array.
	///   - invoice: The invoice that the discount's coupon was applied to, if it was applied directly to a particular invoice.
	///   - invoice_item: The invoice item `id` (or invoice line item `id` for invoice line items of type='subscription') that the discount's coupon was applied to, if it was applied directly to a particular invoice item or invoice line item.
	///   - object: String representing the object's type. Objects of the same type share the same value.
	///   - promotion_code: The promotion code applied to create this discount.
	///   - start: Date that the coupon was applied.
	///   - subscription: The subscription that this coupon is applied to, if it is applied to a particular subscription.
	public init(coupon: Coupon, id: String, object: ObjectValues, start: Timestamp, checkout_session: String? = nil, customer: String? = nil, end: Timestamp? = nil, invoice: String? = nil, invoice_item: String? = nil, promotion_code: String? = nil, subscription: String? = nil) {
		self.coupon = coupon
		self.id = id
		self.object = object
		self.start = start
		self.checkout_session = checkout_session
		self.customer = customer
		self.end = end
		self.invoice = invoice
		self.invoice_item = invoice_item
		self.promotion_code = promotion_code
		self.subscription = subscription
	}

	public enum ObjectValues: String, Codable {
		case discount = "discount"
	}
}

public class DiscountsResourceDiscountAmount: Codable {
	/// The amount, in %s, of the discount.
	public var amount: Int
	/// The discount that was applied to get this discount amount.
	public var discount: String

	public init(amount: Int, discount: String) {
		self.amount = amount
		self.discount = discount
	}
}

/// A dispute occurs when a customer questions your charge with their card issuer. When this happens, you're given the opportunity to respond to the dispute with evidence that shows that the charge is legitimate. You can find more information about the dispute process in our [Disputes and Fraud](/docs/disputes) documentation.  Related guide: [Disputes and Fraud](https://stripe.com/docs/disputes).
public class Dispute: Codable {
	/// Disputed amount. Usually the amount of the charge, but can differ (usually because of currency fluctuation or because only part of the order is disputed).
	public var amount: Int
	/// List of zero, one, or two balance transactions that show funds withdrawn and reinstated to your Stripe account as a result of this dispute.
	public var balance_transactions: [BalanceTransaction]
	/// ID of the charge that was disputed.
	public var charge: String
	/// Time at which the object was created. Measured in seconds since the Unix epoch.
	public var created: Timestamp
	/// Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
	public var currency: String
	public var evidence: DisputeEvidence
	public var evidence_details: DisputeEvidenceDetails
	/// Unique identifier for the object.
	public var id: String
	/// If true, it is still possible to refund the disputed payment. Once the payment has been fully refunded, no further funds will be withdrawn from your Stripe account as a result of this dispute.
	public var is_charge_refundable: Bool
	/// Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
	public var livemode: Bool
	/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
	public var metadata: String
	/// String representing the object's type. Objects of the same type share the same value.
	public var object: ObjectValues
	/// ID of the PaymentIntent that was disputed.
	public var payment_intent: String?
	/// Reason given by cardholder for dispute. Possible values are `bank_cannot_process`, `check_returned`, `credit_not_processed`, `customer_initiated`, `debit_not_authorized`, `duplicate`, `fraudulent`, `general`, `incorrect_account_details`, `insufficient_funds`, `product_not_received`, `product_unacceptable`, `subscription_canceled`, or `unrecognized`. Read more about [dispute reasons](https://stripe.com/docs/disputes/categories).
	public var reason: String
	/// Current status of dispute. Possible values are `warning_needs_response`, `warning_under_review`, `warning_closed`, `needs_response`, `under_review`, `charge_refunded`, `won`, or `lost`.
	public var status: StatusValues

	/// A dispute occurs when a customer questions your charge with their card issuer. When this happens, you're given the opportunity to respond to the dispute with evidence that shows that the charge is legitimate. You can find more information about the dispute process in our [Disputes and Fraud](/docs/disputes) documentation.  Related guide: [Disputes and Fraud](https://stripe.com/docs/disputes).
	/// - Parameters:
	///   - amount: Disputed amount. Usually the amount of the charge, but can differ (usually because of currency fluctuation or because only part of the order is disputed).
	///   - balance_transactions: List of zero, one, or two balance transactions that show funds withdrawn and reinstated to your Stripe account as a result of this dispute.
	///   - charge: ID of the charge that was disputed.
	///   - created: Time at which the object was created. Measured in seconds since the Unix epoch.
	///   - currency: Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
	///   - evidence: 
	///   - evidence_details: 
	///   - id: Unique identifier for the object.
	///   - is_charge_refundable: If true, it is still possible to refund the disputed payment. Once the payment has been fully refunded, no further funds will be withdrawn from your Stripe account as a result of this dispute.
	///   - livemode: Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
	///   - metadata: Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
	///   - object: String representing the object's type. Objects of the same type share the same value.
	///   - payment_intent: ID of the PaymentIntent that was disputed.
	///   - reason: Reason given by cardholder for dispute. Possible values are `bank_cannot_process`, `check_returned`, `credit_not_processed`, `customer_initiated`, `debit_not_authorized`, `duplicate`, `fraudulent`, `general`, `incorrect_account_details`, `insufficient_funds`, `product_not_received`, `product_unacceptable`, `subscription_canceled`, or `unrecognized`. Read more about [dispute reasons](https://stripe.com/docs/disputes/categories).
	///   - status: Current status of dispute. Possible values are `warning_needs_response`, `warning_under_review`, `warning_closed`, `needs_response`, `under_review`, `charge_refunded`, `won`, or `lost`.
	public init(amount: Int, balance_transactions: [BalanceTransaction], charge: String, created: Timestamp, currency: String, evidence: DisputeEvidence, evidence_details: DisputeEvidenceDetails, id: String, is_charge_refundable: Bool, livemode: Bool, metadata: String, object: ObjectValues, reason: String, status: StatusValues, payment_intent: String? = nil) {
		self.amount = amount
		self.balance_transactions = balance_transactions
		self.charge = charge
		self.created = created
		self.currency = currency
		self.evidence = evidence
		self.evidence_details = evidence_details
		self.id = id
		self.is_charge_refundable = is_charge_refundable
		self.livemode = livemode
		self.metadata = metadata
		self.object = object
		self.reason = reason
		self.status = status
		self.payment_intent = payment_intent
	}

	public enum ObjectValues: String, Codable {
		case dispute = "dispute"
	}

	public enum StatusValues: String, Codable {
		case chargeRefunded = "charge_refunded"
		case lost = "lost"
		case needsResponse = "needs_response"
		case underReview = "under_review"
		case warningClosed = "warning_closed"
		case warningNeedsResponse = "warning_needs_response"
		case warningUnderReview = "warning_under_review"
		case won = "won"
	}
}

public class DisputeEvidence: Codable {
	/// Any server or activity logs showing proof that the customer accessed or downloaded the purchased digital product. This information should include IP addresses, corresponding timestamps, and any detailed recorded activity.
	public var access_activity_log: String?
	/// The billing address provided by the customer.
	public var billing_address: String?
	/// (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) Your subscription cancellation policy, as shown to the customer.
	public var cancellation_policy: String?
	/// An explanation of how and when the customer was shown your refund policy prior to purchase.
	public var cancellation_policy_disclosure: String?
	/// A justification for why the customer's subscription was not canceled.
	public var cancellation_rebuttal: String?
	/// (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) Any communication with the customer that you feel is relevant to your case. Examples include emails proving that the customer received the product or service, or demonstrating their use of or satisfaction with the product or service.
	public var customer_communication: String?
	/// The email address of the customer.
	public var customer_email_address: String?
	/// The name of the customer.
	public var customer_name: String?
	/// The IP address that the customer used when making the purchase.
	public var customer_purchase_ip: String?
	/// (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) A relevant document or contract showing the customer's signature.
	public var customer_signature: String?
	/// (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) Documentation for the prior charge that can uniquely identify the charge, such as a receipt, shipping label, work order, etc. This document should be paired with a similar document from the disputed payment that proves the two payments are separate.
	public var duplicate_charge_documentation: String?
	/// An explanation of the difference between the disputed charge versus the prior charge that appears to be a duplicate.
	public var duplicate_charge_explanation: String?
	/// The Stripe ID for the prior charge which appears to be a duplicate of the disputed charge.
	public var duplicate_charge_id: String?
	/// A description of the product or service that was sold.
	public var product_description: String?
	/// (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) Any receipt or message sent to the customer notifying them of the charge.
	public var receipt: String?
	/// (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) Your refund policy, as shown to the customer.
	public var refund_policy: String?
	/// Documentation demonstrating that the customer was shown your refund policy prior to purchase.
	public var refund_policy_disclosure: String?
	/// A justification for why the customer is not entitled to a refund.
	public var refund_refusal_explanation: String?
	/// The date on which the customer received or began receiving the purchased service, in a clear human-readable format.
	public var service_date: String?
	/// (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) Documentation showing proof that a service was provided to the customer. This could include a copy of a signed contract, work order, or other form of written agreement.
	public var service_documentation: String?
	/// The address to which a physical product was shipped. You should try to include as complete address information as possible.
	public var shipping_address: String?
	/// The delivery service that shipped a physical product, such as Fedex, UPS, USPS, etc. If multiple carriers were used for this purchase, please separate them with commas.
	public var shipping_carrier: String?
	/// The date on which a physical product began its route to the shipping address, in a clear human-readable format.
	public var shipping_date: String?
	/// (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) Documentation showing proof that a product was shipped to the customer at the same address the customer provided to you. This could include a copy of the shipment receipt, shipping label, etc. It should show the customer's full shipping address, if possible.
	public var shipping_documentation: String?
	/// The tracking number for a physical product, obtained from the delivery service. If multiple tracking numbers were generated for this purchase, please separate them with commas.
	public var shipping_tracking_number: String?
	/// (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) Any additional evidence or statements.
	public var uncategorized_file: String?
	/// Any additional evidence or statements.
	public var uncategorized_text: String?

	public init(access_activity_log: String? = nil, billing_address: String? = nil, cancellation_policy: String? = nil, cancellation_policy_disclosure: String? = nil, cancellation_rebuttal: String? = nil, customer_communication: String? = nil, customer_email_address: String? = nil, customer_name: String? = nil, customer_purchase_ip: String? = nil, customer_signature: String? = nil, duplicate_charge_documentation: String? = nil, duplicate_charge_explanation: String? = nil, duplicate_charge_id: String? = nil, product_description: String? = nil, receipt: String? = nil, refund_policy: String? = nil, refund_policy_disclosure: String? = nil, refund_refusal_explanation: String? = nil, service_date: String? = nil, service_documentation: String? = nil, shipping_address: String? = nil, shipping_carrier: String? = nil, shipping_date: String? = nil, shipping_documentation: String? = nil, shipping_tracking_number: String? = nil, uncategorized_file: String? = nil, uncategorized_text: String? = nil) {
		self.access_activity_log = access_activity_log
		self.billing_address = billing_address
		self.cancellation_policy = cancellation_policy
		self.cancellation_policy_disclosure = cancellation_policy_disclosure
		self.cancellation_rebuttal = cancellation_rebuttal
		self.customer_communication = customer_communication
		self.customer_email_address = customer_email_address
		self.customer_name = customer_name
		self.customer_purchase_ip = customer_purchase_ip
		self.customer_signature = customer_signature
		self.duplicate_charge_documentation = duplicate_charge_documentation
		self.duplicate_charge_explanation = duplicate_charge_explanation
		self.duplicate_charge_id = duplicate_charge_id
		self.product_description = product_description
		self.receipt = receipt
		self.refund_policy = refund_policy
		self.refund_policy_disclosure = refund_policy_disclosure
		self.refund_refusal_explanation = refund_refusal_explanation
		self.service_date = service_date
		self.service_documentation = service_documentation
		self.shipping_address = shipping_address
		self.shipping_carrier = shipping_carrier
		self.shipping_date = shipping_date
		self.shipping_documentation = shipping_documentation
		self.shipping_tracking_number = shipping_tracking_number
		self.uncategorized_file = uncategorized_file
		self.uncategorized_text = uncategorized_text
	}
}

public class DisputeEvidenceDetails: Codable {
	/// Date by which evidence must be submitted in order to successfully challenge dispute. Will be null if the customer's bank or credit card company doesn't allow a response for this particular dispute.
	public var due_by: Timestamp?
	/// Whether evidence has been staged for this dispute.
	public var has_evidence: Bool
	/// Whether the last evidence submission was submitted past the due date. Defaults to `false` if no evidence submissions have occurred. If `true`, then delivery of the latest evidence is *not* guaranteed.
	public var past_due: Bool
	/// The number of times evidence has been submitted. Typically, you may only submit evidence once.
	public var submission_count: Int

	public init(has_evidence: Bool, past_due: Bool, submission_count: Int, due_by: Timestamp? = nil) {
		self.has_evidence = has_evidence
		self.past_due = past_due
		self.submission_count = submission_count
		self.due_by = due_by
	}
}

public class EphemeralKey: Codable {
	/// Time at which the object was created. Measured in seconds since the Unix epoch.
	public var created: Timestamp
	/// Time at which the key will expire. Measured in seconds since the Unix epoch.
	public var expires: Timestamp
	/// Unique identifier for the object.
	public var id: String
	/// Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
	public var livemode: Bool
	/// String representing the object's type. Objects of the same type share the same value.
	public var object: ObjectValues
	/// The key's secret. You can use this value to make authorized requests to the Stripe API.
	public var secret: String?

	public init(created: Timestamp, expires: Timestamp, id: String, livemode: Bool, object: ObjectValues, secret: String? = nil) {
		self.created = created
		self.expires = expires
		self.id = id
		self.livemode = livemode
		self.object = object
		self.secret = secret
	}

	public enum ObjectValues: String, Codable {
		case ephemeralKey = "ephemeral_key"
	}
}

/// An error response from the Stripe API
public class Error: Codable {
	public var error: ApiErrors

	/// An error response from the Stripe API
	/// - Parameters:
	///   - error: 
	public init(error: ApiErrors) {
		self.error = error
	}
}

/// Events are our way of letting you know when something interesting happens in your account. When an interesting event occurs, we create a new `Event` object. For example, when a charge succeeds, we create a `charge.succeeded` event; and when an invoice payment attempt fails, we create an `invoice.payment_failed` event. Note that many API requests may cause multiple events to be created. For example, if you create a new subscription for a customer, you will receive both a `customer.subscription.created` event and a `charge.succeeded` event.  Events occur when the state of another API resource changes. The state of that resource at the time of the change is embedded in the event's data field. For example, a `charge.succeeded` event will contain a charge, and an `invoice.payment_failed` event will contain an invoice.  As with other API resources, you can use endpoints to retrieve an [individual event](https://stripe.com/docs/api#retrieve_event) or a [list of events](https://stripe.com/docs/api#list_events) from the API. We also have a separate [webhooks](http://en.wikipedia.org/wiki/Webhook) system for sending the `Event` objects directly to an endpoint on your server. Webhooks are managed in your [account settings](https://dashboard.stripe.com/account/webhooks), and our [Using Webhooks](https://stripe.com/docs/webhooks) guide will help you get set up.  When using [Connect](https://stripe.com/docs/connect), you can also receive notifications of events that occur in connected accounts. For these events, there will be an additional `account` attribute in the received `Event` object.  **NOTE:** Right now, access to events through the [Retrieve Event API](https://stripe.com/docs/api#retrieve_event) is guaranteed only for 30 days.
public class Event: Codable {
	/// The connected account that originated the event.
	public var account: String?
	/// The Stripe API version used to render `data`. *Note: This property is populated only for events on or after October 31, 2014*.
	public var api_version: String?
	/// Time at which the object was created. Measured in seconds since the Unix epoch.
	public var created: Timestamp
	public var data: NotificationEventData
	/// Unique identifier for the object.
	public var id: String
	/// Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
	public var livemode: Bool
	/// String representing the object's type. Objects of the same type share the same value.
	public var object: ObjectValues
	/// Number of webhooks that have yet to be successfully delivered (i.e., to return a 20x response) to the URLs you've specified.
	public var pending_webhooks: Int
	/// Information on the API request that instigated the event.
	public var request: NotificationEventRequest?
	/// Description of the event (e.g., `invoice.created` or `charge.refunded`).
	public var type: String

	/// Events are our way of letting you know when something interesting happens in your account. When an interesting event occurs, we create a new `Event` object. For example, when a charge succeeds, we create a `charge.succeeded` event; and when an invoice payment attempt fails, we create an `invoice.payment_failed` event. Note that many API requests may cause multiple events to be created. For example, if you create a new subscription for a customer, you will receive both a `customer.subscription.created` event and a `charge.succeeded` event.  Events occur when the state of another API resource changes. The state of that resource at the time of the change is embedded in the event's data field. For example, a `charge.succeeded` event will contain a charge, and an `invoice.payment_failed` event will contain an invoice.  As with other API resources, you can use endpoints to retrieve an [individual event](https://stripe.com/docs/api#retrieve_event) or a [list of events](https://stripe.com/docs/api#list_events) from the API. We also have a separate [webhooks](http://en.wikipedia.org/wiki/Webhook) system for sending the `Event` objects directly to an endpoint on your server. Webhooks are managed in your [account settings](https://dashboard.stripe.com/account/webhooks), and our [Using Webhooks](https://stripe.com/docs/webhooks) guide will help you get set up.  When using [Connect](https://stripe.com/docs/connect), you can also receive notifications of events that occur in connected accounts. For these events, there will be an additional `account` attribute in the received `Event` object.  **NOTE:** Right now, access to events through the [Retrieve Event API](https://stripe.com/docs/api#retrieve_event) is guaranteed only for 30 days.
	/// - Parameters:
	///   - account: The connected account that originated the event.
	///   - api_version: The Stripe API version used to render `data`. *Note: This property is populated only for events on or after October 31, 2014*.
	///   - created: Time at which the object was created. Measured in seconds since the Unix epoch.
	///   - data: 
	///   - id: Unique identifier for the object.
	///   - livemode: Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
	///   - object: String representing the object's type. Objects of the same type share the same value.
	///   - pending_webhooks: Number of webhooks that have yet to be successfully delivered (i.e., to return a 20x response) to the URLs you've specified.
	///   - request: Information on the API request that instigated the event.
	///   - type: Description of the event (e.g., `invoice.created` or `charge.refunded`).
	public init(created: Timestamp, data: NotificationEventData, id: String, livemode: Bool, object: ObjectValues, pending_webhooks: Int, type: String, account: String? = nil, api_version: String? = nil, request: NotificationEventRequest? = nil) {
		self.created = created
		self.data = data
		self.id = id
		self.livemode = livemode
		self.object = object
		self.pending_webhooks = pending_webhooks
		self.type = type
		self.account = account
		self.api_version = api_version
		self.request = request
	}

	public enum ObjectValues: String, Codable {
		case event = "event"
	}
}

/// `Exchange Rate` objects allow you to determine the rates that Stripe is currently using to convert from one currency to another. Since this number is variable throughout the day, there are various reasons why you might want to know the current rate (for example, to dynamically price an item for a user with a default payment in a foreign currency).  If you want a guarantee that the charge is made with a certain exchange rate you expect is current, you can pass in `exchange_rate` to charges endpoints. If the value is no longer up to date, the charge won't go through. Please refer to our [Exchange Rates API](https://stripe.com/docs/exchange-rates) guide for more details.
public class ExchangeRate: Codable {
	/// Unique identifier for the object. Represented as the three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html) in lowercase.
	public var id: String
	/// String representing the object's type. Objects of the same type share the same value.
	public var object: ObjectValues
	/// Hash where the keys are supported currencies and the values are the exchange rate at which the base id currency converts to the key currency.
	public var rates: String

	/// `Exchange Rate` objects allow you to determine the rates that Stripe is currently using to convert from one currency to another. Since this number is variable throughout the day, there are various reasons why you might want to know the current rate (for example, to dynamically price an item for a user with a default payment in a foreign currency).  If you want a guarantee that the charge is made with a certain exchange rate you expect is current, you can pass in `exchange_rate` to charges endpoints. If the value is no longer up to date, the charge won't go through. Please refer to our [Exchange Rates API](https://stripe.com/docs/exchange-rates) guide for more details.
	/// - Parameters:
	///   - id: Unique identifier for the object. Represented as the three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html) in lowercase.
	///   - object: String representing the object's type. Objects of the same type share the same value.
	///   - rates: Hash where the keys are supported currencies and the values are the exchange rate at which the base id currency converts to the key currency.
	public init(id: String, object: ObjectValues, rates: String) {
		self.id = id
		self.object = object
		self.rates = rates
	}

	public enum ObjectValues: String, Codable {
		case exchangeRate = "exchange_rate"
	}
}

public class ExternalAccount: Codable {
}

public class Fee: Codable {
	/// Amount of the fee, in cents.
	public var amount: Int
	/// ID of the Connect application that earned the fee.
	public var application: String?
	/// Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
	public var currency: String
	/// An arbitrary string attached to the object. Often useful for displaying to users.
	public var description: String?
	/// Type of the fee, one of: `application_fee`, `stripe_fee` or `tax`.
	public var type: String

	public init(amount: Int, currency: String, type: String, application: String? = nil, description: String? = nil) {
		self.amount = amount
		self.currency = currency
		self.type = type
		self.application = application
		self.description = description
	}
}

/// `Application Fee Refund` objects allow you to refund an application fee that has previously been created but not yet refunded. Funds will be refunded to the Stripe account from which the fee was originally collected.  Related guide: [Refunding Application Fees](https://stripe.com/docs/connect/destination-charges#refunding-app-fee).
public class FeeRefund: Codable {
	/// Amount, in %s.
	public var amount: Int
	/// Balance transaction that describes the impact on your account balance.
	public var balance_transaction: String?
	/// Time at which the object was created. Measured in seconds since the Unix epoch.
	public var created: Timestamp
	/// Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
	public var currency: String
	/// ID of the application fee that was refunded.
	public var fee: String
	/// Unique identifier for the object.
	public var id: String
	/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
	public var metadata: String?
	/// String representing the object's type. Objects of the same type share the same value.
	public var object: ObjectValues

	/// `Application Fee Refund` objects allow you to refund an application fee that has previously been created but not yet refunded. Funds will be refunded to the Stripe account from which the fee was originally collected.  Related guide: [Refunding Application Fees](https://stripe.com/docs/connect/destination-charges#refunding-app-fee).
	/// - Parameters:
	///   - amount: Amount, in %s.
	///   - balance_transaction: Balance transaction that describes the impact on your account balance.
	///   - created: Time at which the object was created. Measured in seconds since the Unix epoch.
	///   - currency: Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
	///   - fee: ID of the application fee that was refunded.
	///   - id: Unique identifier for the object.
	///   - metadata: Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
	///   - object: String representing the object's type. Objects of the same type share the same value.
	public init(amount: Int, created: Timestamp, currency: String, fee: String, id: String, object: ObjectValues, balance_transaction: String? = nil, metadata: String? = nil) {
		self.amount = amount
		self.created = created
		self.currency = currency
		self.fee = fee
		self.id = id
		self.object = object
		self.balance_transaction = balance_transaction
		self.metadata = metadata
	}

	public enum ObjectValues: String, Codable {
		case feeRefund = "fee_refund"
	}
}

/// This is an object representing a file hosted on Stripe's servers. The file may have been uploaded by yourself using the [create file](https://stripe.com/docs/api#create_file) request (for example, when uploading dispute evidence) or it may have been created by Stripe (for example, the results of a [Sigma scheduled query](#scheduled_queries)).  Related guide: [File Upload Guide](https://stripe.com/docs/file-upload).
public class File: Codable {
	/// Time at which the object was created. Measured in seconds since the Unix epoch.
	public var created: Timestamp
	/// The time at which the file expires and is no longer available in epoch seconds.
	public var expires_at: Timestamp?
	/// A filename for the file, suitable for saving to a filesystem.
	public var filename: String?
	/// Unique identifier for the object.
	public var id: String
	/// A list of [file links](https://stripe.com/docs/api#file_links) that point at this file.
	public var links: FileFileLinkList?
	/// String representing the object's type. Objects of the same type share the same value.
	public var object: ObjectValues
	/// The [purpose](https://stripe.com/docs/file-upload#uploading-a-file) of the uploaded file.
	public var purpose: PurposeValues
	/// The size in bytes of the file object.
	public var size: Int
	/// A user friendly title for the document.
	public var title: String?
	/// The type of the file returned (e.g., `csv`, `pdf`, `jpg`, or `png`).
	public var type: String?
	/// The URL from which the file can be downloaded using your live secret API key.
	public var url: String?

	/// This is an object representing a file hosted on Stripe's servers. The file may have been uploaded by yourself using the [create file](https://stripe.com/docs/api#create_file) request (for example, when uploading dispute evidence) or it may have been created by Stripe (for example, the results of a [Sigma scheduled query](#scheduled_queries)).  Related guide: [File Upload Guide](https://stripe.com/docs/file-upload).
	/// - Parameters:
	///   - created: Time at which the object was created. Measured in seconds since the Unix epoch.
	///   - expires_at: The time at which the file expires and is no longer available in epoch seconds.
	///   - filename: A filename for the file, suitable for saving to a filesystem.
	///   - id: Unique identifier for the object.
	///   - links: A list of [file links](https://stripe.com/docs/api#file_links) that point at this file.
	///   - object: String representing the object's type. Objects of the same type share the same value.
	///   - purpose: The [purpose](https://stripe.com/docs/file-upload#uploading-a-file) of the uploaded file.
	///   - size: The size in bytes of the file object.
	///   - title: A user friendly title for the document.
	///   - type: The type of the file returned (e.g., `csv`, `pdf`, `jpg`, or `png`).
	///   - url: The URL from which the file can be downloaded using your live secret API key.
	public init(created: Timestamp, id: String, object: ObjectValues, purpose: PurposeValues, size: Int, expires_at: Timestamp? = nil, filename: String? = nil, links: FileFileLinkList? = nil, title: String? = nil, type: String? = nil, url: String? = nil) {
		self.created = created
		self.id = id
		self.object = object
		self.purpose = purpose
		self.size = size
		self.expires_at = expires_at
		self.filename = filename
		self.links = links
		self.title = title
		self.type = type
		self.url = url
	}


	/// A list of [file links](https://stripe.com/docs/api#file_links) that point at this file.
	public class FileFileLinkList: Codable {
		/// Details about each object.
		public var data: [FileLink]
		/// True if this list has another page of items after this one that can be fetched.
		public var has_more: Bool
		/// String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
		public var object: ObjectValues
		/// The URL where this list can be accessed.
		public var url: String

		/// A list of [file links](https://stripe.com/docs/api#file_links) that point at this file.
		/// - Parameters:
		///   - data: Details about each object.
		///   - has_more: True if this list has another page of items after this one that can be fetched.
		///   - object: String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
		///   - url: The URL where this list can be accessed.
		public init(data: [FileLink], has_more: Bool, object: ObjectValues, url: String) {
			self.data = data
			self.has_more = has_more
			self.object = object
			self.url = url
		}

		public enum ObjectValues: String, Codable {
			case list = "list"
		}
	}


	public enum PurposeValues: String, Codable {
		case accountRequirement = "account_requirement"
		case additionalVerification = "additional_verification"
		case businessIcon = "business_icon"
		case businessLogo = "business_logo"
		case customerSignature = "customer_signature"
		case disputeEvidence = "dispute_evidence"
		case identityDocument = "identity_document"
		case pciDocument = "pci_document"
		case taxDocumentUserUpload = "tax_document_user_upload"
	}

	public enum ObjectValues: String, Codable {
		case file = "file"
	}
}

/// To share the contents of a `File` object with non-Stripe users, you can create a `FileLink`. `FileLink`s contain a URL that can be used to retrieve the contents of the file without authentication.
public class FileLink: Codable {
	/// Time at which the object was created. Measured in seconds since the Unix epoch.
	public var created: Timestamp
	/// Whether this link is already expired.
	public var expired: Bool
	/// Time at which the link expires.
	public var expires_at: Timestamp?
	/// The file object this link points to.
	public var file: String
	/// Unique identifier for the object.
	public var id: String
	/// Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
	public var livemode: Bool
	/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
	public var metadata: String
	/// String representing the object's type. Objects of the same type share the same value.
	public var object: ObjectValues
	/// The publicly accessible URL to download the file.
	public var url: String?

	/// To share the contents of a `File` object with non-Stripe users, you can create a `FileLink`. `FileLink`s contain a URL that can be used to retrieve the contents of the file without authentication.
	/// - Parameters:
	///   - created: Time at which the object was created. Measured in seconds since the Unix epoch.
	///   - expired: Whether this link is already expired.
	///   - expires_at: Time at which the link expires.
	///   - file: The file object this link points to.
	///   - id: Unique identifier for the object.
	///   - livemode: Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
	///   - metadata: Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
	///   - object: String representing the object's type. Objects of the same type share the same value.
	///   - url: The publicly accessible URL to download the file.
	public init(created: Timestamp, expired: Bool, file: String, id: String, livemode: Bool, metadata: String, object: ObjectValues, expires_at: Timestamp? = nil, url: String? = nil) {
		self.created = created
		self.expired = expired
		self.file = file
		self.id = id
		self.livemode = livemode
		self.metadata = metadata
		self.object = object
		self.expires_at = expires_at
		self.url = url
	}

	public enum ObjectValues: String, Codable {
		case fileLink = "file_link"
	}
}

public class FinancialReportingFinanceReportRunRunParameters: Codable {
	/// The set of output columns requested for inclusion in the report run.
	public var columns: [String]?
	/// Connected account ID by which to filter the report run.
	public var connected_account: String?
	/// Currency of objects to be included in the report run.
	public var currency: String?
	/// Ending timestamp of data to be included in the report run (exclusive).
	public var interval_end: Timestamp?
	/// Starting timestamp of data to be included in the report run.
	public var interval_start: Timestamp?
	/// Payout ID by which to filter the report run.
	public var payout: String?
	/// Category of balance transactions to be included in the report run.
	public var reporting_category: String?
	/// Defaults to `Etc/UTC`. The output timezone for all timestamps in the report. A list of possible time zone values is maintained at the [IANA Time Zone Database](http://www.iana.org/time-zones). Has no effect on `interval_start` or `interval_end`.
	public var timezone: String?

	public init(columns: [String]? = nil, connected_account: String? = nil, currency: String? = nil, interval_end: Timestamp? = nil, interval_start: Timestamp? = nil, payout: String? = nil, reporting_category: String? = nil, timezone: String? = nil) {
		self.columns = columns
		self.connected_account = connected_account
		self.currency = currency
		self.interval_end = interval_end
		self.interval_start = interval_start
		self.payout = payout
		self.reporting_category = reporting_category
		self.timezone = timezone
	}
}

public class Inventory: Codable {
	/// The count of inventory available. Will be present if and only if `type` is `finite`.
	public var quantity: Int?
	/// Inventory type. Possible values are `finite`, `bucket` (not quantified), and `infinite`.
	public var type: String
	/// An indicator of the inventory available. Possible values are `in_stock`, `limited`, and `out_of_stock`. Will be present if and only if `type` is `bucket`.
	public var value: String?

	public init(type: String, quantity: Int? = nil, value: String? = nil) {
		self.type = type
		self.quantity = quantity
		self.value = value
	}
}

/// Invoices are statements of amounts owed by a customer, and are either generated one-off, or generated periodically from a subscription.  They contain [invoice items](https://stripe.com/docs/api#invoiceitems), and proration adjustments that may be caused by subscription upgrades/downgrades (if necessary).  If your invoice is configured to be billed through automatic charges, Stripe automatically finalizes your invoice and attempts payment. Note that finalizing the invoice, [when automatic](https://stripe.com/docs/billing/invoices/workflow/#auto_advance), does not happen immediately as the invoice is created. Stripe waits until one hour after the last webhook was successfully sent (or the last webhook timed out after failing). If you (and the platforms you may have connected to) have no webhooks configured, Stripe waits one hour after creation to finalize the invoice.  If your invoice is configured to be billed by sending an email, then based on your [email settings](https://dashboard.stripe.com/account/billing/automatic'), Stripe will email the invoice to your customer and await payment. These emails can contain a link to a hosted page to pay the invoice.  Stripe applies any customer credit on the account before determining the amount due for the invoice (i.e., the amount that will be actually charged). If the amount due for the invoice is less than Stripe's [minimum allowed charge per currency](/docs/currencies#minimum-and-maximum-charge-amounts), the invoice is automatically marked paid, and we add the amount due to the customer's credit balance which is applied to the next invoice.  More details on the customer's credit balance are [here](https://stripe.com/docs/billing/customer/balance).  Related guide: [Send Invoices to Customers](https://stripe.com/docs/billing/invoices/sending).
public class Invoice: Codable {
	/// The country of the business associated with this invoice, most often the business creating the invoice.
	public var account_country: String?
	/// The public name of the business associated with this invoice, most often the business creating the invoice.
	public var account_name: String?
	/// The account tax IDs associated with the invoice. Only editable when the invoice is a draft.
	public var account_tax_ids: [String]??
	/// Final amount due at this time for this invoice. If the invoice's total is smaller than the minimum charge amount, for example, or if there is account credit that can be applied to the invoice, the `amount_due` may be 0. If there is a positive `starting_balance` for the invoice (the customer owes money), the `amount_due` will also take that into account. The charge that gets generated for the invoice will be for the amount specified in `amount_due`.
	public var amount_due: Int
	/// The amount, in %s, that was paid.
	public var amount_paid: Int
	/// The amount remaining, in %s, that is due.
	public var amount_remaining: Int
	/// The fee in %s that will be applied to the invoice and transferred to the application owner's Stripe account when the invoice is paid.
	public var application_fee_amount: Int?
	/// Number of payment attempts made for this invoice, from the perspective of the payment retry schedule. Any payment attempt counts as the first attempt, and subsequently only automatic retries increment the attempt count. In other words, manual payment attempts after the first attempt do not affect the retry schedule.
	public var attempt_count: Int
	/// Whether an attempt has been made to pay the invoice. An invoice is not attempted until 1 hour after the `invoice.created` webhook, for example, so you might not want to display that invoice as unpaid to your users.
	public var attempted: Bool
	/// Controls whether Stripe will perform [automatic collection](https://stripe.com/docs/billing/invoices/workflow/#auto_advance) of the invoice. When `false`, the invoice's state will not automatically advance without an explicit action.
	public var auto_advance: Bool?
	/// Indicates the reason why the invoice was created. `subscription_cycle` indicates an invoice created by a subscription advancing into a new period. `subscription_create` indicates an invoice created due to creating a subscription. `subscription_update` indicates an invoice created due to updating a subscription. `subscription` is set for all old invoices to indicate either a change to a subscription or a period advancement. `manual` is set for all invoices unrelated to a subscription (for example: created via the invoice editor). The `upcoming` value is reserved for simulated invoices per the upcoming invoice endpoint. `subscription_threshold` indicates an invoice created due to a billing threshold being reached.
	public var billing_reason: BillingReasonValues?
	/// ID of the latest charge generated for this invoice, if any.
	public var charge: String?
	/// Either `charge_automatically`, or `send_invoice`. When charging automatically, Stripe will attempt to pay this invoice using the default source attached to the customer. When sending an invoice, Stripe will email this invoice to the customer with payment instructions.
	public var collection_method: CollectionMethodValues?
	/// Time at which the object was created. Measured in seconds since the Unix epoch.
	public var created: Timestamp
	/// Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
	public var currency: String
	/// Custom fields displayed on the invoice.
	public var custom_fields: [InvoiceSettingCustomField]??
	/// The ID of the customer who will be billed.
	public var customer: String
	/// The customer's address. Until the invoice is finalized, this field will equal `customer.address`. Once the invoice is finalized, this field will no longer be updated.
	public var customer_address: Address?
	/// The customer's email. Until the invoice is finalized, this field will equal `customer.email`. Once the invoice is finalized, this field will no longer be updated.
	public var customer_email: String?
	/// The customer's name. Until the invoice is finalized, this field will equal `customer.name`. Once the invoice is finalized, this field will no longer be updated.
	public var customer_name: String?
	/// The customer's phone number. Until the invoice is finalized, this field will equal `customer.phone`. Once the invoice is finalized, this field will no longer be updated.
	public var customer_phone: String?
	/// The customer's shipping information. Until the invoice is finalized, this field will equal `customer.shipping`. Once the invoice is finalized, this field will no longer be updated.
	public var customer_shipping: Shipping?
	/// The customer's tax exempt status. Until the invoice is finalized, this field will equal `customer.tax_exempt`. Once the invoice is finalized, this field will no longer be updated.
	public var customer_tax_exempt: CustomerTaxExemptValues?
	/// The customer's tax IDs. Until the invoice is finalized, this field will contain the same tax IDs as `customer.tax_ids`. Once the invoice is finalized, this field will no longer be updated.
	public var customer_tax_ids: [InvoicesResourceInvoiceTaxId]??
	/// ID of the default payment method for the invoice. It must belong to the customer associated with the invoice. If not set, defaults to the subscription's default payment method, if any, or to the default payment method in the customer's invoice settings.
	public var default_payment_method: String?
	/// ID of the default payment source for the invoice. It must belong to the customer associated with the invoice and be in a chargeable state. If not set, defaults to the subscription's default source, if any, or to the customer's default source.
	public var default_source: String?
	/// The tax rates applied to this invoice, if any.
	public var default_tax_rates: [TaxRate]
	/// An arbitrary string attached to the object. Often useful for displaying to users. Referenced as 'memo' in the Dashboard.
	public var description: String?
	/// Describes the current discount applied to this invoice, if there is one. Not populated if there are multiple discounts.
	public var discount: Discount?
	/// The discounts applied to the invoice. Line item discounts are applied before invoice discounts. Use `expand[]=discounts` to expand each discount.
	public var discounts: [String]??
	/// The date on which payment for this invoice is due. This value will be `null` for invoices where `collection_method=charge_automatically`.
	public var due_date: Timestamp?
	/// Ending customer balance after the invoice is finalized. Invoices are finalized approximately an hour after successful webhook delivery or when payment collection is attempted for the invoice. If the invoice has not been finalized yet, this will be null.
	public var ending_balance: Int?
	/// Footer displayed on the invoice.
	public var footer: String?
	/// The URL for the hosted invoice page, which allows customers to view and pay an invoice. If the invoice has not been finalized yet, this will be null.
	public var hosted_invoice_url: String?
	/// Unique identifier for the object.
	public var id: String?
	/// The link to download the PDF for the invoice. If the invoice has not been finalized yet, this will be null.
	public var invoice_pdf: String?
	/// The error encountered during the previous attempt to finalize the invoice. This field is cleared when the invoice is successfully finalized.
	public var last_finalization_error: ApiErrors?
	/// The individual line items that make up the invoice. `lines` is sorted as follows: invoice items in reverse chronological order, followed by the subscription, if any.
	public var lines: InvoiceLinesList
	/// Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
	public var livemode: Bool
	/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
	public var metadata: String?
	/// The time at which payment will next be attempted. This value will be `null` for invoices where `collection_method=send_invoice`.
	public var next_payment_attempt: Timestamp?
	/// A unique, identifying string that appears on emails sent to the customer for this invoice. This starts with the customer's unique invoice_prefix if it is specified.
	public var number: String?
	/// String representing the object's type. Objects of the same type share the same value.
	public var object: ObjectValues
	/// Whether payment was successfully collected for this invoice. An invoice can be paid (most commonly) with a charge or with credit from the customer's account balance.
	public var paid: Bool
	/// The PaymentIntent associated with this invoice. The PaymentIntent is generated when the invoice is finalized, and can then be used to pay the invoice. Note that voiding an invoice will cancel the PaymentIntent.
	public var payment_intent: String?
	/// End of the usage period during which invoice items were added to this invoice.
	public var period_end: Timestamp
	/// Start of the usage period during which invoice items were added to this invoice.
	public var period_start: Timestamp
	/// Total amount of all post-payment credit notes issued for this invoice.
	public var post_payment_credit_notes_amount: Int
	/// Total amount of all pre-payment credit notes issued for this invoice.
	public var pre_payment_credit_notes_amount: Int
	/// This is the transaction number that appears on email receipts sent for this invoice.
	public var receipt_number: String?
	/// Starting customer balance before the invoice is finalized. If the invoice has not been finalized yet, this will be the current customer balance.
	public var starting_balance: Int
	/// Extra information about an invoice for the customer's credit card statement.
	public var statement_descriptor: String?
	/// The status of the invoice, one of `draft`, `open`, `paid`, `uncollectible`, or `void`. [Learn more](https://stripe.com/docs/billing/invoices/workflow#workflow-overview)
	public var status: StatusValues?
	public var status_transitions: InvoicesStatusTransitions
	/// The subscription that this invoice was prepared for, if any.
	public var subscription: String?
	/// Only set for upcoming invoices that preview prorations. The time used to calculate prorations.
	public var subscription_proration_date: Int?
	/// Total of all subscriptions, invoice items, and prorations on the invoice before any invoice level discount or tax is applied. Item discounts are already incorporated
	public var subtotal: Int
	/// The amount of tax on this invoice. This is the sum of all the tax amounts on this invoice.
	public var tax: Int?
	public var threshold_reason: InvoiceThresholdReason?
	/// Total after discounts and taxes.
	public var total: Int
	/// The aggregate amounts calculated per discount across all line items.
	public var total_discount_amounts: [DiscountsResourceDiscountAmount]??
	/// The aggregate amounts calculated per tax rate for all line items.
	public var total_tax_amounts: [InvoiceTaxAmount]
	/// The account (if any) the payment will be attributed to for tax reporting, and where funds from the payment will be transferred to for the invoice.
	public var transfer_data: InvoiceTransferData?
	/// Invoices are automatically paid or sent 1 hour after webhooks are delivered, or until all webhook delivery attempts have [been exhausted](https://stripe.com/docs/billing/webhooks#understand). This field tracks the time when webhooks for this invoice were successfully delivered. If the invoice had no webhooks to deliver, this will be set while the invoice is being created.
	public var webhooks_delivered_at: Timestamp?

	/// Invoices are statements of amounts owed by a customer, and are either generated one-off, or generated periodically from a subscription.  They contain [invoice items](https://stripe.com/docs/api#invoiceitems), and proration adjustments that may be caused by subscription upgrades/downgrades (if necessary).  If your invoice is configured to be billed through automatic charges, Stripe automatically finalizes your invoice and attempts payment. Note that finalizing the invoice, [when automatic](https://stripe.com/docs/billing/invoices/workflow/#auto_advance), does not happen immediately as the invoice is created. Stripe waits until one hour after the last webhook was successfully sent (or the last webhook timed out after failing). If you (and the platforms you may have connected to) have no webhooks configured, Stripe waits one hour after creation to finalize the invoice.  If your invoice is configured to be billed by sending an email, then based on your [email settings](https://dashboard.stripe.com/account/billing/automatic'), Stripe will email the invoice to your customer and await payment. These emails can contain a link to a hosted page to pay the invoice.  Stripe applies any customer credit on the account before determining the amount due for the invoice (i.e., the amount that will be actually charged). If the amount due for the invoice is less than Stripe's [minimum allowed charge per currency](/docs/currencies#minimum-and-maximum-charge-amounts), the invoice is automatically marked paid, and we add the amount due to the customer's credit balance which is applied to the next invoice.  More details on the customer's credit balance are [here](https://stripe.com/docs/billing/customer/balance).  Related guide: [Send Invoices to Customers](https://stripe.com/docs/billing/invoices/sending).
	/// - Parameters:
	///   - account_country: The country of the business associated with this invoice, most often the business creating the invoice.
	///   - account_name: The public name of the business associated with this invoice, most often the business creating the invoice.
	///   - account_tax_ids: The account tax IDs associated with the invoice. Only editable when the invoice is a draft.
	///   - amount_due: Final amount due at this time for this invoice. If the invoice's total is smaller than the minimum charge amount, for example, or if there is account credit that can be applied to the invoice, the `amount_due` may be 0. If there is a positive `starting_balance` for the invoice (the customer owes money), the `amount_due` will also take that into account. The charge that gets generated for the invoice will be for the amount specified in `amount_due`.
	///   - amount_paid: The amount, in %s, that was paid.
	///   - amount_remaining: The amount remaining, in %s, that is due.
	///   - application_fee_amount: The fee in %s that will be applied to the invoice and transferred to the application owner's Stripe account when the invoice is paid.
	///   - attempt_count: Number of payment attempts made for this invoice, from the perspective of the payment retry schedule. Any payment attempt counts as the first attempt, and subsequently only automatic retries increment the attempt count. In other words, manual payment attempts after the first attempt do not affect the retry schedule.
	///   - attempted: Whether an attempt has been made to pay the invoice. An invoice is not attempted until 1 hour after the `invoice.created` webhook, for example, so you might not want to display that invoice as unpaid to your users.
	///   - auto_advance: Controls whether Stripe will perform [automatic collection](https://stripe.com/docs/billing/invoices/workflow/#auto_advance) of the invoice. When `false`, the invoice's state will not automatically advance without an explicit action.
	///   - billing_reason: Indicates the reason why the invoice was created. `subscription_cycle` indicates an invoice created by a subscription advancing into a new period. `subscription_create` indicates an invoice created due to creating a subscription. `subscription_update` indicates an invoice created due to updating a subscription. `subscription` is set for all old invoices to indicate either a change to a subscription or a period advancement. `manual` is set for all invoices unrelated to a subscription (for example: created via the invoice editor). The `upcoming` value is reserved for simulated invoices per the upcoming invoice endpoint. `subscription_threshold` indicates an invoice created due to a billing threshold being reached.
	///   - charge: ID of the latest charge generated for this invoice, if any.
	///   - collection_method: Either `charge_automatically`, or `send_invoice`. When charging automatically, Stripe will attempt to pay this invoice using the default source attached to the customer. When sending an invoice, Stripe will email this invoice to the customer with payment instructions.
	///   - created: Time at which the object was created. Measured in seconds since the Unix epoch.
	///   - currency: Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
	///   - custom_fields: Custom fields displayed on the invoice.
	///   - customer: The ID of the customer who will be billed.
	///   - customer_address: The customer's address. Until the invoice is finalized, this field will equal `customer.address`. Once the invoice is finalized, this field will no longer be updated.
	///   - customer_email: The customer's email. Until the invoice is finalized, this field will equal `customer.email`. Once the invoice is finalized, this field will no longer be updated.
	///   - customer_name: The customer's name. Until the invoice is finalized, this field will equal `customer.name`. Once the invoice is finalized, this field will no longer be updated.
	///   - customer_phone: The customer's phone number. Until the invoice is finalized, this field will equal `customer.phone`. Once the invoice is finalized, this field will no longer be updated.
	///   - customer_shipping: The customer's shipping information. Until the invoice is finalized, this field will equal `customer.shipping`. Once the invoice is finalized, this field will no longer be updated.
	///   - customer_tax_exempt: The customer's tax exempt status. Until the invoice is finalized, this field will equal `customer.tax_exempt`. Once the invoice is finalized, this field will no longer be updated.
	///   - customer_tax_ids: The customer's tax IDs. Until the invoice is finalized, this field will contain the same tax IDs as `customer.tax_ids`. Once the invoice is finalized, this field will no longer be updated.
	///   - default_payment_method: ID of the default payment method for the invoice. It must belong to the customer associated with the invoice. If not set, defaults to the subscription's default payment method, if any, or to the default payment method in the customer's invoice settings.
	///   - default_source: ID of the default payment source for the invoice. It must belong to the customer associated with the invoice and be in a chargeable state. If not set, defaults to the subscription's default source, if any, or to the customer's default source.
	///   - default_tax_rates: The tax rates applied to this invoice, if any.
	///   - description: An arbitrary string attached to the object. Often useful for displaying to users. Referenced as 'memo' in the Dashboard.
	///   - discount: Describes the current discount applied to this invoice, if there is one. Not populated if there are multiple discounts.
	///   - discounts: The discounts applied to the invoice. Line item discounts are applied before invoice discounts. Use `expand[]=discounts` to expand each discount.
	///   - due_date: The date on which payment for this invoice is due. This value will be `null` for invoices where `collection_method=charge_automatically`.
	///   - ending_balance: Ending customer balance after the invoice is finalized. Invoices are finalized approximately an hour after successful webhook delivery or when payment collection is attempted for the invoice. If the invoice has not been finalized yet, this will be null.
	///   - footer: Footer displayed on the invoice.
	///   - hosted_invoice_url: The URL for the hosted invoice page, which allows customers to view and pay an invoice. If the invoice has not been finalized yet, this will be null.
	///   - id: Unique identifier for the object.
	///   - invoice_pdf: The link to download the PDF for the invoice. If the invoice has not been finalized yet, this will be null.
	///   - last_finalization_error: The error encountered during the previous attempt to finalize the invoice. This field is cleared when the invoice is successfully finalized.
	///   - lines: The individual line items that make up the invoice. `lines` is sorted as follows: invoice items in reverse chronological order, followed by the subscription, if any.
	///   - livemode: Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
	///   - metadata: Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
	///   - next_payment_attempt: The time at which payment will next be attempted. This value will be `null` for invoices where `collection_method=send_invoice`.
	///   - number: A unique, identifying string that appears on emails sent to the customer for this invoice. This starts with the customer's unique invoice_prefix if it is specified.
	///   - object: String representing the object's type. Objects of the same type share the same value.
	///   - paid: Whether payment was successfully collected for this invoice. An invoice can be paid (most commonly) with a charge or with credit from the customer's account balance.
	///   - payment_intent: The PaymentIntent associated with this invoice. The PaymentIntent is generated when the invoice is finalized, and can then be used to pay the invoice. Note that voiding an invoice will cancel the PaymentIntent.
	///   - period_end: End of the usage period during which invoice items were added to this invoice.
	///   - period_start: Start of the usage period during which invoice items were added to this invoice.
	///   - post_payment_credit_notes_amount: Total amount of all post-payment credit notes issued for this invoice.
	///   - pre_payment_credit_notes_amount: Total amount of all pre-payment credit notes issued for this invoice.
	///   - receipt_number: This is the transaction number that appears on email receipts sent for this invoice.
	///   - starting_balance: Starting customer balance before the invoice is finalized. If the invoice has not been finalized yet, this will be the current customer balance.
	///   - statement_descriptor: Extra information about an invoice for the customer's credit card statement.
	///   - status: The status of the invoice, one of `draft`, `open`, `paid`, `uncollectible`, or `void`. [Learn more](https://stripe.com/docs/billing/invoices/workflow#workflow-overview)
	///   - status_transitions: 
	///   - subscription: The subscription that this invoice was prepared for, if any.
	///   - subscription_proration_date: Only set for upcoming invoices that preview prorations. The time used to calculate prorations.
	///   - subtotal: Total of all subscriptions, invoice items, and prorations on the invoice before any invoice level discount or tax is applied. Item discounts are already incorporated
	///   - tax: The amount of tax on this invoice. This is the sum of all the tax amounts on this invoice.
	///   - total: Total after discounts and taxes.
	///   - total_discount_amounts: The aggregate amounts calculated per discount across all line items.
	///   - total_tax_amounts: The aggregate amounts calculated per tax rate for all line items.
	///   - transfer_data: The account (if any) the payment will be attributed to for tax reporting, and where funds from the payment will be transferred to for the invoice.
	///   - webhooks_delivered_at: Invoices are automatically paid or sent 1 hour after webhooks are delivered, or until all webhook delivery attempts have [been exhausted](https://stripe.com/docs/billing/webhooks#understand). This field tracks the time when webhooks for this invoice were successfully delivered. If the invoice had no webhooks to deliver, this will be set while the invoice is being created.
	public init(amount_due: Int, amount_paid: Int, amount_remaining: Int, attempt_count: Int, attempted: Bool, created: Timestamp, currency: String, customer: String, default_tax_rates: [TaxRate], lines: InvoiceLinesList, livemode: Bool, object: ObjectValues, paid: Bool, period_end: Timestamp, period_start: Timestamp, post_payment_credit_notes_amount: Int, pre_payment_credit_notes_amount: Int, starting_balance: Int, status_transitions: InvoicesStatusTransitions, subtotal: Int, total: Int, total_tax_amounts: [InvoiceTaxAmount], account_country: String? = nil, account_name: String? = nil, account_tax_ids: [String]?? = nil, application_fee_amount: Int? = nil, auto_advance: Bool? = nil, billing_reason: BillingReasonValues? = nil, charge: String? = nil, collection_method: CollectionMethodValues? = nil, custom_fields: [InvoiceSettingCustomField]?? = nil, customer_address: Address? = nil, customer_email: String? = nil, customer_name: String? = nil, customer_phone: String? = nil, customer_shipping: Shipping? = nil, customer_tax_exempt: CustomerTaxExemptValues? = nil, customer_tax_ids: [InvoicesResourceInvoiceTaxId]?? = nil, default_payment_method: String? = nil, default_source: String? = nil, description: String? = nil, discount: Discount? = nil, discounts: [String]?? = nil, due_date: Timestamp? = nil, ending_balance: Int? = nil, footer: String? = nil, hosted_invoice_url: String? = nil, id: String? = nil, invoice_pdf: String? = nil, last_finalization_error: ApiErrors? = nil, metadata: String? = nil, next_payment_attempt: Timestamp? = nil, number: String? = nil, payment_intent: String? = nil, receipt_number: String? = nil, statement_descriptor: String? = nil, status: StatusValues? = nil, subscription: String? = nil, subscription_proration_date: Int? = nil, tax: Int? = nil, threshold_reason: InvoiceThresholdReason? = nil, total_discount_amounts: [DiscountsResourceDiscountAmount]?? = nil, transfer_data: InvoiceTransferData? = nil, webhooks_delivered_at: Timestamp? = nil) {
		self.amount_due = amount_due
		self.amount_paid = amount_paid
		self.amount_remaining = amount_remaining
		self.attempt_count = attempt_count
		self.attempted = attempted
		self.created = created
		self.currency = currency
		self.customer = customer
		self.default_tax_rates = default_tax_rates
		self.lines = lines
		self.livemode = livemode
		self.object = object
		self.paid = paid
		self.period_end = period_end
		self.period_start = period_start
		self.post_payment_credit_notes_amount = post_payment_credit_notes_amount
		self.pre_payment_credit_notes_amount = pre_payment_credit_notes_amount
		self.starting_balance = starting_balance
		self.status_transitions = status_transitions
		self.subtotal = subtotal
		self.total = total
		self.total_tax_amounts = total_tax_amounts
		self.account_country = account_country
		self.account_name = account_name
		self.account_tax_ids = account_tax_ids
		self.application_fee_amount = application_fee_amount
		self.auto_advance = auto_advance
		self.billing_reason = billing_reason
		self.charge = charge
		self.collection_method = collection_method
		self.custom_fields = custom_fields
		self.customer_address = customer_address
		self.customer_email = customer_email
		self.customer_name = customer_name
		self.customer_phone = customer_phone
		self.customer_shipping = customer_shipping
		self.customer_tax_exempt = customer_tax_exempt
		self.customer_tax_ids = customer_tax_ids
		self.default_payment_method = default_payment_method
		self.default_source = default_source
		self.description = description
		self.discount = discount
		self.discounts = discounts
		self.due_date = due_date
		self.ending_balance = ending_balance
		self.footer = footer
		self.hosted_invoice_url = hosted_invoice_url
		self.id = id
		self.invoice_pdf = invoice_pdf
		self.last_finalization_error = last_finalization_error
		self.metadata = metadata
		self.next_payment_attempt = next_payment_attempt
		self.number = number
		self.payment_intent = payment_intent
		self.receipt_number = receipt_number
		self.statement_descriptor = statement_descriptor
		self.status = status
		self.subscription = subscription
		self.subscription_proration_date = subscription_proration_date
		self.tax = tax
		self.threshold_reason = threshold_reason
		self.total_discount_amounts = total_discount_amounts
		self.transfer_data = transfer_data
		self.webhooks_delivered_at = webhooks_delivered_at
	}


	/// The individual line items that make up the invoice. `lines` is sorted as follows: invoice items in reverse chronological order, followed by the subscription, if any.
	public class InvoiceLinesList: Codable {
		/// Details about each object.
		public var data: [LineItem]
		/// True if this list has another page of items after this one that can be fetched.
		public var has_more: Bool
		/// String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
		public var object: ObjectValues
		/// The URL where this list can be accessed.
		public var url: String

		/// The individual line items that make up the invoice. `lines` is sorted as follows: invoice items in reverse chronological order, followed by the subscription, if any.
		/// - Parameters:
		///   - data: Details about each object.
		///   - has_more: True if this list has another page of items after this one that can be fetched.
		///   - object: String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
		///   - url: The URL where this list can be accessed.
		public init(data: [LineItem], has_more: Bool, object: ObjectValues, url: String) {
			self.data = data
			self.has_more = has_more
			self.object = object
			self.url = url
		}

		public enum ObjectValues: String, Codable {
			case list = "list"
		}
	}


	public enum CollectionMethodValues: String, Codable {
		case chargeAutomatically = "charge_automatically"
		case sendInvoice = "send_invoice"
	}

	public enum ObjectValues: String, Codable {
		case invoice = "invoice"
	}

	public enum StatusValues: String, Codable {
		case deleted = "deleted"
		case draft = "draft"
		case open = "open"
		case paid = "paid"
		case uncollectible = "uncollectible"
		case void = "void"
	}

	public enum BillingReasonValues: String, Codable {
		case automaticPendingInvoiceItemInvoice = "automatic_pending_invoice_item_invoice"
		case manual = "manual"
		case subscription = "subscription"
		case subscriptionCreate = "subscription_create"
		case subscriptionCycle = "subscription_cycle"
		case subscriptionThreshold = "subscription_threshold"
		case subscriptionUpdate = "subscription_update"
		case upcoming = "upcoming"
	}

	public enum CustomerTaxExemptValues: String, Codable {
		case exempt = "exempt"
		case none = "none"
		case reverse = "reverse"
	}
}

public class InvoiceItemThresholdReason: Codable {
	/// The IDs of the line items that triggered the threshold invoice.
	public var line_item_ids: [String]
	/// The quantity threshold boundary that applied to the given line item.
	public var usage_gte: Int

	public init(line_item_ids: [String], usage_gte: Int) {
		self.line_item_ids = line_item_ids
		self.usage_gte = usage_gte
	}
}

public class InvoiceLineItemPeriod: Codable {
	/// End of the line item's billing period
	public var end: Timestamp
	/// Start of the line item's billing period
	public var start: Timestamp

	public init(end: Timestamp, start: Timestamp) {
		self.end = end
		self.start = start
	}
}

public class InvoiceSettingCustomField: Codable {
	/// The name of the custom field.
	public var name: String
	/// The value of the custom field.
	public var value: String

	public init(name: String, value: String) {
		self.name = name
		self.value = value
	}
}

public class InvoiceSettingCustomerSetting: Codable {
	/// Default custom fields to be displayed on invoices for this customer.
	public var custom_fields: [InvoiceSettingCustomField]??
	/// ID of a payment method that's attached to the customer, to be used as the customer's default payment method for subscriptions and invoices.
	public var default_payment_method: String?
	/// Default footer to be displayed on invoices for this customer.
	public var footer: String?

	public init(custom_fields: [InvoiceSettingCustomField]?? = nil, default_payment_method: String? = nil, footer: String? = nil) {
		self.custom_fields = custom_fields
		self.default_payment_method = default_payment_method
		self.footer = footer
	}
}

public class InvoiceSettingSubscriptionScheduleSetting: Codable {
	/// Number of days within which a customer must pay invoices generated by this subscription schedule. This value will be `null` for subscription schedules where `billing=charge_automatically`.
	public var days_until_due: Int?

	public init(days_until_due: Int? = nil) {
		self.days_until_due = days_until_due
	}
}

public class InvoiceTaxAmount: Codable {
	/// The amount, in %s, of the tax.
	public var amount: Int
	/// Whether this tax amount is inclusive or exclusive.
	public var inclusive: Bool
	/// The tax rate that was applied to get this tax amount.
	public var tax_rate: String

	public init(amount: Int, inclusive: Bool, tax_rate: String) {
		self.amount = amount
		self.inclusive = inclusive
		self.tax_rate = tax_rate
	}
}

public class InvoiceThresholdReason: Codable {
	/// The total invoice amount threshold boundary if it triggered the threshold invoice.
	public var amount_gte: Int?
	/// Indicates which line items triggered a threshold invoice.
	public var item_reasons: [InvoiceItemThresholdReason]

	public init(item_reasons: [InvoiceItemThresholdReason], amount_gte: Int? = nil) {
		self.item_reasons = item_reasons
		self.amount_gte = amount_gte
	}
}

public class InvoiceTransferData: Codable {
	/// The amount in %s that will be transferred to the destination account when the invoice is paid. By default, the entire amount is transferred to the destination.
	public var amount: Int?
	/// The account where funds from the payment will be transferred to upon payment success.
	public var destination: String

	public init(destination: String, amount: Int? = nil) {
		self.destination = destination
		self.amount = amount
	}
}

/// Sometimes you want to add a charge or credit to a customer, but actually charge or credit the customer's card only at the end of a regular billing cycle. This is useful for combining several charges (to minimize per-transaction fees), or for having Stripe tabulate your usage-based billing totals.  Related guide: [Subscription Invoices](https://stripe.com/docs/billing/invoices/subscription#adding-upcoming-invoice-items).
public class Invoiceitem: Codable {
	/// Amount (in the `currency` specified) of the invoice item. This should always be equal to `unit_amount * quantity`.
	public var amount: Int
	/// Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
	public var currency: String
	/// The ID of the customer who will be billed when this invoice item is billed.
	public var customer: String
	/// Time at which the object was created. Measured in seconds since the Unix epoch.
	public var date: Timestamp
	/// An arbitrary string attached to the object. Often useful for displaying to users.
	public var description: String?
	/// If true, discounts will apply to this invoice item. Always false for prorations.
	public var discountable: Bool
	/// The discounts which apply to the invoice item. Item discounts are applied before invoice discounts. Use `expand[]=discounts` to expand each discount.
	public var discounts: [String]??
	/// Unique identifier for the object.
	public var id: String
	/// The ID of the invoice this invoice item belongs to.
	public var invoice: String?
	/// Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
	public var livemode: Bool
	/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
	public var metadata: String?
	/// String representing the object's type. Objects of the same type share the same value.
	public var object: ObjectValues
	public var period: InvoiceLineItemPeriod
	/// The price of the invoice item.
	public var price: Price?
	/// Whether the invoice item was created automatically as a proration adjustment when the customer switched plans.
	public var proration: Bool
	/// Quantity of units for the invoice item. If the invoice item is a proration, the quantity of the subscription that the proration was computed for.
	public var quantity: Int
	/// The subscription that this invoice item has been created for, if any.
	public var subscription: String?
	/// The subscription item that this invoice item has been created for, if any.
	public var subscription_item: String?
	/// The tax rates which apply to the invoice item. When set, the `default_tax_rates` on the invoice do not apply to this invoice item.
	public var tax_rates: [TaxRate]??
	/// Unit amount (in the `currency` specified) of the invoice item.
	public var unit_amount: Int?
	/// Same as `unit_amount`, but contains a decimal value with at most 12 decimal places.
	public var unit_amount_decimal: StringNumber?

	/// Sometimes you want to add a charge or credit to a customer, but actually charge or credit the customer's card only at the end of a regular billing cycle. This is useful for combining several charges (to minimize per-transaction fees), or for having Stripe tabulate your usage-based billing totals.  Related guide: [Subscription Invoices](https://stripe.com/docs/billing/invoices/subscription#adding-upcoming-invoice-items).
	/// - Parameters:
	///   - amount: Amount (in the `currency` specified) of the invoice item. This should always be equal to `unit_amount * quantity`.
	///   - currency: Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
	///   - customer: The ID of the customer who will be billed when this invoice item is billed.
	///   - date: Time at which the object was created. Measured in seconds since the Unix epoch.
	///   - description: An arbitrary string attached to the object. Often useful for displaying to users.
	///   - discountable: If true, discounts will apply to this invoice item. Always false for prorations.
	///   - discounts: The discounts which apply to the invoice item. Item discounts are applied before invoice discounts. Use `expand[]=discounts` to expand each discount.
	///   - id: Unique identifier for the object.
	///   - invoice: The ID of the invoice this invoice item belongs to.
	///   - livemode: Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
	///   - metadata: Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
	///   - object: String representing the object's type. Objects of the same type share the same value.
	///   - period: 
	///   - price: The price of the invoice item.
	///   - proration: Whether the invoice item was created automatically as a proration adjustment when the customer switched plans.
	///   - quantity: Quantity of units for the invoice item. If the invoice item is a proration, the quantity of the subscription that the proration was computed for.
	///   - subscription: The subscription that this invoice item has been created for, if any.
	///   - subscription_item: The subscription item that this invoice item has been created for, if any.
	///   - tax_rates: The tax rates which apply to the invoice item. When set, the `default_tax_rates` on the invoice do not apply to this invoice item.
	///   - unit_amount: Unit amount (in the `currency` specified) of the invoice item.
	///   - unit_amount_decimal: Same as `unit_amount`, but contains a decimal value with at most 12 decimal places.
	public init(amount: Int, currency: String, customer: String, date: Timestamp, discountable: Bool, id: String, livemode: Bool, object: ObjectValues, period: InvoiceLineItemPeriod, proration: Bool, quantity: Int, description: String? = nil, discounts: [String]?? = nil, invoice: String? = nil, metadata: String? = nil, price: Price? = nil, subscription: String? = nil, subscription_item: String? = nil, tax_rates: [TaxRate]?? = nil, unit_amount: Int? = nil, unit_amount_decimal: StringNumber? = nil) {
		self.amount = amount
		self.currency = currency
		self.customer = customer
		self.date = date
		self.discountable = discountable
		self.id = id
		self.livemode = livemode
		self.object = object
		self.period = period
		self.proration = proration
		self.quantity = quantity
		self.description = description
		self.discounts = discounts
		self.invoice = invoice
		self.metadata = metadata
		self.price = price
		self.subscription = subscription
		self.subscription_item = subscription_item
		self.tax_rates = tax_rates
		self.unit_amount = unit_amount
		self.unit_amount_decimal = unit_amount_decimal
	}

	public enum ObjectValues: String, Codable {
		case invoiceitem = "invoiceitem"
	}
}

public class InvoicesResourceInvoiceTaxId: Codable {
	/// The type of the tax ID, one of `eu_vat`, `br_cnpj`, `br_cpf`, `nz_gst`, `au_abn`, `in_gst`, `no_vat`, `za_vat`, `ch_vat`, `mx_rfc`, `sg_uen`, `ru_inn`, `ru_kpp`, `ca_bn`, `hk_br`, `es_cif`, `tw_vat`, `th_vat`, `jp_cn`, `jp_rn`, `li_uid`, `my_itn`, `us_ein`, `kr_brn`, `ca_qst`, `my_sst`, `sg_gst`, `ae_trn`, `cl_tin`, `sa_vat`, `id_npwp`, `my_frp`, or `unknown`
	public var type: TypeValues
	/// The value of the tax ID.
	public var value: String?

	public init(type: TypeValues, value: String? = nil) {
		self.type = type
		self.value = value
	}

	public enum TypeValues: String, Codable {
		case aeTrn = "ae_trn"
		case auAbn = "au_abn"
		case brCnpj = "br_cnpj"
		case brCpf = "br_cpf"
		case caBn = "ca_bn"
		case caQst = "ca_qst"
		case chVat = "ch_vat"
		case clTin = "cl_tin"
		case esCif = "es_cif"
		case euVat = "eu_vat"
		case hkBr = "hk_br"
		case idNpwp = "id_npwp"
		case inGst = "in_gst"
		case jpCn = "jp_cn"
		case jpRn = "jp_rn"
		case krBrn = "kr_brn"
		case liUid = "li_uid"
		case mxRfc = "mx_rfc"
		case myFrp = "my_frp"
		case myItn = "my_itn"
		case mySst = "my_sst"
		case noVat = "no_vat"
		case nzGst = "nz_gst"
		case ruInn = "ru_inn"
		case ruKpp = "ru_kpp"
		case saVat = "sa_vat"
		case sgGst = "sg_gst"
		case sgUen = "sg_uen"
		case thVat = "th_vat"
		case twVat = "tw_vat"
		case unknown = "unknown"
		case usEin = "us_ein"
		case zaVat = "za_vat"
	}
}

public class InvoicesStatusTransitions: Codable {
	/// The time that the invoice draft was finalized.
	public var finalized_at: Timestamp?
	/// The time that the invoice was marked uncollectible.
	public var marked_uncollectible_at: Timestamp?
	/// The time that the invoice was paid.
	public var paid_at: Timestamp?
	/// The time that the invoice was voided.
	public var voided_at: Timestamp?

	public init(finalized_at: Timestamp? = nil, marked_uncollectible_at: Timestamp? = nil, paid_at: Timestamp? = nil, voided_at: Timestamp? = nil) {
		self.finalized_at = finalized_at
		self.marked_uncollectible_at = marked_uncollectible_at
		self.paid_at = paid_at
		self.voided_at = voided_at
	}
}

/// This resource has been renamed to [Early Fraud Warning](#early_fraud_warning_object) and will be removed in a future API version.
public class IssuerFraudRecord: Codable {
	/// An IFR is actionable if it has not received a dispute and has not been fully refunded. You may wish to proactively refund a charge that receives an IFR, in order to avoid receiving a dispute later.
	public var actionable: Bool
	/// ID of the charge this issuer fraud record is for, optionally expanded.
	public var charge: String
	/// Time at which the object was created. Measured in seconds since the Unix epoch.
	public var created: Timestamp
	/// The type of fraud labelled by the issuer. One of `card_never_received`, `fraudulent_card_application`, `made_with_counterfeit_card`, `made_with_lost_card`, `made_with_stolen_card`, `misc`, `unauthorized_use_of_card`.
	public var fraud_type: String
	/// If true, the associated charge is subject to [liability shift](https://stripe.com/docs/payments/3d-secure#disputed-payments).
	public var has_liability_shift: Bool
	/// Unique identifier for the object.
	public var id: String
	/// Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
	public var livemode: Bool
	/// String representing the object's type. Objects of the same type share the same value.
	public var object: ObjectValues
	/// The timestamp at which the card issuer posted the issuer fraud record.
	public var post_date: Int

	/// This resource has been renamed to [Early Fraud Warning](#early_fraud_warning_object) and will be removed in a future API version.
	/// - Parameters:
	///   - actionable: An IFR is actionable if it has not received a dispute and has not been fully refunded. You may wish to proactively refund a charge that receives an IFR, in order to avoid receiving a dispute later.
	///   - charge: ID of the charge this issuer fraud record is for, optionally expanded.
	///   - created: Time at which the object was created. Measured in seconds since the Unix epoch.
	///   - fraud_type: The type of fraud labelled by the issuer. One of `card_never_received`, `fraudulent_card_application`, `made_with_counterfeit_card`, `made_with_lost_card`, `made_with_stolen_card`, `misc`, `unauthorized_use_of_card`.
	///   - has_liability_shift: If true, the associated charge is subject to [liability shift](https://stripe.com/docs/payments/3d-secure#disputed-payments).
	///   - id: Unique identifier for the object.
	///   - livemode: Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
	///   - object: String representing the object's type. Objects of the same type share the same value.
	///   - post_date: The timestamp at which the card issuer posted the issuer fraud record.
	public init(actionable: Bool, charge: String, created: Timestamp, fraud_type: String, has_liability_shift: Bool, id: String, livemode: Bool, object: ObjectValues, post_date: Int) {
		self.actionable = actionable
		self.charge = charge
		self.created = created
		self.fraud_type = fraud_type
		self.has_liability_shift = has_liability_shift
		self.id = id
		self.livemode = livemode
		self.object = object
		self.post_date = post_date
	}

	public enum ObjectValues: String, Codable {
		case issuerFraudRecord = "issuer_fraud_record"
	}
}

/// When an [issued card](https://stripe.com/docs/issuing) is used to make a purchase, an Issuing `Authorization` object is created. [Authorizations](https://stripe.com/docs/issuing/purchases/authorizations) must be approved for the purchase to be completed successfully.  Related guide: [Issued Card Authorizations](https://stripe.com/docs/issuing/purchases/authorizations).
public class IssuingAuthorization: Codable {
	/// The total amount that was authorized or rejected. This amount is in the card's currency and in the [smallest currency unit](https://stripe.com/docs/currencies#zero-decimal).
	public var amount: Int
	/// Detailed breakdown of amount components. These amounts are denominated in `currency` and in the [smallest currency unit](https://stripe.com/docs/currencies#zero-decimal).
	public var amount_details: IssuingAuthorizationAmountDetails?
	/// Whether the authorization has been approved.
	public var approved: Bool
	/// How the card details were provided.
	public var authorization_method: AuthorizationMethodValues
	/// List of balance transactions associated with this authorization.
	public var balance_transactions: [BalanceTransaction]
	public var card: IssuingCard
	/// The cardholder to whom this authorization belongs.
	public var cardholder: String?
	/// Time at which the object was created. Measured in seconds since the Unix epoch.
	public var created: Timestamp
	/// Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
	public var currency: String
	/// Unique identifier for the object.
	public var id: String
	/// Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
	public var livemode: Bool
	/// The total amount that was authorized or rejected. This amount is in the `merchant_currency` and in the [smallest currency unit](https://stripe.com/docs/currencies#zero-decimal).
	public var merchant_amount: Int
	/// The currency that was presented to the cardholder for the authorization. Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
	public var merchant_currency: String
	public var merchant_data: IssuingAuthorizationMerchantData
	/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
	public var metadata: String
	/// String representing the object's type. Objects of the same type share the same value.
	public var object: ObjectValues
	/// The pending authorization request. This field will only be non-null during an `issuing_authorization.request` webhook.
	public var pending_request: IssuingAuthorizationPendingRequest?
	/// History of every time the authorization was approved/denied (whether approved/denied by you directly or by Stripe based on your `spending_controls`). If the merchant changes the authorization by performing an [incremental authorization or partial capture](https://stripe.com/docs/issuing/purchases/authorizations), you can look at this field to see the previous states of the authorization.
	public var request_history: [IssuingAuthorizationRequest]
	/// The current status of the authorization in its lifecycle.
	public var status: StatusValues
	/// List of [transactions](https://stripe.com/docs/api/issuing/transactions) associated with this authorization.
	public var transactions: [IssuingTransaction]
	public var verification_data: IssuingAuthorizationVerificationData
	/// What, if any, digital wallet was used for this authorization. One of `apple_pay`, `google_pay`, or `samsung_pay`.
	public var wallet: String?

	/// When an [issued card](https://stripe.com/docs/issuing) is used to make a purchase, an Issuing `Authorization` object is created. [Authorizations](https://stripe.com/docs/issuing/purchases/authorizations) must be approved for the purchase to be completed successfully.  Related guide: [Issued Card Authorizations](https://stripe.com/docs/issuing/purchases/authorizations).
	/// - Parameters:
	///   - amount: The total amount that was authorized or rejected. This amount is in the card's currency and in the [smallest currency unit](https://stripe.com/docs/currencies#zero-decimal).
	///   - amount_details: Detailed breakdown of amount components. These amounts are denominated in `currency` and in the [smallest currency unit](https://stripe.com/docs/currencies#zero-decimal).
	///   - approved: Whether the authorization has been approved.
	///   - authorization_method: How the card details were provided.
	///   - balance_transactions: List of balance transactions associated with this authorization.
	///   - card: 
	///   - cardholder: The cardholder to whom this authorization belongs.
	///   - created: Time at which the object was created. Measured in seconds since the Unix epoch.
	///   - currency: Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
	///   - id: Unique identifier for the object.
	///   - livemode: Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
	///   - merchant_amount: The total amount that was authorized or rejected. This amount is in the `merchant_currency` and in the [smallest currency unit](https://stripe.com/docs/currencies#zero-decimal).
	///   - merchant_currency: The currency that was presented to the cardholder for the authorization. Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
	///   - merchant_data: 
	///   - metadata: Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
	///   - object: String representing the object's type. Objects of the same type share the same value.
	///   - pending_request: The pending authorization request. This field will only be non-null during an `issuing_authorization.request` webhook.
	///   - request_history: History of every time the authorization was approved/denied (whether approved/denied by you directly or by Stripe based on your `spending_controls`). If the merchant changes the authorization by performing an [incremental authorization or partial capture](https://stripe.com/docs/issuing/purchases/authorizations), you can look at this field to see the previous states of the authorization.
	///   - status: The current status of the authorization in its lifecycle.
	///   - transactions: List of [transactions](https://stripe.com/docs/api/issuing/transactions) associated with this authorization.
	///   - verification_data: 
	///   - wallet: What, if any, digital wallet was used for this authorization. One of `apple_pay`, `google_pay`, or `samsung_pay`.
	public init(amount: Int, approved: Bool, authorization_method: AuthorizationMethodValues, balance_transactions: [BalanceTransaction], card: IssuingCard, created: Timestamp, currency: String, id: String, livemode: Bool, merchant_amount: Int, merchant_currency: String, merchant_data: IssuingAuthorizationMerchantData, metadata: String, object: ObjectValues, request_history: [IssuingAuthorizationRequest], status: StatusValues, transactions: [IssuingTransaction], verification_data: IssuingAuthorizationVerificationData, amount_details: IssuingAuthorizationAmountDetails? = nil, cardholder: String? = nil, pending_request: IssuingAuthorizationPendingRequest? = nil, wallet: String? = nil) {
		self.amount = amount
		self.approved = approved
		self.authorization_method = authorization_method
		self.balance_transactions = balance_transactions
		self.card = card
		self.created = created
		self.currency = currency
		self.id = id
		self.livemode = livemode
		self.merchant_amount = merchant_amount
		self.merchant_currency = merchant_currency
		self.merchant_data = merchant_data
		self.metadata = metadata
		self.object = object
		self.request_history = request_history
		self.status = status
		self.transactions = transactions
		self.verification_data = verification_data
		self.amount_details = amount_details
		self.cardholder = cardholder
		self.pending_request = pending_request
		self.wallet = wallet
	}

	public enum StatusValues: String, Codable {
		case closed = "closed"
		case pending = "pending"
		case reversed = "reversed"
	}

	public enum AuthorizationMethodValues: String, Codable {
		case chip = "chip"
		case contactless = "contactless"
		case keyedIn = "keyed_in"
		case online = "online"
		case swipe = "swipe"
	}

	public enum ObjectValues: String, Codable {
		case issuingAuthorization = "issuing.authorization"
	}
}

/// You can [create physical or virtual cards](https://stripe.com/docs/issuing/cards) that are issued to cardholders.
public class IssuingCard: Codable {
	/// The brand of the card.
	public var brand: String
	/// The reason why the card was canceled.
	public var cancellation_reason: CancellationReasonValues?
	public var cardholder: IssuingCardholder
	/// Time at which the object was created. Measured in seconds since the Unix epoch.
	public var created: Timestamp
	/// Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
	public var currency: String
	/// The card's CVC. For security reasons, this is only available for virtual cards, and will be omitted unless you explicitly request it with [the `expand` parameter](https://stripe.com/docs/api/expanding_objects). Additionally, it's only available via the ["Retrieve a card" endpoint](https://stripe.com/docs/api/issuing/cards/retrieve), not via "List all cards" or any other endpoint.
	public var cvc: String?
	/// The expiration month of the card.
	public var exp_month: Int
	/// The expiration year of the card.
	public var exp_year: Int
	/// Unique identifier for the object.
	public var id: String
	/// The last 4 digits of the card number.
	public var last4: String
	/// Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
	public var livemode: Bool
	/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
	public var metadata: String
	/// The full unredacted card number. For security reasons, this is only available for virtual cards, and will be omitted unless you explicitly request it with [the `expand` parameter](https://stripe.com/docs/api/expanding_objects). Additionally, it's only available via the ["Retrieve a card" endpoint](https://stripe.com/docs/api/issuing/cards/retrieve), not via "List all cards" or any other endpoint.
	public var number: String?
	/// String representing the object's type. Objects of the same type share the same value.
	public var object: ObjectValues
	/// The latest card that replaces this card, if any.
	public var replaced_by: String?
	/// The card this card replaces, if any.
	public var replacement_for: String?
	/// The reason why the previous card needed to be replaced.
	public var replacement_reason: ReplacementReasonValues?
	/// Where and how the card will be shipped.
	public var shipping: IssuingCardShipping?
	public var spending_controls: IssuingCardAuthorizationControls
	/// Whether authorizations can be approved on this card.
	public var status: StatusValues
	/// The type of the card.
	public var type: TypeValues

	/// You can [create physical or virtual cards](https://stripe.com/docs/issuing/cards) that are issued to cardholders.
	/// - Parameters:
	///   - brand: The brand of the card.
	///   - cancellation_reason: The reason why the card was canceled.
	///   - cardholder: 
	///   - created: Time at which the object was created. Measured in seconds since the Unix epoch.
	///   - currency: Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
	///   - cvc: The card's CVC. For security reasons, this is only available for virtual cards, and will be omitted unless you explicitly request it with [the `expand` parameter](https://stripe.com/docs/api/expanding_objects). Additionally, it's only available via the ["Retrieve a card" endpoint](https://stripe.com/docs/api/issuing/cards/retrieve), not via "List all cards" or any other endpoint.
	///   - exp_month: The expiration month of the card.
	///   - exp_year: The expiration year of the card.
	///   - id: Unique identifier for the object.
	///   - last4: The last 4 digits of the card number.
	///   - livemode: Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
	///   - metadata: Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
	///   - number: The full unredacted card number. For security reasons, this is only available for virtual cards, and will be omitted unless you explicitly request it with [the `expand` parameter](https://stripe.com/docs/api/expanding_objects). Additionally, it's only available via the ["Retrieve a card" endpoint](https://stripe.com/docs/api/issuing/cards/retrieve), not via "List all cards" or any other endpoint.
	///   - object: String representing the object's type. Objects of the same type share the same value.
	///   - replaced_by: The latest card that replaces this card, if any.
	///   - replacement_for: The card this card replaces, if any.
	///   - replacement_reason: The reason why the previous card needed to be replaced.
	///   - shipping: Where and how the card will be shipped.
	///   - spending_controls: 
	///   - status: Whether authorizations can be approved on this card.
	///   - type: The type of the card.
	public init(brand: String, cardholder: IssuingCardholder, created: Timestamp, currency: String, exp_month: Int, exp_year: Int, id: String, last4: String, livemode: Bool, metadata: String, object: ObjectValues, spending_controls: IssuingCardAuthorizationControls, status: StatusValues, type: TypeValues, cancellation_reason: CancellationReasonValues? = nil, cvc: String? = nil, number: String? = nil, replaced_by: String? = nil, replacement_for: String? = nil, replacement_reason: ReplacementReasonValues? = nil, shipping: IssuingCardShipping? = nil) {
		self.brand = brand
		self.cardholder = cardholder
		self.created = created
		self.currency = currency
		self.exp_month = exp_month
		self.exp_year = exp_year
		self.id = id
		self.last4 = last4
		self.livemode = livemode
		self.metadata = metadata
		self.object = object
		self.spending_controls = spending_controls
		self.status = status
		self.type = type
		self.cancellation_reason = cancellation_reason
		self.cvc = cvc
		self.number = number
		self.replaced_by = replaced_by
		self.replacement_for = replacement_for
		self.replacement_reason = replacement_reason
		self.shipping = shipping
	}

	public enum ReplacementReasonValues: String, Codable {
		case damaged = "damaged"
		case expired = "expired"
		case lost = "lost"
		case stolen = "stolen"
	}

	public enum ObjectValues: String, Codable {
		case issuingCard = "issuing.card"
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

	public enum TypeValues: String, Codable {
		case physical = "physical"
		case virtual = "virtual"
	}
}

/// An Issuing `Cardholder` object represents an individual or business entity who is [issued](https://stripe.com/docs/issuing) cards.  Related guide: [How to create a Cardholder](https://stripe.com/docs/issuing/cards#create-cardholder)
public class IssuingCardholder: Codable {
	public var billing: IssuingCardholderAddress
	/// Additional information about a `company` cardholder.
	public var company: IssuingCardholderCompany?
	/// Time at which the object was created. Measured in seconds since the Unix epoch.
	public var created: Timestamp
	/// The cardholder's email address.
	public var email: String?
	/// Unique identifier for the object.
	public var id: String
	/// Additional information about an `individual` cardholder.
	public var individual: IssuingCardholderIndividual?
	/// Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
	public var livemode: Bool
	/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
	public var metadata: String
	/// The cardholder's name. This will be printed on cards issued to them.
	public var name: String
	/// String representing the object's type. Objects of the same type share the same value.
	public var object: ObjectValues
	/// The cardholder's phone number.
	public var phone_number: String?
	public var requirements: IssuingCardholderRequirements
	/// Rules that control spending across this cardholder's cards. Refer to our [documentation](https://stripe.com/docs/issuing/controls/spending-controls) for more details.
	public var spending_controls: IssuingCardholderAuthorizationControls?
	/// Specifies whether to permit authorizations on this cardholder's cards.
	public var status: StatusValues
	/// One of `individual` or `company`.
	public var type: TypeValues

	/// An Issuing `Cardholder` object represents an individual or business entity who is [issued](https://stripe.com/docs/issuing) cards.  Related guide: [How to create a Cardholder](https://stripe.com/docs/issuing/cards#create-cardholder)
	/// - Parameters:
	///   - billing: 
	///   - company: Additional information about a `company` cardholder.
	///   - created: Time at which the object was created. Measured in seconds since the Unix epoch.
	///   - email: The cardholder's email address.
	///   - id: Unique identifier for the object.
	///   - individual: Additional information about an `individual` cardholder.
	///   - livemode: Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
	///   - metadata: Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
	///   - name: The cardholder's name. This will be printed on cards issued to them.
	///   - object: String representing the object's type. Objects of the same type share the same value.
	///   - phone_number: The cardholder's phone number.
	///   - requirements: 
	///   - spending_controls: Rules that control spending across this cardholder's cards. Refer to our [documentation](https://stripe.com/docs/issuing/controls/spending-controls) for more details.
	///   - status: Specifies whether to permit authorizations on this cardholder's cards.
	///   - type: One of `individual` or `company`.
	public init(billing: IssuingCardholderAddress, created: Timestamp, id: String, livemode: Bool, metadata: String, name: String, object: ObjectValues, requirements: IssuingCardholderRequirements, status: StatusValues, type: TypeValues, company: IssuingCardholderCompany? = nil, email: String? = nil, individual: IssuingCardholderIndividual? = nil, phone_number: String? = nil, spending_controls: IssuingCardholderAuthorizationControls? = nil) {
		self.billing = billing
		self.created = created
		self.id = id
		self.livemode = livemode
		self.metadata = metadata
		self.name = name
		self.object = object
		self.requirements = requirements
		self.status = status
		self.type = type
		self.company = company
		self.email = email
		self.individual = individual
		self.phone_number = phone_number
		self.spending_controls = spending_controls
	}

	public enum StatusValues: String, Codable {
		case active = "active"
		case blocked = "blocked"
		case inactive = "inactive"
	}

	public enum TypeValues: String, Codable {
		case company = "company"
		case individual = "individual"
	}

	public enum ObjectValues: String, Codable {
		case issuingCardholder = "issuing.cardholder"
	}
}

/// As a [card issuer](https://stripe.com/docs/issuing), you can dispute transactions that the cardholder does not recognize, suspects to be fraudulent, or has other issues with.  Related guide: [Disputing Transactions](https://stripe.com/docs/issuing/purchases/disputes)
public class IssuingDispute: Codable {
	/// Disputed amount. Usually the amount of the `disputed_transaction`, but can differ (usually because of currency fluctuation).
	public var amount: Int
	/// List of balance transactions associated with the dispute.
	public var balance_transactions: [BalanceTransaction]??
	/// Time at which the object was created. Measured in seconds since the Unix epoch.
	public var created: Timestamp
	/// The currency the `disputed_transaction` was made in.
	public var currency: String
	public var evidence: IssuingDisputeEvidence
	/// Unique identifier for the object.
	public var id: String
	/// Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
	public var livemode: Bool
	/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
	public var metadata: String
	/// String representing the object's type. Objects of the same type share the same value.
	public var object: ObjectValues
	/// Current status of the dispute.
	public var status: StatusValues
	/// The transaction being disputed.
	public var transaction: String

	/// As a [card issuer](https://stripe.com/docs/issuing), you can dispute transactions that the cardholder does not recognize, suspects to be fraudulent, or has other issues with.  Related guide: [Disputing Transactions](https://stripe.com/docs/issuing/purchases/disputes)
	/// - Parameters:
	///   - amount: Disputed amount. Usually the amount of the `disputed_transaction`, but can differ (usually because of currency fluctuation).
	///   - balance_transactions: List of balance transactions associated with the dispute.
	///   - created: Time at which the object was created. Measured in seconds since the Unix epoch.
	///   - currency: The currency the `disputed_transaction` was made in.
	///   - evidence: 
	///   - id: Unique identifier for the object.
	///   - livemode: Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
	///   - metadata: Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
	///   - object: String representing the object's type. Objects of the same type share the same value.
	///   - status: Current status of the dispute.
	///   - transaction: The transaction being disputed.
	public init(amount: Int, created: Timestamp, currency: String, evidence: IssuingDisputeEvidence, id: String, livemode: Bool, metadata: String, object: ObjectValues, status: StatusValues, transaction: String, balance_transactions: [BalanceTransaction]?? = nil) {
		self.amount = amount
		self.created = created
		self.currency = currency
		self.evidence = evidence
		self.id = id
		self.livemode = livemode
		self.metadata = metadata
		self.object = object
		self.status = status
		self.transaction = transaction
		self.balance_transactions = balance_transactions
	}

	public enum StatusValues: String, Codable {
		case expired = "expired"
		case lost = "lost"
		case submitted = "submitted"
		case unsubmitted = "unsubmitted"
		case won = "won"
	}

	public enum ObjectValues: String, Codable {
		case issuingDispute = "issuing.dispute"
	}
}

/// When a non-stripe BIN is used, any use of an [issued card](https://stripe.com/docs/issuing) must be settled directly with the card network. The net amount owed is represented by an Issuing `Settlement` object.
public class IssuingSettlement: Codable {
	/// The Bank Identification Number reflecting this settlement record.
	public var bin: String
	/// The date that the transactions are cleared and posted to user's accounts.
	public var clearing_date: Int
	/// Time at which the object was created. Measured in seconds since the Unix epoch.
	public var created: Timestamp
	/// Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
	public var currency: String
	/// Unique identifier for the object.
	public var id: String
	/// The total interchange received as reimbursement for the transactions.
	public var interchange_fees: Int
	/// Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
	public var livemode: Bool
	/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
	public var metadata: String
	/// The total net amount required to settle with the network.
	public var net_total: Int
	/// The card network for this settlement report. One of ["visa"]
	public var network: NetworkValues
	/// The total amount of fees owed to the network.
	public var network_fees: Int
	/// The Settlement Identification Number assigned by the network.
	public var network_settlement_identifier: String
	/// String representing the object's type. Objects of the same type share the same value.
	public var object: ObjectValues
	/// One of `international` or `uk_national_net`.
	public var settlement_service: String
	/// The total number of transactions reflected in this settlement.
	public var transaction_count: Int
	/// The total transaction amount reflected in this settlement.
	public var transaction_volume: Int

	/// When a non-stripe BIN is used, any use of an [issued card](https://stripe.com/docs/issuing) must be settled directly with the card network. The net amount owed is represented by an Issuing `Settlement` object.
	/// - Parameters:
	///   - bin: The Bank Identification Number reflecting this settlement record.
	///   - clearing_date: The date that the transactions are cleared and posted to user's accounts.
	///   - created: Time at which the object was created. Measured in seconds since the Unix epoch.
	///   - currency: Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
	///   - id: Unique identifier for the object.
	///   - interchange_fees: The total interchange received as reimbursement for the transactions.
	///   - livemode: Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
	///   - metadata: Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
	///   - net_total: The total net amount required to settle with the network.
	///   - network: The card network for this settlement report. One of ["visa"]
	///   - network_fees: The total amount of fees owed to the network.
	///   - network_settlement_identifier: The Settlement Identification Number assigned by the network.
	///   - object: String representing the object's type. Objects of the same type share the same value.
	///   - settlement_service: One of `international` or `uk_national_net`.
	///   - transaction_count: The total number of transactions reflected in this settlement.
	///   - transaction_volume: The total transaction amount reflected in this settlement.
	public init(bin: String, clearing_date: Int, created: Timestamp, currency: String, id: String, interchange_fees: Int, livemode: Bool, metadata: String, net_total: Int, network: NetworkValues, network_fees: Int, network_settlement_identifier: String, object: ObjectValues, settlement_service: String, transaction_count: Int, transaction_volume: Int) {
		self.bin = bin
		self.clearing_date = clearing_date
		self.created = created
		self.currency = currency
		self.id = id
		self.interchange_fees = interchange_fees
		self.livemode = livemode
		self.metadata = metadata
		self.net_total = net_total
		self.network = network
		self.network_fees = network_fees
		self.network_settlement_identifier = network_settlement_identifier
		self.object = object
		self.settlement_service = settlement_service
		self.transaction_count = transaction_count
		self.transaction_volume = transaction_volume
	}

	public enum NetworkValues: String, Codable {
		case visa = "visa"
	}

	public enum ObjectValues: String, Codable {
		case issuingSettlement = "issuing.settlement"
	}
}

/// Any use of an [issued card](https://stripe.com/docs/issuing) that results in funds entering or leaving your Stripe account, such as a completed purchase or refund, is represented by an Issuing `Transaction` object.  Related guide: [Issued Card Transactions](https://stripe.com/docs/issuing/purchases/transactions).
public class IssuingTransaction: Codable {
	/// The transaction amount, which will be reflected in your balance. This amount is in your currency and in the [smallest currency unit](https://stripe.com/docs/currencies#zero-decimal).
	public var amount: Int
	/// Detailed breakdown of amount components. These amounts are denominated in `currency` and in the [smallest currency unit](https://stripe.com/docs/currencies#zero-decimal).
	public var amount_details: IssuingTransactionAmountDetails?
	/// The `Authorization` object that led to this transaction.
	public var authorization: String?
	/// ID of the [balance transaction](https://stripe.com/docs/api/balance_transactions) associated with this transaction.
	public var balance_transaction: String?
	/// The card used to make this transaction.
	public var card: String
	/// The cardholder to whom this transaction belongs.
	public var cardholder: String?
	/// Time at which the object was created. Measured in seconds since the Unix epoch.
	public var created: Timestamp
	/// Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
	public var currency: String
	/// If you've disputed the transaction, the ID of the dispute.
	public var dispute: String?
	/// Unique identifier for the object.
	public var id: String
	/// Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
	public var livemode: Bool
	/// The amount that the merchant will receive, denominated in `merchant_currency` and in the [smallest currency unit](https://stripe.com/docs/currencies#zero-decimal). It will be different from `amount` if the merchant is taking payment in a different currency.
	public var merchant_amount: Int
	/// The currency with which the merchant is taking payment.
	public var merchant_currency: String
	public var merchant_data: IssuingAuthorizationMerchantData
	/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
	public var metadata: String
	/// String representing the object's type. Objects of the same type share the same value.
	public var object: ObjectValues
	/// Additional purchase information that is optionally provided by the merchant.
	public var purchase_details: IssuingTransactionPurchaseDetails?
	/// The nature of the transaction.
	public var type: TypeValues

	/// Any use of an [issued card](https://stripe.com/docs/issuing) that results in funds entering or leaving your Stripe account, such as a completed purchase or refund, is represented by an Issuing `Transaction` object.  Related guide: [Issued Card Transactions](https://stripe.com/docs/issuing/purchases/transactions).
	/// - Parameters:
	///   - amount: The transaction amount, which will be reflected in your balance. This amount is in your currency and in the [smallest currency unit](https://stripe.com/docs/currencies#zero-decimal).
	///   - amount_details: Detailed breakdown of amount components. These amounts are denominated in `currency` and in the [smallest currency unit](https://stripe.com/docs/currencies#zero-decimal).
	///   - authorization: The `Authorization` object that led to this transaction.
	///   - balance_transaction: ID of the [balance transaction](https://stripe.com/docs/api/balance_transactions) associated with this transaction.
	///   - card: The card used to make this transaction.
	///   - cardholder: The cardholder to whom this transaction belongs.
	///   - created: Time at which the object was created. Measured in seconds since the Unix epoch.
	///   - currency: Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
	///   - dispute: If you've disputed the transaction, the ID of the dispute.
	///   - id: Unique identifier for the object.
	///   - livemode: Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
	///   - merchant_amount: The amount that the merchant will receive, denominated in `merchant_currency` and in the [smallest currency unit](https://stripe.com/docs/currencies#zero-decimal). It will be different from `amount` if the merchant is taking payment in a different currency.
	///   - merchant_currency: The currency with which the merchant is taking payment.
	///   - merchant_data: 
	///   - metadata: Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
	///   - object: String representing the object's type. Objects of the same type share the same value.
	///   - purchase_details: Additional purchase information that is optionally provided by the merchant.
	///   - type: The nature of the transaction.
	public init(amount: Int, card: String, created: Timestamp, currency: String, id: String, livemode: Bool, merchant_amount: Int, merchant_currency: String, merchant_data: IssuingAuthorizationMerchantData, metadata: String, object: ObjectValues, type: TypeValues, amount_details: IssuingTransactionAmountDetails? = nil, authorization: String? = nil, balance_transaction: String? = nil, cardholder: String? = nil, dispute: String? = nil, purchase_details: IssuingTransactionPurchaseDetails? = nil) {
		self.amount = amount
		self.card = card
		self.created = created
		self.currency = currency
		self.id = id
		self.livemode = livemode
		self.merchant_amount = merchant_amount
		self.merchant_currency = merchant_currency
		self.merchant_data = merchant_data
		self.metadata = metadata
		self.object = object
		self.type = type
		self.amount_details = amount_details
		self.authorization = authorization
		self.balance_transaction = balance_transaction
		self.cardholder = cardholder
		self.dispute = dispute
		self.purchase_details = purchase_details
	}

	public enum ObjectValues: String, Codable {
		case issuingTransaction = "issuing.transaction"
	}

	public enum TypeValues: String, Codable {
		case capture = "capture"
		case refund = "refund"
	}
}

public class IssuingAuthorizationAmountDetails: Codable {
	/// The fee charged by the ATM for the cash withdrawal.
	public var atm_fee: Int?

	public init(atm_fee: Int? = nil) {
		self.atm_fee = atm_fee
	}
}

public class IssuingAuthorizationMerchantData: Codable {
	/// A categorization of the seller's type of business. See our [merchant categories guide](https://stripe.com/docs/issuing/merchant-categories) for a list of possible values.
	public var category: String
	/// City where the seller is located
	public var city: String?
	/// Country where the seller is located
	public var country: String?
	/// Name of the seller
	public var name: String?
	/// Identifier assigned to the seller by the card brand
	public var network_id: String
	/// Postal code where the seller is located
	public var postal_code: String?
	/// State where the seller is located
	public var state: String?

	public init(category: String, network_id: String, city: String? = nil, country: String? = nil, name: String? = nil, postal_code: String? = nil, state: String? = nil) {
		self.category = category
		self.network_id = network_id
		self.city = city
		self.country = country
		self.name = name
		self.postal_code = postal_code
		self.state = state
	}
}

public class IssuingAuthorizationPendingRequest: Codable {
	/// The additional amount Stripe will hold if the authorization is approved, in the card's [currency](https://stripe.com/docs/api#issuing_authorization_object-pending-request-currency) and in the [smallest currency unit](https://stripe.com/docs/currencies#zero-decimal).
	public var amount: Int
	/// Detailed breakdown of amount components. These amounts are denominated in `currency` and in the [smallest currency unit](https://stripe.com/docs/currencies#zero-decimal).
	public var amount_details: IssuingAuthorizationAmountDetails?
	/// Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
	public var currency: String
	/// If set `true`, you may provide [amount](https://stripe.com/docs/api/issuing/authorizations/approve#approve_issuing_authorization-amount) to control how much to hold for the authorization.
	public var is_amount_controllable: Bool
	/// The amount the merchant is requesting to be authorized in the `merchant_currency`. The amount is in the [smallest currency unit](https://stripe.com/docs/currencies#zero-decimal).
	public var merchant_amount: Int
	/// The local currency the merchant is requesting to authorize.
	public var merchant_currency: String

	public init(amount: Int, currency: String, is_amount_controllable: Bool, merchant_amount: Int, merchant_currency: String, amount_details: IssuingAuthorizationAmountDetails? = nil) {
		self.amount = amount
		self.currency = currency
		self.is_amount_controllable = is_amount_controllable
		self.merchant_amount = merchant_amount
		self.merchant_currency = merchant_currency
		self.amount_details = amount_details
	}
}

public class IssuingAuthorizationRequest: Codable {
	/// The authorization amount in your card's currency and in the [smallest currency unit](https://stripe.com/docs/currencies#zero-decimal). Stripe held this amount from your account to fund the authorization if the request was approved.
	public var amount: Int
	/// Detailed breakdown of amount components. These amounts are denominated in `currency` and in the [smallest currency unit](https://stripe.com/docs/currencies#zero-decimal).
	public var amount_details: IssuingAuthorizationAmountDetails?
	/// Whether this request was approved.
	public var approved: Bool
	/// Time at which the object was created. Measured in seconds since the Unix epoch.
	public var created: Timestamp
	/// Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
	public var currency: String
	/// The amount that was authorized at the time of this request. This amount is in the `merchant_currency` and in the [smallest currency unit](https://stripe.com/docs/currencies#zero-decimal).
	public var merchant_amount: Int
	/// The currency that was collected by the merchant and presented to the cardholder for the authorization. Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
	public var merchant_currency: String
	/// The reason for the approval or decline.
	public var reason: ReasonValues

	public init(amount: Int, approved: Bool, created: Timestamp, currency: String, merchant_amount: Int, merchant_currency: String, reason: ReasonValues, amount_details: IssuingAuthorizationAmountDetails? = nil) {
		self.amount = amount
		self.approved = approved
		self.created = created
		self.currency = currency
		self.merchant_amount = merchant_amount
		self.merchant_currency = merchant_currency
		self.reason = reason
		self.amount_details = amount_details
	}

	public enum ReasonValues: String, Codable {
		case accountDisabled = "account_disabled"
		case cardActive = "card_active"
		case cardInactive = "card_inactive"
		case cardholderInactive = "cardholder_inactive"
		case cardholderVerificationRequired = "cardholder_verification_required"
		case insufficientFunds = "insufficient_funds"
		case notAllowed = "not_allowed"
		case spendingControls = "spending_controls"
		case suspectedFraud = "suspected_fraud"
		case verificationFailed = "verification_failed"
		case webhookApproved = "webhook_approved"
		case webhookDeclined = "webhook_declined"
		case webhookTimeout = "webhook_timeout"
	}
}

public class IssuingAuthorizationVerificationData: Codable {
	/// Whether the cardholder provided an address first line and if it matched the cardholder’s `billing.address.line1`.
	public var address_line1_check: AddressLine1CheckValues
	/// Whether the cardholder provided a postal code and if it matched the cardholder’s `billing.address.postal_code`.
	public var address_postal_code_check: AddressPostalCodeCheckValues
	/// Whether the cardholder provided a CVC and if it matched Stripe’s record.
	public var cvc_check: CvcCheckValues
	/// Whether the cardholder provided an expiry date and if it matched Stripe’s record.
	public var expiry_check: ExpiryCheckValues

	public init(address_line1_check: AddressLine1CheckValues, address_postal_code_check: AddressPostalCodeCheckValues, cvc_check: CvcCheckValues, expiry_check: ExpiryCheckValues) {
		self.address_line1_check = address_line1_check
		self.address_postal_code_check = address_postal_code_check
		self.cvc_check = cvc_check
		self.expiry_check = expiry_check
	}

	public enum AddressLine1CheckValues: String, Codable {
		case match = "match"
		case mismatch = "mismatch"
		case notProvided = "not_provided"
	}

	public enum ExpiryCheckValues: String, Codable {
		case match = "match"
		case mismatch = "mismatch"
		case notProvided = "not_provided"
	}

	public enum AddressPostalCodeCheckValues: String, Codable {
		case match = "match"
		case mismatch = "mismatch"
		case notProvided = "not_provided"
	}

	public enum CvcCheckValues: String, Codable {
		case match = "match"
		case mismatch = "mismatch"
		case notProvided = "not_provided"
	}
}

public class IssuingCardAuthorizationControls: Codable {
	/// Array of strings containing [categories](https://stripe.com/docs/api#issuing_authorization_object-merchant_data-category) of authorizations to allow. All other categories will be blocked. Cannot be set with `blocked_categories`.
	public var allowed_categories: [String]??
	/// Array of strings containing [categories](https://stripe.com/docs/api#issuing_authorization_object-merchant_data-category) of authorizations to decline. All other categories will be allowed. Cannot be set with `allowed_categories`.
	public var blocked_categories: [String]??
	/// Limit spending with amount-based rules that apply across any cards this card replaced (i.e., its `replacement_for` card and _that_ card's `replacement_for` card, up the chain).
	public var spending_limits: [IssuingCardSpendingLimit]??
	/// Currency of the amounts within `spending_limits`. Always the same as the currency of the card.
	public var spending_limits_currency: String?

	public init(allowed_categories: [String]?? = nil, blocked_categories: [String]?? = nil, spending_limits: [IssuingCardSpendingLimit]?? = nil, spending_limits_currency: String? = nil) {
		self.allowed_categories = allowed_categories
		self.blocked_categories = blocked_categories
		self.spending_limits = spending_limits
		self.spending_limits_currency = spending_limits_currency
	}
}

public class IssuingCardShipping: Codable {
	public var address: Address
	/// The delivery company that shipped a card.
	public var carrier: CarrierValues?
	/// A unix timestamp representing a best estimate of when the card will be delivered.
	public var eta: Timestamp?
	/// Recipient name.
	public var name: String
	/// Shipment service, such as `standard` or `express`.
	public var service: ServiceValues
	/// The delivery status of the card.
	public var status: StatusValues?
	/// A tracking number for a card shipment.
	public var tracking_number: String?
	/// A link to the shipping carrier's site where you can view detailed information about a card shipment.
	public var tracking_url: String?
	/// Packaging options.
	public var type: TypeValues

	public init(address: Address, name: String, service: ServiceValues, type: TypeValues, carrier: CarrierValues? = nil, eta: Timestamp? = nil, status: StatusValues? = nil, tracking_number: String? = nil, tracking_url: String? = nil) {
		self.address = address
		self.name = name
		self.service = service
		self.type = type
		self.carrier = carrier
		self.eta = eta
		self.status = status
		self.tracking_number = tracking_number
		self.tracking_url = tracking_url
	}

	public enum TypeValues: String, Codable {
		case bulk = "bulk"
		case individual = "individual"
	}

	public enum CarrierValues: String, Codable {
		case fedex = "fedex"
		case usps = "usps"
	}

	public enum StatusValues: String, Codable {
		case canceled = "canceled"
		case delivered = "delivered"
		case failure = "failure"
		case pending = "pending"
		case returned = "returned"
		case shipped = "shipped"
	}

	public enum ServiceValues: String, Codable {
		case express = "express"
		case priority = "priority"
		case standard = "standard"
	}
}

public class IssuingCardSpendingLimit: Codable {
	/// Maximum amount allowed to spend per interval.
	public var amount: Int
	/// Array of strings containing [categories](https://stripe.com/docs/api#issuing_authorization_object-merchant_data-category) this limit applies to. Omitting this field will apply the limit to all categories.
	public var categories: [String]??
	/// Interval (or event) to which the amount applies.
	public var interval: IntervalValues

	public init(amount: Int, interval: IntervalValues, categories: [String]?? = nil) {
		self.amount = amount
		self.interval = interval
		self.categories = categories
	}

	public enum IntervalValues: String, Codable {
		case allTime = "all_time"
		case daily = "daily"
		case monthly = "monthly"
		case perAuthorization = "per_authorization"
		case weekly = "weekly"
		case yearly = "yearly"
	}
}

public class IssuingCardholderAddress: Codable {
	public var address: Address

	public init(address: Address) {
		self.address = address
	}
}

public class IssuingCardholderAuthorizationControls: Codable {
	/// Array of strings containing [categories](https://stripe.com/docs/api#issuing_authorization_object-merchant_data-category) of authorizations to allow. All other categories will be blocked. Cannot be set with `blocked_categories`.
	public var allowed_categories: [String]??
	/// Array of strings containing [categories](https://stripe.com/docs/api#issuing_authorization_object-merchant_data-category) of authorizations to decline. All other categories will be allowed. Cannot be set with `allowed_categories`.
	public var blocked_categories: [String]??
	/// Limit spending with amount-based rules that apply across this cardholder's cards.
	public var spending_limits: [IssuingCardholderSpendingLimit]??
	/// Currency of the amounts within `spending_limits`.
	public var spending_limits_currency: String?

	public init(allowed_categories: [String]?? = nil, blocked_categories: [String]?? = nil, spending_limits: [IssuingCardholderSpendingLimit]?? = nil, spending_limits_currency: String? = nil) {
		self.allowed_categories = allowed_categories
		self.blocked_categories = blocked_categories
		self.spending_limits = spending_limits
		self.spending_limits_currency = spending_limits_currency
	}
}

public class IssuingCardholderCompany: Codable {
	/// Whether the company's business ID number was provided.
	public var tax_id_provided: Bool

	public init(tax_id_provided: Bool) {
		self.tax_id_provided = tax_id_provided
	}
}

public class IssuingCardholderIdDocument: Codable {
	/// The back of a document returned by a [file upload](https://stripe.com/docs/api#create_file) with a `purpose` value of `identity_document`.
	public var back: String?
	/// The front of a document returned by a [file upload](https://stripe.com/docs/api#create_file) with a `purpose` value of `identity_document`.
	public var front: String?

	public init(back: String? = nil, front: String? = nil) {
		self.back = back
		self.front = front
	}
}

public class IssuingCardholderIndividual: Codable {
	/// The date of birth of this cardholder.
	public var dob: IssuingCardholderIndividualDob?
	/// The first name of this cardholder.
	public var first_name: String
	/// The last name of this cardholder.
	public var last_name: String
	/// Government-issued ID document for this cardholder.
	public var verification: IssuingCardholderVerification?

	public init(first_name: String, last_name: String, dob: IssuingCardholderIndividualDob? = nil, verification: IssuingCardholderVerification? = nil) {
		self.first_name = first_name
		self.last_name = last_name
		self.dob = dob
		self.verification = verification
	}
}

public class IssuingCardholderIndividualDob: Codable {
	/// The day of birth, between 1 and 31.
	public var day: Int?
	/// The month of birth, between 1 and 12.
	public var month: Int?
	/// The four-digit year of birth.
	public var year: Int?

	public init(day: Int? = nil, month: Int? = nil, year: Int? = nil) {
		self.day = day
		self.month = month
		self.year = year
	}
}

public class IssuingCardholderRequirements: Codable {
	/// If `disabled_reason` is present, all cards will decline authorizations with `cardholder_verification_required` reason.
	public var disabled_reason: DisabledReasonValues?
	/// Array of fields that need to be collected in order to verify and re-enable the cardholder.
	public var past_due: [String]??

	public init(disabled_reason: DisabledReasonValues? = nil, past_due: [String]?? = nil) {
		self.disabled_reason = disabled_reason
		self.past_due = past_due
	}

	public enum DisabledReasonValues: String, Codable {
		case listed = "listed"
		case rejectedListed = "rejected.listed"
		case underReview = "under_review"
	}
}

public class IssuingCardholderSpendingLimit: Codable {
	/// Maximum amount allowed to spend per interval.
	public var amount: Int
	/// Array of strings containing [categories](https://stripe.com/docs/api#issuing_authorization_object-merchant_data-category) this limit applies to. Omitting this field will apply the limit to all categories.
	public var categories: [String]??
	/// Interval (or event) to which the amount applies.
	public var interval: IntervalValues

	public init(amount: Int, interval: IntervalValues, categories: [String]?? = nil) {
		self.amount = amount
		self.interval = interval
		self.categories = categories
	}

	public enum IntervalValues: String, Codable {
		case allTime = "all_time"
		case daily = "daily"
		case monthly = "monthly"
		case perAuthorization = "per_authorization"
		case weekly = "weekly"
		case yearly = "yearly"
	}
}

public class IssuingCardholderVerification: Codable {
	/// An identifying document, either a passport or local ID card.
	public var document: IssuingCardholderIdDocument?

	public init(document: IssuingCardholderIdDocument? = nil) {
		self.document = document
	}
}

public class IssuingDisputeCanceledEvidence: Codable {
	/// (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) Additional documentation supporting the dispute.
	public var additional_documentation: String?
	/// Date when order was canceled.
	public var canceled_at: Timestamp?
	/// Whether the cardholder was provided with a cancellation policy.
	public var cancellation_policy_provided: Bool?
	/// Reason for canceling the order.
	public var cancellation_reason: String?
	/// Date when the cardholder expected to receive the product.
	public var expected_at: Timestamp?
	/// Explanation of why the cardholder is disputing this transaction.
	public var explanation: String?
	/// Description of the merchandise or service that was purchased.
	public var product_description: String?
	/// Whether the product was a merchandise or service.
	public var product_type: ProductTypeValues?
	/// Result of cardholder's attempt to return the product.
	public var return_status: ReturnStatusValues?
	/// Date when the product was returned or attempted to be returned.
	public var returned_at: Timestamp?

	public init(additional_documentation: String? = nil, canceled_at: Timestamp? = nil, cancellation_policy_provided: Bool? = nil, cancellation_reason: String? = nil, expected_at: Timestamp? = nil, explanation: String? = nil, product_description: String? = nil, product_type: ProductTypeValues? = nil, return_status: ReturnStatusValues? = nil, returned_at: Timestamp? = nil) {
		self.additional_documentation = additional_documentation
		self.canceled_at = canceled_at
		self.cancellation_policy_provided = cancellation_policy_provided
		self.cancellation_reason = cancellation_reason
		self.expected_at = expected_at
		self.explanation = explanation
		self.product_description = product_description
		self.product_type = product_type
		self.return_status = return_status
		self.returned_at = returned_at
	}

	public enum ProductTypeValues: String, Codable {
		case merchandise = "merchandise"
		case service = "service"
	}

	public enum ReturnStatusValues: String, Codable {
		case merchantRejected = "merchant_rejected"
		case successful = "successful"
	}
}

public class IssuingDisputeDuplicateEvidence: Codable {
	/// (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) Additional documentation supporting the dispute.
	public var additional_documentation: String?
	/// (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) Copy of the card statement showing that the product had already been paid for.
	public var card_statement: String?
	/// (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) Copy of the receipt showing that the product had been paid for in cash.
	public var cash_receipt: String?
	/// (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) Image of the front and back of the check that was used to pay for the product.
	public var check_image: String?
	/// Explanation of why the cardholder is disputing this transaction.
	public var explanation: String?
	/// Transaction (e.g., ipi_...) that the disputed transaction is a duplicate of. Of the two or more transactions that are copies of each other, this is original undisputed one.
	public var original_transaction: String?

	public init(additional_documentation: String? = nil, card_statement: String? = nil, cash_receipt: String? = nil, check_image: String? = nil, explanation: String? = nil, original_transaction: String? = nil) {
		self.additional_documentation = additional_documentation
		self.card_statement = card_statement
		self.cash_receipt = cash_receipt
		self.check_image = check_image
		self.explanation = explanation
		self.original_transaction = original_transaction
	}
}

public class IssuingDisputeEvidence: Codable {
	public var canceled: IssuingDisputeCanceledEvidence?
	public var duplicate: IssuingDisputeDuplicateEvidence?
	public var fraudulent: IssuingDisputeFraudulentEvidence?
	public var merchandise_not_as_described: IssuingDisputeMerchandiseNotAsDescribedEvidence?
	public var not_received: IssuingDisputeNotReceivedEvidence?
	public var other: IssuingDisputeOtherEvidence?
	/// The reason for filing the dispute. Its value will match the field containing the evidence.
	public var reason: ReasonValues
	public var service_not_as_described: IssuingDisputeServiceNotAsDescribedEvidence?

	public init(reason: ReasonValues, canceled: IssuingDisputeCanceledEvidence? = nil, duplicate: IssuingDisputeDuplicateEvidence? = nil, fraudulent: IssuingDisputeFraudulentEvidence? = nil, merchandise_not_as_described: IssuingDisputeMerchandiseNotAsDescribedEvidence? = nil, not_received: IssuingDisputeNotReceivedEvidence? = nil, other: IssuingDisputeOtherEvidence? = nil, service_not_as_described: IssuingDisputeServiceNotAsDescribedEvidence? = nil) {
		self.reason = reason
		self.canceled = canceled
		self.duplicate = duplicate
		self.fraudulent = fraudulent
		self.merchandise_not_as_described = merchandise_not_as_described
		self.not_received = not_received
		self.other = other
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

public class IssuingDisputeFraudulentEvidence: Codable {
	/// (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) Additional documentation supporting the dispute.
	public var additional_documentation: String?
	/// Explanation of why the cardholder is disputing this transaction.
	public var explanation: String?

	public init(additional_documentation: String? = nil, explanation: String? = nil) {
		self.additional_documentation = additional_documentation
		self.explanation = explanation
	}
}

public class IssuingDisputeMerchandiseNotAsDescribedEvidence: Codable {
	/// (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) Additional documentation supporting the dispute.
	public var additional_documentation: String?
	/// Explanation of why the cardholder is disputing this transaction.
	public var explanation: String?
	/// Date when the product was received.
	public var received_at: Timestamp?
	/// Description of the cardholder's attempt to return the product.
	public var return_description: String?
	/// Result of cardholder's attempt to return the product.
	public var return_status: ReturnStatusValues?
	/// Date when the product was returned or attempted to be returned.
	public var returned_at: Timestamp?

	public init(additional_documentation: String? = nil, explanation: String? = nil, received_at: Timestamp? = nil, return_description: String? = nil, return_status: ReturnStatusValues? = nil, returned_at: Timestamp? = nil) {
		self.additional_documentation = additional_documentation
		self.explanation = explanation
		self.received_at = received_at
		self.return_description = return_description
		self.return_status = return_status
		self.returned_at = returned_at
	}

	public enum ReturnStatusValues: String, Codable {
		case merchantRejected = "merchant_rejected"
		case successful = "successful"
	}
}

public class IssuingDisputeNotReceivedEvidence: Codable {
	/// (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) Additional documentation supporting the dispute.
	public var additional_documentation: String?
	/// Date when the cardholder expected to receive the product.
	public var expected_at: Timestamp?
	/// Explanation of why the cardholder is disputing this transaction.
	public var explanation: String?
	/// Description of the merchandise or service that was purchased.
	public var product_description: String?
	/// Whether the product was a merchandise or service.
	public var product_type: ProductTypeValues?

	public init(additional_documentation: String? = nil, expected_at: Timestamp? = nil, explanation: String? = nil, product_description: String? = nil, product_type: ProductTypeValues? = nil) {
		self.additional_documentation = additional_documentation
		self.expected_at = expected_at
		self.explanation = explanation
		self.product_description = product_description
		self.product_type = product_type
	}

	public enum ProductTypeValues: String, Codable {
		case merchandise = "merchandise"
		case service = "service"
	}
}

public class IssuingDisputeOtherEvidence: Codable {
	/// (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) Additional documentation supporting the dispute.
	public var additional_documentation: String?
	/// Explanation of why the cardholder is disputing this transaction.
	public var explanation: String?
	/// Description of the merchandise or service that was purchased.
	public var product_description: String?
	/// Whether the product was a merchandise or service.
	public var product_type: ProductTypeValues?

	public init(additional_documentation: String? = nil, explanation: String? = nil, product_description: String? = nil, product_type: ProductTypeValues? = nil) {
		self.additional_documentation = additional_documentation
		self.explanation = explanation
		self.product_description = product_description
		self.product_type = product_type
	}

	public enum ProductTypeValues: String, Codable {
		case merchandise = "merchandise"
		case service = "service"
	}
}

public class IssuingDisputeServiceNotAsDescribedEvidence: Codable {
	/// (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) Additional documentation supporting the dispute.
	public var additional_documentation: String?
	/// Date when order was canceled.
	public var canceled_at: Timestamp?
	/// Reason for canceling the order.
	public var cancellation_reason: String?
	/// Explanation of why the cardholder is disputing this transaction.
	public var explanation: String?
	/// Date when the product was received.
	public var received_at: Timestamp?

	public init(additional_documentation: String? = nil, canceled_at: Timestamp? = nil, cancellation_reason: String? = nil, explanation: String? = nil, received_at: Timestamp? = nil) {
		self.additional_documentation = additional_documentation
		self.canceled_at = canceled_at
		self.cancellation_reason = cancellation_reason
		self.explanation = explanation
		self.received_at = received_at
	}
}

public class IssuingTransactionAmountDetails: Codable {
	/// The fee charged by the ATM for the cash withdrawal.
	public var atm_fee: Int?

	public init(atm_fee: Int? = nil) {
		self.atm_fee = atm_fee
	}
}

public class IssuingTransactionFlightData: Codable {
	/// The time that the flight departed.
	public var departure_at: Int?
	/// The name of the passenger.
	public var passenger_name: String?
	/// Whether the ticket is refundable.
	public var refundable: Bool?
	/// The legs of the trip.
	public var segments: [IssuingTransactionFlightDataLeg]??
	/// The travel agency that issued the ticket.
	public var travel_agency: String?

	public init(departure_at: Int? = nil, passenger_name: String? = nil, refundable: Bool? = nil, segments: [IssuingTransactionFlightDataLeg]?? = nil, travel_agency: String? = nil) {
		self.departure_at = departure_at
		self.passenger_name = passenger_name
		self.refundable = refundable
		self.segments = segments
		self.travel_agency = travel_agency
	}
}

public class IssuingTransactionFlightDataLeg: Codable {
	/// The three-letter IATA airport code of the flight's destination.
	public var arrival_airport_code: String?
	/// The airline carrier code.
	public var carrier: String?
	/// The three-letter IATA airport code that the flight departed from.
	public var departure_airport_code: String?
	/// The flight number.
	public var flight_number: String?
	/// The flight's service class.
	public var service_class: String?
	/// Whether a stopover is allowed on this flight.
	public var stopover_allowed: Bool?

	public init(arrival_airport_code: String? = nil, carrier: String? = nil, departure_airport_code: String? = nil, flight_number: String? = nil, service_class: String? = nil, stopover_allowed: Bool? = nil) {
		self.arrival_airport_code = arrival_airport_code
		self.carrier = carrier
		self.departure_airport_code = departure_airport_code
		self.flight_number = flight_number
		self.service_class = service_class
		self.stopover_allowed = stopover_allowed
	}
}

public class IssuingTransactionFuelData: Codable {
	/// The type of fuel that was purchased. One of `diesel`, `unleaded_plus`, `unleaded_regular`, `unleaded_super`, or `other`.
	public var type: String
	/// The units for `volume_decimal`. One of `us_gallon` or `liter`.
	public var unit: String
	/// The cost in cents per each unit of fuel, represented as a decimal string with at most 12 decimal places.
	public var unit_cost_decimal: StringNumber
	/// The volume of the fuel that was pumped, represented as a decimal string with at most 12 decimal places.
	public var volume_decimal: StringNumber?

	public init(type: String, unit: String, unit_cost_decimal: StringNumber, volume_decimal: StringNumber? = nil) {
		self.type = type
		self.unit = unit
		self.unit_cost_decimal = unit_cost_decimal
		self.volume_decimal = volume_decimal
	}
}

public class IssuingTransactionLodgingData: Codable {
	/// The time of checking into the lodging.
	public var check_in_at: Int?
	/// The number of nights stayed at the lodging.
	public var nights: Int?

	public init(check_in_at: Int? = nil, nights: Int? = nil) {
		self.check_in_at = check_in_at
		self.nights = nights
	}
}

public class IssuingTransactionPurchaseDetails: Codable {
	/// Information about the flight that was purchased with this transaction.
	public var flight: IssuingTransactionFlightData?
	/// Information about fuel that was purchased with this transaction.
	public var fuel: IssuingTransactionFuelData?
	/// Information about lodging that was purchased with this transaction.
	public var lodging: IssuingTransactionLodgingData?
	/// The line items in the purchase.
	public var receipt: [IssuingTransactionReceiptData]??
	/// A merchant-specific order number.
	public var reference: String?

	public init(flight: IssuingTransactionFlightData? = nil, fuel: IssuingTransactionFuelData? = nil, lodging: IssuingTransactionLodgingData? = nil, receipt: [IssuingTransactionReceiptData]?? = nil, reference: String? = nil) {
		self.flight = flight
		self.fuel = fuel
		self.lodging = lodging
		self.receipt = receipt
		self.reference = reference
	}
}

public class IssuingTransactionReceiptData: Codable {
	/// The description of the item. The maximum length of this field is 26 characters.
	public var description: String?
	/// The quantity of the item.
	public var quantity: StringNumber?
	/// The total for this line item in cents.
	public var total: Int?
	/// The unit cost of the item in cents.
	public var unit_cost: Int?

	public init(description: String? = nil, quantity: StringNumber? = nil, total: Int? = nil, unit_cost: Int? = nil) {
		self.description = description
		self.quantity = quantity
		self.total = total
		self.unit_cost = unit_cost
	}
}

/// A line item.
public class Item: Codable {
	/// Total before any discounts or taxes are applied.
	public var amount_subtotal: Int?
	/// Total after discounts and taxes.
	public var amount_total: Int?
	/// Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
	public var currency: String
	/// An arbitrary string attached to the object. Often useful for displaying to users. Defaults to product name.
	public var description: String
	/// The discounts applied to the line item.
	public var discounts: [LineItemsDiscountAmount]?
	/// Unique identifier for the object.
	public var id: String
	/// String representing the object's type. Objects of the same type share the same value.
	public var object: ObjectValues
	/// The price used to generate the line item.
	public var price: Price?
	/// The quantity of products being purchased.
	public var quantity: Int?
	/// The taxes applied to the line item.
	public var taxes: [LineItemsTaxAmount]?

	/// A line item.
	/// - Parameters:
	///   - amount_subtotal: Total before any discounts or taxes are applied.
	///   - amount_total: Total after discounts and taxes.
	///   - currency: Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
	///   - description: An arbitrary string attached to the object. Often useful for displaying to users. Defaults to product name.
	///   - discounts: The discounts applied to the line item.
	///   - id: Unique identifier for the object.
	///   - object: String representing the object's type. Objects of the same type share the same value.
	///   - price: The price used to generate the line item.
	///   - quantity: The quantity of products being purchased.
	///   - taxes: The taxes applied to the line item.
	public init(currency: String, description: String, id: String, object: ObjectValues, amount_subtotal: Int? = nil, amount_total: Int? = nil, discounts: [LineItemsDiscountAmount]? = nil, price: Price? = nil, quantity: Int? = nil, taxes: [LineItemsTaxAmount]? = nil) {
		self.currency = currency
		self.description = description
		self.id = id
		self.object = object
		self.amount_subtotal = amount_subtotal
		self.amount_total = amount_total
		self.discounts = discounts
		self.price = price
		self.quantity = quantity
		self.taxes = taxes
	}

	public enum ObjectValues: String, Codable {
		case item = "item"
	}
}

public class LegalEntityCompany: Codable {
	public var address: Address?
	/// The Kana variation of the company's primary address (Japan only).
	public var address_kana: LegalEntityJapanAddress?
	/// The Kanji variation of the company's primary address (Japan only).
	public var address_kanji: LegalEntityJapanAddress?
	/// Whether the company's directors have been provided. This Boolean will be `true` if you've manually indicated that all directors are provided via [the `directors_provided` parameter](https://stripe.com/docs/api/accounts/update#update_account-company-directors_provided).
	public var directors_provided: Bool?
	/// Whether the company's executives have been provided. This Boolean will be `true` if you've manually indicated that all executives are provided via [the `executives_provided` parameter](https://stripe.com/docs/api/accounts/update#update_account-company-executives_provided), or if Stripe determined that sufficient executives were provided.
	public var executives_provided: Bool?
	/// The company's legal name.
	public var name: String?
	/// The Kana variation of the company's legal name (Japan only).
	public var name_kana: String?
	/// The Kanji variation of the company's legal name (Japan only).
	public var name_kanji: String?
	/// Whether the company's owners have been provided. This Boolean will be `true` if you've manually indicated that all owners are provided via [the `owners_provided` parameter](https://stripe.com/docs/api/accounts/update#update_account-company-owners_provided), or if Stripe determined that sufficient owners were provided. Stripe determines ownership requirements using both the number of owners provided and their total percent ownership (calculated by adding the `percent_ownership` of each owner together).
	public var owners_provided: Bool?
	/// The company's phone number (used for verification).
	public var phone: String?
	/// The category identifying the legal structure of the company or legal entity. See [Business structure](https://stripe.com/docs/connect/identity-verification#business-structure) for more details.
	public var structure: StructureValues?
	/// Whether the company's business ID number was provided.
	public var tax_id_provided: Bool?
	/// The jurisdiction in which the `tax_id` is registered (Germany-based companies only).
	public var tax_id_registrar: String?
	/// Whether the company's business VAT number was provided.
	public var vat_id_provided: Bool?
	/// Information on the verification state of the company.
	public var verification: LegalEntityCompanyVerification?

	public init(address: Address? = nil, address_kana: LegalEntityJapanAddress? = nil, address_kanji: LegalEntityJapanAddress? = nil, directors_provided: Bool? = nil, executives_provided: Bool? = nil, name: String? = nil, name_kana: String? = nil, name_kanji: String? = nil, owners_provided: Bool? = nil, phone: String? = nil, structure: StructureValues? = nil, tax_id_provided: Bool? = nil, tax_id_registrar: String? = nil, vat_id_provided: Bool? = nil, verification: LegalEntityCompanyVerification? = nil) {
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
		self.structure = structure
		self.tax_id_provided = tax_id_provided
		self.tax_id_registrar = tax_id_registrar
		self.vat_id_provided = vat_id_provided
		self.verification = verification
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

public class LegalEntityCompanyVerification: Codable {
	public var document: LegalEntityCompanyVerificationDocument

	public init(document: LegalEntityCompanyVerificationDocument) {
		self.document = document
	}
}

public class LegalEntityCompanyVerificationDocument: Codable {
	/// The back of a document returned by a [file upload](https://stripe.com/docs/api#create_file) with a `purpose` value of `additional_verification`.
	public var back: String?
	/// A user-displayable string describing the verification state of this document.
	public var details: String?
	/// One of `document_corrupt`, `document_expired`, `document_failed_copy`, `document_failed_greyscale`, `document_failed_other`, `document_failed_test_mode`, `document_fraudulent`, `document_incomplete`, `document_invalid`, `document_manipulated`, `document_not_readable`, `document_not_uploaded`, `document_type_not_supported`, or `document_too_large`. A machine-readable code specifying the verification state for this document.
	public var details_code: String?
	/// The front of a document returned by a [file upload](https://stripe.com/docs/api#create_file) with a `purpose` value of `additional_verification`.
	public var front: String?

	public init(back: String? = nil, details: String? = nil, details_code: String? = nil, front: String? = nil) {
		self.back = back
		self.details = details
		self.details_code = details_code
		self.front = front
	}
}

public class LegalEntityDob: Codable {
	/// The day of birth, between 1 and 31.
	public var day: Int?
	/// The month of birth, between 1 and 12.
	public var month: Int?
	/// The four-digit year of birth.
	public var year: Int?

	public init(day: Int? = nil, month: Int? = nil, year: Int? = nil) {
		self.day = day
		self.month = month
		self.year = year
	}
}

public class LegalEntityJapanAddress: Codable {
	/// City/Ward.
	public var city: String?
	/// Two-letter country code ([ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)).
	public var country: String?
	/// Block/Building number.
	public var line1: String?
	/// Building details.
	public var line2: String?
	/// ZIP or postal code.
	public var postal_code: String?
	/// Prefecture.
	public var state: String?
	/// Town/cho-me.
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

public class LegalEntityPersonVerification: Codable {
	/// A document showing address, either a passport, local ID card, or utility bill from a well-known utility company.
	public var additional_document: LegalEntityPersonVerificationDocument?
	/// A user-displayable string describing the verification state for the person. For example, this may say "Provided identity information could not be verified".
	public var details: String?
	/// One of `document_address_mismatch`, `document_dob_mismatch`, `document_duplicate_type`, `document_id_number_mismatch`, `document_name_mismatch`, `document_nationality_mismatch`, `failed_keyed_identity`, or `failed_other`. A machine-readable code specifying the verification state for the person.
	public var details_code: String?
	public var document: LegalEntityPersonVerificationDocument?
	/// The state of verification for the person. Possible values are `unverified`, `pending`, or `verified`.
	public var status: String

	public init(status: String, additional_document: LegalEntityPersonVerificationDocument? = nil, details: String? = nil, details_code: String? = nil, document: LegalEntityPersonVerificationDocument? = nil) {
		self.status = status
		self.additional_document = additional_document
		self.details = details
		self.details_code = details_code
		self.document = document
	}
}

public class LegalEntityPersonVerificationDocument: Codable {
	/// The back of an ID returned by a [file upload](https://stripe.com/docs/api#create_file) with a `purpose` value of `identity_document`.
	public var back: String?
	/// A user-displayable string describing the verification state of this document. For example, if a document is uploaded and the picture is too fuzzy, this may say "Identity document is too unclear to read".
	public var details: String?
	/// One of `document_corrupt`, `document_country_not_supported`, `document_expired`, `document_failed_copy`, `document_failed_other`, `document_failed_test_mode`, `document_fraudulent`, `document_failed_greyscale`, `document_incomplete`, `document_invalid`, `document_manipulated`, `document_missing_back`, `document_missing_front`, `document_not_readable`, `document_not_uploaded`, `document_photo_mismatch`, `document_too_large`, or `document_type_not_supported`. A machine-readable code specifying the verification state for this document.
	public var details_code: String?
	/// The front of an ID returned by a [file upload](https://stripe.com/docs/api#create_file) with a `purpose` value of `identity_document`.
	public var front: String?

	public init(back: String? = nil, details: String? = nil, details_code: String? = nil, front: String? = nil) {
		self.back = back
		self.details = details
		self.details_code = details_code
		self.front = front
	}
}

public class LightAccountLogout: Codable {

	public init() {
	}
}

public class LineItem: Codable {
	/// The amount, in %s.
	public var amount: Int
	/// Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
	public var currency: String
	/// An arbitrary string attached to the object. Often useful for displaying to users.
	public var description: String?
	/// The amount of discount calculated per discount for this line item.
	public var discount_amounts: [DiscountsResourceDiscountAmount]??
	/// If true, discounts will apply to this line item. Always false for prorations.
	public var discountable: Bool
	/// The discounts applied to the invoice line item. Line item discounts are applied before invoice discounts. Use `expand[]=discounts` to expand each discount.
	public var discounts: [String]??
	/// Unique identifier for the object.
	public var id: String
	/// The ID of the [invoice item](https://stripe.com/docs/api/invoiceitems) associated with this line item if any.
	public var invoice_item: String?
	/// Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
	public var livemode: Bool
	/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Note that for line items with `type=subscription` this will reflect the metadata of the subscription that caused the line item to be created.
	public var metadata: String
	/// String representing the object's type. Objects of the same type share the same value.
	public var object: ObjectValues
	public var period: InvoiceLineItemPeriod
	/// The price of the line item.
	public var price: Price?
	/// Whether this is a proration.
	public var proration: Bool
	/// The quantity of the subscription, if the line item is a subscription or a proration.
	public var quantity: Int?
	/// The subscription that the invoice item pertains to, if any.
	public var subscription: String?
	/// The subscription item that generated this invoice item. Left empty if the line item is not an explicit result of a subscription.
	public var subscription_item: String?
	/// The amount of tax calculated per tax rate for this line item
	public var tax_amounts: [InvoiceTaxAmount]?
	/// The tax rates which apply to the line item.
	public var tax_rates: [TaxRate]?
	/// A string identifying the type of the source of this line item, either an `invoiceitem` or a `subscription`.
	public var type: TypeValues

	public init(amount: Int, currency: String, discountable: Bool, id: String, livemode: Bool, metadata: String, object: ObjectValues, period: InvoiceLineItemPeriod, proration: Bool, type: TypeValues, description: String? = nil, discount_amounts: [DiscountsResourceDiscountAmount]?? = nil, discounts: [String]?? = nil, invoice_item: String? = nil, price: Price? = nil, quantity: Int? = nil, subscription: String? = nil, subscription_item: String? = nil, tax_amounts: [InvoiceTaxAmount]? = nil, tax_rates: [TaxRate]? = nil) {
		self.amount = amount
		self.currency = currency
		self.discountable = discountable
		self.id = id
		self.livemode = livemode
		self.metadata = metadata
		self.object = object
		self.period = period
		self.proration = proration
		self.type = type
		self.description = description
		self.discount_amounts = discount_amounts
		self.discounts = discounts
		self.invoice_item = invoice_item
		self.price = price
		self.quantity = quantity
		self.subscription = subscription
		self.subscription_item = subscription_item
		self.tax_amounts = tax_amounts
		self.tax_rates = tax_rates
	}

	public enum TypeValues: String, Codable {
		case invoiceitem = "invoiceitem"
		case subscription = "subscription"
	}

	public enum ObjectValues: String, Codable {
		case lineItem = "line_item"
	}
}

public class LineItemsDiscountAmount: Codable {
	/// The amount discounted.
	public var amount: Int
	public var discount: Discount

	public init(amount: Int, discount: Discount) {
		self.amount = amount
		self.discount = discount
	}
}

public class LineItemsTaxAmount: Codable {
	/// Amount of tax applied for this rate.
	public var amount: Int
	public var rate: TaxRate

	public init(amount: Int, rate: TaxRate) {
		self.amount = amount
		self.rate = rate
	}
}

public class LoginLink: Codable {
	/// Time at which the object was created. Measured in seconds since the Unix epoch.
	public var created: Timestamp
	/// String representing the object's type. Objects of the same type share the same value.
	public var object: ObjectValues
	/// The URL for the login link.
	public var url: String

	public init(created: Timestamp, object: ObjectValues, url: String) {
		self.created = created
		self.object = object
		self.url = url
	}

	public enum ObjectValues: String, Codable {
		case loginLink = "login_link"
	}
}

/// A Mandate is a record of the permission a customer has given you to debit their payment method.
public class Mandate: Codable {
	public var customer_acceptance: CustomerAcceptance
	/// Unique identifier for the object.
	public var id: String
	/// Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
	public var livemode: Bool
	public var multi_use: MandateMultiUse?
	/// String representing the object's type. Objects of the same type share the same value.
	public var object: ObjectValues
	/// ID of the payment method associated with this mandate.
	public var payment_method: String
	public var payment_method_details: MandatePaymentMethodDetails
	public var single_use: MandateSingleUse?
	/// The status of the mandate, which indicates whether it can be used to initiate a payment.
	public var status: StatusValues
	/// The type of the mandate.
	public var type: TypeValues

	/// A Mandate is a record of the permission a customer has given you to debit their payment method.
	/// - Parameters:
	///   - customer_acceptance: 
	///   - id: Unique identifier for the object.
	///   - livemode: Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
	///   - object: String representing the object's type. Objects of the same type share the same value.
	///   - payment_method: ID of the payment method associated with this mandate.
	///   - payment_method_details: 
	///   - status: The status of the mandate, which indicates whether it can be used to initiate a payment.
	///   - type: The type of the mandate.
	public init(customer_acceptance: CustomerAcceptance, id: String, livemode: Bool, object: ObjectValues, payment_method: String, payment_method_details: MandatePaymentMethodDetails, status: StatusValues, type: TypeValues, multi_use: MandateMultiUse? = nil, single_use: MandateSingleUse? = nil) {
		self.customer_acceptance = customer_acceptance
		self.id = id
		self.livemode = livemode
		self.object = object
		self.payment_method = payment_method
		self.payment_method_details = payment_method_details
		self.status = status
		self.type = type
		self.multi_use = multi_use
		self.single_use = single_use
	}

	public enum TypeValues: String, Codable {
		case multiUse = "multi_use"
		case singleUse = "single_use"
	}

	public enum StatusValues: String, Codable {
		case active = "active"
		case inactive = "inactive"
		case pending = "pending"
	}

	public enum ObjectValues: String, Codable {
		case mandate = "mandate"
	}
}

public class MandateAuBecsDebit: Codable {
	/// The URL of the mandate. This URL generally contains sensitive information about the customer and should be shared with them exclusively.
	public var url: String

	public init(url: String) {
		self.url = url
	}
}

public class MandateBacsDebit: Codable {
	/// The status of the mandate on the Bacs network. Can be one of `pending`, `revoked`, `refused`, or `accepted`.
	public var network_status: NetworkStatusValues
	/// The unique reference identifying the mandate on the Bacs network.
	public var reference: String
	/// The URL that will contain the mandate that the customer has signed.
	public var url: String

	public init(network_status: NetworkStatusValues, reference: String, url: String) {
		self.network_status = network_status
		self.reference = reference
		self.url = url
	}

	public enum NetworkStatusValues: String, Codable {
		case accepted = "accepted"
		case pending = "pending"
		case refused = "refused"
		case revoked = "revoked"
	}
}

public class MandateMultiUse: Codable {

	public init() {
	}
}

public class MandatePaymentMethodDetails: Codable {
	public var au_becs_debit: MandateAuBecsDebit?
	public var bacs_debit: MandateBacsDebit?
	public var card: CardMandatePaymentMethodDetails?
	public var sepa_debit: MandateSepaDebit?
	/// The type of the payment method associated with this mandate. An additional hash is included on `payment_method_details` with a name matching this value. It contains mandate information specific to the payment method.
	public var type: String

	public init(type: String, au_becs_debit: MandateAuBecsDebit? = nil, bacs_debit: MandateBacsDebit? = nil, card: CardMandatePaymentMethodDetails? = nil, sepa_debit: MandateSepaDebit? = nil) {
		self.type = type
		self.au_becs_debit = au_becs_debit
		self.bacs_debit = bacs_debit
		self.card = card
		self.sepa_debit = sepa_debit
	}
}

public class MandateSepaDebit: Codable {
	/// The unique reference of the mandate.
	public var reference: String
	/// The URL of the mandate. This URL generally contains sensitive information about the customer and should be shared with them exclusively.
	public var url: String

	public init(reference: String, url: String) {
		self.reference = reference
		self.url = url
	}
}

public class MandateSingleUse: Codable {
	/// On a single use mandate, the amount of the payment.
	public var amount: Int
	/// On a single use mandate, the currency of the payment.
	public var currency: String

	public init(amount: Int, currency: String) {
		self.amount = amount
		self.currency = currency
	}
}

public class Networks: Codable {
	/// All available networks for the card.
	public var available: [String]
	/// The preferred network for the card.
	public var preferred: String?

	public init(available: [String], preferred: String? = nil) {
		self.available = available
		self.preferred = preferred
	}
}

public class NotificationEventData: Codable {
	/// Object containing the API resource relevant to the event. For example, an `invoice.created` event will have a full [invoice object](https://stripe.com/docs/api#invoice_object) as the value of the object key.
	public var object: String
	/// Object containing the names of the attributes that have changed, and their previous values (sent along only with *.updated events).
	public var previous_attributes: String?

	public init(object: String, previous_attributes: String? = nil) {
		self.object = object
		self.previous_attributes = previous_attributes
	}
}

public class NotificationEventRequest: Codable {
	/// ID of the API request that caused the event. If null, the event was automatic (e.g., Stripe's automatic subscription handling). Request logs are available in the [dashboard](https://dashboard.stripe.com/logs), but currently not in the API.
	public var id: String?
	/// The idempotency key transmitted during the request, if any. *Note: This property is populated only for events on or after May 23, 2017*.
	public var idempotency_key: String?

	public init(id: String? = nil, idempotency_key: String? = nil) {
		self.id = id
		self.idempotency_key = idempotency_key
	}
}

public class OfflineAcceptance: Codable {

	public init() {
	}
}

public class OnlineAcceptance: Codable {
	/// The IP address from which the Mandate was accepted by the customer.
	public var ip_address: String?
	/// The user agent of the browser from which the Mandate was accepted by the customer.
	public var user_agent: String?

	public init(ip_address: String? = nil, user_agent: String? = nil) {
		self.ip_address = ip_address
		self.user_agent = user_agent
	}
}

/// Order objects are created to handle end customers' purchases of previously defined [products](https://stripe.com/docs/api#products). You can create, retrieve, and pay individual orders, as well as list all orders. Orders are identified by a unique, random ID.  Related guide: [Tax, Shipping, and Inventory](https://stripe.com/docs/orders).
public class Order: Codable {
	/// A positive integer in the smallest currency unit (that is, 100 cents for $1.00, or 1 for ¥1, Japanese Yen being a zero-decimal currency) representing the total amount for the order.
	public var amount: Int
	/// The total amount that was returned to the customer.
	public var amount_returned: Int?
	/// ID of the Connect Application that created the order.
	public var application: String?
	/// A fee in cents that will be applied to the order and transferred to the application owner’s Stripe account. The request must be made with an OAuth key or the Stripe-Account header in order to take an application fee. For more information, see the application fees documentation.
	public var application_fee: Int?
	/// The ID of the payment used to pay for the order. Present if the order status is `paid`, `fulfilled`, or `refunded`.
	public var charge: String?
	/// Time at which the object was created. Measured in seconds since the Unix epoch.
	public var created: Timestamp
	/// Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
	public var currency: String
	/// The customer used for the order.
	public var customer: String?
	/// The email address of the customer placing the order.
	public var email: String?
	/// External coupon code to load for this order.
	public var external_coupon_code: String?
	/// Unique identifier for the object.
	public var id: String
	/// List of items constituting the order. An order can have up to 25 items.
	public var items: [OrderItem]
	/// Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
	public var livemode: Bool
	/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
	public var metadata: String?
	/// String representing the object's type. Objects of the same type share the same value.
	public var object: ObjectValues
	/// A list of returns that have taken place for this order.
	public var returns: OrdersResourceOrderReturnList?
	/// The shipping method that is currently selected for this order, if any. If present, it is equal to one of the `id`s of shipping methods in the `shipping_methods` array. At order creation time, if there are multiple shipping methods, Stripe will automatically selected the first method.
	public var selected_shipping_method: String?
	/// The shipping address for the order. Present if the order is for goods to be shipped.
	public var shipping: Shipping?
	/// A list of supported shipping methods for this order. The desired shipping method can be specified either by updating the order, or when paying it.
	public var shipping_methods: [ShippingMethod]??
	/// Current order status. One of `created`, `paid`, `canceled`, `fulfilled`, or `returned`. More details in the [Orders Guide](https://stripe.com/docs/orders/guide#understanding-order-statuses).
	public var status: String
	/// The timestamps at which the order status was updated.
	public var status_transitions: StatusTransitions?
	/// Time at which the object was last updated. Measured in seconds since the Unix epoch.
	public var updated: Timestamp?
	/// The user's order ID if it is different from the Stripe order ID.
	public var upstream_id: String?

	/// Order objects are created to handle end customers' purchases of previously defined [products](https://stripe.com/docs/api#products). You can create, retrieve, and pay individual orders, as well as list all orders. Orders are identified by a unique, random ID.  Related guide: [Tax, Shipping, and Inventory](https://stripe.com/docs/orders).
	/// - Parameters:
	///   - amount: A positive integer in the smallest currency unit (that is, 100 cents for $1.00, or 1 for ¥1, Japanese Yen being a zero-decimal currency) representing the total amount for the order.
	///   - amount_returned: The total amount that was returned to the customer.
	///   - application: ID of the Connect Application that created the order.
	///   - application_fee: A fee in cents that will be applied to the order and transferred to the application owner’s Stripe account. The request must be made with an OAuth key or the Stripe-Account header in order to take an application fee. For more information, see the application fees documentation.
	///   - charge: The ID of the payment used to pay for the order. Present if the order status is `paid`, `fulfilled`, or `refunded`.
	///   - created: Time at which the object was created. Measured in seconds since the Unix epoch.
	///   - currency: Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
	///   - customer: The customer used for the order.
	///   - email: The email address of the customer placing the order.
	///   - external_coupon_code: External coupon code to load for this order.
	///   - id: Unique identifier for the object.
	///   - items: List of items constituting the order. An order can have up to 25 items.
	///   - livemode: Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
	///   - metadata: Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
	///   - object: String representing the object's type. Objects of the same type share the same value.
	///   - returns: A list of returns that have taken place for this order.
	///   - selected_shipping_method: The shipping method that is currently selected for this order, if any. If present, it is equal to one of the `id`s of shipping methods in the `shipping_methods` array. At order creation time, if there are multiple shipping methods, Stripe will automatically selected the first method.
	///   - shipping: The shipping address for the order. Present if the order is for goods to be shipped.
	///   - shipping_methods: A list of supported shipping methods for this order. The desired shipping method can be specified either by updating the order, or when paying it.
	///   - status: Current order status. One of `created`, `paid`, `canceled`, `fulfilled`, or `returned`. More details in the [Orders Guide](https://stripe.com/docs/orders/guide#understanding-order-statuses).
	///   - status_transitions: The timestamps at which the order status was updated.
	///   - updated: Time at which the object was last updated. Measured in seconds since the Unix epoch.
	///   - upstream_id: The user's order ID if it is different from the Stripe order ID.
	public init(amount: Int, created: Timestamp, currency: String, id: String, items: [OrderItem], livemode: Bool, object: ObjectValues, status: String, amount_returned: Int? = nil, application: String? = nil, application_fee: Int? = nil, charge: String? = nil, customer: String? = nil, email: String? = nil, external_coupon_code: String? = nil, metadata: String? = nil, returns: OrdersResourceOrderReturnList? = nil, selected_shipping_method: String? = nil, shipping: Shipping? = nil, shipping_methods: [ShippingMethod]?? = nil, status_transitions: StatusTransitions? = nil, updated: Timestamp? = nil, upstream_id: String? = nil) {
		self.amount = amount
		self.created = created
		self.currency = currency
		self.id = id
		self.items = items
		self.livemode = livemode
		self.object = object
		self.status = status
		self.amount_returned = amount_returned
		self.application = application
		self.application_fee = application_fee
		self.charge = charge
		self.customer = customer
		self.email = email
		self.external_coupon_code = external_coupon_code
		self.metadata = metadata
		self.returns = returns
		self.selected_shipping_method = selected_shipping_method
		self.shipping = shipping
		self.shipping_methods = shipping_methods
		self.status_transitions = status_transitions
		self.updated = updated
		self.upstream_id = upstream_id
	}


	/// A list of returns that have taken place for this order.
	public class OrdersResourceOrderReturnList: Codable {
		/// Details about each object.
		public var data: [OrderReturn]
		/// True if this list has another page of items after this one that can be fetched.
		public var has_more: Bool
		/// String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
		public var object: ObjectValues
		/// The URL where this list can be accessed.
		public var url: String

		/// A list of returns that have taken place for this order.
		/// - Parameters:
		///   - data: Details about each object.
		///   - has_more: True if this list has another page of items after this one that can be fetched.
		///   - object: String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
		///   - url: The URL where this list can be accessed.
		public init(data: [OrderReturn], has_more: Bool, object: ObjectValues, url: String) {
			self.data = data
			self.has_more = has_more
			self.object = object
			self.url = url
		}

		public enum ObjectValues: String, Codable {
			case list = "list"
		}
	}


	public enum ObjectValues: String, Codable {
		case order = "order"
	}
}

/// A representation of the constituent items of any given order. Can be used to represent [SKUs](https://stripe.com/docs/api#skus), shipping costs, or taxes owed on the order.  Related guide: [Orders](https://stripe.com/docs/orders/guide).
public class OrderItem: Codable {
	/// A positive integer in the smallest currency unit (that is, 100 cents for $1.00, or 1 for ¥1, Japanese Yen being a zero-decimal currency) representing the total amount for the line item.
	public var amount: Int
	/// Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
	public var currency: String
	/// Description of the line item, meant to be displayable to the user (e.g., `"Express shipping"`).
	public var description: String
	/// String representing the object's type. Objects of the same type share the same value.
	public var object: ObjectValues
	/// The ID of the associated object for this line item. Expandable if not null (e.g., expandable to a SKU).
	public var parent: String?
	/// A positive integer representing the number of instances of `parent` that are included in this order item. Applicable/present only if `type` is `sku`.
	public var quantity: Int?
	/// The type of line item. One of `sku`, `tax`, `shipping`, or `discount`.
	public var type: String

	/// A representation of the constituent items of any given order. Can be used to represent [SKUs](https://stripe.com/docs/api#skus), shipping costs, or taxes owed on the order.  Related guide: [Orders](https://stripe.com/docs/orders/guide).
	/// - Parameters:
	///   - amount: A positive integer in the smallest currency unit (that is, 100 cents for $1.00, or 1 for ¥1, Japanese Yen being a zero-decimal currency) representing the total amount for the line item.
	///   - currency: Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
	///   - description: Description of the line item, meant to be displayable to the user (e.g., `"Express shipping"`).
	///   - object: String representing the object's type. Objects of the same type share the same value.
	///   - parent: The ID of the associated object for this line item. Expandable if not null (e.g., expandable to a SKU).
	///   - quantity: A positive integer representing the number of instances of `parent` that are included in this order item. Applicable/present only if `type` is `sku`.
	///   - type: The type of line item. One of `sku`, `tax`, `shipping`, or `discount`.
	public init(amount: Int, currency: String, description: String, object: ObjectValues, type: String, parent: String? = nil, quantity: Int? = nil) {
		self.amount = amount
		self.currency = currency
		self.description = description
		self.object = object
		self.type = type
		self.parent = parent
		self.quantity = quantity
	}

	public enum ObjectValues: String, Codable {
		case orderItem = "order_item"
	}
}

/// A return represents the full or partial return of a number of [order items](https://stripe.com/docs/api#order_items). Returns always belong to an order, and may optionally contain a refund.  Related guide: [Handling Returns](https://stripe.com/docs/orders/guide#handling-returns).
public class OrderReturn: Codable {
	/// A positive integer in the smallest currency unit (that is, 100 cents for $1.00, or 1 for ¥1, Japanese Yen being a zero-decimal currency) representing the total amount for the returned line item.
	public var amount: Int
	/// Time at which the object was created. Measured in seconds since the Unix epoch.
	public var created: Timestamp
	/// Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
	public var currency: String
	/// Unique identifier for the object.
	public var id: String
	/// The items included in this order return.
	public var items: [OrderItem]
	/// Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
	public var livemode: Bool
	/// String representing the object's type. Objects of the same type share the same value.
	public var object: ObjectValues
	/// The order that this return includes items from.
	public var order: String?
	/// The ID of the refund issued for this return.
	public var refund: String?

	/// A return represents the full or partial return of a number of [order items](https://stripe.com/docs/api#order_items). Returns always belong to an order, and may optionally contain a refund.  Related guide: [Handling Returns](https://stripe.com/docs/orders/guide#handling-returns).
	/// - Parameters:
	///   - amount: A positive integer in the smallest currency unit (that is, 100 cents for $1.00, or 1 for ¥1, Japanese Yen being a zero-decimal currency) representing the total amount for the returned line item.
	///   - created: Time at which the object was created. Measured in seconds since the Unix epoch.
	///   - currency: Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
	///   - id: Unique identifier for the object.
	///   - items: The items included in this order return.
	///   - livemode: Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
	///   - object: String representing the object's type. Objects of the same type share the same value.
	///   - order: The order that this return includes items from.
	///   - refund: The ID of the refund issued for this return.
	public init(amount: Int, created: Timestamp, currency: String, id: String, items: [OrderItem], livemode: Bool, object: ObjectValues, order: String? = nil, refund: String? = nil) {
		self.amount = amount
		self.created = created
		self.currency = currency
		self.id = id
		self.items = items
		self.livemode = livemode
		self.object = object
		self.order = order
		self.refund = refund
	}

	public enum ObjectValues: String, Codable {
		case orderReturn = "order_return"
	}
}

public class PackageDimensions: Codable {
	/// Height, in inches.
	public var height: StringNumber
	/// Length, in inches.
	public var length: StringNumber
	/// Weight, in ounces.
	public var weight: StringNumber
	/// Width, in inches.
	public var width: StringNumber

	public init(height: StringNumber, length: StringNumber, weight: StringNumber, width: StringNumber) {
		self.height = height
		self.length = length
		self.weight = weight
		self.width = width
	}
}

public class PaymentFlowsPrivatePaymentMethodsAlipay: Codable {

	public init() {
	}
}

public class PaymentFlowsPrivatePaymentMethodsAlipayDetails: Codable {
	/// Uniquely identifies this particular Alipay account. You can use this attribute to check whether two Alipay accounts are the same.
	public var fingerprint: String?
	/// Transaction ID of this particular Alipay transaction.
	public var transaction_id: String?

	public init(fingerprint: String? = nil, transaction_id: String? = nil) {
		self.fingerprint = fingerprint
		self.transaction_id = transaction_id
	}
}

/// A PaymentIntent guides you through the process of collecting a payment from your customer. We recommend that you create exactly one PaymentIntent for each order or customer session in your system. You can reference the PaymentIntent later to see the history of payment attempts for a particular session.  A PaymentIntent transitions through [multiple statuses](https://stripe.com/docs/payments/intents#intent-statuses) throughout its lifetime as it interfaces with Stripe.js to perform authentication flows and ultimately creates at most one successful charge.  Related guide: [Payment Intents API](https://stripe.com/docs/payments/payment-intents).
public class PaymentIntent: Codable {
	/// Amount intended to be collected by this PaymentIntent. A positive integer representing how much to charge in the [smallest currency unit](https://stripe.com/docs/currencies#zero-decimal) (e.g., 100 cents to charge $1.00 or 100 to charge ¥100, a zero-decimal currency). The minimum amount is $0.50 US or [equivalent in charge currency](https://stripe.com/docs/currencies#minimum-and-maximum-charge-amounts). The amount value supports up to eight digits (e.g., a value of 99999999 for a USD charge of $999,999.99).
	public var amount: Int
	/// Amount that can be captured from this PaymentIntent.
	public var amount_capturable: Int?
	/// Amount that was collected by this PaymentIntent.
	public var amount_received: Int?
	/// ID of the Connect application that created the PaymentIntent.
	public var application: String?
	/// The amount of the application fee (if any) that will be requested to be applied to the payment and transferred to the application owner's Stripe account. The amount of the application fee collected will be capped at the total payment amount. For more information, see the PaymentIntents [use case for connected accounts](https://stripe.com/docs/payments/connected-accounts).
	public var application_fee_amount: Int?
	/// Populated when `status` is `canceled`, this is the time at which the PaymentIntent was canceled. Measured in seconds since the Unix epoch.
	public var canceled_at: Timestamp?
	/// Reason for cancellation of this PaymentIntent, either user-provided (`duplicate`, `fraudulent`, `requested_by_customer`, or `abandoned`) or generated by Stripe internally (`failed_invoice`, `void_invoice`, or `automatic`).
	public var cancellation_reason: CancellationReasonValues?
	/// Controls when the funds will be captured from the customer's account.
	public var capture_method: CaptureMethodValues
	/// Charges that were created by this PaymentIntent, if any.
	public var charges: PaymentFlowsPaymentIntentResourceChargeList?
	/// The client secret of this PaymentIntent. Used for client-side retrieval using a publishable key.   The client secret can be used to complete a payment from your frontend. It should not be stored, logged, embedded in URLs, or exposed to anyone other than the customer. Make sure that you have TLS enabled on any page that includes the client secret.  Refer to our docs to [accept a payment](https://stripe.com/docs/payments/accept-a-payment?integration=elements) and learn about how `client_secret` should be handled.
	public var client_secret: String?
	public var confirmation_method: ConfirmationMethodValues
	/// Time at which the object was created. Measured in seconds since the Unix epoch.
	public var created: Timestamp
	/// Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
	public var currency: String
	/// ID of the Customer this PaymentIntent belongs to, if one exists.  Payment methods attached to other Customers cannot be used with this PaymentIntent.  If present in combination with [setup_future_usage](https://stripe.com/docs/api#payment_intent_object-setup_future_usage), this PaymentIntent's payment method will be attached to the Customer after the PaymentIntent has been confirmed and any required actions from the user are complete.
	public var customer: String?
	/// An arbitrary string attached to the object. Often useful for displaying to users.
	public var description: String?
	/// Unique identifier for the object.
	public var id: String
	/// ID of the invoice that created this PaymentIntent, if it exists.
	public var invoice: String?
	/// The payment error encountered in the previous PaymentIntent confirmation. It will be cleared if the PaymentIntent is later updated for any reason.
	public var last_payment_error: ApiErrors?
	/// Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
	public var livemode: Bool
	/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. For more information, see the [documentation](https://stripe.com/docs/payments/payment-intents/creating-payment-intents#storing-information-in-metadata).
	public var metadata: String?
	/// If present, this property tells you what actions you need to take in order for your customer to fulfill a payment using the provided source.
	public var next_action: PaymentIntentNextAction?
	/// String representing the object's type. Objects of the same type share the same value.
	public var object: ObjectValues
	/// The account (if any) for which the funds of the PaymentIntent are intended. See the PaymentIntents [use case for connected accounts](https://stripe.com/docs/payments/connected-accounts) for details.
	public var on_behalf_of: String?
	/// ID of the payment method used in this PaymentIntent.
	public var payment_method: String?
	/// Payment-method-specific configuration for this PaymentIntent.
	public var payment_method_options: PaymentIntentPaymentMethodOptions?
	/// The list of payment method types (e.g. card) that this PaymentIntent is allowed to use.
	public var payment_method_types: [String]
	/// Email address that the receipt for the resulting payment will be sent to. If `receipt_email` is specified for a payment in live mode, a receipt will be sent regardless of your [email settings](https://dashboard.stripe.com/account/emails).
	public var receipt_email: String?
	/// ID of the review associated with this PaymentIntent, if any.
	public var review: String?
	/// Indicates that you intend to make future payments with this PaymentIntent's payment method.  Providing this parameter will [attach the payment method](https://stripe.com/docs/payments/save-during-payment) to the PaymentIntent's Customer, if present, after the PaymentIntent is confirmed and any required actions from the user are complete. If no Customer was provided, the payment method can still be [attached](https://stripe.com/docs/api/payment_methods/attach) to a Customer after the transaction completes.  When processing card payments, Stripe also uses `setup_future_usage` to dynamically optimize your payment flow and comply with regional legislation and network rules, such as [SCA](https://stripe.com/docs/strong-customer-authentication).
	public var setup_future_usage: SetupFutureUsageValues?
	/// Shipping information for this PaymentIntent.
	public var shipping: Shipping?
	/// For non-card charges, you can use this value as the complete description that appears on your customers’ statements. Must contain at least one letter, maximum 22 characters.
	public var statement_descriptor: String?
	/// Provides information about a card payment that customers see on their statements. Concatenated with the prefix (shortened descriptor) or statement descriptor that’s set on the account to form the complete statement descriptor. Maximum 22 characters for the concatenated descriptor.
	public var statement_descriptor_suffix: String?
	/// Status of this PaymentIntent, one of `requires_payment_method`, `requires_confirmation`, `requires_action`, `processing`, `requires_capture`, `canceled`, or `succeeded`. Read more about each PaymentIntent [status](https://stripe.com/docs/payments/intents#intent-statuses).
	public var status: StatusValues
	/// The data with which to automatically create a Transfer when the payment is finalized. See the PaymentIntents [use case for connected accounts](https://stripe.com/docs/payments/connected-accounts) for details.
	public var transfer_data: TransferData?
	/// A string that identifies the resulting payment as part of a group. See the PaymentIntents [use case for connected accounts](https://stripe.com/docs/payments/connected-accounts) for details.
	public var transfer_group: String?

	/// A PaymentIntent guides you through the process of collecting a payment from your customer. We recommend that you create exactly one PaymentIntent for each order or customer session in your system. You can reference the PaymentIntent later to see the history of payment attempts for a particular session.  A PaymentIntent transitions through [multiple statuses](https://stripe.com/docs/payments/intents#intent-statuses) throughout its lifetime as it interfaces with Stripe.js to perform authentication flows and ultimately creates at most one successful charge.  Related guide: [Payment Intents API](https://stripe.com/docs/payments/payment-intents).
	/// - Parameters:
	///   - amount: Amount intended to be collected by this PaymentIntent. A positive integer representing how much to charge in the [smallest currency unit](https://stripe.com/docs/currencies#zero-decimal) (e.g., 100 cents to charge $1.00 or 100 to charge ¥100, a zero-decimal currency). The minimum amount is $0.50 US or [equivalent in charge currency](https://stripe.com/docs/currencies#minimum-and-maximum-charge-amounts). The amount value supports up to eight digits (e.g., a value of 99999999 for a USD charge of $999,999.99).
	///   - amount_capturable: Amount that can be captured from this PaymentIntent.
	///   - amount_received: Amount that was collected by this PaymentIntent.
	///   - application: ID of the Connect application that created the PaymentIntent.
	///   - application_fee_amount: The amount of the application fee (if any) that will be requested to be applied to the payment and transferred to the application owner's Stripe account. The amount of the application fee collected will be capped at the total payment amount. For more information, see the PaymentIntents [use case for connected accounts](https://stripe.com/docs/payments/connected-accounts).
	///   - canceled_at: Populated when `status` is `canceled`, this is the time at which the PaymentIntent was canceled. Measured in seconds since the Unix epoch.
	///   - cancellation_reason: Reason for cancellation of this PaymentIntent, either user-provided (`duplicate`, `fraudulent`, `requested_by_customer`, or `abandoned`) or generated by Stripe internally (`failed_invoice`, `void_invoice`, or `automatic`).
	///   - capture_method: Controls when the funds will be captured from the customer's account.
	///   - charges: Charges that were created by this PaymentIntent, if any.
	///   - client_secret: The client secret of this PaymentIntent. Used for client-side retrieval using a publishable key.   The client secret can be used to complete a payment from your frontend. It should not be stored, logged, embedded in URLs, or exposed to anyone other than the customer. Make sure that you have TLS enabled on any page that includes the client secret.  Refer to our docs to [accept a payment](https://stripe.com/docs/payments/accept-a-payment?integration=elements) and learn about how `client_secret` should be handled.
	///   - confirmation_method: 
	///   - created: Time at which the object was created. Measured in seconds since the Unix epoch.
	///   - currency: Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
	///   - customer: ID of the Customer this PaymentIntent belongs to, if one exists.  Payment methods attached to other Customers cannot be used with this PaymentIntent.  If present in combination with [setup_future_usage](https://stripe.com/docs/api#payment_intent_object-setup_future_usage), this PaymentIntent's payment method will be attached to the Customer after the PaymentIntent has been confirmed and any required actions from the user are complete.
	///   - description: An arbitrary string attached to the object. Often useful for displaying to users.
	///   - id: Unique identifier for the object.
	///   - invoice: ID of the invoice that created this PaymentIntent, if it exists.
	///   - last_payment_error: The payment error encountered in the previous PaymentIntent confirmation. It will be cleared if the PaymentIntent is later updated for any reason.
	///   - livemode: Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
	///   - metadata: Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. For more information, see the [documentation](https://stripe.com/docs/payments/payment-intents/creating-payment-intents#storing-information-in-metadata).
	///   - next_action: If present, this property tells you what actions you need to take in order for your customer to fulfill a payment using the provided source.
	///   - object: String representing the object's type. Objects of the same type share the same value.
	///   - on_behalf_of: The account (if any) for which the funds of the PaymentIntent are intended. See the PaymentIntents [use case for connected accounts](https://stripe.com/docs/payments/connected-accounts) for details.
	///   - payment_method: ID of the payment method used in this PaymentIntent.
	///   - payment_method_options: Payment-method-specific configuration for this PaymentIntent.
	///   - payment_method_types: The list of payment method types (e.g. card) that this PaymentIntent is allowed to use.
	///   - receipt_email: Email address that the receipt for the resulting payment will be sent to. If `receipt_email` is specified for a payment in live mode, a receipt will be sent regardless of your [email settings](https://dashboard.stripe.com/account/emails).
	///   - review: ID of the review associated with this PaymentIntent, if any.
	///   - setup_future_usage: Indicates that you intend to make future payments with this PaymentIntent's payment method.  Providing this parameter will [attach the payment method](https://stripe.com/docs/payments/save-during-payment) to the PaymentIntent's Customer, if present, after the PaymentIntent is confirmed and any required actions from the user are complete. If no Customer was provided, the payment method can still be [attached](https://stripe.com/docs/api/payment_methods/attach) to a Customer after the transaction completes.  When processing card payments, Stripe also uses `setup_future_usage` to dynamically optimize your payment flow and comply with regional legislation and network rules, such as [SCA](https://stripe.com/docs/strong-customer-authentication).
	///   - shipping: Shipping information for this PaymentIntent.
	///   - statement_descriptor: For non-card charges, you can use this value as the complete description that appears on your customers’ statements. Must contain at least one letter, maximum 22 characters.
	///   - statement_descriptor_suffix: Provides information about a card payment that customers see on their statements. Concatenated with the prefix (shortened descriptor) or statement descriptor that’s set on the account to form the complete statement descriptor. Maximum 22 characters for the concatenated descriptor.
	///   - status: Status of this PaymentIntent, one of `requires_payment_method`, `requires_confirmation`, `requires_action`, `processing`, `requires_capture`, `canceled`, or `succeeded`. Read more about each PaymentIntent [status](https://stripe.com/docs/payments/intents#intent-statuses).
	///   - transfer_data: The data with which to automatically create a Transfer when the payment is finalized. See the PaymentIntents [use case for connected accounts](https://stripe.com/docs/payments/connected-accounts) for details.
	///   - transfer_group: A string that identifies the resulting payment as part of a group. See the PaymentIntents [use case for connected accounts](https://stripe.com/docs/payments/connected-accounts) for details.
	public init(amount: Int, capture_method: CaptureMethodValues, confirmation_method: ConfirmationMethodValues, created: Timestamp, currency: String, id: String, livemode: Bool, object: ObjectValues, payment_method_types: [String], status: StatusValues, amount_capturable: Int? = nil, amount_received: Int? = nil, application: String? = nil, application_fee_amount: Int? = nil, canceled_at: Timestamp? = nil, cancellation_reason: CancellationReasonValues? = nil, charges: PaymentFlowsPaymentIntentResourceChargeList? = nil, client_secret: String? = nil, customer: String? = nil, description: String? = nil, invoice: String? = nil, last_payment_error: ApiErrors? = nil, metadata: String? = nil, next_action: PaymentIntentNextAction? = nil, on_behalf_of: String? = nil, payment_method: String? = nil, payment_method_options: PaymentIntentPaymentMethodOptions? = nil, receipt_email: String? = nil, review: String? = nil, setup_future_usage: SetupFutureUsageValues? = nil, shipping: Shipping? = nil, statement_descriptor: String? = nil, statement_descriptor_suffix: String? = nil, transfer_data: TransferData? = nil, transfer_group: String? = nil) {
		self.amount = amount
		self.capture_method = capture_method
		self.confirmation_method = confirmation_method
		self.created = created
		self.currency = currency
		self.id = id
		self.livemode = livemode
		self.object = object
		self.payment_method_types = payment_method_types
		self.status = status
		self.amount_capturable = amount_capturable
		self.amount_received = amount_received
		self.application = application
		self.application_fee_amount = application_fee_amount
		self.canceled_at = canceled_at
		self.cancellation_reason = cancellation_reason
		self.charges = charges
		self.client_secret = client_secret
		self.customer = customer
		self.description = description
		self.invoice = invoice
		self.last_payment_error = last_payment_error
		self.metadata = metadata
		self.next_action = next_action
		self.on_behalf_of = on_behalf_of
		self.payment_method = payment_method
		self.payment_method_options = payment_method_options
		self.receipt_email = receipt_email
		self.review = review
		self.setup_future_usage = setup_future_usage
		self.shipping = shipping
		self.statement_descriptor = statement_descriptor
		self.statement_descriptor_suffix = statement_descriptor_suffix
		self.transfer_data = transfer_data
		self.transfer_group = transfer_group
	}


	/// Charges that were created by this PaymentIntent, if any.
	public class PaymentFlowsPaymentIntentResourceChargeList: Codable {
		/// This list only contains the latest charge, even if there were previously multiple unsuccessful charges. To view all previous charges for a PaymentIntent, you can filter the charges list using the `payment_intent` [parameter](https://stripe.com/docs/api/charges/list#list_charges-payment_intent).
		public var data: [Charge]
		/// True if this list has another page of items after this one that can be fetched.
		public var has_more: Bool
		/// String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
		public var object: ObjectValues
		/// The URL where this list can be accessed.
		public var url: String

		/// Charges that were created by this PaymentIntent, if any.
		/// - Parameters:
		///   - data: This list only contains the latest charge, even if there were previously multiple unsuccessful charges. To view all previous charges for a PaymentIntent, you can filter the charges list using the `payment_intent` [parameter](https://stripe.com/docs/api/charges/list#list_charges-payment_intent).
		///   - has_more: True if this list has another page of items after this one that can be fetched.
		///   - object: String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
		///   - url: The URL where this list can be accessed.
		public init(data: [Charge], has_more: Bool, object: ObjectValues, url: String) {
			self.data = data
			self.has_more = has_more
			self.object = object
			self.url = url
		}

		public enum ObjectValues: String, Codable {
			case list = "list"
		}
	}


	public enum CancellationReasonValues: String, Codable {
		case abandoned = "abandoned"
		case automatic = "automatic"
		case duplicate = "duplicate"
		case failedInvoice = "failed_invoice"
		case fraudulent = "fraudulent"
		case requestedByCustomer = "requested_by_customer"
		case voidInvoice = "void_invoice"
	}

	public enum ConfirmationMethodValues: String, Codable {
		case automatic = "automatic"
		case manual = "manual"
	}

	public enum CaptureMethodValues: String, Codable {
		case automatic = "automatic"
		case manual = "manual"
	}

	public enum ObjectValues: String, Codable {
		case paymentIntent = "payment_intent"
	}

	public enum StatusValues: String, Codable {
		case canceled = "canceled"
		case processing = "processing"
		case requiresAction = "requires_action"
		case requiresCapture = "requires_capture"
		case requiresConfirmation = "requires_confirmation"
		case requiresPaymentMethod = "requires_payment_method"
		case succeeded = "succeeded"
	}

	public enum SetupFutureUsageValues: String, Codable {
		case offSession = "off_session"
		case onSession = "on_session"
	}
}

public class PaymentIntentNextAction: Codable {
	public var alipay_handle_redirect: PaymentIntentNextActionAlipayHandleRedirect?
	public var oxxo_display_details: PaymentIntentNextActionDisplayOxxoDetails?
	public var redirect_to_url: PaymentIntentNextActionRedirectToUrl?
	/// Type of the next action to perform, one of `redirect_to_url` or `use_stripe_sdk`.
	public var type: String
	/// When confirming a PaymentIntent with Stripe.js, Stripe.js depends on the contents of this dictionary to invoke authentication flows. The shape of the contents is subject to change and is only intended to be used by Stripe.js.
	public var use_stripe_sdk: String?

	public init(type: String, alipay_handle_redirect: PaymentIntentNextActionAlipayHandleRedirect? = nil, oxxo_display_details: PaymentIntentNextActionDisplayOxxoDetails? = nil, redirect_to_url: PaymentIntentNextActionRedirectToUrl? = nil, use_stripe_sdk: String? = nil) {
		self.type = type
		self.alipay_handle_redirect = alipay_handle_redirect
		self.oxxo_display_details = oxxo_display_details
		self.redirect_to_url = redirect_to_url
		self.use_stripe_sdk = use_stripe_sdk
	}
}

public class PaymentIntentNextActionAlipayHandleRedirect: Codable {
	/// The native data to be used with Alipay SDK you must redirect your customer to in order to authenticate the payment in an Android App.
	public var native_data: String?
	/// The native URL you must redirect your customer to in order to authenticate the payment in an iOS App.
	public var native_url: String?
	/// If the customer does not exit their browser while authenticating, they will be redirected to this specified URL after completion.
	public var return_url: String?
	/// The URL you must redirect your customer to in order to authenticate the payment.
	public var url: String?

	public init(native_data: String? = nil, native_url: String? = nil, return_url: String? = nil, url: String? = nil) {
		self.native_data = native_data
		self.native_url = native_url
		self.return_url = return_url
		self.url = url
	}
}

public class PaymentIntentNextActionDisplayOxxoDetails: Codable {
	/// The timestamp after which the OXXO voucher expires.
	public var expires_after: Timestamp?
	/// The URL for the hosted OXXO voucher page, which allows customers to view and print an OXXO voucher.
	public var hosted_voucher_url: String?
	/// OXXO reference number.
	public var number: String?

	public init(expires_after: Timestamp? = nil, hosted_voucher_url: String? = nil, number: String? = nil) {
		self.expires_after = expires_after
		self.hosted_voucher_url = hosted_voucher_url
		self.number = number
	}
}

public class PaymentIntentNextActionRedirectToUrl: Codable {
	/// If the customer does not exit their browser while authenticating, they will be redirected to this specified URL after completion.
	public var return_url: String?
	/// The URL you must redirect your customer to in order to authenticate the payment.
	public var url: String?

	public init(return_url: String? = nil, url: String? = nil) {
		self.return_url = return_url
		self.url = url
	}
}

public class PaymentIntentPaymentMethodOptions: Codable {
	public var alipay: PaymentMethodOptionsAlipay?
	public var bancontact: PaymentMethodOptionsBancontact?
	public var card: PaymentIntentPaymentMethodOptionsCard?
	public var oxxo: PaymentMethodOptionsOxxo?
	public var p24: PaymentMethodOptionsP24?
	public var sepa_debit: PaymentIntentPaymentMethodOptionsSepaDebit?
	public var sofort: PaymentMethodOptionsSofort?

	public init(alipay: PaymentMethodOptionsAlipay? = nil, bancontact: PaymentMethodOptionsBancontact? = nil, card: PaymentIntentPaymentMethodOptionsCard? = nil, oxxo: PaymentMethodOptionsOxxo? = nil, p24: PaymentMethodOptionsP24? = nil, sepa_debit: PaymentIntentPaymentMethodOptionsSepaDebit? = nil, sofort: PaymentMethodOptionsSofort? = nil) {
		self.alipay = alipay
		self.bancontact = bancontact
		self.card = card
		self.oxxo = oxxo
		self.p24 = p24
		self.sepa_debit = sepa_debit
		self.sofort = sofort
	}
}

public class PaymentIntentPaymentMethodOptionsCard: Codable {
	/// Installment details for this payment (Mexico only).  For more information, see the [installments integration guide](https://stripe.com/docs/payments/installments).
	public var installments: PaymentMethodOptionsCardInstallments?
	/// Selected network to process this PaymentIntent on. Depends on the available networks of the card attached to the PaymentIntent. Can be only set confirm-time.
	public var network: NetworkValues?
	/// We strongly recommend that you rely on our SCA Engine to automatically prompt your customers for authentication based on risk level and [other requirements](https://stripe.com/docs/strong-customer-authentication). However, if you wish to request 3D Secure based on logic from your own fraud engine, provide this option. Permitted values include: `automatic` or `any`. If not provided, defaults to `automatic`. Read our guide on [manually requesting 3D Secure](https://stripe.com/docs/payments/3d-secure#manual-three-ds) for more information on how this configuration interacts with Radar and our SCA Engine.
	public var request_three_d_secure: RequestThreeDSecureValues?

	public init(installments: PaymentMethodOptionsCardInstallments? = nil, network: NetworkValues? = nil, request_three_d_secure: RequestThreeDSecureValues? = nil) {
		self.installments = installments
		self.network = network
		self.request_three_d_secure = request_three_d_secure
	}

	public enum RequestThreeDSecureValues: String, Codable {
		case any = "any"
		case automatic = "automatic"
		case challengeOnly = "challenge_only"
	}

	public enum NetworkValues: String, Codable {
		case amex = "amex"
		case cartesBancaires = "cartes_bancaires"
		case diners = "diners"
		case discover = "discover"
		case interac = "interac"
		case jcb = "jcb"
		case mastercard = "mastercard"
		case unionpay = "unionpay"
		case unknown = "unknown"
		case visa = "visa"
	}
}

public class PaymentIntentPaymentMethodOptionsMandateOptionsSepaDebit: Codable {

	public init() {
	}
}

public class PaymentIntentPaymentMethodOptionsSepaDebit: Codable {
	public var mandate_options: PaymentIntentPaymentMethodOptionsMandateOptionsSepaDebit?

	public init(mandate_options: PaymentIntentPaymentMethodOptionsMandateOptionsSepaDebit? = nil) {
		self.mandate_options = mandate_options
	}
}

/// PaymentMethod objects represent your customer's payment instruments. They can be used with [PaymentIntents](https://stripe.com/docs/payments/payment-intents) to collect payments or saved to Customer objects to store instrument details for future payments.  Related guides: [Payment Methods](https://stripe.com/docs/payments/payment-methods) and [More Payment Scenarios](https://stripe.com/docs/payments/more-payment-scenarios).
public class PaymentMethod: Codable {
	public var alipay: PaymentFlowsPrivatePaymentMethodsAlipay?
	public var au_becs_debit: PaymentMethodAuBecsDebit?
	public var bacs_debit: PaymentMethodBacsDebit?
	public var bancontact: PaymentMethodBancontact?
	public var billing_details: BillingDetails
	public var card: PaymentMethodCard?
	public var card_present: PaymentMethodCardPresent?
	/// Time at which the object was created. Measured in seconds since the Unix epoch.
	public var created: Timestamp
	/// The ID of the Customer to which this PaymentMethod is saved. This will not be set when the PaymentMethod has not been saved to a Customer.
	public var customer: String?
	public var eps: PaymentMethodEps?
	public var fpx: PaymentMethodFpx?
	public var giropay: PaymentMethodGiropay?
	public var grabpay: PaymentMethodGrabpay?
	/// Unique identifier for the object.
	public var id: String
	public var ideal: PaymentMethodIdeal?
	public var interac_present: PaymentMethodInteracPresent?
	/// Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
	public var livemode: Bool
	/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
	public var metadata: String?
	/// String representing the object's type. Objects of the same type share the same value.
	public var object: ObjectValues
	public var oxxo: PaymentMethodOxxo?
	public var p24: PaymentMethodP24?
	public var sepa_debit: PaymentMethodSepaDebit?
	public var sofort: PaymentMethodSofort?
	/// The type of the PaymentMethod. An additional hash is included on the PaymentMethod with a name matching this value. It contains additional information specific to the PaymentMethod type.
	public var type: TypeValues

	/// PaymentMethod objects represent your customer's payment instruments. They can be used with [PaymentIntents](https://stripe.com/docs/payments/payment-intents) to collect payments or saved to Customer objects to store instrument details for future payments.  Related guides: [Payment Methods](https://stripe.com/docs/payments/payment-methods) and [More Payment Scenarios](https://stripe.com/docs/payments/more-payment-scenarios).
	/// - Parameters:
	///   - billing_details: 
	///   - created: Time at which the object was created. Measured in seconds since the Unix epoch.
	///   - customer: The ID of the Customer to which this PaymentMethod is saved. This will not be set when the PaymentMethod has not been saved to a Customer.
	///   - id: Unique identifier for the object.
	///   - livemode: Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
	///   - metadata: Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
	///   - object: String representing the object's type. Objects of the same type share the same value.
	///   - type: The type of the PaymentMethod. An additional hash is included on the PaymentMethod with a name matching this value. It contains additional information specific to the PaymentMethod type.
	public init(billing_details: BillingDetails, created: Timestamp, id: String, livemode: Bool, object: ObjectValues, type: TypeValues, alipay: PaymentFlowsPrivatePaymentMethodsAlipay? = nil, au_becs_debit: PaymentMethodAuBecsDebit? = nil, bacs_debit: PaymentMethodBacsDebit? = nil, bancontact: PaymentMethodBancontact? = nil, card: PaymentMethodCard? = nil, card_present: PaymentMethodCardPresent? = nil, customer: String? = nil, eps: PaymentMethodEps? = nil, fpx: PaymentMethodFpx? = nil, giropay: PaymentMethodGiropay? = nil, grabpay: PaymentMethodGrabpay? = nil, ideal: PaymentMethodIdeal? = nil, interac_present: PaymentMethodInteracPresent? = nil, metadata: String? = nil, oxxo: PaymentMethodOxxo? = nil, p24: PaymentMethodP24? = nil, sepa_debit: PaymentMethodSepaDebit? = nil, sofort: PaymentMethodSofort? = nil) {
		self.billing_details = billing_details
		self.created = created
		self.id = id
		self.livemode = livemode
		self.object = object
		self.type = type
		self.alipay = alipay
		self.au_becs_debit = au_becs_debit
		self.bacs_debit = bacs_debit
		self.bancontact = bancontact
		self.card = card
		self.card_present = card_present
		self.customer = customer
		self.eps = eps
		self.fpx = fpx
		self.giropay = giropay
		self.grabpay = grabpay
		self.ideal = ideal
		self.interac_present = interac_present
		self.metadata = metadata
		self.oxxo = oxxo
		self.p24 = p24
		self.sepa_debit = sepa_debit
		self.sofort = sofort
	}

	public enum TypeValues: String, Codable {
		case alipay = "alipay"
		case auBecsDebit = "au_becs_debit"
		case bacsDebit = "bacs_debit"
		case bancontact = "bancontact"
		case card = "card"
		case cardPresent = "card_present"
		case eps = "eps"
		case fpx = "fpx"
		case giropay = "giropay"
		case grabpay = "grabpay"
		case ideal = "ideal"
		case interacPresent = "interac_present"
		case oxxo = "oxxo"
		case p24 = "p24"
		case sepaDebit = "sepa_debit"
		case sofort = "sofort"
	}

	public enum ObjectValues: String, Codable {
		case paymentMethod = "payment_method"
	}
}

public class PaymentMethodAuBecsDebit: Codable {
	/// Six-digit number identifying bank and branch associated with this bank account.
	public var bsb_number: String?
	/// Uniquely identifies this particular bank account. You can use this attribute to check whether two bank accounts are the same.
	public var fingerprint: String?
	/// Last four digits of the bank account number.
	public var last4: String?

	public init(bsb_number: String? = nil, fingerprint: String? = nil, last4: String? = nil) {
		self.bsb_number = bsb_number
		self.fingerprint = fingerprint
		self.last4 = last4
	}
}

public class PaymentMethodBacsDebit: Codable {
	/// Uniquely identifies this particular bank account. You can use this attribute to check whether two bank accounts are the same.
	public var fingerprint: String?
	/// Last four digits of the bank account number.
	public var last4: String?
	/// Sort code of the bank account. (e.g., `10-20-30`)
	public var sort_code: String?

	public init(fingerprint: String? = nil, last4: String? = nil, sort_code: String? = nil) {
		self.fingerprint = fingerprint
		self.last4 = last4
		self.sort_code = sort_code
	}
}

public class PaymentMethodBancontact: Codable {

	public init() {
	}
}

public class PaymentMethodCard: Codable {
	/// Card brand. Can be `amex`, `diners`, `discover`, `jcb`, `mastercard`, `unionpay`, `visa`, or `unknown`.
	public var brand: String
	/// Checks on Card address and CVC if provided.
	public var checks: PaymentMethodCardChecks?
	/// Two-letter ISO code representing the country of the card. You could use this attribute to get a sense of the international breakdown of cards you've collected.
	public var country: String?
	/// Two-digit number representing the card's expiration month.
	public var exp_month: Int
	/// Four-digit number representing the card's expiration year.
	public var exp_year: Int
	/// Uniquely identifies this particular card number. You can use this attribute to check whether two customers who’ve signed up with you are using the same card number, for example. For payment methods that tokenize card information (Apple Pay, Google Pay), the tokenized number might be provided instead of the underlying card number.
	public var fingerprint: String?
	/// Card funding type. Can be `credit`, `debit`, `prepaid`, or `unknown`.
	public var funding: String
	/// Details of the original PaymentMethod that created this object.
	public var generated_from: PaymentMethodCardGeneratedCard?
	/// The last four digits of the card.
	public var last4: String
	/// Contains information about card networks that can be used to process the payment.
	public var networks: Networks?
	/// Contains details on how this Card maybe be used for 3D Secure authentication.
	public var three_d_secure_usage: ThreeDSecureUsage?
	/// If this Card is part of a card wallet, this contains the details of the card wallet.
	public var wallet: PaymentMethodCardWallet?

	public init(brand: String, exp_month: Int, exp_year: Int, funding: String, last4: String, checks: PaymentMethodCardChecks? = nil, country: String? = nil, fingerprint: String? = nil, generated_from: PaymentMethodCardGeneratedCard? = nil, networks: Networks? = nil, three_d_secure_usage: ThreeDSecureUsage? = nil, wallet: PaymentMethodCardWallet? = nil) {
		self.brand = brand
		self.exp_month = exp_month
		self.exp_year = exp_year
		self.funding = funding
		self.last4 = last4
		self.checks = checks
		self.country = country
		self.fingerprint = fingerprint
		self.generated_from = generated_from
		self.networks = networks
		self.three_d_secure_usage = three_d_secure_usage
		self.wallet = wallet
	}
}

public class PaymentMethodCardChecks: Codable {
	/// If a address line1 was provided, results of the check, one of `pass`, `fail`, `unavailable`, or `unchecked`.
	public var address_line1_check: String?
	/// If a address postal code was provided, results of the check, one of `pass`, `fail`, `unavailable`, or `unchecked`.
	public var address_postal_code_check: String?
	/// If a CVC was provided, results of the check, one of `pass`, `fail`, `unavailable`, or `unchecked`.
	public var cvc_check: String?

	public init(address_line1_check: String? = nil, address_postal_code_check: String? = nil, cvc_check: String? = nil) {
		self.address_line1_check = address_line1_check
		self.address_postal_code_check = address_postal_code_check
		self.cvc_check = cvc_check
	}
}

public class PaymentMethodCardGeneratedCard: Codable {
	/// The charge that created this object.
	public var charge: String?
	/// Transaction-specific details of the payment method used in the payment.
	public var payment_method_details: CardGeneratedFromPaymentMethodDetails?
	/// The ID of the SetupAttempt that generated this PaymentMethod, if any.
	public var setup_attempt: String?

	public init(charge: String? = nil, payment_method_details: CardGeneratedFromPaymentMethodDetails? = nil, setup_attempt: String? = nil) {
		self.charge = charge
		self.payment_method_details = payment_method_details
		self.setup_attempt = setup_attempt
	}
}

public class PaymentMethodCardPresent: Codable {

	public init() {
	}
}

public class PaymentMethodCardWallet: Codable {
	public var amex_express_checkout: PaymentMethodCardWalletAmexExpressCheckout?
	public var apple_pay: PaymentMethodCardWalletApplePay?
	/// (For tokenized numbers only.) The last four digits of the device account number.
	public var dynamic_last4: String?
	public var google_pay: PaymentMethodCardWalletGooglePay?
	public var masterpass: PaymentMethodCardWalletMasterpass?
	public var samsung_pay: PaymentMethodCardWalletSamsungPay?
	/// The type of the card wallet, one of `amex_express_checkout`, `apple_pay`, `google_pay`, `masterpass`, `samsung_pay`, or `visa_checkout`. An additional hash is included on the Wallet subhash with a name matching this value. It contains additional information specific to the card wallet type.
	public var type: TypeValues
	public var visa_checkout: PaymentMethodCardWalletVisaCheckout?

	public init(type: TypeValues, amex_express_checkout: PaymentMethodCardWalletAmexExpressCheckout? = nil, apple_pay: PaymentMethodCardWalletApplePay? = nil, dynamic_last4: String? = nil, google_pay: PaymentMethodCardWalletGooglePay? = nil, masterpass: PaymentMethodCardWalletMasterpass? = nil, samsung_pay: PaymentMethodCardWalletSamsungPay? = nil, visa_checkout: PaymentMethodCardWalletVisaCheckout? = nil) {
		self.type = type
		self.amex_express_checkout = amex_express_checkout
		self.apple_pay = apple_pay
		self.dynamic_last4 = dynamic_last4
		self.google_pay = google_pay
		self.masterpass = masterpass
		self.samsung_pay = samsung_pay
		self.visa_checkout = visa_checkout
	}

	public enum TypeValues: String, Codable {
		case amexExpressCheckout = "amex_express_checkout"
		case applePay = "apple_pay"
		case googlePay = "google_pay"
		case masterpass = "masterpass"
		case samsungPay = "samsung_pay"
		case visaCheckout = "visa_checkout"
	}
}

public class PaymentMethodCardWalletAmexExpressCheckout: Codable {

	public init() {
	}
}

public class PaymentMethodCardWalletApplePay: Codable {

	public init() {
	}
}

public class PaymentMethodCardWalletGooglePay: Codable {

	public init() {
	}
}

public class PaymentMethodCardWalletMasterpass: Codable {
	/// Owner's verified billing address. Values are verified or provided by the wallet directly (if supported) at the time of authorization or settlement. They cannot be set or mutated.
	public var billing_address: Address?
	/// Owner's verified email. Values are verified or provided by the wallet directly (if supported) at the time of authorization or settlement. They cannot be set or mutated.
	public var email: String?
	/// Owner's verified full name. Values are verified or provided by the wallet directly (if supported) at the time of authorization or settlement. They cannot be set or mutated.
	public var name: String?
	/// Owner's verified shipping address. Values are verified or provided by the wallet directly (if supported) at the time of authorization or settlement. They cannot be set or mutated.
	public var shipping_address: Address?

	public init(billing_address: Address? = nil, email: String? = nil, name: String? = nil, shipping_address: Address? = nil) {
		self.billing_address = billing_address
		self.email = email
		self.name = name
		self.shipping_address = shipping_address
	}
}

public class PaymentMethodCardWalletSamsungPay: Codable {

	public init() {
	}
}

public class PaymentMethodCardWalletVisaCheckout: Codable {
	/// Owner's verified billing address. Values are verified or provided by the wallet directly (if supported) at the time of authorization or settlement. They cannot be set or mutated.
	public var billing_address: Address?
	/// Owner's verified email. Values are verified or provided by the wallet directly (if supported) at the time of authorization or settlement. They cannot be set or mutated.
	public var email: String?
	/// Owner's verified full name. Values are verified or provided by the wallet directly (if supported) at the time of authorization or settlement. They cannot be set or mutated.
	public var name: String?
	/// Owner's verified shipping address. Values are verified or provided by the wallet directly (if supported) at the time of authorization or settlement. They cannot be set or mutated.
	public var shipping_address: Address?

	public init(billing_address: Address? = nil, email: String? = nil, name: String? = nil, shipping_address: Address? = nil) {
		self.billing_address = billing_address
		self.email = email
		self.name = name
		self.shipping_address = shipping_address
	}
}

public class PaymentMethodDetails: Codable {
	public var ach_credit_transfer: PaymentMethodDetailsAchCreditTransfer?
	public var ach_debit: PaymentMethodDetailsAchDebit?
	public var alipay: PaymentFlowsPrivatePaymentMethodsAlipayDetails?
	public var au_becs_debit: PaymentMethodDetailsAuBecsDebit?
	public var bacs_debit: PaymentMethodDetailsBacsDebit?
	public var bancontact: PaymentMethodDetailsBancontact?
	public var card: PaymentMethodDetailsCard?
	public var card_present: PaymentMethodDetailsCardPresent?
	public var eps: PaymentMethodDetailsEps?
	public var fpx: PaymentMethodDetailsFpx?
	public var giropay: PaymentMethodDetailsGiropay?
	public var grabpay: PaymentMethodDetailsGrabpay?
	public var ideal: PaymentMethodDetailsIdeal?
	public var interac_present: PaymentMethodDetailsInteracPresent?
	public var klarna: PaymentMethodDetailsKlarna?
	public var multibanco: PaymentMethodDetailsMultibanco?
	public var oxxo: PaymentMethodDetailsOxxo?
	public var p24: PaymentMethodDetailsP24?
	public var sepa_debit: PaymentMethodDetailsSepaDebit?
	public var sofort: PaymentMethodDetailsSofort?
	public var stripe_account: PaymentMethodDetailsStripeAccount?
	/// The type of transaction-specific details of the payment method used in the payment, one of `ach_credit_transfer`, `ach_debit`, `alipay`, `au_becs_debit`, `bancontact`, `card`, `card_present`, `eps`, `giropay`, `ideal`, `klarna`, `multibanco`, `p24`, `sepa_debit`, `sofort`, `stripe_account`, or `wechat`. An additional hash is included on `payment_method_details` with a name matching this value. It contains information specific to the payment method.
	public var type: String
	public var wechat: PaymentMethodDetailsWechat?

	public init(type: String, ach_credit_transfer: PaymentMethodDetailsAchCreditTransfer? = nil, ach_debit: PaymentMethodDetailsAchDebit? = nil, alipay: PaymentFlowsPrivatePaymentMethodsAlipayDetails? = nil, au_becs_debit: PaymentMethodDetailsAuBecsDebit? = nil, bacs_debit: PaymentMethodDetailsBacsDebit? = nil, bancontact: PaymentMethodDetailsBancontact? = nil, card: PaymentMethodDetailsCard? = nil, card_present: PaymentMethodDetailsCardPresent? = nil, eps: PaymentMethodDetailsEps? = nil, fpx: PaymentMethodDetailsFpx? = nil, giropay: PaymentMethodDetailsGiropay? = nil, grabpay: PaymentMethodDetailsGrabpay? = nil, ideal: PaymentMethodDetailsIdeal? = nil, interac_present: PaymentMethodDetailsInteracPresent? = nil, klarna: PaymentMethodDetailsKlarna? = nil, multibanco: PaymentMethodDetailsMultibanco? = nil, oxxo: PaymentMethodDetailsOxxo? = nil, p24: PaymentMethodDetailsP24? = nil, sepa_debit: PaymentMethodDetailsSepaDebit? = nil, sofort: PaymentMethodDetailsSofort? = nil, stripe_account: PaymentMethodDetailsStripeAccount? = nil, wechat: PaymentMethodDetailsWechat? = nil) {
		self.type = type
		self.ach_credit_transfer = ach_credit_transfer
		self.ach_debit = ach_debit
		self.alipay = alipay
		self.au_becs_debit = au_becs_debit
		self.bacs_debit = bacs_debit
		self.bancontact = bancontact
		self.card = card
		self.card_present = card_present
		self.eps = eps
		self.fpx = fpx
		self.giropay = giropay
		self.grabpay = grabpay
		self.ideal = ideal
		self.interac_present = interac_present
		self.klarna = klarna
		self.multibanco = multibanco
		self.oxxo = oxxo
		self.p24 = p24
		self.sepa_debit = sepa_debit
		self.sofort = sofort
		self.stripe_account = stripe_account
		self.wechat = wechat
	}
}

public class PaymentMethodDetailsAchCreditTransfer: Codable {
	/// Account number to transfer funds to.
	public var account_number: String?
	/// Name of the bank associated with the routing number.
	public var bank_name: String?
	/// Routing transit number for the bank account to transfer funds to.
	public var routing_number: String?
	/// SWIFT code of the bank associated with the routing number.
	public var swift_code: String?

	public init(account_number: String? = nil, bank_name: String? = nil, routing_number: String? = nil, swift_code: String? = nil) {
		self.account_number = account_number
		self.bank_name = bank_name
		self.routing_number = routing_number
		self.swift_code = swift_code
	}
}

public class PaymentMethodDetailsAchDebit: Codable {
	/// Type of entity that holds the account. This can be either `individual` or `company`.
	public var account_holder_type: AccountHolderTypeValues?
	/// Name of the bank associated with the bank account.
	public var bank_name: String?
	/// Two-letter ISO code representing the country the bank account is located in.
	public var country: String?
	/// Uniquely identifies this particular bank account. You can use this attribute to check whether two bank accounts are the same.
	public var fingerprint: String?
	/// Last four digits of the bank account number.
	public var last4: String?
	/// Routing transit number of the bank account.
	public var routing_number: String?

	public init(account_holder_type: AccountHolderTypeValues? = nil, bank_name: String? = nil, country: String? = nil, fingerprint: String? = nil, last4: String? = nil, routing_number: String? = nil) {
		self.account_holder_type = account_holder_type
		self.bank_name = bank_name
		self.country = country
		self.fingerprint = fingerprint
		self.last4 = last4
		self.routing_number = routing_number
	}

	public enum AccountHolderTypeValues: String, Codable {
		case company = "company"
		case individual = "individual"
	}
}

public class PaymentMethodDetailsAuBecsDebit: Codable {
	/// Bank-State-Branch number of the bank account.
	public var bsb_number: String?
	/// Uniquely identifies this particular bank account. You can use this attribute to check whether two bank accounts are the same.
	public var fingerprint: String?
	/// Last four digits of the bank account number.
	public var last4: String?
	/// ID of the mandate used to make this payment.
	public var mandate: String?

	public init(bsb_number: String? = nil, fingerprint: String? = nil, last4: String? = nil, mandate: String? = nil) {
		self.bsb_number = bsb_number
		self.fingerprint = fingerprint
		self.last4 = last4
		self.mandate = mandate
	}
}

public class PaymentMethodDetailsBacsDebit: Codable {
	/// Uniquely identifies this particular bank account. You can use this attribute to check whether two bank accounts are the same.
	public var fingerprint: String?
	/// Last four digits of the bank account number.
	public var last4: String?
	/// ID of the mandate used to make this payment.
	public var mandate: String?
	/// Sort code of the bank account. (e.g., `10-20-30`)
	public var sort_code: String?

	public init(fingerprint: String? = nil, last4: String? = nil, mandate: String? = nil, sort_code: String? = nil) {
		self.fingerprint = fingerprint
		self.last4 = last4
		self.mandate = mandate
		self.sort_code = sort_code
	}
}

public class PaymentMethodDetailsBancontact: Codable {
	/// Bank code of bank associated with the bank account.
	public var bank_code: String?
	/// Name of the bank associated with the bank account.
	public var bank_name: String?
	/// Bank Identifier Code of the bank associated with the bank account.
	public var bic: String?
	/// The ID of the SEPA Direct Debit PaymentMethod which was generated by this Charge.
	public var generated_sepa_debit: String?
	/// The mandate for the SEPA Direct Debit PaymentMethod which was generated by this Charge.
	public var generated_sepa_debit_mandate: String?
	/// Last four characters of the IBAN.
	public var iban_last4: String?
	/// Preferred language of the Bancontact authorization page that the customer is redirected to. Can be one of `en`, `de`, `fr`, or `nl`
	public var preferred_language: PreferredLanguageValues?
	/// Owner's verified full name. Values are verified or provided by Bancontact directly (if supported) at the time of authorization or settlement. They cannot be set or mutated.
	public var verified_name: String?

	public init(bank_code: String? = nil, bank_name: String? = nil, bic: String? = nil, generated_sepa_debit: String? = nil, generated_sepa_debit_mandate: String? = nil, iban_last4: String? = nil, preferred_language: PreferredLanguageValues? = nil, verified_name: String? = nil) {
		self.bank_code = bank_code
		self.bank_name = bank_name
		self.bic = bic
		self.generated_sepa_debit = generated_sepa_debit
		self.generated_sepa_debit_mandate = generated_sepa_debit_mandate
		self.iban_last4 = iban_last4
		self.preferred_language = preferred_language
		self.verified_name = verified_name
	}

	public enum PreferredLanguageValues: String, Codable {
		case de = "de"
		case en = "en"
		case fr = "fr"
		case nl = "nl"
	}
}

public class PaymentMethodDetailsCard: Codable {
	/// Card brand. Can be `amex`, `diners`, `discover`, `jcb`, `mastercard`, `unionpay`, `visa`, or `unknown`.
	public var brand: String?
	/// Check results by Card networks on Card address and CVC at time of payment.
	public var checks: PaymentMethodDetailsCardChecks?
	/// Two-letter ISO code representing the country of the card. You could use this attribute to get a sense of the international breakdown of cards you've collected.
	public var country: String?
	/// Two-digit number representing the card's expiration month.
	public var exp_month: Int
	/// Four-digit number representing the card's expiration year.
	public var exp_year: Int
	/// Uniquely identifies this particular card number. You can use this attribute to check whether two customers who’ve signed up with you are using the same card number, for example. For payment methods that tokenize card information (Apple Pay, Google Pay), the tokenized number might be provided instead of the underlying card number.
	public var fingerprint: String?
	/// Card funding type. Can be `credit`, `debit`, `prepaid`, or `unknown`.
	public var funding: String?
	/// Installment details for this payment (Mexico only).  For more information, see the [installments integration guide](https://stripe.com/docs/payments/installments).
	public var installments: PaymentMethodDetailsCardInstallments?
	/// The last four digits of the card.
	public var last4: String?
	/// Identifies which network this charge was processed on. Can be `amex`, `cartes_bancaires`, `diners`, `discover`, `interac`, `jcb`, `mastercard`, `unionpay`, `visa`, or `unknown`.
	public var network: String?
	/// Populated if this transaction used 3D Secure authentication.
	public var three_d_secure: ThreeDSecureDetails?
	/// If this Card is part of a card wallet, this contains the details of the card wallet.
	public var wallet: PaymentMethodDetailsCardWallet?

	public init(exp_month: Int, exp_year: Int, brand: String? = nil, checks: PaymentMethodDetailsCardChecks? = nil, country: String? = nil, fingerprint: String? = nil, funding: String? = nil, installments: PaymentMethodDetailsCardInstallments? = nil, last4: String? = nil, network: String? = nil, three_d_secure: ThreeDSecureDetails? = nil, wallet: PaymentMethodDetailsCardWallet? = nil) {
		self.exp_month = exp_month
		self.exp_year = exp_year
		self.brand = brand
		self.checks = checks
		self.country = country
		self.fingerprint = fingerprint
		self.funding = funding
		self.installments = installments
		self.last4 = last4
		self.network = network
		self.three_d_secure = three_d_secure
		self.wallet = wallet
	}
}

public class PaymentMethodDetailsCardChecks: Codable {
	/// If a address line1 was provided, results of the check, one of `pass`, `fail`, `unavailable`, or `unchecked`.
	public var address_line1_check: String?
	/// If a address postal code was provided, results of the check, one of `pass`, `fail`, `unavailable`, or `unchecked`.
	public var address_postal_code_check: String?
	/// If a CVC was provided, results of the check, one of `pass`, `fail`, `unavailable`, or `unchecked`.
	public var cvc_check: String?

	public init(address_line1_check: String? = nil, address_postal_code_check: String? = nil, cvc_check: String? = nil) {
		self.address_line1_check = address_line1_check
		self.address_postal_code_check = address_postal_code_check
		self.cvc_check = cvc_check
	}
}

public class PaymentMethodDetailsCardInstallments: Codable {
	/// Installment plan selected for the payment.
	public var plan: PaymentMethodDetailsCardInstallmentsPlan?

	public init(plan: PaymentMethodDetailsCardInstallmentsPlan? = nil) {
		self.plan = plan
	}
}

public class PaymentMethodDetailsCardInstallmentsPlan: Codable {
	/// For `fixed_count` installment plans, this is the number of installment payments your customer will make to their credit card.
	public var count: Int?
	/// For `fixed_count` installment plans, this is the interval between installment payments your customer will make to their credit card. One of `month`.
	public var interval: IntervalValues?
	/// Type of installment plan, one of `fixed_count`.
	public var type: TypeValues

	public init(type: TypeValues, count: Int? = nil, interval: IntervalValues? = nil) {
		self.type = type
		self.count = count
		self.interval = interval
	}

	public enum IntervalValues: String, Codable {
		case month = "month"
	}

	public enum TypeValues: String, Codable {
		case fixedCount = "fixed_count"
	}
}

public class PaymentMethodDetailsCardPresent: Codable {
	/// Card brand. Can be `amex`, `diners`, `discover`, `jcb`, `mastercard`, `unionpay`, `visa`, or `unknown`.
	public var brand: String?
	/// The cardholder name as read from the card, in [ISO 7813](https://en.wikipedia.org/wiki/ISO/IEC_7813) format. May include alphanumeric characters, special characters and first/last name separator (`/`).
	public var cardholder_name: String?
	/// Two-letter ISO code representing the country of the card. You could use this attribute to get a sense of the international breakdown of cards you've collected.
	public var country: String?
	/// Authorization response cryptogram.
	public var emv_auth_data: String?
	/// Two-digit number representing the card's expiration month.
	public var exp_month: Int
	/// Four-digit number representing the card's expiration year.
	public var exp_year: Int
	/// Uniquely identifies this particular card number. You can use this attribute to check whether two customers who’ve signed up with you are using the same card number, for example. For payment methods that tokenize card information (Apple Pay, Google Pay), the tokenized number might be provided instead of the underlying card number.
	public var fingerprint: String?
	/// Card funding type. Can be `credit`, `debit`, `prepaid`, or `unknown`.
	public var funding: String?
	/// ID of a card PaymentMethod generated from the card_present PaymentMethod that may be attached to a Customer for future transactions. Only present if it was possible to generate a card PaymentMethod.
	public var generated_card: String?
	/// The last four digits of the card.
	public var last4: String?
	/// Identifies which network this charge was processed on. Can be `amex`, `cartes_bancaires`, `diners`, `discover`, `interac`, `jcb`, `mastercard`, `unionpay`, `visa`, or `unknown`.
	public var network: String?
	/// How card details were read in this transaction.
	public var read_method: ReadMethodValues?
	/// A collection of fields required to be displayed on receipts. Only required for EMV transactions.
	public var receipt: PaymentMethodDetailsCardPresentReceipt?

	public init(exp_month: Int, exp_year: Int, brand: String? = nil, cardholder_name: String? = nil, country: String? = nil, emv_auth_data: String? = nil, fingerprint: String? = nil, funding: String? = nil, generated_card: String? = nil, last4: String? = nil, network: String? = nil, read_method: ReadMethodValues? = nil, receipt: PaymentMethodDetailsCardPresentReceipt? = nil) {
		self.exp_month = exp_month
		self.exp_year = exp_year
		self.brand = brand
		self.cardholder_name = cardholder_name
		self.country = country
		self.emv_auth_data = emv_auth_data
		self.fingerprint = fingerprint
		self.funding = funding
		self.generated_card = generated_card
		self.last4 = last4
		self.network = network
		self.read_method = read_method
		self.receipt = receipt
	}

	public enum ReadMethodValues: String, Codable {
		case contactEmv = "contact_emv"
		case contactlessEmv = "contactless_emv"
		case contactlessMagstripeMode = "contactless_magstripe_mode"
		case magneticStripeFallback = "magnetic_stripe_fallback"
		case magneticStripeTrack2 = "magnetic_stripe_track2"
	}
}

public class PaymentMethodDetailsCardPresentReceipt: Codable {
	/// The type of account being debited or credited
	public var account_type: AccountTypeValues?
	/// EMV tag 9F26, cryptogram generated by the integrated circuit chip.
	public var application_cryptogram: String?
	/// Mnenomic of the Application Identifier.
	public var application_preferred_name: String?
	/// Identifier for this transaction.
	public var authorization_code: String?
	/// EMV tag 8A. A code returned by the card issuer.
	public var authorization_response_code: String?
	/// How the cardholder verified ownership of the card.
	public var cardholder_verification_method: String?
	/// EMV tag 84. Similar to the application identifier stored on the integrated circuit chip.
	public var dedicated_file_name: String?
	/// The outcome of a series of EMV functions performed by the card reader.
	public var terminal_verification_results: String?
	/// An indication of various EMV functions performed during the transaction.
	public var transaction_status_information: String?

	public init(account_type: AccountTypeValues? = nil, application_cryptogram: String? = nil, application_preferred_name: String? = nil, authorization_code: String? = nil, authorization_response_code: String? = nil, cardholder_verification_method: String? = nil, dedicated_file_name: String? = nil, terminal_verification_results: String? = nil, transaction_status_information: String? = nil) {
		self.account_type = account_type
		self.application_cryptogram = application_cryptogram
		self.application_preferred_name = application_preferred_name
		self.authorization_code = authorization_code
		self.authorization_response_code = authorization_response_code
		self.cardholder_verification_method = cardholder_verification_method
		self.dedicated_file_name = dedicated_file_name
		self.terminal_verification_results = terminal_verification_results
		self.transaction_status_information = transaction_status_information
	}

	public enum AccountTypeValues: String, Codable {
		case checking = "checking"
		case credit = "credit"
		case prepaid = "prepaid"
		case unknown = "unknown"
	}
}

public class PaymentMethodDetailsCardWallet: Codable {
	public var amex_express_checkout: PaymentMethodDetailsCardWalletAmexExpressCheckout?
	public var apple_pay: PaymentMethodDetailsCardWalletApplePay?
	/// (For tokenized numbers only.) The last four digits of the device account number.
	public var dynamic_last4: String?
	public var google_pay: PaymentMethodDetailsCardWalletGooglePay?
	public var masterpass: PaymentMethodDetailsCardWalletMasterpass?
	public var samsung_pay: PaymentMethodDetailsCardWalletSamsungPay?
	/// The type of the card wallet, one of `amex_express_checkout`, `apple_pay`, `google_pay`, `masterpass`, `samsung_pay`, or `visa_checkout`. An additional hash is included on the Wallet subhash with a name matching this value. It contains additional information specific to the card wallet type.
	public var type: TypeValues
	public var visa_checkout: PaymentMethodDetailsCardWalletVisaCheckout?

	public init(type: TypeValues, amex_express_checkout: PaymentMethodDetailsCardWalletAmexExpressCheckout? = nil, apple_pay: PaymentMethodDetailsCardWalletApplePay? = nil, dynamic_last4: String? = nil, google_pay: PaymentMethodDetailsCardWalletGooglePay? = nil, masterpass: PaymentMethodDetailsCardWalletMasterpass? = nil, samsung_pay: PaymentMethodDetailsCardWalletSamsungPay? = nil, visa_checkout: PaymentMethodDetailsCardWalletVisaCheckout? = nil) {
		self.type = type
		self.amex_express_checkout = amex_express_checkout
		self.apple_pay = apple_pay
		self.dynamic_last4 = dynamic_last4
		self.google_pay = google_pay
		self.masterpass = masterpass
		self.samsung_pay = samsung_pay
		self.visa_checkout = visa_checkout
	}

	public enum TypeValues: String, Codable {
		case amexExpressCheckout = "amex_express_checkout"
		case applePay = "apple_pay"
		case googlePay = "google_pay"
		case masterpass = "masterpass"
		case samsungPay = "samsung_pay"
		case visaCheckout = "visa_checkout"
	}
}

public class PaymentMethodDetailsCardWalletAmexExpressCheckout: Codable {

	public init() {
	}
}

public class PaymentMethodDetailsCardWalletApplePay: Codable {

	public init() {
	}
}

public class PaymentMethodDetailsCardWalletGooglePay: Codable {

	public init() {
	}
}

public class PaymentMethodDetailsCardWalletMasterpass: Codable {
	/// Owner's verified billing address. Values are verified or provided by the wallet directly (if supported) at the time of authorization or settlement. They cannot be set or mutated.
	public var billing_address: Address?
	/// Owner's verified email. Values are verified or provided by the wallet directly (if supported) at the time of authorization or settlement. They cannot be set or mutated.
	public var email: String?
	/// Owner's verified full name. Values are verified or provided by the wallet directly (if supported) at the time of authorization or settlement. They cannot be set or mutated.
	public var name: String?
	/// Owner's verified shipping address. Values are verified or provided by the wallet directly (if supported) at the time of authorization or settlement. They cannot be set or mutated.
	public var shipping_address: Address?

	public init(billing_address: Address? = nil, email: String? = nil, name: String? = nil, shipping_address: Address? = nil) {
		self.billing_address = billing_address
		self.email = email
		self.name = name
		self.shipping_address = shipping_address
	}
}

public class PaymentMethodDetailsCardWalletSamsungPay: Codable {

	public init() {
	}
}

public class PaymentMethodDetailsCardWalletVisaCheckout: Codable {
	/// Owner's verified billing address. Values are verified or provided by the wallet directly (if supported) at the time of authorization or settlement. They cannot be set or mutated.
	public var billing_address: Address?
	/// Owner's verified email. Values are verified or provided by the wallet directly (if supported) at the time of authorization or settlement. They cannot be set or mutated.
	public var email: String?
	/// Owner's verified full name. Values are verified or provided by the wallet directly (if supported) at the time of authorization or settlement. They cannot be set or mutated.
	public var name: String?
	/// Owner's verified shipping address. Values are verified or provided by the wallet directly (if supported) at the time of authorization or settlement. They cannot be set or mutated.
	public var shipping_address: Address?

	public init(billing_address: Address? = nil, email: String? = nil, name: String? = nil, shipping_address: Address? = nil) {
		self.billing_address = billing_address
		self.email = email
		self.name = name
		self.shipping_address = shipping_address
	}
}

public class PaymentMethodDetailsEps: Codable {
	/// The customer's bank. Should be one of `arzte_und_apotheker_bank`, `austrian_anadi_bank_ag`, `bank_austria`, `bankhaus_carl_spangler`, `bankhaus_schelhammer_und_schattera_ag`, `bawag_psk_ag`, `bks_bank_ag`, `brull_kallmus_bank_ag`, `btv_vier_lander_bank`, `capital_bank_grawe_gruppe_ag`, `dolomitenbank`, `easybank_ag`, `erste_bank_und_sparkassen`, `hypo_alpeadriabank_international_ag`, `hypo_noe_lb_fur_niederosterreich_u_wien`, `hypo_oberosterreich_salzburg_steiermark`, `hypo_tirol_bank_ag`, `hypo_vorarlberg_bank_ag`, `hypo_bank_burgenland_aktiengesellschaft`, `marchfelder_bank`, `oberbank_ag`, `raiffeisen_bankengruppe_osterreich`, `schoellerbank_ag`, `sparda_bank_wien`, `volksbank_gruppe`, `volkskreditbank_ag`, or `vr_bank_braunau`.
	public var bank: BankValues?
	/// Owner's verified full name. Values are verified or provided by EPS directly (if supported) at the time of authorization or settlement. They cannot be set or mutated. EPS rarely provides this information so the attribute is usually empty.
	public var verified_name: String?

	public init(bank: BankValues? = nil, verified_name: String? = nil) {
		self.bank = bank
		self.verified_name = verified_name
	}

	public enum BankValues: String, Codable {
		case arzteUndApothekerBank = "arzte_und_apotheker_bank"
		case austrianAnadiBankAg = "austrian_anadi_bank_ag"
		case bankAustria = "bank_austria"
		case bankhausCarlSpangler = "bankhaus_carl_spangler"
		case bankhausSchelhammerUndSchatteraAg = "bankhaus_schelhammer_und_schattera_ag"
		case bawagPskAg = "bawag_psk_ag"
		case bksBankAg = "bks_bank_ag"
		case brullKallmusBankAg = "brull_kallmus_bank_ag"
		case btvVierLanderBank = "btv_vier_lander_bank"
		case capitalBankGraweGruppeAg = "capital_bank_grawe_gruppe_ag"
		case dolomitenbank = "dolomitenbank"
		case easybankAg = "easybank_ag"
		case ersteBankUndSparkassen = "erste_bank_und_sparkassen"
		case hypoAlpeadriabankInternationalAg = "hypo_alpeadriabank_international_ag"
		case hypoBankBurgenlandAktiengesellschaft = "hypo_bank_burgenland_aktiengesellschaft"
		case hypoNoeLbFurNiederosterreichUWien = "hypo_noe_lb_fur_niederosterreich_u_wien"
		case hypoOberosterreichSalzburgSteiermark = "hypo_oberosterreich_salzburg_steiermark"
		case hypoTirolBankAg = "hypo_tirol_bank_ag"
		case hypoVorarlbergBankAg = "hypo_vorarlberg_bank_ag"
		case marchfelderBank = "marchfelder_bank"
		case oberbankAg = "oberbank_ag"
		case raiffeisenBankengruppeOsterreich = "raiffeisen_bankengruppe_osterreich"
		case schoellerbankAg = "schoellerbank_ag"
		case spardaBankWien = "sparda_bank_wien"
		case volksbankGruppe = "volksbank_gruppe"
		case volkskreditbankAg = "volkskreditbank_ag"
		case vrBankBraunau = "vr_bank_braunau"
	}
}

public class PaymentMethodDetailsFpx: Codable {
	/// The customer's bank. Can be one of `affin_bank`, `alliance_bank`, `ambank`, `bank_islam`, `bank_muamalat`, `bank_rakyat`, `bsn`, `cimb`, `hong_leong_bank`, `hsbc`, `kfh`, `maybank2u`, `ocbc`, `public_bank`, `rhb`, `standard_chartered`, `uob`, `deutsche_bank`, `maybank2e`, or `pb_enterprise`.
	public var bank: BankValues
	/// Unique transaction id generated by FPX for every request from the merchant
	public var transaction_id: String?

	public init(bank: BankValues, transaction_id: String? = nil) {
		self.bank = bank
		self.transaction_id = transaction_id
	}

	public enum BankValues: String, Codable {
		case affinBank = "affin_bank"
		case allianceBank = "alliance_bank"
		case ambank = "ambank"
		case bankIslam = "bank_islam"
		case bankMuamalat = "bank_muamalat"
		case bankRakyat = "bank_rakyat"
		case bsn = "bsn"
		case cimb = "cimb"
		case deutscheBank = "deutsche_bank"
		case hongLeongBank = "hong_leong_bank"
		case hsbc = "hsbc"
		case kfh = "kfh"
		case maybank2e = "maybank2e"
		case maybank2u = "maybank2u"
		case ocbc = "ocbc"
		case pbEnterprise = "pb_enterprise"
		case publicBank = "public_bank"
		case rhb = "rhb"
		case standardChartered = "standard_chartered"
		case uob = "uob"
	}
}

public class PaymentMethodDetailsGiropay: Codable {
	/// Bank code of bank associated with the bank account.
	public var bank_code: String?
	/// Name of the bank associated with the bank account.
	public var bank_name: String?
	/// Bank Identifier Code of the bank associated with the bank account.
	public var bic: String?
	/// Owner's verified full name. Values are verified or provided by Giropay directly (if supported) at the time of authorization or settlement. They cannot be set or mutated. Giropay rarely provides this information so the attribute is usually empty.
	public var verified_name: String?

	public init(bank_code: String? = nil, bank_name: String? = nil, bic: String? = nil, verified_name: String? = nil) {
		self.bank_code = bank_code
		self.bank_name = bank_name
		self.bic = bic
		self.verified_name = verified_name
	}
}

public class PaymentMethodDetailsGrabpay: Codable {
	/// Unique transaction id generated by GrabPay
	public var transaction_id: String?

	public init(transaction_id: String? = nil) {
		self.transaction_id = transaction_id
	}
}

public class PaymentMethodDetailsIdeal: Codable {
	/// The customer's bank. Can be one of `abn_amro`, `asn_bank`, `bunq`, `handelsbanken`, `ing`, `knab`, `moneyou`, `rabobank`, `regiobank`, `sns_bank`, `triodos_bank`, or `van_lanschot`.
	public var bank: BankValues?
	/// The Bank Identifier Code of the customer's bank.
	public var bic: BicValues?
	/// The ID of the SEPA Direct Debit PaymentMethod which was generated by this Charge.
	public var generated_sepa_debit: String?
	/// The mandate for the SEPA Direct Debit PaymentMethod which was generated by this Charge.
	public var generated_sepa_debit_mandate: String?
	/// Last four characters of the IBAN.
	public var iban_last4: String?
	/// Owner's verified full name. Values are verified or provided by iDEAL directly (if supported) at the time of authorization or settlement. They cannot be set or mutated.
	public var verified_name: String?

	public init(bank: BankValues? = nil, bic: BicValues? = nil, generated_sepa_debit: String? = nil, generated_sepa_debit_mandate: String? = nil, iban_last4: String? = nil, verified_name: String? = nil) {
		self.bank = bank
		self.bic = bic
		self.generated_sepa_debit = generated_sepa_debit
		self.generated_sepa_debit_mandate = generated_sepa_debit_mandate
		self.iban_last4 = iban_last4
		self.verified_name = verified_name
	}

	public enum BicValues: String, Codable {
		case optionABNANL2A = "ABNANL2A"
		case optionASNBNL21 = "ASNBNL21"
		case optionBUNQNL2A = "BUNQNL2A"
		case optionFVLBNL22 = "FVLBNL22"
		case optionHANDNL2A = "HANDNL2A"
		case optionINGBNL2A = "INGBNL2A"
		case optionKNABNL2H = "KNABNL2H"
		case optionMOYONL21 = "MOYONL21"
		case optionRABONL2U = "RABONL2U"
		case optionRBRBNL21 = "RBRBNL21"
		case optionSNSBNL2A = "SNSBNL2A"
		case optionTRIONL2U = "TRIONL2U"
	}

	public enum BankValues: String, Codable {
		case abnAmro = "abn_amro"
		case asnBank = "asn_bank"
		case bunq = "bunq"
		case handelsbanken = "handelsbanken"
		case ing = "ing"
		case knab = "knab"
		case moneyou = "moneyou"
		case rabobank = "rabobank"
		case regiobank = "regiobank"
		case snsBank = "sns_bank"
		case triodosBank = "triodos_bank"
		case vanLanschot = "van_lanschot"
	}
}

public class PaymentMethodDetailsInteracPresent: Codable {
	/// Card brand. Can be `interac`, `mastercard` or `visa`.
	public var brand: String?
	/// The cardholder name as read from the card, in [ISO 7813](https://en.wikipedia.org/wiki/ISO/IEC_7813) format. May include alphanumeric characters, special characters and first/last name separator (`/`).
	public var cardholder_name: String?
	/// Two-letter ISO code representing the country of the card. You could use this attribute to get a sense of the international breakdown of cards you've collected.
	public var country: String?
	/// Authorization response cryptogram.
	public var emv_auth_data: String?
	/// Two-digit number representing the card's expiration month.
	public var exp_month: Int
	/// Four-digit number representing the card's expiration year.
	public var exp_year: Int
	/// Uniquely identifies this particular card number. You can use this attribute to check whether two customers who’ve signed up with you are using the same card number, for example. For payment methods that tokenize card information (Apple Pay, Google Pay), the tokenized number might be provided instead of the underlying card number.
	public var fingerprint: String?
	/// Card funding type. Can be `credit`, `debit`, `prepaid`, or `unknown`.
	public var funding: String?
	/// ID of a card PaymentMethod generated from the card_present PaymentMethod that may be attached to a Customer for future transactions. Only present if it was possible to generate a card PaymentMethod.
	public var generated_card: String?
	/// The last four digits of the card.
	public var last4: String?
	/// Identifies which network this charge was processed on. Can be `amex`, `cartes_bancaires`, `diners`, `discover`, `interac`, `jcb`, `mastercard`, `unionpay`, `visa`, or `unknown`.
	public var network: String?
	/// EMV tag 5F2D. Preferred languages specified by the integrated circuit chip.
	public var preferred_locales: [String]??
	/// How card details were read in this transaction.
	public var read_method: ReadMethodValues?
	/// A collection of fields required to be displayed on receipts. Only required for EMV transactions.
	public var receipt: PaymentMethodDetailsInteracPresentReceipt?

	public init(exp_month: Int, exp_year: Int, brand: String? = nil, cardholder_name: String? = nil, country: String? = nil, emv_auth_data: String? = nil, fingerprint: String? = nil, funding: String? = nil, generated_card: String? = nil, last4: String? = nil, network: String? = nil, preferred_locales: [String]?? = nil, read_method: ReadMethodValues? = nil, receipt: PaymentMethodDetailsInteracPresentReceipt? = nil) {
		self.exp_month = exp_month
		self.exp_year = exp_year
		self.brand = brand
		self.cardholder_name = cardholder_name
		self.country = country
		self.emv_auth_data = emv_auth_data
		self.fingerprint = fingerprint
		self.funding = funding
		self.generated_card = generated_card
		self.last4 = last4
		self.network = network
		self.preferred_locales = preferred_locales
		self.read_method = read_method
		self.receipt = receipt
	}

	public enum ReadMethodValues: String, Codable {
		case contactEmv = "contact_emv"
		case contactlessEmv = "contactless_emv"
		case contactlessMagstripeMode = "contactless_magstripe_mode"
		case magneticStripeFallback = "magnetic_stripe_fallback"
		case magneticStripeTrack2 = "magnetic_stripe_track2"
	}
}

public class PaymentMethodDetailsInteracPresentReceipt: Codable {
	/// The type of account being debited or credited
	public var account_type: AccountTypeValues?
	/// EMV tag 9F26, cryptogram generated by the integrated circuit chip.
	public var application_cryptogram: String?
	/// Mnenomic of the Application Identifier.
	public var application_preferred_name: String?
	/// Identifier for this transaction.
	public var authorization_code: String?
	/// EMV tag 8A. A code returned by the card issuer.
	public var authorization_response_code: String?
	/// How the cardholder verified ownership of the card.
	public var cardholder_verification_method: String?
	/// EMV tag 84. Similar to the application identifier stored on the integrated circuit chip.
	public var dedicated_file_name: String?
	/// The outcome of a series of EMV functions performed by the card reader.
	public var terminal_verification_results: String?
	/// An indication of various EMV functions performed during the transaction.
	public var transaction_status_information: String?

	public init(account_type: AccountTypeValues? = nil, application_cryptogram: String? = nil, application_preferred_name: String? = nil, authorization_code: String? = nil, authorization_response_code: String? = nil, cardholder_verification_method: String? = nil, dedicated_file_name: String? = nil, terminal_verification_results: String? = nil, transaction_status_information: String? = nil) {
		self.account_type = account_type
		self.application_cryptogram = application_cryptogram
		self.application_preferred_name = application_preferred_name
		self.authorization_code = authorization_code
		self.authorization_response_code = authorization_response_code
		self.cardholder_verification_method = cardholder_verification_method
		self.dedicated_file_name = dedicated_file_name
		self.terminal_verification_results = terminal_verification_results
		self.transaction_status_information = transaction_status_information
	}

	public enum AccountTypeValues: String, Codable {
		case checking = "checking"
		case savings = "savings"
		case unknown = "unknown"
	}
}

public class PaymentMethodDetailsKlarna: Codable {

	public init() {
	}
}

public class PaymentMethodDetailsMultibanco: Codable {
	/// Entity number associated with this Multibanco payment.
	public var entity: String?
	/// Reference number associated with this Multibanco payment.
	public var reference: String?

	public init(entity: String? = nil, reference: String? = nil) {
		self.entity = entity
		self.reference = reference
	}
}

public class PaymentMethodDetailsOxxo: Codable {
	/// OXXO reference number
	public var number: String?

	public init(number: String? = nil) {
		self.number = number
	}
}

public class PaymentMethodDetailsP24: Codable {
	/// The customer's bank. Can be one of `ing`, `citi_handlowy`, `tmobile_usbugi_bankowe`, `plus_bank`, `etransfer_pocztowy24`, `banki_spbdzielcze`, `bank_nowy_bfg_sa`, `getin_bank`, `blik`, `noble_pay`, `ideabank`, `envelobank`, `santander_przelew24`, `nest_przelew`, `mbank_mtransfer`, `inteligo`, `pbac_z_ipko`, `bnp_paribas`, `credit_agricole`, `toyota_bank`, `bank_pekao_sa`, `volkswagen_bank`, `bank_millennium`, `alior_bank`, or `boz`.
	public var bank: BankValues?
	/// Unique reference for this Przelewy24 payment.
	public var reference: String?
	/// Owner's verified full name. Values are verified or provided by Przelewy24 directly (if supported) at the time of authorization or settlement. They cannot be set or mutated. Przelewy24 rarely provides this information so the attribute is usually empty.
	public var verified_name: String?

	public init(bank: BankValues? = nil, reference: String? = nil, verified_name: String? = nil) {
		self.bank = bank
		self.reference = reference
		self.verified_name = verified_name
	}

	public enum BankValues: String, Codable {
		case aliorBank = "alior_bank"
		case bankMillennium = "bank_millennium"
		case bankNowyBfgSa = "bank_nowy_bfg_sa"
		case bankPekaoSa = "bank_pekao_sa"
		case bankiSpbdzielcze = "banki_spbdzielcze"
		case blik = "blik"
		case bnpParibas = "bnp_paribas"
		case boz = "boz"
		case citiHandlowy = "citi_handlowy"
		case creditAgricole = "credit_agricole"
		case envelobank = "envelobank"
		case etransferPocztowy24 = "etransfer_pocztowy24"
		case getinBank = "getin_bank"
		case ideabank = "ideabank"
		case ing = "ing"
		case inteligo = "inteligo"
		case mbankMtransfer = "mbank_mtransfer"
		case nestPrzelew = "nest_przelew"
		case noblePay = "noble_pay"
		case pbacZIpko = "pbac_z_ipko"
		case plusBank = "plus_bank"
		case santanderPrzelew24 = "santander_przelew24"
		case tmobileUsbugiBankowe = "tmobile_usbugi_bankowe"
		case toyotaBank = "toyota_bank"
		case volkswagenBank = "volkswagen_bank"
	}
}

public class PaymentMethodDetailsSepaDebit: Codable {
	/// Bank code of bank associated with the bank account.
	public var bank_code: String?
	/// Branch code of bank associated with the bank account.
	public var branch_code: String?
	/// Two-letter ISO code representing the country the bank account is located in.
	public var country: String?
	/// Uniquely identifies this particular bank account. You can use this attribute to check whether two bank accounts are the same.
	public var fingerprint: String?
	/// Last four characters of the IBAN.
	public var last4: String?
	/// ID of the mandate used to make this payment.
	public var mandate: String?

	public init(bank_code: String? = nil, branch_code: String? = nil, country: String? = nil, fingerprint: String? = nil, last4: String? = nil, mandate: String? = nil) {
		self.bank_code = bank_code
		self.branch_code = branch_code
		self.country = country
		self.fingerprint = fingerprint
		self.last4 = last4
		self.mandate = mandate
	}
}

public class PaymentMethodDetailsSofort: Codable {
	/// Bank code of bank associated with the bank account.
	public var bank_code: String?
	/// Name of the bank associated with the bank account.
	public var bank_name: String?
	/// Bank Identifier Code of the bank associated with the bank account.
	public var bic: String?
	/// Two-letter ISO code representing the country the bank account is located in.
	public var country: String?
	/// The ID of the SEPA Direct Debit PaymentMethod which was generated by this Charge.
	public var generated_sepa_debit: String?
	/// The mandate for the SEPA Direct Debit PaymentMethod which was generated by this Charge.
	public var generated_sepa_debit_mandate: String?
	/// Last four characters of the IBAN.
	public var iban_last4: String?
	/// Preferred language of the SOFORT authorization page that the customer is redirected to. Can be one of `de`, `en`, `es`, `fr`, `it`, `nl`, or `pl`
	public var preferred_language: PreferredLanguageValues?
	/// Owner's verified full name. Values are verified or provided by SOFORT directly (if supported) at the time of authorization or settlement. They cannot be set or mutated.
	public var verified_name: String?

	public init(bank_code: String? = nil, bank_name: String? = nil, bic: String? = nil, country: String? = nil, generated_sepa_debit: String? = nil, generated_sepa_debit_mandate: String? = nil, iban_last4: String? = nil, preferred_language: PreferredLanguageValues? = nil, verified_name: String? = nil) {
		self.bank_code = bank_code
		self.bank_name = bank_name
		self.bic = bic
		self.country = country
		self.generated_sepa_debit = generated_sepa_debit
		self.generated_sepa_debit_mandate = generated_sepa_debit_mandate
		self.iban_last4 = iban_last4
		self.preferred_language = preferred_language
		self.verified_name = verified_name
	}

	public enum PreferredLanguageValues: String, Codable {
		case de = "de"
		case en = "en"
		case es = "es"
		case fr = "fr"
		case it = "it"
		case nl = "nl"
		case pl = "pl"
	}
}

public class PaymentMethodDetailsStripeAccount: Codable {

	public init() {
	}
}

public class PaymentMethodDetailsWechat: Codable {

	public init() {
	}
}

public class PaymentMethodEps: Codable {
	/// The customer's bank. Should be one of `arzte_und_apotheker_bank`, `austrian_anadi_bank_ag`, `bank_austria`, `bankhaus_carl_spangler`, `bankhaus_schelhammer_und_schattera_ag`, `bawag_psk_ag`, `bks_bank_ag`, `brull_kallmus_bank_ag`, `btv_vier_lander_bank`, `capital_bank_grawe_gruppe_ag`, `dolomitenbank`, `easybank_ag`, `erste_bank_und_sparkassen`, `hypo_alpeadriabank_international_ag`, `hypo_noe_lb_fur_niederosterreich_u_wien`, `hypo_oberosterreich_salzburg_steiermark`, `hypo_tirol_bank_ag`, `hypo_vorarlberg_bank_ag`, `hypo_bank_burgenland_aktiengesellschaft`, `marchfelder_bank`, `oberbank_ag`, `raiffeisen_bankengruppe_osterreich`, `schoellerbank_ag`, `sparda_bank_wien`, `volksbank_gruppe`, `volkskreditbank_ag`, or `vr_bank_braunau`.
	public var bank: BankValues?

	public init(bank: BankValues? = nil) {
		self.bank = bank
	}

	public enum BankValues: String, Codable {
		case arzteUndApothekerBank = "arzte_und_apotheker_bank"
		case austrianAnadiBankAg = "austrian_anadi_bank_ag"
		case bankAustria = "bank_austria"
		case bankhausCarlSpangler = "bankhaus_carl_spangler"
		case bankhausSchelhammerUndSchatteraAg = "bankhaus_schelhammer_und_schattera_ag"
		case bawagPskAg = "bawag_psk_ag"
		case bksBankAg = "bks_bank_ag"
		case brullKallmusBankAg = "brull_kallmus_bank_ag"
		case btvVierLanderBank = "btv_vier_lander_bank"
		case capitalBankGraweGruppeAg = "capital_bank_grawe_gruppe_ag"
		case dolomitenbank = "dolomitenbank"
		case easybankAg = "easybank_ag"
		case ersteBankUndSparkassen = "erste_bank_und_sparkassen"
		case hypoAlpeadriabankInternationalAg = "hypo_alpeadriabank_international_ag"
		case hypoBankBurgenlandAktiengesellschaft = "hypo_bank_burgenland_aktiengesellschaft"
		case hypoNoeLbFurNiederosterreichUWien = "hypo_noe_lb_fur_niederosterreich_u_wien"
		case hypoOberosterreichSalzburgSteiermark = "hypo_oberosterreich_salzburg_steiermark"
		case hypoTirolBankAg = "hypo_tirol_bank_ag"
		case hypoVorarlbergBankAg = "hypo_vorarlberg_bank_ag"
		case marchfelderBank = "marchfelder_bank"
		case oberbankAg = "oberbank_ag"
		case raiffeisenBankengruppeOsterreich = "raiffeisen_bankengruppe_osterreich"
		case schoellerbankAg = "schoellerbank_ag"
		case spardaBankWien = "sparda_bank_wien"
		case volksbankGruppe = "volksbank_gruppe"
		case volkskreditbankAg = "volkskreditbank_ag"
		case vrBankBraunau = "vr_bank_braunau"
	}
}

public class PaymentMethodFpx: Codable {
	/// The customer's bank, if provided. Can be one of `affin_bank`, `alliance_bank`, `ambank`, `bank_islam`, `bank_muamalat`, `bank_rakyat`, `bsn`, `cimb`, `hong_leong_bank`, `hsbc`, `kfh`, `maybank2u`, `ocbc`, `public_bank`, `rhb`, `standard_chartered`, `uob`, `deutsche_bank`, `maybank2e`, or `pb_enterprise`.
	public var bank: BankValues

	public init(bank: BankValues) {
		self.bank = bank
	}

	public enum BankValues: String, Codable {
		case affinBank = "affin_bank"
		case allianceBank = "alliance_bank"
		case ambank = "ambank"
		case bankIslam = "bank_islam"
		case bankMuamalat = "bank_muamalat"
		case bankRakyat = "bank_rakyat"
		case bsn = "bsn"
		case cimb = "cimb"
		case deutscheBank = "deutsche_bank"
		case hongLeongBank = "hong_leong_bank"
		case hsbc = "hsbc"
		case kfh = "kfh"
		case maybank2e = "maybank2e"
		case maybank2u = "maybank2u"
		case ocbc = "ocbc"
		case pbEnterprise = "pb_enterprise"
		case publicBank = "public_bank"
		case rhb = "rhb"
		case standardChartered = "standard_chartered"
		case uob = "uob"
	}
}

public class PaymentMethodGiropay: Codable {

	public init() {
	}
}

public class PaymentMethodGrabpay: Codable {

	public init() {
	}
}

public class PaymentMethodIdeal: Codable {
	/// The customer's bank, if provided. Can be one of `abn_amro`, `asn_bank`, `bunq`, `handelsbanken`, `ing`, `knab`, `moneyou`, `rabobank`, `regiobank`, `sns_bank`, `triodos_bank`, or `van_lanschot`.
	public var bank: BankValues?
	/// The Bank Identifier Code of the customer's bank, if the bank was provided.
	public var bic: BicValues?

	public init(bank: BankValues? = nil, bic: BicValues? = nil) {
		self.bank = bank
		self.bic = bic
	}

	public enum BankValues: String, Codable {
		case abnAmro = "abn_amro"
		case asnBank = "asn_bank"
		case bunq = "bunq"
		case handelsbanken = "handelsbanken"
		case ing = "ing"
		case knab = "knab"
		case moneyou = "moneyou"
		case rabobank = "rabobank"
		case regiobank = "regiobank"
		case snsBank = "sns_bank"
		case triodosBank = "triodos_bank"
		case vanLanschot = "van_lanschot"
	}

	public enum BicValues: String, Codable {
		case optionABNANL2A = "ABNANL2A"
		case optionASNBNL21 = "ASNBNL21"
		case optionBUNQNL2A = "BUNQNL2A"
		case optionFVLBNL22 = "FVLBNL22"
		case optionHANDNL2A = "HANDNL2A"
		case optionINGBNL2A = "INGBNL2A"
		case optionKNABNL2H = "KNABNL2H"
		case optionMOYONL21 = "MOYONL21"
		case optionRABONL2U = "RABONL2U"
		case optionRBRBNL21 = "RBRBNL21"
		case optionSNSBNL2A = "SNSBNL2A"
		case optionTRIONL2U = "TRIONL2U"
	}
}

public class PaymentMethodInteracPresent: Codable {

	public init() {
	}
}

public class PaymentMethodOptionsAlipay: Codable {

	public init() {
	}
}

public class PaymentMethodOptionsBancontact: Codable {
	/// Preferred language of the Bancontact authorization page that the customer is redirected to.
	public var preferred_language: PreferredLanguageValues

	public init(preferred_language: PreferredLanguageValues) {
		self.preferred_language = preferred_language
	}

	public enum PreferredLanguageValues: String, Codable {
		case de = "de"
		case en = "en"
		case fr = "fr"
		case nl = "nl"
	}
}

public class PaymentMethodOptionsCardInstallments: Codable {
	/// Installment plans that may be selected for this PaymentIntent.
	public var available_plans: [PaymentMethodDetailsCardInstallmentsPlan]??
	/// Whether Installments are enabled for this PaymentIntent.
	public var enabled: Bool
	/// Installment plan selected for this PaymentIntent.
	public var plan: PaymentMethodDetailsCardInstallmentsPlan?

	public init(enabled: Bool, available_plans: [PaymentMethodDetailsCardInstallmentsPlan]?? = nil, plan: PaymentMethodDetailsCardInstallmentsPlan? = nil) {
		self.enabled = enabled
		self.available_plans = available_plans
		self.plan = plan
	}
}

public class PaymentMethodOptionsOxxo: Codable {
	/// The number of calendar days before an OXXO invoice expires. For example, if you create an OXXO invoice on Monday and you set expires_after_days to 2, the OXXO invoice will expire on Wednesday at 23:59 America/Mexico_City time.
	public var expires_after_days: Int

	public init(expires_after_days: Int) {
		self.expires_after_days = expires_after_days
	}
}

public class PaymentMethodOptionsP24: Codable {

	public init() {
	}
}

public class PaymentMethodOptionsSofort: Codable {
	/// Preferred language of the SOFORT authorization page that the customer is redirected to.
	public var preferred_language: PreferredLanguageValues?

	public init(preferred_language: PreferredLanguageValues? = nil) {
		self.preferred_language = preferred_language
	}

	public enum PreferredLanguageValues: String, Codable {
		case de = "de"
		case en = "en"
		case es = "es"
		case fr = "fr"
		case it = "it"
		case nl = "nl"
		case pl = "pl"
	}
}

public class PaymentMethodOxxo: Codable {

	public init() {
	}
}

public class PaymentMethodP24: Codable {
	/// The customer's bank, if provided.
	public var bank: BankValues?

	public init(bank: BankValues? = nil) {
		self.bank = bank
	}

	public enum BankValues: String, Codable {
		case aliorBank = "alior_bank"
		case bankMillennium = "bank_millennium"
		case bankNowyBfgSa = "bank_nowy_bfg_sa"
		case bankPekaoSa = "bank_pekao_sa"
		case bankiSpbdzielcze = "banki_spbdzielcze"
		case blik = "blik"
		case bnpParibas = "bnp_paribas"
		case boz = "boz"
		case citiHandlowy = "citi_handlowy"
		case creditAgricole = "credit_agricole"
		case envelobank = "envelobank"
		case etransferPocztowy24 = "etransfer_pocztowy24"
		case getinBank = "getin_bank"
		case ideabank = "ideabank"
		case ing = "ing"
		case inteligo = "inteligo"
		case mbankMtransfer = "mbank_mtransfer"
		case nestPrzelew = "nest_przelew"
		case noblePay = "noble_pay"
		case pbacZIpko = "pbac_z_ipko"
		case plusBank = "plus_bank"
		case santanderPrzelew24 = "santander_przelew24"
		case tmobileUsbugiBankowe = "tmobile_usbugi_bankowe"
		case toyotaBank = "toyota_bank"
		case volkswagenBank = "volkswagen_bank"
	}
}

public class PaymentMethodSepaDebit: Codable {
	/// Bank code of bank associated with the bank account.
	public var bank_code: String?
	/// Branch code of bank associated with the bank account.
	public var branch_code: String?
	/// Two-letter ISO code representing the country the bank account is located in.
	public var country: String?
	/// Uniquely identifies this particular bank account. You can use this attribute to check whether two bank accounts are the same.
	public var fingerprint: String?
	/// Information about the object that generated this PaymentMethod.
	public var generated_from: SepaDebitGeneratedFrom?
	/// Last four characters of the IBAN.
	public var last4: String?

	public init(bank_code: String? = nil, branch_code: String? = nil, country: String? = nil, fingerprint: String? = nil, generated_from: SepaDebitGeneratedFrom? = nil, last4: String? = nil) {
		self.bank_code = bank_code
		self.branch_code = branch_code
		self.country = country
		self.fingerprint = fingerprint
		self.generated_from = generated_from
		self.last4 = last4
	}
}

public class PaymentMethodSofort: Codable {
	/// Two-letter ISO code representing the country the bank account is located in.
	public var country: String?

	public init(country: String? = nil) {
		self.country = country
	}
}

public class PaymentPagesCheckoutSessionCustomerDetails: Codable {
	/// The customer’s email at time of checkout.
	public var email: String?
	/// The customer’s tax exempt status at time of checkout.
	public var tax_exempt: TaxExemptValues?
	/// The customer’s tax IDs at time of checkout.
	public var tax_ids: [PaymentPagesCheckoutSessionTaxId]??

	public init(email: String? = nil, tax_exempt: TaxExemptValues? = nil, tax_ids: [PaymentPagesCheckoutSessionTaxId]?? = nil) {
		self.email = email
		self.tax_exempt = tax_exempt
		self.tax_ids = tax_ids
	}

	public enum TaxExemptValues: String, Codable {
		case exempt = "exempt"
		case none = "none"
		case reverse = "reverse"
	}
}

public class PaymentPagesCheckoutSessionTaxId: Codable {
	/// The type of the tax ID, one of `eu_vat`, `br_cnpj`, `br_cpf`, `nz_gst`, `au_abn`, `in_gst`, `no_vat`, `za_vat`, `ch_vat`, `mx_rfc`, `sg_uen`, `ru_inn`, `ru_kpp`, `ca_bn`, `hk_br`, `es_cif`, `tw_vat`, `th_vat`, `jp_cn`, `jp_rn`, `li_uid`, `my_itn`, `us_ein`, `kr_brn`, `ca_qst`, `my_sst`, `sg_gst`, `ae_trn`, `cl_tin`, `sa_vat`, `id_npwp`, `my_frp`, or `unknown`
	public var type: TypeValues
	/// The value of the tax ID.
	public var value: String?

	public init(type: TypeValues, value: String? = nil) {
		self.type = type
		self.value = value
	}

	public enum TypeValues: String, Codable {
		case aeTrn = "ae_trn"
		case auAbn = "au_abn"
		case brCnpj = "br_cnpj"
		case brCpf = "br_cpf"
		case caBn = "ca_bn"
		case caQst = "ca_qst"
		case chVat = "ch_vat"
		case clTin = "cl_tin"
		case esCif = "es_cif"
		case euVat = "eu_vat"
		case hkBr = "hk_br"
		case idNpwp = "id_npwp"
		case inGst = "in_gst"
		case jpCn = "jp_cn"
		case jpRn = "jp_rn"
		case krBrn = "kr_brn"
		case liUid = "li_uid"
		case mxRfc = "mx_rfc"
		case myFrp = "my_frp"
		case myItn = "my_itn"
		case mySst = "my_sst"
		case noVat = "no_vat"
		case nzGst = "nz_gst"
		case ruInn = "ru_inn"
		case ruKpp = "ru_kpp"
		case saVat = "sa_vat"
		case sgGst = "sg_gst"
		case sgUen = "sg_uen"
		case thVat = "th_vat"
		case twVat = "tw_vat"
		case unknown = "unknown"
		case usEin = "us_ein"
		case zaVat = "za_vat"
	}
}

public class PaymentPagesCheckoutSessionTotalDetails: Codable {
	/// This is the sum of all the line item discounts.
	public var amount_discount: Int
	/// This is the sum of all the line item tax amounts.
	public var amount_tax: Int
	public var breakdown: PaymentPagesCheckoutSessionTotalDetailsResourceBreakdown?

	public init(amount_discount: Int, amount_tax: Int, breakdown: PaymentPagesCheckoutSessionTotalDetailsResourceBreakdown? = nil) {
		self.amount_discount = amount_discount
		self.amount_tax = amount_tax
		self.breakdown = breakdown
	}
}

public class PaymentPagesCheckoutSessionTotalDetailsResourceBreakdown: Codable {
	/// The aggregated line item discounts.
	public var discounts: [LineItemsDiscountAmount]
	/// The aggregated line item tax amounts by rate.
	public var taxes: [LineItemsTaxAmount]

	public init(discounts: [LineItemsDiscountAmount], taxes: [LineItemsTaxAmount]) {
		self.discounts = discounts
		self.taxes = taxes
	}
}

public class PaymentPagesPaymentPageResourcesShippingAddressCollection: Codable {
	/// An array of two-letter ISO country codes representing which countries Checkout should provide as options for shipping locations. Unsupported country codes: `AS, CX, CC, CU, HM, IR, KP, MH, FM, NF, MP, PW, SD, SY, UM, VI`.
	public var allowed_countries: [String]

	public init(allowed_countries: [String]) {
		self.allowed_countries = allowed_countries
	}
}

public class PaymentSource: Codable {
}

/// A `Payout` object is created when you receive funds from Stripe, or when you initiate a payout to either a bank account or debit card of a [connected Stripe account](/docs/connect/bank-debit-card-payouts). You can retrieve individual payouts, as well as list all payouts. Payouts are made on [varying schedules](/docs/connect/manage-payout-schedule), depending on your country and industry.  Related guide: [Receiving Payouts](https://stripe.com/docs/payouts).
public class Payout: Codable {
	/// Amount (in %s) to be transferred to your bank account or debit card.
	public var amount: Int
	/// Date the payout is expected to arrive in the bank. This factors in delays like weekends or bank holidays.
	public var arrival_date: Timestamp
	/// Returns `true` if the payout was created by an [automated payout schedule](https://stripe.com/docs/payouts#payout-schedule), and `false` if it was [requested manually](https://stripe.com/docs/payouts#manual-payouts).
	public var automatic: Bool
	/// ID of the balance transaction that describes the impact of this payout on your account balance.
	public var balance_transaction: String?
	/// Time at which the object was created. Measured in seconds since the Unix epoch.
	public var created: Timestamp
	/// Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
	public var currency: String
	/// An arbitrary string attached to the object. Often useful for displaying to users.
	public var description: String?
	/// ID of the bank account or card the payout was sent to.
	public var destination: String?
	/// If the payout failed or was canceled, this will be the ID of the balance transaction that reversed the initial balance transaction, and puts the funds from the failed payout back in your balance.
	public var failure_balance_transaction: String?
	/// Error code explaining reason for payout failure if available. See [Types of payout failures](https://stripe.com/docs/api#payout_failures) for a list of failure codes.
	public var failure_code: String?
	/// Message to user further explaining reason for payout failure if available.
	public var failure_message: String?
	/// Unique identifier for the object.
	public var id: String
	/// Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
	public var livemode: Bool
	/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
	public var metadata: String?
	/// The method used to send this payout, which can be `standard` or `instant`. `instant` is only supported for payouts to debit cards. (See [Instant payouts for marketplaces](https://stripe.com/blog/instant-payouts-for-marketplaces) for more information.)
	public var method: String
	/// String representing the object's type. Objects of the same type share the same value.
	public var object: ObjectValues
	/// If the payout reverses another, this is the ID of the original payout.
	public var original_payout: String?
	/// If the payout was reversed, this is the ID of the payout that reverses this payout.
	public var reversed_by: String?
	/// The source balance this payout came from. One of `card`, `fpx`, or `bank_account`.
	public var source_type: String
	/// Extra information about a payout to be displayed on the user's bank statement.
	public var statement_descriptor: String?
	/// Current status of the payout: `paid`, `pending`, `in_transit`, `canceled` or `failed`. A payout is `pending` until it is submitted to the bank, when it becomes `in_transit`. The status then changes to `paid` if the transaction goes through, or to `failed` or `canceled` (within 5 business days). Some failed payouts may initially show as `paid` but then change to `failed`.
	public var status: String
	/// Can be `bank_account` or `card`.
	public var type: TypeValues

	/// A `Payout` object is created when you receive funds from Stripe, or when you initiate a payout to either a bank account or debit card of a [connected Stripe account](/docs/connect/bank-debit-card-payouts). You can retrieve individual payouts, as well as list all payouts. Payouts are made on [varying schedules](/docs/connect/manage-payout-schedule), depending on your country and industry.  Related guide: [Receiving Payouts](https://stripe.com/docs/payouts).
	/// - Parameters:
	///   - amount: Amount (in %s) to be transferred to your bank account or debit card.
	///   - arrival_date: Date the payout is expected to arrive in the bank. This factors in delays like weekends or bank holidays.
	///   - automatic: Returns `true` if the payout was created by an [automated payout schedule](https://stripe.com/docs/payouts#payout-schedule), and `false` if it was [requested manually](https://stripe.com/docs/payouts#manual-payouts).
	///   - balance_transaction: ID of the balance transaction that describes the impact of this payout on your account balance.
	///   - created: Time at which the object was created. Measured in seconds since the Unix epoch.
	///   - currency: Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
	///   - description: An arbitrary string attached to the object. Often useful for displaying to users.
	///   - destination: ID of the bank account or card the payout was sent to.
	///   - failure_balance_transaction: If the payout failed or was canceled, this will be the ID of the balance transaction that reversed the initial balance transaction, and puts the funds from the failed payout back in your balance.
	///   - failure_code: Error code explaining reason for payout failure if available. See [Types of payout failures](https://stripe.com/docs/api#payout_failures) for a list of failure codes.
	///   - failure_message: Message to user further explaining reason for payout failure if available.
	///   - id: Unique identifier for the object.
	///   - livemode: Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
	///   - metadata: Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
	///   - method: The method used to send this payout, which can be `standard` or `instant`. `instant` is only supported for payouts to debit cards. (See [Instant payouts for marketplaces](https://stripe.com/blog/instant-payouts-for-marketplaces) for more information.)
	///   - object: String representing the object's type. Objects of the same type share the same value.
	///   - original_payout: If the payout reverses another, this is the ID of the original payout.
	///   - reversed_by: If the payout was reversed, this is the ID of the payout that reverses this payout.
	///   - source_type: The source balance this payout came from. One of `card`, `fpx`, or `bank_account`.
	///   - statement_descriptor: Extra information about a payout to be displayed on the user's bank statement.
	///   - status: Current status of the payout: `paid`, `pending`, `in_transit`, `canceled` or `failed`. A payout is `pending` until it is submitted to the bank, when it becomes `in_transit`. The status then changes to `paid` if the transaction goes through, or to `failed` or `canceled` (within 5 business days). Some failed payouts may initially show as `paid` but then change to `failed`.
	///   - type: Can be `bank_account` or `card`.
	public init(amount: Int, arrival_date: Timestamp, automatic: Bool, created: Timestamp, currency: String, id: String, livemode: Bool, method: String, object: ObjectValues, source_type: String, status: String, type: TypeValues, balance_transaction: String? = nil, description: String? = nil, destination: String? = nil, failure_balance_transaction: String? = nil, failure_code: String? = nil, failure_message: String? = nil, metadata: String? = nil, original_payout: String? = nil, reversed_by: String? = nil, statement_descriptor: String? = nil) {
		self.amount = amount
		self.arrival_date = arrival_date
		self.automatic = automatic
		self.created = created
		self.currency = currency
		self.id = id
		self.livemode = livemode
		self.method = method
		self.object = object
		self.source_type = source_type
		self.status = status
		self.type = type
		self.balance_transaction = balance_transaction
		self.description = description
		self.destination = destination
		self.failure_balance_transaction = failure_balance_transaction
		self.failure_code = failure_code
		self.failure_message = failure_message
		self.metadata = metadata
		self.original_payout = original_payout
		self.reversed_by = reversed_by
		self.statement_descriptor = statement_descriptor
	}

	public enum TypeValues: String, Codable {
		case bankAccount = "bank_account"
		case card = "card"
	}

	public enum ObjectValues: String, Codable {
		case payout = "payout"
	}
}

public class Period: Codable {
	/// The end date of this usage period. All usage up to and including this point in time is included.
	public var end: Timestamp?
	/// The start date of this usage period. All usage after this point in time is included.
	public var start: Timestamp?

	public init(end: Timestamp? = nil, start: Timestamp? = nil) {
		self.end = end
		self.start = start
	}
}

/// This is an object representing a person associated with a Stripe account.  A platform cannot access a Standard or Express account's persons after the account starts onboarding, such as after generating an account link for the account. See the [Standard onboarding](https://stripe.com/docs/connect/standard-accounts) or [Express onboarding documentation](https://stripe.com/docs/connect/express-accounts) for information about platform pre-filling and account onboarding steps.  Related guide: [Handling Identity Verification with the API](https://stripe.com/docs/connect/identity-verification-api#person-information).
public class Person: Codable {
	/// The account the person is associated with.
	public var account: String
	public var address: Address?
	public var address_kana: LegalEntityJapanAddress?
	public var address_kanji: LegalEntityJapanAddress?
	/// Time at which the object was created. Measured in seconds since the Unix epoch.
	public var created: Timestamp
	public var dob: LegalEntityDob?
	/// The person's email address.
	public var email: String?
	/// The person's first name.
	public var first_name: String?
	/// The Kana variation of the person's first name (Japan only).
	public var first_name_kana: String?
	/// The Kanji variation of the person's first name (Japan only).
	public var first_name_kanji: String?
	/// The person's gender (International regulations require either "male" or "female").
	public var gender: String?
	/// Unique identifier for the object.
	public var id: String
	/// Whether the person's `id_number` was provided.
	public var id_number_provided: Bool?
	/// The person's last name.
	public var last_name: String?
	/// The Kana variation of the person's last name (Japan only).
	public var last_name_kana: String?
	/// The Kanji variation of the person's last name (Japan only).
	public var last_name_kanji: String?
	/// The person's maiden name.
	public var maiden_name: String?
	/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
	public var metadata: String?
	/// String representing the object's type. Objects of the same type share the same value.
	public var object: ObjectValues
	/// The person's phone number.
	public var phone: String?
	/// Indicates if the person or any of their representatives, family members, or other closely related persons, declares that they hold or have held an important public job or function, in any jurisdiction.
	public var political_exposure: PoliticalExposureValues?
	public var relationship: PersonRelationship?
	public var requirements: PersonRequirements?
	/// Whether the last four digits of the person's Social Security number have been provided (U.S. only).
	public var ssn_last_4_provided: Bool?
	public var verification: LegalEntityPersonVerification?

	/// This is an object representing a person associated with a Stripe account.  A platform cannot access a Standard or Express account's persons after the account starts onboarding, such as after generating an account link for the account. See the [Standard onboarding](https://stripe.com/docs/connect/standard-accounts) or [Express onboarding documentation](https://stripe.com/docs/connect/express-accounts) for information about platform pre-filling and account onboarding steps.  Related guide: [Handling Identity Verification with the API](https://stripe.com/docs/connect/identity-verification-api#person-information).
	/// - Parameters:
	///   - account: The account the person is associated with.
	///   - created: Time at which the object was created. Measured in seconds since the Unix epoch.
	///   - email: The person's email address.
	///   - first_name: The person's first name.
	///   - first_name_kana: The Kana variation of the person's first name (Japan only).
	///   - first_name_kanji: The Kanji variation of the person's first name (Japan only).
	///   - gender: The person's gender (International regulations require either "male" or "female").
	///   - id: Unique identifier for the object.
	///   - id_number_provided: Whether the person's `id_number` was provided.
	///   - last_name: The person's last name.
	///   - last_name_kana: The Kana variation of the person's last name (Japan only).
	///   - last_name_kanji: The Kanji variation of the person's last name (Japan only).
	///   - maiden_name: The person's maiden name.
	///   - metadata: Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
	///   - object: String representing the object's type. Objects of the same type share the same value.
	///   - phone: The person's phone number.
	///   - political_exposure: Indicates if the person or any of their representatives, family members, or other closely related persons, declares that they hold or have held an important public job or function, in any jurisdiction.
	///   - ssn_last_4_provided: Whether the last four digits of the person's Social Security number have been provided (U.S. only).
	public init(account: String, created: Timestamp, id: String, object: ObjectValues, address: Address? = nil, address_kana: LegalEntityJapanAddress? = nil, address_kanji: LegalEntityJapanAddress? = nil, dob: LegalEntityDob? = nil, email: String? = nil, first_name: String? = nil, first_name_kana: String? = nil, first_name_kanji: String? = nil, gender: String? = nil, id_number_provided: Bool? = nil, last_name: String? = nil, last_name_kana: String? = nil, last_name_kanji: String? = nil, maiden_name: String? = nil, metadata: String? = nil, phone: String? = nil, political_exposure: PoliticalExposureValues? = nil, relationship: PersonRelationship? = nil, requirements: PersonRequirements? = nil, ssn_last_4_provided: Bool? = nil, verification: LegalEntityPersonVerification? = nil) {
		self.account = account
		self.created = created
		self.id = id
		self.object = object
		self.address = address
		self.address_kana = address_kana
		self.address_kanji = address_kanji
		self.dob = dob
		self.email = email
		self.first_name = first_name
		self.first_name_kana = first_name_kana
		self.first_name_kanji = first_name_kanji
		self.gender = gender
		self.id_number_provided = id_number_provided
		self.last_name = last_name
		self.last_name_kana = last_name_kana
		self.last_name_kanji = last_name_kanji
		self.maiden_name = maiden_name
		self.metadata = metadata
		self.phone = phone
		self.political_exposure = political_exposure
		self.relationship = relationship
		self.requirements = requirements
		self.ssn_last_4_provided = ssn_last_4_provided
		self.verification = verification
	}

	public enum ObjectValues: String, Codable {
		case person = "person"
	}

	public enum PoliticalExposureValues: String, Codable {
		case existing = "existing"
		case none = "none"
	}
}

public class PersonRelationship: Codable {
	/// Whether the person is a director of the account's legal entity. Currently only required for accounts in the EU. Directors are typically members of the governing board of the company, or responsible for ensuring the company meets its regulatory obligations.
	public var director: Bool?
	/// Whether the person has significant responsibility to control, manage, or direct the organization.
	public var executive: Bool?
	/// Whether the person is an owner of the account’s legal entity.
	public var owner: Bool?
	/// The percent owned by the person of the account's legal entity.
	public var percent_ownership: StringNumber?
	/// Whether the person is authorized as the primary representative of the account. This is the person nominated by the business to provide information about themselves, and general information about the account. There can only be one representative at any given time. At the time the account is created, this person should be set to the person responsible for opening the account.
	public var representative: Bool?
	/// The person's title (e.g., CEO, Support Engineer).
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

public class PersonRequirements: Codable {
	/// Fields that need to be collected to keep the person's account enabled. If not collected by the account's `current_deadline`, these fields appear in `past_due` as well, and the account is disabled.
	public var currently_due: [String]
	/// The fields that are `currently_due` and need to be collected again because validation or verification failed for some reason.
	public var errors: [AccountRequirementsError]
	/// Fields that need to be collected assuming all volume thresholds are reached. As fields are needed, they are moved to `currently_due` and the account's `current_deadline` is set.
	public var eventually_due: [String]
	/// Fields that weren't collected by the account's `current_deadline`. These fields need to be collected to enable payouts for the person's account.
	public var past_due: [String]
	/// Fields that may become required depending on the results of verification or review. An empty array unless an asynchronous verification is pending. If verification fails, the fields in this array become required and move to `currently_due` or `past_due`.
	public var pending_verification: [String]

	public init(currently_due: [String], errors: [AccountRequirementsError], eventually_due: [String], past_due: [String], pending_verification: [String]) {
		self.currently_due = currently_due
		self.errors = errors
		self.eventually_due = eventually_due
		self.past_due = past_due
		self.pending_verification = pending_verification
	}
}

/// You can now model subscriptions more flexibly using the [Prices API](https://stripe.com/docs/api#prices). It replaces the Plans API and is backwards compatible to simplify your migration.  Plans define the base price, currency, and billing cycle for recurring purchases of products. [Products](https://stripe.com/docs/api#products) help you track inventory or provisioning, and plans help you track pricing. Different physical goods or levels of service should be represented by products, and pricing options should be represented by plans. This approach lets you change prices without having to change your provisioning scheme.  For example, you might have a single "gold" product that has plans for $10/month, $100/year, €9/month, and €90/year.  Related guides: [Set up a subscription](https://stripe.com/docs/billing/subscriptions/set-up-subscription) and more about [products and prices](https://stripe.com/docs/billing/prices-guide).
public class Plan: Codable {
	/// Whether the plan can be used for new purchases.
	public var active: Bool
	/// Specifies a usage aggregation strategy for plans of `usage_type=metered`. Allowed values are `sum` for summing up all usage during a period, `last_during_period` for using the last usage record reported within a period, `last_ever` for using the last usage record ever (across period bounds) or `max` which uses the usage record with the maximum reported usage during a period. Defaults to `sum`.
	public var aggregate_usage: AggregateUsageValues?
	/// The unit amount in %s to be charged, represented as a whole integer if possible.
	public var amount: Int?
	/// The unit amount in %s to be charged, represented as a decimal string with at most 12 decimal places.
	public var amount_decimal: StringNumber?
	/// Describes how to compute the price per period. Either `per_unit` or `tiered`. `per_unit` indicates that the fixed amount (specified in `amount`) will be charged per unit in `quantity` (for plans with `usage_type=licensed`), or per unit of total usage (for plans with `usage_type=metered`). `tiered` indicates that the unit pricing will be computed using a tiering strategy as defined using the `tiers` and `tiers_mode` attributes.
	public var billing_scheme: BillingSchemeValues
	/// Time at which the object was created. Measured in seconds since the Unix epoch.
	public var created: Timestamp
	/// Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
	public var currency: String
	/// Unique identifier for the object.
	public var id: String
	/// The frequency at which a subscription is billed. One of `day`, `week`, `month` or `year`.
	public var interval: IntervalValues
	/// The number of intervals (specified in the `interval` attribute) between subscription billings. For example, `interval=month` and `interval_count=3` bills every 3 months.
	public var interval_count: Int
	/// Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
	public var livemode: Bool
	/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
	public var metadata: String?
	/// A brief description of the plan, hidden from customers.
	public var nickname: String?
	/// String representing the object's type. Objects of the same type share the same value.
	public var object: ObjectValues
	/// The product whose pricing this plan determines.
	public var product: String?
	/// Each element represents a pricing tier. This parameter requires `billing_scheme` to be set to `tiered`. See also the documentation for `billing_scheme`.
	public var tiers: [PlanTier]?
	/// Defines if the tiering price should be `graduated` or `volume` based. In `volume`-based tiering, the maximum quantity within a period determines the per unit price. In `graduated` tiering, pricing can change as the quantity grows.
	public var tiers_mode: TiersModeValues?
	/// Apply a transformation to the reported usage or set quantity before computing the amount billed. Cannot be combined with `tiers`.
	public var transform_usage: TransformUsage?
	/// Default number of trial days when subscribing a customer to this plan using [`trial_from_plan=true`](https://stripe.com/docs/api#create_subscription-trial_from_plan).
	public var trial_period_days: Int?
	/// Configures how the quantity per period should be determined. Can be either `metered` or `licensed`. `licensed` automatically bills the `quantity` set when adding it to a subscription. `metered` aggregates the total usage based on usage records. Defaults to `licensed`.
	public var usage_type: UsageTypeValues

	/// You can now model subscriptions more flexibly using the [Prices API](https://stripe.com/docs/api#prices). It replaces the Plans API and is backwards compatible to simplify your migration.  Plans define the base price, currency, and billing cycle for recurring purchases of products. [Products](https://stripe.com/docs/api#products) help you track inventory or provisioning, and plans help you track pricing. Different physical goods or levels of service should be represented by products, and pricing options should be represented by plans. This approach lets you change prices without having to change your provisioning scheme.  For example, you might have a single "gold" product that has plans for $10/month, $100/year, €9/month, and €90/year.  Related guides: [Set up a subscription](https://stripe.com/docs/billing/subscriptions/set-up-subscription) and more about [products and prices](https://stripe.com/docs/billing/prices-guide).
	/// - Parameters:
	///   - active: Whether the plan can be used for new purchases.
	///   - aggregate_usage: Specifies a usage aggregation strategy for plans of `usage_type=metered`. Allowed values are `sum` for summing up all usage during a period, `last_during_period` for using the last usage record reported within a period, `last_ever` for using the last usage record ever (across period bounds) or `max` which uses the usage record with the maximum reported usage during a period. Defaults to `sum`.
	///   - amount: The unit amount in %s to be charged, represented as a whole integer if possible.
	///   - amount_decimal: The unit amount in %s to be charged, represented as a decimal string with at most 12 decimal places.
	///   - billing_scheme: Describes how to compute the price per period. Either `per_unit` or `tiered`. `per_unit` indicates that the fixed amount (specified in `amount`) will be charged per unit in `quantity` (for plans with `usage_type=licensed`), or per unit of total usage (for plans with `usage_type=metered`). `tiered` indicates that the unit pricing will be computed using a tiering strategy as defined using the `tiers` and `tiers_mode` attributes.
	///   - created: Time at which the object was created. Measured in seconds since the Unix epoch.
	///   - currency: Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
	///   - id: Unique identifier for the object.
	///   - interval: The frequency at which a subscription is billed. One of `day`, `week`, `month` or `year`.
	///   - interval_count: The number of intervals (specified in the `interval` attribute) between subscription billings. For example, `interval=month` and `interval_count=3` bills every 3 months.
	///   - livemode: Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
	///   - metadata: Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
	///   - nickname: A brief description of the plan, hidden from customers.
	///   - object: String representing the object's type. Objects of the same type share the same value.
	///   - product: The product whose pricing this plan determines.
	///   - tiers: Each element represents a pricing tier. This parameter requires `billing_scheme` to be set to `tiered`. See also the documentation for `billing_scheme`.
	///   - tiers_mode: Defines if the tiering price should be `graduated` or `volume` based. In `volume`-based tiering, the maximum quantity within a period determines the per unit price. In `graduated` tiering, pricing can change as the quantity grows.
	///   - transform_usage: Apply a transformation to the reported usage or set quantity before computing the amount billed. Cannot be combined with `tiers`.
	///   - trial_period_days: Default number of trial days when subscribing a customer to this plan using [`trial_from_plan=true`](https://stripe.com/docs/api#create_subscription-trial_from_plan).
	///   - usage_type: Configures how the quantity per period should be determined. Can be either `metered` or `licensed`. `licensed` automatically bills the `quantity` set when adding it to a subscription. `metered` aggregates the total usage based on usage records. Defaults to `licensed`.
	public init(active: Bool, billing_scheme: BillingSchemeValues, created: Timestamp, currency: String, id: String, interval: IntervalValues, interval_count: Int, livemode: Bool, object: ObjectValues, usage_type: UsageTypeValues, aggregate_usage: AggregateUsageValues? = nil, amount: Int? = nil, amount_decimal: StringNumber? = nil, metadata: String? = nil, nickname: String? = nil, product: String? = nil, tiers: [PlanTier]? = nil, tiers_mode: TiersModeValues? = nil, transform_usage: TransformUsage? = nil, trial_period_days: Int? = nil) {
		self.active = active
		self.billing_scheme = billing_scheme
		self.created = created
		self.currency = currency
		self.id = id
		self.interval = interval
		self.interval_count = interval_count
		self.livemode = livemode
		self.object = object
		self.usage_type = usage_type
		self.aggregate_usage = aggregate_usage
		self.amount = amount
		self.amount_decimal = amount_decimal
		self.metadata = metadata
		self.nickname = nickname
		self.product = product
		self.tiers = tiers
		self.tiers_mode = tiers_mode
		self.transform_usage = transform_usage
		self.trial_period_days = trial_period_days
	}

	public enum ObjectValues: String, Codable {
		case plan = "plan"
	}

	public enum TiersModeValues: String, Codable {
		case graduated = "graduated"
		case volume = "volume"
	}

	public enum IntervalValues: String, Codable {
		case day = "day"
		case month = "month"
		case week = "week"
		case year = "year"
	}

	public enum UsageTypeValues: String, Codable {
		case licensed = "licensed"
		case metered = "metered"
	}

	public enum AggregateUsageValues: String, Codable {
		case lastDuringPeriod = "last_during_period"
		case lastEver = "last_ever"
		case max = "max"
		case sum = "sum"
	}

	public enum BillingSchemeValues: String, Codable {
		case perUnit = "per_unit"
		case tiered = "tiered"
	}
}

public class PlanTier: Codable {
	/// Price for the entire tier.
	public var flat_amount: Int?
	/// Same as `flat_amount`, but contains a decimal value with at most 12 decimal places.
	public var flat_amount_decimal: StringNumber?
	/// Per unit price for units relevant to the tier.
	public var unit_amount: Int?
	/// Same as `unit_amount`, but contains a decimal value with at most 12 decimal places.
	public var unit_amount_decimal: StringNumber?
	/// Up to and including to this quantity will be contained in the tier.
	public var up_to: Int?

	public init(flat_amount: Int? = nil, flat_amount_decimal: StringNumber? = nil, unit_amount: Int? = nil, unit_amount_decimal: StringNumber? = nil, up_to: Int? = nil) {
		self.flat_amount = flat_amount
		self.flat_amount_decimal = flat_amount_decimal
		self.unit_amount = unit_amount
		self.unit_amount_decimal = unit_amount_decimal
		self.up_to = up_to
	}
}

public class PlatformTaxFee: Codable {
	/// The Connected account that incurred this charge.
	public var account: String
	/// Unique identifier for the object.
	public var id: String
	/// String representing the object's type. Objects of the same type share the same value.
	public var object: ObjectValues
	/// The payment object that caused this tax to be inflicted.
	public var source_transaction: String
	/// The type of tax (VAT).
	public var type: String

	public init(account: String, id: String, object: ObjectValues, source_transaction: String, type: String) {
		self.account = account
		self.id = id
		self.object = object
		self.source_transaction = source_transaction
		self.type = type
	}

	public enum ObjectValues: String, Codable {
		case platformTaxFee = "platform_tax_fee"
	}
}

/// Prices define the unit cost, currency, and (optional) billing cycle for both recurring and one-time purchases of products. [Products](https://stripe.com/docs/api#products) help you track inventory or provisioning, and prices help you track payment terms. Different physical goods or levels of service should be represented by products, and pricing options should be represented by prices. This approach lets you change prices without having to change your provisioning scheme.  For example, you might have a single "gold" product that has prices for $10/month, $100/year, and €9 once.  Related guides: [Set up a subscription](https://stripe.com/docs/billing/subscriptions/set-up-subscription), [create an invoice](https://stripe.com/docs/billing/invoices/create), and more about [products and prices](https://stripe.com/docs/billing/prices-guide).
public class Price: Codable {
	/// Whether the price can be used for new purchases.
	public var active: Bool
	/// Describes how to compute the price per period. Either `per_unit` or `tiered`. `per_unit` indicates that the fixed amount (specified in `unit_amount` or `unit_amount_decimal`) will be charged per unit in `quantity` (for prices with `usage_type=licensed`), or per unit of total usage (for prices with `usage_type=metered`). `tiered` indicates that the unit pricing will be computed using a tiering strategy as defined using the `tiers` and `tiers_mode` attributes.
	public var billing_scheme: BillingSchemeValues
	/// Time at which the object was created. Measured in seconds since the Unix epoch.
	public var created: Timestamp
	/// Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
	public var currency: String
	/// Unique identifier for the object.
	public var id: String
	/// Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
	public var livemode: Bool
	/// A lookup key used to retrieve prices dynamically from a static string.
	public var lookup_key: String?
	/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
	public var metadata: String
	/// A brief description of the plan, hidden from customers.
	public var nickname: String?
	/// String representing the object's type. Objects of the same type share the same value.
	public var object: ObjectValues
	/// The ID of the product this price is associated with.
	public var product: String
	/// The recurring components of a price such as `interval` and `usage_type`.
	public var recurring: Recurring?
	/// Each element represents a pricing tier. This parameter requires `billing_scheme` to be set to `tiered`. See also the documentation for `billing_scheme`.
	public var tiers: [PriceTier]?
	/// Defines if the tiering price should be `graduated` or `volume` based. In `volume`-based tiering, the maximum quantity within a period determines the per unit price. In `graduated` tiering, pricing can change as the quantity grows.
	public var tiers_mode: TiersModeValues?
	/// Apply a transformation to the reported usage or set quantity before computing the amount billed. Cannot be combined with `tiers`.
	public var transform_quantity: TransformQuantity?
	/// One of `one_time` or `recurring` depending on whether the price is for a one-time purchase or a recurring (subscription) purchase.
	public var type: TypeValues
	/// The unit amount in %s to be charged, represented as a whole integer if possible.
	public var unit_amount: Int?
	/// The unit amount in %s to be charged, represented as a decimal string with at most 12 decimal places.
	public var unit_amount_decimal: StringNumber?

	/// Prices define the unit cost, currency, and (optional) billing cycle for both recurring and one-time purchases of products. [Products](https://stripe.com/docs/api#products) help you track inventory or provisioning, and prices help you track payment terms. Different physical goods or levels of service should be represented by products, and pricing options should be represented by prices. This approach lets you change prices without having to change your provisioning scheme.  For example, you might have a single "gold" product that has prices for $10/month, $100/year, and €9 once.  Related guides: [Set up a subscription](https://stripe.com/docs/billing/subscriptions/set-up-subscription), [create an invoice](https://stripe.com/docs/billing/invoices/create), and more about [products and prices](https://stripe.com/docs/billing/prices-guide).
	/// - Parameters:
	///   - active: Whether the price can be used for new purchases.
	///   - billing_scheme: Describes how to compute the price per period. Either `per_unit` or `tiered`. `per_unit` indicates that the fixed amount (specified in `unit_amount` or `unit_amount_decimal`) will be charged per unit in `quantity` (for prices with `usage_type=licensed`), or per unit of total usage (for prices with `usage_type=metered`). `tiered` indicates that the unit pricing will be computed using a tiering strategy as defined using the `tiers` and `tiers_mode` attributes.
	///   - created: Time at which the object was created. Measured in seconds since the Unix epoch.
	///   - currency: Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
	///   - id: Unique identifier for the object.
	///   - livemode: Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
	///   - lookup_key: A lookup key used to retrieve prices dynamically from a static string.
	///   - metadata: Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
	///   - nickname: A brief description of the plan, hidden from customers.
	///   - object: String representing the object's type. Objects of the same type share the same value.
	///   - product: The ID of the product this price is associated with.
	///   - recurring: The recurring components of a price such as `interval` and `usage_type`.
	///   - tiers: Each element represents a pricing tier. This parameter requires `billing_scheme` to be set to `tiered`. See also the documentation for `billing_scheme`.
	///   - tiers_mode: Defines if the tiering price should be `graduated` or `volume` based. In `volume`-based tiering, the maximum quantity within a period determines the per unit price. In `graduated` tiering, pricing can change as the quantity grows.
	///   - transform_quantity: Apply a transformation to the reported usage or set quantity before computing the amount billed. Cannot be combined with `tiers`.
	///   - type: One of `one_time` or `recurring` depending on whether the price is for a one-time purchase or a recurring (subscription) purchase.
	///   - unit_amount: The unit amount in %s to be charged, represented as a whole integer if possible.
	///   - unit_amount_decimal: The unit amount in %s to be charged, represented as a decimal string with at most 12 decimal places.
	public init(active: Bool, billing_scheme: BillingSchemeValues, created: Timestamp, currency: String, id: String, livemode: Bool, metadata: String, object: ObjectValues, product: String, type: TypeValues, lookup_key: String? = nil, nickname: String? = nil, recurring: Recurring? = nil, tiers: [PriceTier]? = nil, tiers_mode: TiersModeValues? = nil, transform_quantity: TransformQuantity? = nil, unit_amount: Int? = nil, unit_amount_decimal: StringNumber? = nil) {
		self.active = active
		self.billing_scheme = billing_scheme
		self.created = created
		self.currency = currency
		self.id = id
		self.livemode = livemode
		self.metadata = metadata
		self.object = object
		self.product = product
		self.type = type
		self.lookup_key = lookup_key
		self.nickname = nickname
		self.recurring = recurring
		self.tiers = tiers
		self.tiers_mode = tiers_mode
		self.transform_quantity = transform_quantity
		self.unit_amount = unit_amount
		self.unit_amount_decimal = unit_amount_decimal
	}

	public enum ObjectValues: String, Codable {
		case price = "price"
	}

	public enum TypeValues: String, Codable {
		case oneTime = "one_time"
		case recurring = "recurring"
	}

	public enum BillingSchemeValues: String, Codable {
		case perUnit = "per_unit"
		case tiered = "tiered"
	}

	public enum TiersModeValues: String, Codable {
		case graduated = "graduated"
		case volume = "volume"
	}
}

public class PriceTier: Codable {
	/// Price for the entire tier.
	public var flat_amount: Int?
	/// Same as `flat_amount`, but contains a decimal value with at most 12 decimal places.
	public var flat_amount_decimal: StringNumber?
	/// Per unit price for units relevant to the tier.
	public var unit_amount: Int?
	/// Same as `unit_amount`, but contains a decimal value with at most 12 decimal places.
	public var unit_amount_decimal: StringNumber?
	/// Up to and including to this quantity will be contained in the tier.
	public var up_to: Int?

	public init(flat_amount: Int? = nil, flat_amount_decimal: StringNumber? = nil, unit_amount: Int? = nil, unit_amount_decimal: StringNumber? = nil, up_to: Int? = nil) {
		self.flat_amount = flat_amount
		self.flat_amount_decimal = flat_amount_decimal
		self.unit_amount = unit_amount
		self.unit_amount_decimal = unit_amount_decimal
		self.up_to = up_to
	}
}

/// Products describe the specific goods or services you offer to your customers. For example, you might offer a Standard and Premium version of your goods or service; each version would be a separate Product. They can be used in conjunction with [Prices](https://stripe.com/docs/api#prices) to configure pricing in Checkout and Subscriptions.  Related guides: [Set up a subscription](https://stripe.com/docs/billing/subscriptions/set-up-subscription) or accept [one-time payments with Checkout](https://stripe.com/docs/payments/checkout/client#create-products) and more about [Products and Prices](https://stripe.com/docs/billing/prices-guide)
public class Product: Codable {
	/// Whether the product is currently available for purchase.
	public var active: Bool
	/// A list of up to 5 attributes that each SKU can provide values for (e.g., `["color", "size"]`).
	public var attributes: [String]??
	/// A short one-line description of the product, meant to be displayable to the customer. Only applicable to products of `type=good`.
	public var caption: String?
	/// Time at which the object was created. Measured in seconds since the Unix epoch.
	public var created: Timestamp
	/// An array of connect application identifiers that cannot purchase this product. Only applicable to products of `type=good`.
	public var deactivate_on: [String]?
	/// The product's description, meant to be displayable to the customer. Use this field to optionally store a long form explanation of the product being sold for your own rendering purposes.
	public var description: String?
	/// Unique identifier for the object.
	public var id: String
	/// A list of up to 8 URLs of images for this product, meant to be displayable to the customer.
	public var images: [String]
	/// Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
	public var livemode: Bool
	/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
	public var metadata: String
	/// The product's name, meant to be displayable to the customer. Whenever this product is sold via a subscription, name will show up on associated invoice line item descriptions.
	public var name: String
	/// String representing the object's type. Objects of the same type share the same value.
	public var object: ObjectValues
	/// The dimensions of this product for shipping purposes. A SKU associated with this product can override this value by having its own `package_dimensions`. Only applicable to products of `type=good`.
	public var package_dimensions: PackageDimensions?
	/// Whether this product is a shipped good. Only applicable to products of `type=good`.
	public var shippable: Bool?
	/// Extra information about a product which will appear on your customer's credit card statement. In the case that multiple products are billed at once, the first statement descriptor will be used.
	public var statement_descriptor: String?
	/// A label that represents units of this product in Stripe and on customers’ receipts and invoices. When set, this will be included in associated invoice line item descriptions.
	public var unit_label: String?
	/// Time at which the object was last updated. Measured in seconds since the Unix epoch.
	public var updated: Timestamp
	/// A URL of a publicly-accessible webpage for this product. Only applicable to products of `type=good`.
	public var url: String?

	/// Products describe the specific goods or services you offer to your customers. For example, you might offer a Standard and Premium version of your goods or service; each version would be a separate Product. They can be used in conjunction with [Prices](https://stripe.com/docs/api#prices) to configure pricing in Checkout and Subscriptions.  Related guides: [Set up a subscription](https://stripe.com/docs/billing/subscriptions/set-up-subscription) or accept [one-time payments with Checkout](https://stripe.com/docs/payments/checkout/client#create-products) and more about [Products and Prices](https://stripe.com/docs/billing/prices-guide)
	/// - Parameters:
	///   - active: Whether the product is currently available for purchase.
	///   - attributes: A list of up to 5 attributes that each SKU can provide values for (e.g., `["color", "size"]`).
	///   - caption: A short one-line description of the product, meant to be displayable to the customer. Only applicable to products of `type=good`.
	///   - created: Time at which the object was created. Measured in seconds since the Unix epoch.
	///   - deactivate_on: An array of connect application identifiers that cannot purchase this product. Only applicable to products of `type=good`.
	///   - description: The product's description, meant to be displayable to the customer. Use this field to optionally store a long form explanation of the product being sold for your own rendering purposes.
	///   - id: Unique identifier for the object.
	///   - images: A list of up to 8 URLs of images for this product, meant to be displayable to the customer.
	///   - livemode: Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
	///   - metadata: Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
	///   - name: The product's name, meant to be displayable to the customer. Whenever this product is sold via a subscription, name will show up on associated invoice line item descriptions.
	///   - object: String representing the object's type. Objects of the same type share the same value.
	///   - package_dimensions: The dimensions of this product for shipping purposes. A SKU associated with this product can override this value by having its own `package_dimensions`. Only applicable to products of `type=good`.
	///   - shippable: Whether this product is a shipped good. Only applicable to products of `type=good`.
	///   - statement_descriptor: Extra information about a product which will appear on your customer's credit card statement. In the case that multiple products are billed at once, the first statement descriptor will be used.
	///   - unit_label: A label that represents units of this product in Stripe and on customers’ receipts and invoices. When set, this will be included in associated invoice line item descriptions.
	///   - updated: Time at which the object was last updated. Measured in seconds since the Unix epoch.
	///   - url: A URL of a publicly-accessible webpage for this product. Only applicable to products of `type=good`.
	public init(active: Bool, created: Timestamp, id: String, images: [String], livemode: Bool, metadata: String, name: String, object: ObjectValues, updated: Timestamp, attributes: [String]?? = nil, caption: String? = nil, deactivate_on: [String]? = nil, description: String? = nil, package_dimensions: PackageDimensions? = nil, shippable: Bool? = nil, statement_descriptor: String? = nil, unit_label: String? = nil, url: String? = nil) {
		self.active = active
		self.created = created
		self.id = id
		self.images = images
		self.livemode = livemode
		self.metadata = metadata
		self.name = name
		self.object = object
		self.updated = updated
		self.attributes = attributes
		self.caption = caption
		self.deactivate_on = deactivate_on
		self.description = description
		self.package_dimensions = package_dimensions
		self.shippable = shippable
		self.statement_descriptor = statement_descriptor
		self.unit_label = unit_label
		self.url = url
	}

	public enum ObjectValues: String, Codable {
		case product = "product"
	}
}

/// A Promotion Code represents a customer-redeemable code for a coupon. It can be used to create multiple codes for a single coupon.
public class PromotionCode: Codable {
	/// Whether the promotion code is currently active. A promotion code is only active if the coupon is also valid.
	public var active: Bool
	/// The customer-facing code. Regardless of case, this code must be unique across all active promotion codes for each customer.
	public var code: String
	public var coupon: Coupon
	/// Time at which the object was created. Measured in seconds since the Unix epoch.
	public var created: Timestamp
	/// The customer that this promotion code can be used by.
	public var customer: String?
	/// Date at which the promotion code can no longer be redeemed.
	public var expires_at: Timestamp?
	/// Unique identifier for the object.
	public var id: String
	/// Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
	public var livemode: Bool
	/// Maximum number of times this promotion code can be redeemed.
	public var max_redemptions: Int?
	/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
	public var metadata: String?
	/// String representing the object's type. Objects of the same type share the same value.
	public var object: ObjectValues
	public var restrictions: PromotionCodesResourceRestrictions
	/// Number of times this promotion code has been used.
	public var times_redeemed: Int

	/// A Promotion Code represents a customer-redeemable code for a coupon. It can be used to create multiple codes for a single coupon.
	/// - Parameters:
	///   - active: Whether the promotion code is currently active. A promotion code is only active if the coupon is also valid.
	///   - code: The customer-facing code. Regardless of case, this code must be unique across all active promotion codes for each customer.
	///   - coupon: 
	///   - created: Time at which the object was created. Measured in seconds since the Unix epoch.
	///   - customer: The customer that this promotion code can be used by.
	///   - expires_at: Date at which the promotion code can no longer be redeemed.
	///   - id: Unique identifier for the object.
	///   - livemode: Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
	///   - max_redemptions: Maximum number of times this promotion code can be redeemed.
	///   - metadata: Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
	///   - object: String representing the object's type. Objects of the same type share the same value.
	///   - restrictions: 
	///   - times_redeemed: Number of times this promotion code has been used.
	public init(active: Bool, code: String, coupon: Coupon, created: Timestamp, id: String, livemode: Bool, object: ObjectValues, restrictions: PromotionCodesResourceRestrictions, times_redeemed: Int, customer: String? = nil, expires_at: Timestamp? = nil, max_redemptions: Int? = nil, metadata: String? = nil) {
		self.active = active
		self.code = code
		self.coupon = coupon
		self.created = created
		self.id = id
		self.livemode = livemode
		self.object = object
		self.restrictions = restrictions
		self.times_redeemed = times_redeemed
		self.customer = customer
		self.expires_at = expires_at
		self.max_redemptions = max_redemptions
		self.metadata = metadata
	}

	public enum ObjectValues: String, Codable {
		case promotionCode = "promotion_code"
	}
}

public class PromotionCodesResourceRestrictions: Codable {
	/// A Boolean indicating if the Promotion Code should only be redeemed for Customers without any successful payments or invoices
	public var first_time_transaction: Bool
	/// Minimum amount required to redeem this Promotion Code into a Coupon (e.g., a purchase must be $100 or more to work).
	public var minimum_amount: Int?
	/// Three-letter [ISO code](https://stripe.com/docs/currencies) for minimum_amount
	public var minimum_amount_currency: String?

	public init(first_time_transaction: Bool, minimum_amount: Int? = nil, minimum_amount_currency: String? = nil) {
		self.first_time_transaction = first_time_transaction
		self.minimum_amount = minimum_amount
		self.minimum_amount_currency = minimum_amount_currency
	}
}

/// An early fraud warning indicates that the card issuer has notified us that a charge may be fraudulent.  Related guide: [Early Fraud Warnings](https://stripe.com/docs/disputes/measuring#early-fraud-warnings).
public class RadarEarlyFraudWarning: Codable {
	/// An EFW is actionable if it has not received a dispute and has not been fully refunded. You may wish to proactively refund a charge that receives an EFW, in order to avoid receiving a dispute later.
	public var actionable: Bool
	/// ID of the charge this early fraud warning is for, optionally expanded.
	public var charge: String
	/// Time at which the object was created. Measured in seconds since the Unix epoch.
	public var created: Timestamp
	/// The type of fraud labelled by the issuer. One of `card_never_received`, `fraudulent_card_application`, `made_with_counterfeit_card`, `made_with_lost_card`, `made_with_stolen_card`, `misc`, `unauthorized_use_of_card`.
	public var fraud_type: String
	/// Unique identifier for the object.
	public var id: String
	/// Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
	public var livemode: Bool
	/// String representing the object's type. Objects of the same type share the same value.
	public var object: ObjectValues

	/// An early fraud warning indicates that the card issuer has notified us that a charge may be fraudulent.  Related guide: [Early Fraud Warnings](https://stripe.com/docs/disputes/measuring#early-fraud-warnings).
	/// - Parameters:
	///   - actionable: An EFW is actionable if it has not received a dispute and has not been fully refunded. You may wish to proactively refund a charge that receives an EFW, in order to avoid receiving a dispute later.
	///   - charge: ID of the charge this early fraud warning is for, optionally expanded.
	///   - created: Time at which the object was created. Measured in seconds since the Unix epoch.
	///   - fraud_type: The type of fraud labelled by the issuer. One of `card_never_received`, `fraudulent_card_application`, `made_with_counterfeit_card`, `made_with_lost_card`, `made_with_stolen_card`, `misc`, `unauthorized_use_of_card`.
	///   - id: Unique identifier for the object.
	///   - livemode: Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
	///   - object: String representing the object's type. Objects of the same type share the same value.
	public init(actionable: Bool, charge: String, created: Timestamp, fraud_type: String, id: String, livemode: Bool, object: ObjectValues) {
		self.actionable = actionable
		self.charge = charge
		self.created = created
		self.fraud_type = fraud_type
		self.id = id
		self.livemode = livemode
		self.object = object
	}

	public enum ObjectValues: String, Codable {
		case radarEarlyFraudWarning = "radar.early_fraud_warning"
	}
}

/// Value lists allow you to group values together which can then be referenced in rules.  Related guide: [Default Stripe Lists](https://stripe.com/docs/radar/lists#managing-list-items).
public class RadarValueList: Codable {
	/// The name of the value list for use in rules.
	public var alias: String
	/// Time at which the object was created. Measured in seconds since the Unix epoch.
	public var created: Timestamp
	/// The name or email address of the user who created this value list.
	public var created_by: String
	/// Unique identifier for the object.
	public var id: String
	/// The type of items in the value list. One of `card_fingerprint`, `card_bin`, `email`, `ip_address`, `country`, `string`, or `case_sensitive_string`.
	public var item_type: ItemTypeValues
	/// List of items contained within this value list.
	public var list_items: RadarListListItemList
	/// Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
	public var livemode: Bool
	/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
	public var metadata: String
	/// The name of the value list.
	public var name: String
	/// String representing the object's type. Objects of the same type share the same value.
	public var object: ObjectValues

	/// Value lists allow you to group values together which can then be referenced in rules.  Related guide: [Default Stripe Lists](https://stripe.com/docs/radar/lists#managing-list-items).
	/// - Parameters:
	///   - alias: The name of the value list for use in rules.
	///   - created: Time at which the object was created. Measured in seconds since the Unix epoch.
	///   - created_by: The name or email address of the user who created this value list.
	///   - id: Unique identifier for the object.
	///   - item_type: The type of items in the value list. One of `card_fingerprint`, `card_bin`, `email`, `ip_address`, `country`, `string`, or `case_sensitive_string`.
	///   - list_items: List of items contained within this value list.
	///   - livemode: Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
	///   - metadata: Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
	///   - name: The name of the value list.
	///   - object: String representing the object's type. Objects of the same type share the same value.
	public init(alias: String, created: Timestamp, created_by: String, id: String, item_type: ItemTypeValues, list_items: RadarListListItemList, livemode: Bool, metadata: String, name: String, object: ObjectValues) {
		self.alias = alias
		self.created = created
		self.created_by = created_by
		self.id = id
		self.item_type = item_type
		self.list_items = list_items
		self.livemode = livemode
		self.metadata = metadata
		self.name = name
		self.object = object
	}


	/// List of items contained within this value list.
	public class RadarListListItemList: Codable {
		/// Details about each object.
		public var data: [RadarValueListItem]
		/// True if this list has another page of items after this one that can be fetched.
		public var has_more: Bool
		/// String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
		public var object: ObjectValues
		/// The URL where this list can be accessed.
		public var url: String

		/// List of items contained within this value list.
		/// - Parameters:
		///   - data: Details about each object.
		///   - has_more: True if this list has another page of items after this one that can be fetched.
		///   - object: String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
		///   - url: The URL where this list can be accessed.
		public init(data: [RadarValueListItem], has_more: Bool, object: ObjectValues, url: String) {
			self.data = data
			self.has_more = has_more
			self.object = object
			self.url = url
		}

		public enum ObjectValues: String, Codable {
			case list = "list"
		}
	}


	public enum ItemTypeValues: String, Codable {
		case cardBin = "card_bin"
		case cardFingerprint = "card_fingerprint"
		case caseSensitiveString = "case_sensitive_string"
		case country = "country"
		case email = "email"
		case ipAddress = "ip_address"
		case string = "string"
	}

	public enum ObjectValues: String, Codable {
		case radarValueList = "radar.value_list"
	}
}

/// Value list items allow you to add specific values to a given Radar value list, which can then be used in rules.  Related guide: [Managing List Items](https://stripe.com/docs/radar/lists#managing-list-items).
public class RadarValueListItem: Codable {
	/// Time at which the object was created. Measured in seconds since the Unix epoch.
	public var created: Timestamp
	/// The name or email address of the user who added this item to the value list.
	public var created_by: String
	/// Unique identifier for the object.
	public var id: String
	/// Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
	public var livemode: Bool
	/// String representing the object's type. Objects of the same type share the same value.
	public var object: ObjectValues
	/// The value of the item.
	public var value: String
	/// The identifier of the value list this item belongs to.
	public var value_list: String

	/// Value list items allow you to add specific values to a given Radar value list, which can then be used in rules.  Related guide: [Managing List Items](https://stripe.com/docs/radar/lists#managing-list-items).
	/// - Parameters:
	///   - created: Time at which the object was created. Measured in seconds since the Unix epoch.
	///   - created_by: The name or email address of the user who added this item to the value list.
	///   - id: Unique identifier for the object.
	///   - livemode: Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
	///   - object: String representing the object's type. Objects of the same type share the same value.
	///   - value: The value of the item.
	///   - value_list: The identifier of the value list this item belongs to.
	public init(created: Timestamp, created_by: String, id: String, livemode: Bool, object: ObjectValues, value: String, value_list: String) {
		self.created = created
		self.created_by = created_by
		self.id = id
		self.livemode = livemode
		self.object = object
		self.value = value
		self.value_list = value_list
	}

	public enum ObjectValues: String, Codable {
		case radarValueListItem = "radar.value_list_item"
	}
}

public class RadarReviewResourceLocation: Codable {
	/// The city where the payment originated.
	public var city: String?
	/// Two-letter ISO code representing the country where the payment originated.
	public var country: String?
	/// The geographic latitude where the payment originated.
	public var latitude: StringNumber?
	/// The geographic longitude where the payment originated.
	public var longitude: StringNumber?
	/// The state/county/province/region where the payment originated.
	public var region: String?

	public init(city: String? = nil, country: String? = nil, latitude: StringNumber? = nil, longitude: StringNumber? = nil, region: String? = nil) {
		self.city = city
		self.country = country
		self.latitude = latitude
		self.longitude = longitude
		self.region = region
	}
}

public class RadarReviewResourceSession: Codable {
	/// The browser used in this browser session (e.g., `Chrome`).
	public var browser: String?
	/// Information about the device used for the browser session (e.g., `Samsung SM-G930T`).
	public var device: String?
	/// The platform for the browser session (e.g., `Macintosh`).
	public var platform: String?
	/// The version for the browser session (e.g., `61.0.3163.100`).
	public var version: String?

	public init(browser: String? = nil, device: String? = nil, platform: String? = nil, version: String? = nil) {
		self.browser = browser
		self.device = device
		self.platform = platform
		self.version = version
	}
}

/// With `Recipient` objects, you can transfer money from your Stripe account to a third-party bank account or debit card. The API allows you to create, delete, and update your recipients. You can retrieve individual recipients as well as a list of all your recipients.  **`Recipient` objects have been deprecated in favor of [Connect](https://stripe.com/docs/connect), specifically Connect's much more powerful [Account objects](https://stripe.com/docs/api#account). Stripe accounts that don't already use recipients can no longer begin doing so. Please use `Account` objects instead.**
public class Recipient: Codable {
	/// Hash describing the current account on the recipient, if there is one.
	public var active_account: BankAccount?
	public var cards: CardList?
	/// Time at which the object was created. Measured in seconds since the Unix epoch.
	public var created: Timestamp
	/// The default card to use for creating transfers to this recipient.
	public var default_card: String?
	/// An arbitrary string attached to the object. Often useful for displaying to users.
	public var description: String?
	public var email: String?
	/// Unique identifier for the object.
	public var id: String
	/// Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
	public var livemode: Bool
	/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
	public var metadata: String
	/// The ID of the [Custom account](https://stripe.com/docs/connect/custom-accounts) this recipient was migrated to. If set, the recipient can no longer be updated, nor can transfers be made to it: use the Custom account instead.
	public var migrated_to: String?
	/// Full, legal name of the recipient.
	public var name: String?
	/// String representing the object's type. Objects of the same type share the same value.
	public var object: ObjectValues
	public var rolled_back_from: String?
	/// Type of the recipient, one of `individual` or `corporation`.
	public var type: String

	/// With `Recipient` objects, you can transfer money from your Stripe account to a third-party bank account or debit card. The API allows you to create, delete, and update your recipients. You can retrieve individual recipients as well as a list of all your recipients.  **`Recipient` objects have been deprecated in favor of [Connect](https://stripe.com/docs/connect), specifically Connect's much more powerful [Account objects](https://stripe.com/docs/api#account). Stripe accounts that don't already use recipients can no longer begin doing so. Please use `Account` objects instead.**
	/// - Parameters:
	///   - active_account: Hash describing the current account on the recipient, if there is one.
	///   - created: Time at which the object was created. Measured in seconds since the Unix epoch.
	///   - default_card: The default card to use for creating transfers to this recipient.
	///   - description: An arbitrary string attached to the object. Often useful for displaying to users.
	///   - id: Unique identifier for the object.
	///   - livemode: Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
	///   - metadata: Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
	///   - migrated_to: The ID of the [Custom account](https://stripe.com/docs/connect/custom-accounts) this recipient was migrated to. If set, the recipient can no longer be updated, nor can transfers be made to it: use the Custom account instead.
	///   - name: Full, legal name of the recipient.
	///   - object: String representing the object's type. Objects of the same type share the same value.
	///   - type: Type of the recipient, one of `individual` or `corporation`.
	public init(created: Timestamp, id: String, livemode: Bool, metadata: String, object: ObjectValues, type: String, active_account: BankAccount? = nil, cards: CardList? = nil, default_card: String? = nil, description: String? = nil, email: String? = nil, migrated_to: String? = nil, name: String? = nil, rolled_back_from: String? = nil) {
		self.created = created
		self.id = id
		self.livemode = livemode
		self.metadata = metadata
		self.object = object
		self.type = type
		self.active_account = active_account
		self.cards = cards
		self.default_card = default_card
		self.description = description
		self.email = email
		self.migrated_to = migrated_to
		self.name = name
		self.rolled_back_from = rolled_back_from
	}


	public class CardList: Codable {
		public var data: [Card]
		/// True if this list has another page of items after this one that can be fetched.
		public var has_more: Bool
		/// String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
		public var object: ObjectValues
		/// The URL where this list can be accessed.
		public var url: String

		public init(data: [Card], has_more: Bool, object: ObjectValues, url: String) {
			self.data = data
			self.has_more = has_more
			self.object = object
			self.url = url
		}

		public enum ObjectValues: String, Codable {
			case list = "list"
		}
	}


	public enum ObjectValues: String, Codable {
		case recipient = "recipient"
	}
}

public class Recurring: Codable {
	/// Specifies a usage aggregation strategy for prices of `usage_type=metered`. Allowed values are `sum` for summing up all usage during a period, `last_during_period` for using the last usage record reported within a period, `last_ever` for using the last usage record ever (across period bounds) or `max` which uses the usage record with the maximum reported usage during a period. Defaults to `sum`.
	public var aggregate_usage: AggregateUsageValues?
	/// The frequency at which a subscription is billed. One of `day`, `week`, `month` or `year`.
	public var interval: IntervalValues
	/// The number of intervals (specified in the `interval` attribute) between subscription billings. For example, `interval=month` and `interval_count=3` bills every 3 months.
	public var interval_count: Int
	/// Configures how the quantity per period should be determined. Can be either `metered` or `licensed`. `licensed` automatically bills the `quantity` set when adding it to a subscription. `metered` aggregates the total usage based on usage records. Defaults to `licensed`.
	public var usage_type: UsageTypeValues

	public init(interval: IntervalValues, interval_count: Int, usage_type: UsageTypeValues, aggregate_usage: AggregateUsageValues? = nil) {
		self.interval = interval
		self.interval_count = interval_count
		self.usage_type = usage_type
		self.aggregate_usage = aggregate_usage
	}

	public enum IntervalValues: String, Codable {
		case day = "day"
		case month = "month"
		case week = "week"
		case year = "year"
	}

	public enum UsageTypeValues: String, Codable {
		case licensed = "licensed"
		case metered = "metered"
	}

	public enum AggregateUsageValues: String, Codable {
		case lastDuringPeriod = "last_during_period"
		case lastEver = "last_ever"
		case max = "max"
		case sum = "sum"
	}
}

/// `Refund` objects allow you to refund a charge that has previously been created but not yet refunded. Funds will be refunded to the credit or debit card that was originally charged.  Related guide: [Refunds](https://stripe.com/docs/refunds).
public class Refund: Codable {
	/// Amount, in %s.
	public var amount: Int
	/// Balance transaction that describes the impact on your account balance.
	public var balance_transaction: String?
	/// ID of the charge that was refunded.
	public var charge: String?
	/// Time at which the object was created. Measured in seconds since the Unix epoch.
	public var created: Timestamp
	/// Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
	public var currency: String
	/// An arbitrary string attached to the object. Often useful for displaying to users. (Available on non-card refunds only)
	public var description: String?
	/// If the refund failed, this balance transaction describes the adjustment made on your account balance that reverses the initial balance transaction.
	public var failure_balance_transaction: String?
	/// If the refund failed, the reason for refund failure if known. Possible values are `lost_or_stolen_card`, `expired_or_canceled_card`, or `unknown`.
	public var failure_reason: String?
	/// Unique identifier for the object.
	public var id: String
	/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
	public var metadata: String?
	/// String representing the object's type. Objects of the same type share the same value.
	public var object: ObjectValues
	/// ID of the PaymentIntent that was refunded.
	public var payment_intent: String?
	/// Reason for the refund, either user-provided (`duplicate`, `fraudulent`, or `requested_by_customer`) or generated by Stripe internally (`expired_uncaptured_charge`).
	public var reason: String?
	/// This is the transaction number that appears on email receipts sent for this refund.
	public var receipt_number: String?
	/// The transfer reversal that is associated with the refund. Only present if the charge came from another Stripe account. See the Connect documentation for details.
	public var source_transfer_reversal: String?
	/// Status of the refund. For credit card refunds, this can be `pending`, `succeeded`, or `failed`. For other types of refunds, it can be `pending`, `succeeded`, `failed`, or `canceled`. Refer to our [refunds](https://stripe.com/docs/refunds#failed-refunds) documentation for more details.
	public var status: String?
	/// If the accompanying transfer was reversed, the transfer reversal object. Only applicable if the charge was created using the destination parameter.
	public var transfer_reversal: String?

	/// `Refund` objects allow you to refund a charge that has previously been created but not yet refunded. Funds will be refunded to the credit or debit card that was originally charged.  Related guide: [Refunds](https://stripe.com/docs/refunds).
	/// - Parameters:
	///   - amount: Amount, in %s.
	///   - balance_transaction: Balance transaction that describes the impact on your account balance.
	///   - charge: ID of the charge that was refunded.
	///   - created: Time at which the object was created. Measured in seconds since the Unix epoch.
	///   - currency: Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
	///   - description: An arbitrary string attached to the object. Often useful for displaying to users. (Available on non-card refunds only)
	///   - failure_balance_transaction: If the refund failed, this balance transaction describes the adjustment made on your account balance that reverses the initial balance transaction.
	///   - failure_reason: If the refund failed, the reason for refund failure if known. Possible values are `lost_or_stolen_card`, `expired_or_canceled_card`, or `unknown`.
	///   - id: Unique identifier for the object.
	///   - metadata: Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
	///   - object: String representing the object's type. Objects of the same type share the same value.
	///   - payment_intent: ID of the PaymentIntent that was refunded.
	///   - reason: Reason for the refund, either user-provided (`duplicate`, `fraudulent`, or `requested_by_customer`) or generated by Stripe internally (`expired_uncaptured_charge`).
	///   - receipt_number: This is the transaction number that appears on email receipts sent for this refund.
	///   - source_transfer_reversal: The transfer reversal that is associated with the refund. Only present if the charge came from another Stripe account. See the Connect documentation for details.
	///   - status: Status of the refund. For credit card refunds, this can be `pending`, `succeeded`, or `failed`. For other types of refunds, it can be `pending`, `succeeded`, `failed`, or `canceled`. Refer to our [refunds](https://stripe.com/docs/refunds#failed-refunds) documentation for more details.
	///   - transfer_reversal: If the accompanying transfer was reversed, the transfer reversal object. Only applicable if the charge was created using the destination parameter.
	public init(amount: Int, created: Timestamp, currency: String, id: String, object: ObjectValues, balance_transaction: String? = nil, charge: String? = nil, description: String? = nil, failure_balance_transaction: String? = nil, failure_reason: String? = nil, metadata: String? = nil, payment_intent: String? = nil, reason: String? = nil, receipt_number: String? = nil, source_transfer_reversal: String? = nil, status: String? = nil, transfer_reversal: String? = nil) {
		self.amount = amount
		self.created = created
		self.currency = currency
		self.id = id
		self.object = object
		self.balance_transaction = balance_transaction
		self.charge = charge
		self.description = description
		self.failure_balance_transaction = failure_balance_transaction
		self.failure_reason = failure_reason
		self.metadata = metadata
		self.payment_intent = payment_intent
		self.reason = reason
		self.receipt_number = receipt_number
		self.source_transfer_reversal = source_transfer_reversal
		self.status = status
		self.transfer_reversal = transfer_reversal
	}

	public enum ObjectValues: String, Codable {
		case refund = "refund"
	}
}

/// The Report Run object represents an instance of a report type generated with specific run parameters. Once the object is created, Stripe begins processing the report. When the report has finished running, it will give you a reference to a file where you can retrieve your results. For an overview, see [API Access to Reports](https://stripe.com/docs/reporting/statements/api).  Note that reports can only be run based on your live-mode data (not test-mode data), and thus related requests must be made with a [live-mode API key](https://stripe.com/docs/keys#test-live-modes).
public class ReportingReportRun: Codable {
	/// Time at which the object was created. Measured in seconds since the Unix epoch.
	public var created: Timestamp
	/// If something should go wrong during the run, a message about the failure (populated when  `status=failed`).
	public var error: String?
	/// Unique identifier for the object.
	public var id: String
	/// Always `true`: reports can only be run on live-mode data.
	public var livemode: Bool
	/// String representing the object's type. Objects of the same type share the same value.
	public var object: ObjectValues
	public var parameters: FinancialReportingFinanceReportRunRunParameters
	/// The ID of the [report type](https://stripe.com/docs/reports/report-types) to run, such as `"balance.summary.1"`.
	public var report_type: String
	/// The file object representing the result of the report run (populated when  `status=succeeded`).
	public var result: File?
	/// Status of this report run. This will be `pending` when the run is initially created.  When the run finishes, this will be set to `succeeded` and the `result` field will be populated.  Rarely, we may encounter an error, at which point this will be set to `failed` and the `error` field will be populated.
	public var status: String
	/// Timestamp at which this run successfully finished (populated when  `status=succeeded`). Measured in seconds since the Unix epoch.
	public var succeeded_at: Timestamp?

	/// The Report Run object represents an instance of a report type generated with specific run parameters. Once the object is created, Stripe begins processing the report. When the report has finished running, it will give you a reference to a file where you can retrieve your results. For an overview, see [API Access to Reports](https://stripe.com/docs/reporting/statements/api).  Note that reports can only be run based on your live-mode data (not test-mode data), and thus related requests must be made with a [live-mode API key](https://stripe.com/docs/keys#test-live-modes).
	/// - Parameters:
	///   - created: Time at which the object was created. Measured in seconds since the Unix epoch.
	///   - error: If something should go wrong during the run, a message about the failure (populated when  `status=failed`).
	///   - id: Unique identifier for the object.
	///   - livemode: Always `true`: reports can only be run on live-mode data.
	///   - object: String representing the object's type. Objects of the same type share the same value.
	///   - parameters: 
	///   - report_type: The ID of the [report type](https://stripe.com/docs/reports/report-types) to run, such as `"balance.summary.1"`.
	///   - result: The file object representing the result of the report run (populated when  `status=succeeded`).
	///   - status: Status of this report run. This will be `pending` when the run is initially created.  When the run finishes, this will be set to `succeeded` and the `result` field will be populated.  Rarely, we may encounter an error, at which point this will be set to `failed` and the `error` field will be populated.
	///   - succeeded_at: Timestamp at which this run successfully finished (populated when  `status=succeeded`). Measured in seconds since the Unix epoch.
	public init(created: Timestamp, id: String, livemode: Bool, object: ObjectValues, parameters: FinancialReportingFinanceReportRunRunParameters, report_type: String, status: String, error: String? = nil, result: File? = nil, succeeded_at: Timestamp? = nil) {
		self.created = created
		self.id = id
		self.livemode = livemode
		self.object = object
		self.parameters = parameters
		self.report_type = report_type
		self.status = status
		self.error = error
		self.result = result
		self.succeeded_at = succeeded_at
	}

	public enum ObjectValues: String, Codable {
		case reportingReportRun = "reporting.report_run"
	}
}

/// The Report Type resource corresponds to a particular type of report, such as the "Activity summary" or "Itemized payouts" reports. These objects are identified by an ID belonging to a set of enumerated values. See [API Access to Reports documentation](https://stripe.com/docs/reporting/statements/api) for those Report Type IDs, along with required and optional parameters.  Note that reports can only be run based on your live-mode data (not test-mode data), and thus related requests must be made with a [live-mode API key](https://stripe.com/docs/keys#test-live-modes).
public class ReportingReportType: Codable {
	/// Most recent time for which this Report Type is available. Measured in seconds since the Unix epoch.
	public var data_available_end: Timestamp
	/// Earliest time for which this Report Type is available. Measured in seconds since the Unix epoch.
	public var data_available_start: Timestamp
	/// List of column names that are included by default when this Report Type gets run. (If the Report Type doesn't support the `columns` parameter, this will be null.)
	public var default_columns: [String]??
	/// The [ID of the Report Type](https://stripe.com/docs/reporting/statements/api#available-report-types), such as `balance.summary.1`.
	public var id: String
	/// Human-readable name of the Report Type
	public var name: String
	/// String representing the object's type. Objects of the same type share the same value.
	public var object: ObjectValues
	/// When this Report Type was latest updated. Measured in seconds since the Unix epoch.
	public var updated: Timestamp
	/// Version of the Report Type. Different versions report with the same ID will have the same purpose, but may take different run parameters or have different result schemas.
	public var version: Int

	/// The Report Type resource corresponds to a particular type of report, such as the "Activity summary" or "Itemized payouts" reports. These objects are identified by an ID belonging to a set of enumerated values. See [API Access to Reports documentation](https://stripe.com/docs/reporting/statements/api) for those Report Type IDs, along with required and optional parameters.  Note that reports can only be run based on your live-mode data (not test-mode data), and thus related requests must be made with a [live-mode API key](https://stripe.com/docs/keys#test-live-modes).
	/// - Parameters:
	///   - data_available_end: Most recent time for which this Report Type is available. Measured in seconds since the Unix epoch.
	///   - data_available_start: Earliest time for which this Report Type is available. Measured in seconds since the Unix epoch.
	///   - default_columns: List of column names that are included by default when this Report Type gets run. (If the Report Type doesn't support the `columns` parameter, this will be null.)
	///   - id: The [ID of the Report Type](https://stripe.com/docs/reporting/statements/api#available-report-types), such as `balance.summary.1`.
	///   - name: Human-readable name of the Report Type
	///   - object: String representing the object's type. Objects of the same type share the same value.
	///   - updated: When this Report Type was latest updated. Measured in seconds since the Unix epoch.
	///   - version: Version of the Report Type. Different versions report with the same ID will have the same purpose, but may take different run parameters or have different result schemas.
	public init(data_available_end: Timestamp, data_available_start: Timestamp, id: String, name: String, object: ObjectValues, updated: Timestamp, version: Int, default_columns: [String]?? = nil) {
		self.data_available_end = data_available_end
		self.data_available_start = data_available_start
		self.id = id
		self.name = name
		self.object = object
		self.updated = updated
		self.version = version
		self.default_columns = default_columns
	}

	public enum ObjectValues: String, Codable {
		case reportingReportType = "reporting.report_type"
	}
}

public class ReserveTransaction: Codable {
	public var amount: Int
	/// Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
	public var currency: String
	/// An arbitrary string attached to the object. Often useful for displaying to users.
	public var description: String?
	/// Unique identifier for the object.
	public var id: String
	/// String representing the object's type. Objects of the same type share the same value.
	public var object: ObjectValues

	public init(amount: Int, currency: String, id: String, object: ObjectValues, description: String? = nil) {
		self.amount = amount
		self.currency = currency
		self.id = id
		self.object = object
		self.description = description
	}

	public enum ObjectValues: String, Codable {
		case reserveTransaction = "reserve_transaction"
	}
}

/// Reviews can be used to supplement automated fraud detection with human expertise.  Learn more about [Radar](/radar) and reviewing payments [here](https://stripe.com/docs/radar/reviews).
public class Review: Codable {
	/// The ZIP or postal code of the card used, if applicable.
	public var billing_zip: String?
	/// The charge associated with this review.
	public var charge: String?
	/// The reason the review was closed, or null if it has not yet been closed. One of `approved`, `refunded`, `refunded_as_fraud`, or `disputed`.
	public var closed_reason: ClosedReasonValues?
	/// Time at which the object was created. Measured in seconds since the Unix epoch.
	public var created: Timestamp
	/// Unique identifier for the object.
	public var id: String
	/// The IP address where the payment originated.
	public var ip_address: String?
	/// Information related to the location of the payment. Note that this information is an approximation and attempts to locate the nearest population center - it should not be used to determine a specific address.
	public var ip_address_location: RadarReviewResourceLocation?
	/// Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
	public var livemode: Bool
	/// String representing the object's type. Objects of the same type share the same value.
	public var object: ObjectValues
	/// If `true`, the review needs action.
	public var open: Bool
	/// The reason the review was opened. One of `rule` or `manual`.
	public var opened_reason: OpenedReasonValues
	/// The PaymentIntent ID associated with this review, if one exists.
	public var payment_intent: String?
	/// The reason the review is currently open or closed. One of `rule`, `manual`, `approved`, `refunded`, `refunded_as_fraud`, or `disputed`.
	public var reason: String
	/// Information related to the browsing session of the user who initiated the payment.
	public var session: RadarReviewResourceSession?

	/// Reviews can be used to supplement automated fraud detection with human expertise.  Learn more about [Radar](/radar) and reviewing payments [here](https://stripe.com/docs/radar/reviews).
	/// - Parameters:
	///   - billing_zip: The ZIP or postal code of the card used, if applicable.
	///   - charge: The charge associated with this review.
	///   - closed_reason: The reason the review was closed, or null if it has not yet been closed. One of `approved`, `refunded`, `refunded_as_fraud`, or `disputed`.
	///   - created: Time at which the object was created. Measured in seconds since the Unix epoch.
	///   - id: Unique identifier for the object.
	///   - ip_address: The IP address where the payment originated.
	///   - ip_address_location: Information related to the location of the payment. Note that this information is an approximation and attempts to locate the nearest population center - it should not be used to determine a specific address.
	///   - livemode: Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
	///   - object: String representing the object's type. Objects of the same type share the same value.
	///   - open: If `true`, the review needs action.
	///   - opened_reason: The reason the review was opened. One of `rule` or `manual`.
	///   - payment_intent: The PaymentIntent ID associated with this review, if one exists.
	///   - reason: The reason the review is currently open or closed. One of `rule`, `manual`, `approved`, `refunded`, `refunded_as_fraud`, or `disputed`.
	///   - session: Information related to the browsing session of the user who initiated the payment.
	public init(created: Timestamp, id: String, livemode: Bool, object: ObjectValues, open: Bool, opened_reason: OpenedReasonValues, reason: String, billing_zip: String? = nil, charge: String? = nil, closed_reason: ClosedReasonValues? = nil, ip_address: String? = nil, ip_address_location: RadarReviewResourceLocation? = nil, payment_intent: String? = nil, session: RadarReviewResourceSession? = nil) {
		self.created = created
		self.id = id
		self.livemode = livemode
		self.object = object
		self.open = open
		self.opened_reason = opened_reason
		self.reason = reason
		self.billing_zip = billing_zip
		self.charge = charge
		self.closed_reason = closed_reason
		self.ip_address = ip_address
		self.ip_address_location = ip_address_location
		self.payment_intent = payment_intent
		self.session = session
	}

	public enum OpenedReasonValues: String, Codable {
		case manual = "manual"
		case rule = "rule"
	}

	public enum ObjectValues: String, Codable {
		case review = "review"
	}

	public enum ClosedReasonValues: String, Codable {
		case approved = "approved"
		case disputed = "disputed"
		case refunded = "refunded"
		case refundedAsFraud = "refunded_as_fraud"
	}
}

public class Rule: Codable {
	/// The action taken on the payment.
	public var action: String
	/// Unique identifier for the object.
	public var id: String
	/// The predicate to evaluate the payment against.
	public var predicate: String

	public init(action: String, id: String, predicate: String) {
		self.action = action
		self.id = id
		self.predicate = predicate
	}
}

/// If you have [scheduled a Sigma query](https://stripe.com/docs/sigma/scheduled-queries), you'll receive a `sigma.scheduled_query_run.created` webhook each time the query runs. The webhook contains a `ScheduledQueryRun` object, which you can use to retrieve the query results.
public class ScheduledQueryRun: Codable {
	/// Time at which the object was created. Measured in seconds since the Unix epoch.
	public var created: Timestamp
	/// When the query was run, Sigma contained a snapshot of your Stripe data at this time.
	public var data_load_time: Timestamp
	public var error: SigmaScheduledQueryRunError?
	/// The file object representing the results of the query.
	public var file: File?
	/// Unique identifier for the object.
	public var id: String
	/// Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
	public var livemode: Bool
	/// String representing the object's type. Objects of the same type share the same value.
	public var object: ObjectValues
	/// Time at which the result expires and is no longer available for download.
	public var result_available_until: Timestamp
	/// SQL for the query.
	public var sql: String
	/// The query's execution status, which will be `completed` for successful runs, and `canceled`, `failed`, or `timed_out` otherwise.
	public var status: String
	/// Title of the query.
	public var title: String

	/// If you have [scheduled a Sigma query](https://stripe.com/docs/sigma/scheduled-queries), you'll receive a `sigma.scheduled_query_run.created` webhook each time the query runs. The webhook contains a `ScheduledQueryRun` object, which you can use to retrieve the query results.
	/// - Parameters:
	///   - created: Time at which the object was created. Measured in seconds since the Unix epoch.
	///   - data_load_time: When the query was run, Sigma contained a snapshot of your Stripe data at this time.
	///   - file: The file object representing the results of the query.
	///   - id: Unique identifier for the object.
	///   - livemode: Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
	///   - object: String representing the object's type. Objects of the same type share the same value.
	///   - result_available_until: Time at which the result expires and is no longer available for download.
	///   - sql: SQL for the query.
	///   - status: The query's execution status, which will be `completed` for successful runs, and `canceled`, `failed`, or `timed_out` otherwise.
	///   - title: Title of the query.
	public init(created: Timestamp, data_load_time: Timestamp, id: String, livemode: Bool, object: ObjectValues, result_available_until: Timestamp, sql: String, status: String, title: String, error: SigmaScheduledQueryRunError? = nil, file: File? = nil) {
		self.created = created
		self.data_load_time = data_load_time
		self.id = id
		self.livemode = livemode
		self.object = object
		self.result_available_until = result_available_until
		self.sql = sql
		self.status = status
		self.title = title
		self.error = error
		self.file = file
	}

	public enum ObjectValues: String, Codable {
		case scheduledQueryRun = "scheduled_query_run"
	}
}

public class SepaDebitGeneratedFrom: Codable {
	/// The ID of the Charge that generated this PaymentMethod, if any.
	public var charge: String?
	/// The ID of the SetupAttempt that generated this PaymentMethod, if any.
	public var setup_attempt: String?

	public init(charge: String? = nil, setup_attempt: String? = nil) {
		self.charge = charge
		self.setup_attempt = setup_attempt
	}
}

/// A SetupAttempt describes one attempted confirmation of a SetupIntent, whether that confirmation was successful or unsuccessful. You can use SetupAttempts to inspect details of a specific attempt at setting up a payment method using a SetupIntent.
public class SetupAttempt: Codable {
	/// The value of [application](https://stripe.com/docs/api/setup_intents/object#setup_intent_object-application) on the SetupIntent at the time of this confirmation.
	public var application: String?
	/// Time at which the object was created. Measured in seconds since the Unix epoch.
	public var created: Timestamp
	/// The value of [customer](https://stripe.com/docs/api/setup_intents/object#setup_intent_object-customer) on the SetupIntent at the time of this confirmation.
	public var customer: String?
	/// Unique identifier for the object.
	public var id: String
	/// Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
	public var livemode: Bool
	/// String representing the object's type. Objects of the same type share the same value.
	public var object: ObjectValues
	/// The value of [on_behalf_of](https://stripe.com/docs/api/setup_intents/object#setup_intent_object-on_behalf_of) on the SetupIntent at the time of this confirmation.
	public var on_behalf_of: String?
	/// ID of the payment method used with this SetupAttempt.
	public var payment_method: String
	public var payment_method_details: SetupAttemptPaymentMethodDetails
	/// The error encountered during this attempt to confirm the SetupIntent, if any.
	public var setup_error: ApiErrors?
	/// ID of the SetupIntent that this attempt belongs to.
	public var setup_intent: String
	/// Status of this SetupAttempt, one of `requires_confirmation`, `requires_action`, `processing`, `succeeded`, `failed`, or `abandoned`.
	public var status: String
	/// The value of [usage](https://stripe.com/docs/api/setup_intents/object#setup_intent_object-usage) on the SetupIntent at the time of this confirmation, one of `off_session` or `on_session`.
	public var usage: String

	/// A SetupAttempt describes one attempted confirmation of a SetupIntent, whether that confirmation was successful or unsuccessful. You can use SetupAttempts to inspect details of a specific attempt at setting up a payment method using a SetupIntent.
	/// - Parameters:
	///   - application: The value of [application](https://stripe.com/docs/api/setup_intents/object#setup_intent_object-application) on the SetupIntent at the time of this confirmation.
	///   - created: Time at which the object was created. Measured in seconds since the Unix epoch.
	///   - customer: The value of [customer](https://stripe.com/docs/api/setup_intents/object#setup_intent_object-customer) on the SetupIntent at the time of this confirmation.
	///   - id: Unique identifier for the object.
	///   - livemode: Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
	///   - object: String representing the object's type. Objects of the same type share the same value.
	///   - on_behalf_of: The value of [on_behalf_of](https://stripe.com/docs/api/setup_intents/object#setup_intent_object-on_behalf_of) on the SetupIntent at the time of this confirmation.
	///   - payment_method: ID of the payment method used with this SetupAttempt.
	///   - payment_method_details: 
	///   - setup_error: The error encountered during this attempt to confirm the SetupIntent, if any.
	///   - setup_intent: ID of the SetupIntent that this attempt belongs to.
	///   - status: Status of this SetupAttempt, one of `requires_confirmation`, `requires_action`, `processing`, `succeeded`, `failed`, or `abandoned`.
	///   - usage: The value of [usage](https://stripe.com/docs/api/setup_intents/object#setup_intent_object-usage) on the SetupIntent at the time of this confirmation, one of `off_session` or `on_session`.
	public init(created: Timestamp, id: String, livemode: Bool, object: ObjectValues, payment_method: String, payment_method_details: SetupAttemptPaymentMethodDetails, setup_intent: String, status: String, usage: String, application: String? = nil, customer: String? = nil, on_behalf_of: String? = nil, setup_error: ApiErrors? = nil) {
		self.created = created
		self.id = id
		self.livemode = livemode
		self.object = object
		self.payment_method = payment_method
		self.payment_method_details = payment_method_details
		self.setup_intent = setup_intent
		self.status = status
		self.usage = usage
		self.application = application
		self.customer = customer
		self.on_behalf_of = on_behalf_of
		self.setup_error = setup_error
	}

	public enum ObjectValues: String, Codable {
		case setupAttempt = "setup_attempt"
	}
}

public class SetupAttemptPaymentMethodDetails: Codable {
	public var bancontact: SetupAttemptPaymentMethodDetailsBancontact?
	public var card: SetupAttemptPaymentMethodDetailsCard?
	public var card_present: SetupAttemptPaymentMethodDetailsCardPresent?
	public var ideal: SetupAttemptPaymentMethodDetailsIdeal?
	public var sofort: SetupAttemptPaymentMethodDetailsSofort?
	/// The type of the payment method used in the SetupIntent (e.g., `card`). An additional hash is included on `payment_method_details` with a name matching this value. It contains confirmation-specific information for the payment method.
	public var type: String

	public init(type: String, bancontact: SetupAttemptPaymentMethodDetailsBancontact? = nil, card: SetupAttemptPaymentMethodDetailsCard? = nil, card_present: SetupAttemptPaymentMethodDetailsCardPresent? = nil, ideal: SetupAttemptPaymentMethodDetailsIdeal? = nil, sofort: SetupAttemptPaymentMethodDetailsSofort? = nil) {
		self.type = type
		self.bancontact = bancontact
		self.card = card
		self.card_present = card_present
		self.ideal = ideal
		self.sofort = sofort
	}
}

public class SetupAttemptPaymentMethodDetailsBancontact: Codable {
	/// Bank code of bank associated with the bank account.
	public var bank_code: String?
	/// Name of the bank associated with the bank account.
	public var bank_name: String?
	/// Bank Identifier Code of the bank associated with the bank account.
	public var bic: String?
	/// The ID of the SEPA Direct Debit PaymentMethod which was generated by this SetupAttempt.
	public var generated_sepa_debit: String?
	/// The mandate for the SEPA Direct Debit PaymentMethod which was generated by this SetupAttempt.
	public var generated_sepa_debit_mandate: String?
	/// Last four characters of the IBAN.
	public var iban_last4: String?
	/// Preferred language of the Bancontact authorization page that the customer is redirected to. Can be one of `en`, `de`, `fr`, or `nl`
	public var preferred_language: PreferredLanguageValues?
	/// Owner's verified full name. Values are verified or provided by Bancontact directly (if supported) at the time of authorization or settlement. They cannot be set or mutated.
	public var verified_name: String?

	public init(bank_code: String? = nil, bank_name: String? = nil, bic: String? = nil, generated_sepa_debit: String? = nil, generated_sepa_debit_mandate: String? = nil, iban_last4: String? = nil, preferred_language: PreferredLanguageValues? = nil, verified_name: String? = nil) {
		self.bank_code = bank_code
		self.bank_name = bank_name
		self.bic = bic
		self.generated_sepa_debit = generated_sepa_debit
		self.generated_sepa_debit_mandate = generated_sepa_debit_mandate
		self.iban_last4 = iban_last4
		self.preferred_language = preferred_language
		self.verified_name = verified_name
	}

	public enum PreferredLanguageValues: String, Codable {
		case de = "de"
		case en = "en"
		case fr = "fr"
		case nl = "nl"
	}
}

public class SetupAttemptPaymentMethodDetailsCard: Codable {
	/// Populated if this authorization used 3D Secure authentication.
	public var three_d_secure: ThreeDSecureDetails?

	public init(three_d_secure: ThreeDSecureDetails? = nil) {
		self.three_d_secure = three_d_secure
	}
}

public class SetupAttemptPaymentMethodDetailsCardPresent: Codable {
	/// The ID of the Card PaymentMethod which was generated by this SetupAttempt.
	public var generated_card: String?

	public init(generated_card: String? = nil) {
		self.generated_card = generated_card
	}
}

public class SetupAttemptPaymentMethodDetailsIdeal: Codable {
	/// The customer's bank. Can be one of `abn_amro`, `asn_bank`, `bunq`, `handelsbanken`, `ing`, `knab`, `moneyou`, `rabobank`, `regiobank`, `sns_bank`, `triodos_bank`, or `van_lanschot`.
	public var bank: BankValues?
	/// The Bank Identifier Code of the customer's bank.
	public var bic: BicValues?
	/// The ID of the SEPA Direct Debit PaymentMethod which was generated by this SetupAttempt.
	public var generated_sepa_debit: String?
	/// The mandate for the SEPA Direct Debit PaymentMethod which was generated by this SetupAttempt.
	public var generated_sepa_debit_mandate: String?
	/// Last four characters of the IBAN.
	public var iban_last4: String?
	/// Owner's verified full name. Values are verified or provided by iDEAL directly (if supported) at the time of authorization or settlement. They cannot be set or mutated.
	public var verified_name: String?

	public init(bank: BankValues? = nil, bic: BicValues? = nil, generated_sepa_debit: String? = nil, generated_sepa_debit_mandate: String? = nil, iban_last4: String? = nil, verified_name: String? = nil) {
		self.bank = bank
		self.bic = bic
		self.generated_sepa_debit = generated_sepa_debit
		self.generated_sepa_debit_mandate = generated_sepa_debit_mandate
		self.iban_last4 = iban_last4
		self.verified_name = verified_name
	}

	public enum BankValues: String, Codable {
		case abnAmro = "abn_amro"
		case asnBank = "asn_bank"
		case bunq = "bunq"
		case handelsbanken = "handelsbanken"
		case ing = "ing"
		case knab = "knab"
		case moneyou = "moneyou"
		case rabobank = "rabobank"
		case regiobank = "regiobank"
		case snsBank = "sns_bank"
		case triodosBank = "triodos_bank"
		case vanLanschot = "van_lanschot"
	}

	public enum BicValues: String, Codable {
		case optionABNANL2A = "ABNANL2A"
		case optionASNBNL21 = "ASNBNL21"
		case optionBUNQNL2A = "BUNQNL2A"
		case optionFVLBNL22 = "FVLBNL22"
		case optionHANDNL2A = "HANDNL2A"
		case optionINGBNL2A = "INGBNL2A"
		case optionKNABNL2H = "KNABNL2H"
		case optionMOYONL21 = "MOYONL21"
		case optionRABONL2U = "RABONL2U"
		case optionRBRBNL21 = "RBRBNL21"
		case optionSNSBNL2A = "SNSBNL2A"
		case optionTRIONL2U = "TRIONL2U"
	}
}

public class SetupAttemptPaymentMethodDetailsSofort: Codable {
	/// Bank code of bank associated with the bank account.
	public var bank_code: String?
	/// Name of the bank associated with the bank account.
	public var bank_name: String?
	/// Bank Identifier Code of the bank associated with the bank account.
	public var bic: String?
	/// The ID of the SEPA Direct Debit PaymentMethod which was generated by this SetupAttempt.
	public var generated_sepa_debit: String?
	/// The mandate for the SEPA Direct Debit PaymentMethod which was generated by this SetupAttempt.
	public var generated_sepa_debit_mandate: String?
	/// Last four characters of the IBAN.
	public var iban_last4: String?
	/// Preferred language of the Sofort authorization page that the customer is redirected to. Can be one of `en`, `de`, `fr`, or `nl`
	public var preferred_language: PreferredLanguageValues?
	/// Owner's verified full name. Values are verified or provided by Sofort directly (if supported) at the time of authorization or settlement. They cannot be set or mutated.
	public var verified_name: String?

	public init(bank_code: String? = nil, bank_name: String? = nil, bic: String? = nil, generated_sepa_debit: String? = nil, generated_sepa_debit_mandate: String? = nil, iban_last4: String? = nil, preferred_language: PreferredLanguageValues? = nil, verified_name: String? = nil) {
		self.bank_code = bank_code
		self.bank_name = bank_name
		self.bic = bic
		self.generated_sepa_debit = generated_sepa_debit
		self.generated_sepa_debit_mandate = generated_sepa_debit_mandate
		self.iban_last4 = iban_last4
		self.preferred_language = preferred_language
		self.verified_name = verified_name
	}

	public enum PreferredLanguageValues: String, Codable {
		case de = "de"
		case en = "en"
		case fr = "fr"
		case nl = "nl"
	}
}

/// A SetupIntent guides you through the process of setting up and saving a customer's payment credentials for future payments. For example, you could use a SetupIntent to set up and save your customer's card without immediately collecting a payment. Later, you can use [PaymentIntents](https://stripe.com/docs/api#payment_intents) to drive the payment flow.  Create a SetupIntent as soon as you're ready to collect your customer's payment credentials. Do not maintain long-lived, unconfirmed SetupIntents as they may no longer be valid. The SetupIntent then transitions through multiple [statuses](https://stripe.com/docs/payments/intents#intent-statuses) as it guides you through the setup process.  Successful SetupIntents result in payment credentials that are optimized for future payments. For example, cardholders in [certain regions](/guides/strong-customer-authentication) may need to be run through [Strong Customer Authentication](https://stripe.com/docs/strong-customer-authentication) at the time of payment method collection in order to streamline later [off-session payments](https://stripe.com/docs/payments/setup-intents). If the SetupIntent is used with a [Customer](https://stripe.com/docs/api#setup_intent_object-customer), upon success, it will automatically attach the resulting payment method to that Customer. We recommend using SetupIntents or [setup_future_usage](https://stripe.com/docs/api#payment_intent_object-setup_future_usage) on PaymentIntents to save payment methods in order to prevent saving invalid or unoptimized payment methods.  By using SetupIntents, you ensure that your customers experience the minimum set of required friction, even as regulations change over time.  Related guide: [Setup Intents API](https://stripe.com/docs/payments/setup-intents).
public class SetupIntent: Codable {
	/// ID of the Connect application that created the SetupIntent.
	public var application: String?
	/// Reason for cancellation of this SetupIntent, one of `abandoned`, `requested_by_customer`, or `duplicate`.
	public var cancellation_reason: CancellationReasonValues?
	/// The client secret of this SetupIntent. Used for client-side retrieval using a publishable key.  The client secret can be used to complete payment setup from your frontend. It should not be stored, logged, embedded in URLs, or exposed to anyone other than the customer. Make sure that you have TLS enabled on any page that includes the client secret.
	public var client_secret: String?
	/// Time at which the object was created. Measured in seconds since the Unix epoch.
	public var created: Timestamp
	/// ID of the Customer this SetupIntent belongs to, if one exists.  If present, the SetupIntent's payment method will be attached to the Customer on successful setup. Payment methods attached to other Customers cannot be used with this SetupIntent.
	public var customer: String?
	/// An arbitrary string attached to the object. Often useful for displaying to users.
	public var description: String?
	/// Unique identifier for the object.
	public var id: String
	/// The error encountered in the previous SetupIntent confirmation.
	public var last_setup_error: ApiErrors?
	/// The most recent SetupAttempt for this SetupIntent.
	public var latest_attempt: String?
	/// Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
	public var livemode: Bool
	/// ID of the multi use Mandate generated by the SetupIntent.
	public var mandate: String?
	/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
	public var metadata: String?
	/// If present, this property tells you what actions you need to take in order for your customer to continue payment setup.
	public var next_action: SetupIntentNextAction?
	/// String representing the object's type. Objects of the same type share the same value.
	public var object: ObjectValues
	/// The account (if any) for which the setup is intended.
	public var on_behalf_of: String?
	/// ID of the payment method used with this SetupIntent.
	public var payment_method: String?
	/// Payment-method-specific configuration for this SetupIntent.
	public var payment_method_options: SetupIntentPaymentMethodOptions?
	/// The list of payment method types (e.g. card) that this SetupIntent is allowed to set up.
	public var payment_method_types: [String]
	/// ID of the single_use Mandate generated by the SetupIntent.
	public var single_use_mandate: String?
	/// [Status](https://stripe.com/docs/payments/intents#intent-statuses) of this SetupIntent, one of `requires_payment_method`, `requires_confirmation`, `requires_action`, `processing`, `canceled`, or `succeeded`.
	public var status: StatusValues
	/// Indicates how the payment method is intended to be used in the future.  Use `on_session` if you intend to only reuse the payment method when the customer is in your checkout flow. Use `off_session` if your customer may or may not be in your checkout flow. If not provided, this value defaults to `off_session`.
	public var usage: String

	/// A SetupIntent guides you through the process of setting up and saving a customer's payment credentials for future payments. For example, you could use a SetupIntent to set up and save your customer's card without immediately collecting a payment. Later, you can use [PaymentIntents](https://stripe.com/docs/api#payment_intents) to drive the payment flow.  Create a SetupIntent as soon as you're ready to collect your customer's payment credentials. Do not maintain long-lived, unconfirmed SetupIntents as they may no longer be valid. The SetupIntent then transitions through multiple [statuses](https://stripe.com/docs/payments/intents#intent-statuses) as it guides you through the setup process.  Successful SetupIntents result in payment credentials that are optimized for future payments. For example, cardholders in [certain regions](/guides/strong-customer-authentication) may need to be run through [Strong Customer Authentication](https://stripe.com/docs/strong-customer-authentication) at the time of payment method collection in order to streamline later [off-session payments](https://stripe.com/docs/payments/setup-intents). If the SetupIntent is used with a [Customer](https://stripe.com/docs/api#setup_intent_object-customer), upon success, it will automatically attach the resulting payment method to that Customer. We recommend using SetupIntents or [setup_future_usage](https://stripe.com/docs/api#payment_intent_object-setup_future_usage) on PaymentIntents to save payment methods in order to prevent saving invalid or unoptimized payment methods.  By using SetupIntents, you ensure that your customers experience the minimum set of required friction, even as regulations change over time.  Related guide: [Setup Intents API](https://stripe.com/docs/payments/setup-intents).
	/// - Parameters:
	///   - application: ID of the Connect application that created the SetupIntent.
	///   - cancellation_reason: Reason for cancellation of this SetupIntent, one of `abandoned`, `requested_by_customer`, or `duplicate`.
	///   - client_secret: The client secret of this SetupIntent. Used for client-side retrieval using a publishable key.  The client secret can be used to complete payment setup from your frontend. It should not be stored, logged, embedded in URLs, or exposed to anyone other than the customer. Make sure that you have TLS enabled on any page that includes the client secret.
	///   - created: Time at which the object was created. Measured in seconds since the Unix epoch.
	///   - customer: ID of the Customer this SetupIntent belongs to, if one exists.  If present, the SetupIntent's payment method will be attached to the Customer on successful setup. Payment methods attached to other Customers cannot be used with this SetupIntent.
	///   - description: An arbitrary string attached to the object. Often useful for displaying to users.
	///   - id: Unique identifier for the object.
	///   - last_setup_error: The error encountered in the previous SetupIntent confirmation.
	///   - latest_attempt: The most recent SetupAttempt for this SetupIntent.
	///   - livemode: Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
	///   - mandate: ID of the multi use Mandate generated by the SetupIntent.
	///   - metadata: Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
	///   - next_action: If present, this property tells you what actions you need to take in order for your customer to continue payment setup.
	///   - object: String representing the object's type. Objects of the same type share the same value.
	///   - on_behalf_of: The account (if any) for which the setup is intended.
	///   - payment_method: ID of the payment method used with this SetupIntent.
	///   - payment_method_options: Payment-method-specific configuration for this SetupIntent.
	///   - payment_method_types: The list of payment method types (e.g. card) that this SetupIntent is allowed to set up.
	///   - single_use_mandate: ID of the single_use Mandate generated by the SetupIntent.
	///   - status: [Status](https://stripe.com/docs/payments/intents#intent-statuses) of this SetupIntent, one of `requires_payment_method`, `requires_confirmation`, `requires_action`, `processing`, `canceled`, or `succeeded`.
	///   - usage: Indicates how the payment method is intended to be used in the future.  Use `on_session` if you intend to only reuse the payment method when the customer is in your checkout flow. Use `off_session` if your customer may or may not be in your checkout flow. If not provided, this value defaults to `off_session`.
	public init(created: Timestamp, id: String, livemode: Bool, object: ObjectValues, payment_method_types: [String], status: StatusValues, usage: String, application: String? = nil, cancellation_reason: CancellationReasonValues? = nil, client_secret: String? = nil, customer: String? = nil, description: String? = nil, last_setup_error: ApiErrors? = nil, latest_attempt: String? = nil, mandate: String? = nil, metadata: String? = nil, next_action: SetupIntentNextAction? = nil, on_behalf_of: String? = nil, payment_method: String? = nil, payment_method_options: SetupIntentPaymentMethodOptions? = nil, single_use_mandate: String? = nil) {
		self.created = created
		self.id = id
		self.livemode = livemode
		self.object = object
		self.payment_method_types = payment_method_types
		self.status = status
		self.usage = usage
		self.application = application
		self.cancellation_reason = cancellation_reason
		self.client_secret = client_secret
		self.customer = customer
		self.description = description
		self.last_setup_error = last_setup_error
		self.latest_attempt = latest_attempt
		self.mandate = mandate
		self.metadata = metadata
		self.next_action = next_action
		self.on_behalf_of = on_behalf_of
		self.payment_method = payment_method
		self.payment_method_options = payment_method_options
		self.single_use_mandate = single_use_mandate
	}

	public enum CancellationReasonValues: String, Codable {
		case abandoned = "abandoned"
		case duplicate = "duplicate"
		case requestedByCustomer = "requested_by_customer"
	}

	public enum StatusValues: String, Codable {
		case canceled = "canceled"
		case processing = "processing"
		case requiresAction = "requires_action"
		case requiresConfirmation = "requires_confirmation"
		case requiresPaymentMethod = "requires_payment_method"
		case succeeded = "succeeded"
	}

	public enum ObjectValues: String, Codable {
		case setupIntent = "setup_intent"
	}
}

public class SetupIntentNextAction: Codable {
	public var redirect_to_url: SetupIntentNextActionRedirectToUrl?
	/// Type of the next action to perform, one of `redirect_to_url` or `use_stripe_sdk`.
	public var type: String
	/// When confirming a SetupIntent with Stripe.js, Stripe.js depends on the contents of this dictionary to invoke authentication flows. The shape of the contents is subject to change and is only intended to be used by Stripe.js.
	public var use_stripe_sdk: String?

	public init(type: String, redirect_to_url: SetupIntentNextActionRedirectToUrl? = nil, use_stripe_sdk: String? = nil) {
		self.type = type
		self.redirect_to_url = redirect_to_url
		self.use_stripe_sdk = use_stripe_sdk
	}
}

public class SetupIntentNextActionRedirectToUrl: Codable {
	/// If the customer does not exit their browser while authenticating, they will be redirected to this specified URL after completion.
	public var return_url: String?
	/// The URL you must redirect your customer to in order to authenticate.
	public var url: String?

	public init(return_url: String? = nil, url: String? = nil) {
		self.return_url = return_url
		self.url = url
	}
}

public class SetupIntentPaymentMethodOptions: Codable {
	public var card: SetupIntentPaymentMethodOptionsCard?
	public var sepa_debit: SetupIntentPaymentMethodOptionsSepaDebit?

	public init(card: SetupIntentPaymentMethodOptionsCard? = nil, sepa_debit: SetupIntentPaymentMethodOptionsSepaDebit? = nil) {
		self.card = card
		self.sepa_debit = sepa_debit
	}
}

public class SetupIntentPaymentMethodOptionsCard: Codable {
	/// We strongly recommend that you rely on our SCA Engine to automatically prompt your customers for authentication based on risk level and [other requirements](https://stripe.com/docs/strong-customer-authentication). However, if you wish to request 3D Secure based on logic from your own fraud engine, provide this option. Permitted values include: `automatic` or `any`. If not provided, defaults to `automatic`. Read our guide on [manually requesting 3D Secure](https://stripe.com/docs/payments/3d-secure#manual-three-ds) for more information on how this configuration interacts with Radar and our SCA Engine.
	public var request_three_d_secure: RequestThreeDSecureValues?

	public init(request_three_d_secure: RequestThreeDSecureValues? = nil) {
		self.request_three_d_secure = request_three_d_secure
	}

	public enum RequestThreeDSecureValues: String, Codable {
		case any = "any"
		case automatic = "automatic"
		case challengeOnly = "challenge_only"
	}
}

public class SetupIntentPaymentMethodOptionsMandateOptionsSepaDebit: Codable {

	public init() {
	}
}

public class SetupIntentPaymentMethodOptionsSepaDebit: Codable {
	public var mandate_options: SetupIntentPaymentMethodOptionsMandateOptionsSepaDebit?

	public init(mandate_options: SetupIntentPaymentMethodOptionsMandateOptionsSepaDebit? = nil) {
		self.mandate_options = mandate_options
	}
}

public class Shipping: Codable {
	public var address: Address?
	/// The delivery service that shipped a physical product, such as Fedex, UPS, USPS, etc.
	public var carrier: String?
	/// Recipient name.
	public var name: String?
	/// Recipient phone (including extension).
	public var phone: String?
	/// The tracking number for a physical product, obtained from the delivery service. If multiple tracking numbers were generated for this purchase, please separate them with commas.
	public var tracking_number: String?

	public init(address: Address? = nil, carrier: String? = nil, name: String? = nil, phone: String? = nil, tracking_number: String? = nil) {
		self.address = address
		self.carrier = carrier
		self.name = name
		self.phone = phone
		self.tracking_number = tracking_number
	}
}

public class ShippingMethod: Codable {
	/// A positive integer in the smallest currency unit (that is, 100 cents for $1.00, or 1 for ¥1, Japanese Yen being a zero-decimal currency) representing the total amount for the line item.
	public var amount: Int
	/// Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
	public var currency: String
	/// The estimated delivery date for the given shipping method. Can be either a specific date or a range.
	public var delivery_estimate: DeliveryEstimate?
	/// An arbitrary string attached to the object. Often useful for displaying to users.
	public var description: String
	/// Unique identifier for the object.
	public var id: String

	public init(amount: Int, currency: String, description: String, id: String, delivery_estimate: DeliveryEstimate? = nil) {
		self.amount = amount
		self.currency = currency
		self.description = description
		self.id = id
		self.delivery_estimate = delivery_estimate
	}
}

public class SigmaScheduledQueryRunError: Codable {
	/// Information about the run failure.
	public var message: String

	public init(message: String) {
		self.message = message
	}
}

/// Stores representations of [stock keeping units](http://en.wikipedia.org/wiki/Stock_keeping_unit). SKUs describe specific product variations, taking into account any combination of: attributes, currency, and cost. For example, a product may be a T-shirt, whereas a specific SKU represents the `size: large`, `color: red` version of that shirt.  Can also be used to manage inventory.  Related guide: [Tax, Shipping, and Inventory](https://stripe.com/docs/orders).
public class Sku: Codable {
	/// Whether the SKU is available for purchase.
	public var active: Bool
	/// A dictionary of attributes and values for the attributes defined by the product. If, for example, a product's attributes are `["size", "gender"]`, a valid SKU has the following dictionary of attributes: `{"size": "Medium", "gender": "Unisex"}`.
	public var attributes: String
	/// Time at which the object was created. Measured in seconds since the Unix epoch.
	public var created: Timestamp
	/// Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
	public var currency: String
	/// Unique identifier for the object.
	public var id: String
	/// The URL of an image for this SKU, meant to be displayable to the customer.
	public var image: String?
	public var inventory: Inventory
	/// Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
	public var livemode: Bool
	/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
	public var metadata: String
	/// String representing the object's type. Objects of the same type share the same value.
	public var object: ObjectValues
	/// The dimensions of this SKU for shipping purposes.
	public var package_dimensions: PackageDimensions?
	/// The cost of the item as a positive integer in the smallest currency unit (that is, 100 cents to charge $1.00, or 100 to charge ¥100, Japanese Yen being a zero-decimal currency).
	public var price: Int
	/// The ID of the product this SKU is associated with. The product must be currently active.
	public var product: String
	/// Time at which the object was last updated. Measured in seconds since the Unix epoch.
	public var updated: Timestamp

	/// Stores representations of [stock keeping units](http://en.wikipedia.org/wiki/Stock_keeping_unit). SKUs describe specific product variations, taking into account any combination of: attributes, currency, and cost. For example, a product may be a T-shirt, whereas a specific SKU represents the `size: large`, `color: red` version of that shirt.  Can also be used to manage inventory.  Related guide: [Tax, Shipping, and Inventory](https://stripe.com/docs/orders).
	/// - Parameters:
	///   - active: Whether the SKU is available for purchase.
	///   - attributes: A dictionary of attributes and values for the attributes defined by the product. If, for example, a product's attributes are `["size", "gender"]`, a valid SKU has the following dictionary of attributes: `{"size": "Medium", "gender": "Unisex"}`.
	///   - created: Time at which the object was created. Measured in seconds since the Unix epoch.
	///   - currency: Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
	///   - id: Unique identifier for the object.
	///   - image: The URL of an image for this SKU, meant to be displayable to the customer.
	///   - inventory: 
	///   - livemode: Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
	///   - metadata: Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
	///   - object: String representing the object's type. Objects of the same type share the same value.
	///   - package_dimensions: The dimensions of this SKU for shipping purposes.
	///   - price: The cost of the item as a positive integer in the smallest currency unit (that is, 100 cents to charge $1.00, or 100 to charge ¥100, Japanese Yen being a zero-decimal currency).
	///   - product: The ID of the product this SKU is associated with. The product must be currently active.
	///   - updated: Time at which the object was last updated. Measured in seconds since the Unix epoch.
	public init(active: Bool, attributes: String, created: Timestamp, currency: String, id: String, inventory: Inventory, livemode: Bool, metadata: String, object: ObjectValues, price: Int, product: String, updated: Timestamp, image: String? = nil, package_dimensions: PackageDimensions? = nil) {
		self.active = active
		self.attributes = attributes
		self.created = created
		self.currency = currency
		self.id = id
		self.inventory = inventory
		self.livemode = livemode
		self.metadata = metadata
		self.object = object
		self.price = price
		self.product = product
		self.updated = updated
		self.image = image
		self.package_dimensions = package_dimensions
	}

	public enum ObjectValues: String, Codable {
		case sku = "sku"
	}
}

/// `Source` objects allow you to accept a variety of payment methods. They represent a customer's payment instrument, and can be used with the Stripe API just like a `Card` object: once chargeable, they can be charged, or can be attached to customers.  Related guides: [Sources API](https://stripe.com/docs/sources) and [Sources & Customers](https://stripe.com/docs/sources/customers).
public class Source: Codable {
	public var ach_credit_transfer: SourceTypeAchCreditTransfer?
	public var ach_debit: SourceTypeAchDebit?
	public var alipay: SourceTypeAlipay?
	/// A positive integer in the smallest currency unit (that is, 100 cents for $1.00, or 1 for ¥1, Japanese Yen being a zero-decimal currency) representing the total amount associated with the source. This is the amount for which the source will be chargeable once ready. Required for `single_use` sources.
	public var amount: Int?
	public var au_becs_debit: SourceTypeAuBecsDebit?
	public var bancontact: SourceTypeBancontact?
	public var card: SourceTypeCard?
	public var card_present: SourceTypeCardPresent?
	/// The client secret of the source. Used for client-side retrieval using a publishable key.
	public var client_secret: String
	public var code_verification: SourceCodeVerificationFlow?
	/// Time at which the object was created. Measured in seconds since the Unix epoch.
	public var created: Timestamp
	/// Three-letter [ISO code for the currency](https://stripe.com/docs/currencies) associated with the source. This is the currency for which the source will be chargeable once ready. Required for `single_use` sources.
	public var currency: String?
	/// The ID of the customer to which this source is attached. This will not be present when the source has not been attached to a customer.
	public var customer: String?
	public var eps: SourceTypeEps?
	/// The authentication `flow` of the source. `flow` is one of `redirect`, `receiver`, `code_verification`, `none`.
	public var flow: String
	public var giropay: SourceTypeGiropay?
	/// Unique identifier for the object.
	public var id: String
	public var ideal: SourceTypeIdeal?
	public var klarna: SourceTypeKlarna?
	/// Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
	public var livemode: Bool
	/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
	public var metadata: String?
	public var multibanco: SourceTypeMultibanco?
	/// String representing the object's type. Objects of the same type share the same value.
	public var object: ObjectValues
	/// Information about the owner of the payment instrument that may be used or required by particular source types.
	public var owner: SourceOwner?
	public var p24: SourceTypeP24?
	public var receiver: SourceReceiverFlow?
	public var redirect: SourceRedirectFlow?
	public var sepa_debit: SourceTypeSepaDebit?
	public var sofort: SourceTypeSofort?
	public var source_order: SourceOrder?
	/// Extra information about a source. This will appear on your customer's statement every time you charge the source.
	public var statement_descriptor: String?
	/// The status of the source, one of `canceled`, `chargeable`, `consumed`, `failed`, or `pending`. Only `chargeable` sources can be used to create a charge.
	public var status: String
	public var three_d_secure: SourceTypeThreeDSecure?
	/// The `type` of the source. The `type` is a payment method, one of `ach_credit_transfer`, `ach_debit`, `alipay`, `bancontact`, `card`, `card_present`, `eps`, `giropay`, `ideal`, `multibanco`, `klarna`, `p24`, `sepa_debit`, `sofort`, `three_d_secure`, or `wechat`. An additional hash is included on the source with a name matching this value. It contains additional information specific to the [payment method](https://stripe.com/docs/sources) used.
	public var type: TypeValues
	/// Either `reusable` or `single_use`. Whether this source should be reusable or not. Some source types may or may not be reusable by construction, while others may leave the option at creation. If an incompatible value is passed, an error will be returned.
	public var usage: String?
	public var wechat: SourceTypeWechat?

	/// `Source` objects allow you to accept a variety of payment methods. They represent a customer's payment instrument, and can be used with the Stripe API just like a `Card` object: once chargeable, they can be charged, or can be attached to customers.  Related guides: [Sources API](https://stripe.com/docs/sources) and [Sources & Customers](https://stripe.com/docs/sources/customers).
	/// - Parameters:
	///   - amount: A positive integer in the smallest currency unit (that is, 100 cents for $1.00, or 1 for ¥1, Japanese Yen being a zero-decimal currency) representing the total amount associated with the source. This is the amount for which the source will be chargeable once ready. Required for `single_use` sources.
	///   - client_secret: The client secret of the source. Used for client-side retrieval using a publishable key.
	///   - created: Time at which the object was created. Measured in seconds since the Unix epoch.
	///   - currency: Three-letter [ISO code for the currency](https://stripe.com/docs/currencies) associated with the source. This is the currency for which the source will be chargeable once ready. Required for `single_use` sources.
	///   - customer: The ID of the customer to which this source is attached. This will not be present when the source has not been attached to a customer.
	///   - flow: The authentication `flow` of the source. `flow` is one of `redirect`, `receiver`, `code_verification`, `none`.
	///   - id: Unique identifier for the object.
	///   - livemode: Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
	///   - metadata: Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
	///   - object: String representing the object's type. Objects of the same type share the same value.
	///   - owner: Information about the owner of the payment instrument that may be used or required by particular source types.
	///   - statement_descriptor: Extra information about a source. This will appear on your customer's statement every time you charge the source.
	///   - status: The status of the source, one of `canceled`, `chargeable`, `consumed`, `failed`, or `pending`. Only `chargeable` sources can be used to create a charge.
	///   - type: The `type` of the source. The `type` is a payment method, one of `ach_credit_transfer`, `ach_debit`, `alipay`, `bancontact`, `card`, `card_present`, `eps`, `giropay`, `ideal`, `multibanco`, `klarna`, `p24`, `sepa_debit`, `sofort`, `three_d_secure`, or `wechat`. An additional hash is included on the source with a name matching this value. It contains additional information specific to the [payment method](https://stripe.com/docs/sources) used.
	///   - usage: Either `reusable` or `single_use`. Whether this source should be reusable or not. Some source types may or may not be reusable by construction, while others may leave the option at creation. If an incompatible value is passed, an error will be returned.
	public init(client_secret: String, created: Timestamp, flow: String, id: String, livemode: Bool, object: ObjectValues, status: String, type: TypeValues, ach_credit_transfer: SourceTypeAchCreditTransfer? = nil, ach_debit: SourceTypeAchDebit? = nil, alipay: SourceTypeAlipay? = nil, amount: Int? = nil, au_becs_debit: SourceTypeAuBecsDebit? = nil, bancontact: SourceTypeBancontact? = nil, card: SourceTypeCard? = nil, card_present: SourceTypeCardPresent? = nil, code_verification: SourceCodeVerificationFlow? = nil, currency: String? = nil, customer: String? = nil, eps: SourceTypeEps? = nil, giropay: SourceTypeGiropay? = nil, ideal: SourceTypeIdeal? = nil, klarna: SourceTypeKlarna? = nil, metadata: String? = nil, multibanco: SourceTypeMultibanco? = nil, owner: SourceOwner? = nil, p24: SourceTypeP24? = nil, receiver: SourceReceiverFlow? = nil, redirect: SourceRedirectFlow? = nil, sepa_debit: SourceTypeSepaDebit? = nil, sofort: SourceTypeSofort? = nil, source_order: SourceOrder? = nil, statement_descriptor: String? = nil, three_d_secure: SourceTypeThreeDSecure? = nil, usage: String? = nil, wechat: SourceTypeWechat? = nil) {
		self.client_secret = client_secret
		self.created = created
		self.flow = flow
		self.id = id
		self.livemode = livemode
		self.object = object
		self.status = status
		self.type = type
		self.ach_credit_transfer = ach_credit_transfer
		self.ach_debit = ach_debit
		self.alipay = alipay
		self.amount = amount
		self.au_becs_debit = au_becs_debit
		self.bancontact = bancontact
		self.card = card
		self.card_present = card_present
		self.code_verification = code_verification
		self.currency = currency
		self.customer = customer
		self.eps = eps
		self.giropay = giropay
		self.ideal = ideal
		self.klarna = klarna
		self.metadata = metadata
		self.multibanco = multibanco
		self.owner = owner
		self.p24 = p24
		self.receiver = receiver
		self.redirect = redirect
		self.sepa_debit = sepa_debit
		self.sofort = sofort
		self.source_order = source_order
		self.statement_descriptor = statement_descriptor
		self.three_d_secure = three_d_secure
		self.usage = usage
		self.wechat = wechat
	}

	public enum ObjectValues: String, Codable {
		case source = "source"
	}

	public enum TypeValues: String, Codable {
		case achCreditTransfer = "ach_credit_transfer"
		case achDebit = "ach_debit"
		case alipay = "alipay"
		case auBecsDebit = "au_becs_debit"
		case bancontact = "bancontact"
		case card = "card"
		case cardPresent = "card_present"
		case eps = "eps"
		case giropay = "giropay"
		case ideal = "ideal"
		case klarna = "klarna"
		case multibanco = "multibanco"
		case p24 = "p24"
		case sepaDebit = "sepa_debit"
		case sofort = "sofort"
		case threeDSecure = "three_d_secure"
		case wechat = "wechat"
	}
}

public class SourceCodeVerificationFlow: Codable {
	/// The number of attempts remaining to authenticate the source object with a verification code.
	public var attempts_remaining: Int
	/// The status of the code verification, either `pending` (awaiting verification, `attempts_remaining` should be greater than 0), `succeeded` (successful verification) or `failed` (failed verification, cannot be verified anymore as `attempts_remaining` should be 0).
	public var status: String

	public init(attempts_remaining: Int, status: String) {
		self.attempts_remaining = attempts_remaining
		self.status = status
	}
}

/// Source mandate notifications should be created when a notification related to a source mandate must be sent to the payer. They will trigger a webhook or deliver an email to the customer.
public class SourceMandateNotification: Codable {
	public var acss_debit: SourceMandateNotificationAcssDebitData?
	/// A positive integer in the smallest currency unit (that is, 100 cents for $1.00, or 1 for ¥1, Japanese Yen being a zero-decimal currency) representing the amount associated with the mandate notification. The amount is expressed in the currency of the underlying source. Required if the notification type is `debit_initiated`.
	public var amount: Int?
	public var bacs_debit: SourceMandateNotificationBacsDebitData?
	/// Time at which the object was created. Measured in seconds since the Unix epoch.
	public var created: Timestamp
	/// Unique identifier for the object.
	public var id: String
	/// Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
	public var livemode: Bool
	/// String representing the object's type. Objects of the same type share the same value.
	public var object: ObjectValues
	/// The reason of the mandate notification. Valid reasons are `mandate_confirmed` or `debit_initiated`.
	public var reason: String
	public var sepa_debit: SourceMandateNotificationSepaDebitData?
	public var source: Source
	/// The status of the mandate notification. Valid statuses are `pending` or `submitted`.
	public var status: String
	/// The type of source this mandate notification is attached to. Should be the source type identifier code for the payment method, such as `three_d_secure`.
	public var type: String

	/// Source mandate notifications should be created when a notification related to a source mandate must be sent to the payer. They will trigger a webhook or deliver an email to the customer.
	/// - Parameters:
	///   - amount: A positive integer in the smallest currency unit (that is, 100 cents for $1.00, or 1 for ¥1, Japanese Yen being a zero-decimal currency) representing the amount associated with the mandate notification. The amount is expressed in the currency of the underlying source. Required if the notification type is `debit_initiated`.
	///   - created: Time at which the object was created. Measured in seconds since the Unix epoch.
	///   - id: Unique identifier for the object.
	///   - livemode: Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
	///   - object: String representing the object's type. Objects of the same type share the same value.
	///   - reason: The reason of the mandate notification. Valid reasons are `mandate_confirmed` or `debit_initiated`.
	///   - source: 
	///   - status: The status of the mandate notification. Valid statuses are `pending` or `submitted`.
	///   - type: The type of source this mandate notification is attached to. Should be the source type identifier code for the payment method, such as `three_d_secure`.
	public init(created: Timestamp, id: String, livemode: Bool, object: ObjectValues, reason: String, source: Source, status: String, type: String, acss_debit: SourceMandateNotificationAcssDebitData? = nil, amount: Int? = nil, bacs_debit: SourceMandateNotificationBacsDebitData? = nil, sepa_debit: SourceMandateNotificationSepaDebitData? = nil) {
		self.created = created
		self.id = id
		self.livemode = livemode
		self.object = object
		self.reason = reason
		self.source = source
		self.status = status
		self.type = type
		self.acss_debit = acss_debit
		self.amount = amount
		self.bacs_debit = bacs_debit
		self.sepa_debit = sepa_debit
	}

	public enum ObjectValues: String, Codable {
		case sourceMandateNotification = "source_mandate_notification"
	}
}

public class SourceMandateNotificationAcssDebitData: Codable {
	/// The statement descriptor associate with the debit.
	public var statement_descriptor: String?

	public init(statement_descriptor: String? = nil) {
		self.statement_descriptor = statement_descriptor
	}
}

public class SourceMandateNotificationBacsDebitData: Codable {
	/// Last 4 digits of the account number associated with the debit.
	public var last4: String?

	public init(last4: String? = nil) {
		self.last4 = last4
	}
}

public class SourceMandateNotificationSepaDebitData: Codable {
	/// SEPA creditor ID.
	public var creditor_identifier: String?
	/// Last 4 digits of the account number associated with the debit.
	public var last4: String?
	/// Mandate reference associated with the debit.
	public var mandate_reference: String?

	public init(creditor_identifier: String? = nil, last4: String? = nil, mandate_reference: String? = nil) {
		self.creditor_identifier = creditor_identifier
		self.last4 = last4
		self.mandate_reference = mandate_reference
	}
}

public class SourceOrder: Codable {
	/// A positive integer in the smallest currency unit (that is, 100 cents for $1.00, or 1 for ¥1, Japanese Yen being a zero-decimal currency) representing the total amount for the order.
	public var amount: Int
	/// Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
	public var currency: String
	/// The email address of the customer placing the order.
	public var email: String?
	/// List of items constituting the order.
	public var items: [SourceOrderItem]??
	public var shipping: Shipping?

	public init(amount: Int, currency: String, email: String? = nil, items: [SourceOrderItem]?? = nil, shipping: Shipping? = nil) {
		self.amount = amount
		self.currency = currency
		self.email = email
		self.items = items
		self.shipping = shipping
	}
}

public class SourceOrderItem: Codable {
	/// The amount (price) for this order item.
	public var amount: Int?
	/// This currency of this order item. Required when `amount` is present.
	public var currency: String?
	/// Human-readable description for this order item.
	public var description: String?
	/// The ID of the associated object for this line item. Expandable if not null (e.g., expandable to a SKU).
	public var parent: String?
	/// The quantity of this order item. When type is `sku`, this is the number of instances of the SKU to be ordered.
	public var quantity: Int?
	/// The type of this order item. Must be `sku`, `tax`, or `shipping`.
	public var type: String?

	public init(amount: Int? = nil, currency: String? = nil, description: String? = nil, parent: String? = nil, quantity: Int? = nil, type: String? = nil) {
		self.amount = amount
		self.currency = currency
		self.description = description
		self.parent = parent
		self.quantity = quantity
		self.type = type
	}
}

public class SourceOwner: Codable {
	/// Owner's address.
	public var address: Address?
	/// Owner's email address.
	public var email: String?
	/// Owner's full name.
	public var name: String?
	/// Owner's phone number (including extension).
	public var phone: String?
	/// Verified owner's address. Verified values are verified or provided by the payment method directly (and if supported) at the time of authorization or settlement. They cannot be set or mutated.
	public var verified_address: Address?
	/// Verified owner's email address. Verified values are verified or provided by the payment method directly (and if supported) at the time of authorization or settlement. They cannot be set or mutated.
	public var verified_email: String?
	/// Verified owner's full name. Verified values are verified or provided by the payment method directly (and if supported) at the time of authorization or settlement. They cannot be set or mutated.
	public var verified_name: String?
	/// Verified owner's phone number (including extension). Verified values are verified or provided by the payment method directly (and if supported) at the time of authorization or settlement. They cannot be set or mutated.
	public var verified_phone: String?

	public init(address: Address? = nil, email: String? = nil, name: String? = nil, phone: String? = nil, verified_address: Address? = nil, verified_email: String? = nil, verified_name: String? = nil, verified_phone: String? = nil) {
		self.address = address
		self.email = email
		self.name = name
		self.phone = phone
		self.verified_address = verified_address
		self.verified_email = verified_email
		self.verified_name = verified_name
		self.verified_phone = verified_phone
	}
}

public class SourceReceiverFlow: Codable {
	/// The address of the receiver source. This is the value that should be communicated to the customer to send their funds to.
	public var address: String?
	/// The total amount that was moved to your balance. This is almost always equal to the amount charged. In rare cases when customers deposit excess funds and we are unable to refund those, those funds get moved to your balance and show up in amount_charged as well. The amount charged is expressed in the source's currency.
	public var amount_charged: Int
	/// The total amount received by the receiver source. `amount_received = amount_returned + amount_charged` should be true for consumed sources unless customers deposit excess funds. The amount received is expressed in the source's currency.
	public var amount_received: Int
	/// The total amount that was returned to the customer. The amount returned is expressed in the source's currency.
	public var amount_returned: Int
	/// Type of refund attribute method, one of `email`, `manual`, or `none`.
	public var refund_attributes_method: String
	/// Type of refund attribute status, one of `missing`, `requested`, or `available`.
	public var refund_attributes_status: String

	public init(amount_charged: Int, amount_received: Int, amount_returned: Int, refund_attributes_method: String, refund_attributes_status: String, address: String? = nil) {
		self.amount_charged = amount_charged
		self.amount_received = amount_received
		self.amount_returned = amount_returned
		self.refund_attributes_method = refund_attributes_method
		self.refund_attributes_status = refund_attributes_status
		self.address = address
	}
}

public class SourceRedirectFlow: Codable {
	/// The failure reason for the redirect, either `user_abort` (the customer aborted or dropped out of the redirect flow), `declined` (the authentication failed or the transaction was declined), or `processing_error` (the redirect failed due to a technical error). Present only if the redirect status is `failed`.
	public var failure_reason: String?
	/// The URL you provide to redirect the customer to after they authenticated their payment.
	public var return_url: String
	/// The status of the redirect, either `pending` (ready to be used by your customer to authenticate the transaction), `succeeded` (succesful authentication, cannot be reused) or `not_required` (redirect should not be used) or `failed` (failed authentication, cannot be reused).
	public var status: String
	/// The URL provided to you to redirect a customer to as part of a `redirect` authentication flow.
	public var url: String

	public init(return_url: String, status: String, url: String, failure_reason: String? = nil) {
		self.return_url = return_url
		self.status = status
		self.url = url
		self.failure_reason = failure_reason
	}
}

/// Some payment methods have no required amount that a customer must send. Customers can be instructed to send any amount, and it can be made up of multiple transactions. As such, sources can have multiple associated transactions.
public class SourceTransaction: Codable {
	public var ach_credit_transfer: SourceTransactionAchCreditTransferData?
	/// A positive integer in the smallest currency unit (that is, 100 cents for $1.00, or 1 for ¥1, Japanese Yen being a zero-decimal currency) representing the amount your customer has pushed to the receiver.
	public var amount: Int
	public var chf_credit_transfer: SourceTransactionChfCreditTransferData?
	/// Time at which the object was created. Measured in seconds since the Unix epoch.
	public var created: Timestamp
	/// Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
	public var currency: String
	public var gbp_credit_transfer: SourceTransactionGbpCreditTransferData?
	/// Unique identifier for the object.
	public var id: String
	/// Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
	public var livemode: Bool
	/// String representing the object's type. Objects of the same type share the same value.
	public var object: ObjectValues
	public var paper_check: SourceTransactionPaperCheckData?
	public var sepa_credit_transfer: SourceTransactionSepaCreditTransferData?
	/// The ID of the source this transaction is attached to.
	public var source: String
	/// The status of the transaction, one of `succeeded`, `pending`, or `failed`.
	public var status: String
	/// The type of source this transaction is attached to.
	public var type: TypeValues

	/// Some payment methods have no required amount that a customer must send. Customers can be instructed to send any amount, and it can be made up of multiple transactions. As such, sources can have multiple associated transactions.
	/// - Parameters:
	///   - amount: A positive integer in the smallest currency unit (that is, 100 cents for $1.00, or 1 for ¥1, Japanese Yen being a zero-decimal currency) representing the amount your customer has pushed to the receiver.
	///   - created: Time at which the object was created. Measured in seconds since the Unix epoch.
	///   - currency: Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
	///   - id: Unique identifier for the object.
	///   - livemode: Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
	///   - object: String representing the object's type. Objects of the same type share the same value.
	///   - source: The ID of the source this transaction is attached to.
	///   - status: The status of the transaction, one of `succeeded`, `pending`, or `failed`.
	///   - type: The type of source this transaction is attached to.
	public init(amount: Int, created: Timestamp, currency: String, id: String, livemode: Bool, object: ObjectValues, source: String, status: String, type: TypeValues, ach_credit_transfer: SourceTransactionAchCreditTransferData? = nil, chf_credit_transfer: SourceTransactionChfCreditTransferData? = nil, gbp_credit_transfer: SourceTransactionGbpCreditTransferData? = nil, paper_check: SourceTransactionPaperCheckData? = nil, sepa_credit_transfer: SourceTransactionSepaCreditTransferData? = nil) {
		self.amount = amount
		self.created = created
		self.currency = currency
		self.id = id
		self.livemode = livemode
		self.object = object
		self.source = source
		self.status = status
		self.type = type
		self.ach_credit_transfer = ach_credit_transfer
		self.chf_credit_transfer = chf_credit_transfer
		self.gbp_credit_transfer = gbp_credit_transfer
		self.paper_check = paper_check
		self.sepa_credit_transfer = sepa_credit_transfer
	}

	public enum ObjectValues: String, Codable {
		case sourceTransaction = "source_transaction"
	}

	public enum TypeValues: String, Codable {
		case achCreditTransfer = "ach_credit_transfer"
		case achDebit = "ach_debit"
		case alipay = "alipay"
		case bancontact = "bancontact"
		case card = "card"
		case cardPresent = "card_present"
		case eps = "eps"
		case giropay = "giropay"
		case ideal = "ideal"
		case klarna = "klarna"
		case multibanco = "multibanco"
		case p24 = "p24"
		case sepaDebit = "sepa_debit"
		case sofort = "sofort"
		case threeDSecure = "three_d_secure"
		case wechat = "wechat"
	}
}

public class SourceTransactionAchCreditTransferData: Codable {
	/// Customer data associated with the transfer.
	public var customer_data: String?
	/// Bank account fingerprint associated with the transfer.
	public var fingerprint: String?
	/// Last 4 digits of the account number associated with the transfer.
	public var last4: String?
	/// Routing number associated with the transfer.
	public var routing_number: String?

	public init(customer_data: String? = nil, fingerprint: String? = nil, last4: String? = nil, routing_number: String? = nil) {
		self.customer_data = customer_data
		self.fingerprint = fingerprint
		self.last4 = last4
		self.routing_number = routing_number
	}
}

public class SourceTransactionChfCreditTransferData: Codable {
	/// Reference associated with the transfer.
	public var reference: String?
	/// Sender's country address.
	public var sender_address_country: String?
	/// Sender's line 1 address.
	public var sender_address_line1: String?
	/// Sender's bank account IBAN.
	public var sender_iban: String?
	/// Sender's name.
	public var sender_name: String?

	public init(reference: String? = nil, sender_address_country: String? = nil, sender_address_line1: String? = nil, sender_iban: String? = nil, sender_name: String? = nil) {
		self.reference = reference
		self.sender_address_country = sender_address_country
		self.sender_address_line1 = sender_address_line1
		self.sender_iban = sender_iban
		self.sender_name = sender_name
	}
}

public class SourceTransactionGbpCreditTransferData: Codable {
	/// Bank account fingerprint associated with the Stripe owned bank account receiving the transfer.
	public var fingerprint: String?
	/// The credit transfer rails the sender used to push this transfer. The possible rails are: Faster Payments, BACS, CHAPS, and wire transfers. Currently only Faster Payments is supported.
	public var funding_method: String?
	/// Last 4 digits of sender account number associated with the transfer.
	public var last4: String?
	/// Sender entered arbitrary information about the transfer.
	public var reference: String?
	/// Sender account number associated with the transfer.
	public var sender_account_number: String?
	/// Sender name associated with the transfer.
	public var sender_name: String?
	/// Sender sort code associated with the transfer.
	public var sender_sort_code: String?

	public init(fingerprint: String? = nil, funding_method: String? = nil, last4: String? = nil, reference: String? = nil, sender_account_number: String? = nil, sender_name: String? = nil, sender_sort_code: String? = nil) {
		self.fingerprint = fingerprint
		self.funding_method = funding_method
		self.last4 = last4
		self.reference = reference
		self.sender_account_number = sender_account_number
		self.sender_name = sender_name
		self.sender_sort_code = sender_sort_code
	}
}

public class SourceTransactionPaperCheckData: Codable {
	/// Time at which the deposited funds will be available for use. Measured in seconds since the Unix epoch.
	public var available_at: String?
	/// Comma-separated list of invoice IDs associated with the paper check.
	public var invoices: String?

	public init(available_at: String? = nil, invoices: String? = nil) {
		self.available_at = available_at
		self.invoices = invoices
	}
}

public class SourceTransactionSepaCreditTransferData: Codable {
	/// Reference associated with the transfer.
	public var reference: String?
	/// Sender's bank account IBAN.
	public var sender_iban: String?
	/// Sender's name.
	public var sender_name: String?

	public init(reference: String? = nil, sender_iban: String? = nil, sender_name: String? = nil) {
		self.reference = reference
		self.sender_iban = sender_iban
		self.sender_name = sender_name
	}
}

public class SourceTypeAchCreditTransfer: Codable {
	public var account_number: String?
	public var bank_name: String?
	public var fingerprint: String?
	public var refund_account_holder_name: String?
	public var refund_account_holder_type: String?
	public var refund_routing_number: String?
	public var routing_number: String?
	public var swift_code: String?

	public init(account_number: String? = nil, bank_name: String? = nil, fingerprint: String? = nil, refund_account_holder_name: String? = nil, refund_account_holder_type: String? = nil, refund_routing_number: String? = nil, routing_number: String? = nil, swift_code: String? = nil) {
		self.account_number = account_number
		self.bank_name = bank_name
		self.fingerprint = fingerprint
		self.refund_account_holder_name = refund_account_holder_name
		self.refund_account_holder_type = refund_account_holder_type
		self.refund_routing_number = refund_routing_number
		self.routing_number = routing_number
		self.swift_code = swift_code
	}
}

public class SourceTypeAchDebit: Codable {
	public var bank_name: String?
	public var country: String?
	public var fingerprint: String?
	public var last4: String?
	public var routing_number: String?
	public var type: String?

	public init(bank_name: String? = nil, country: String? = nil, fingerprint: String? = nil, last4: String? = nil, routing_number: String? = nil, type: String? = nil) {
		self.bank_name = bank_name
		self.country = country
		self.fingerprint = fingerprint
		self.last4 = last4
		self.routing_number = routing_number
		self.type = type
	}
}

public class SourceTypeAlipay: Codable {
	public var data_string: String?
	public var native_url: String?
	public var statement_descriptor: String?

	public init(data_string: String? = nil, native_url: String? = nil, statement_descriptor: String? = nil) {
		self.data_string = data_string
		self.native_url = native_url
		self.statement_descriptor = statement_descriptor
	}
}

public class SourceTypeAuBecsDebit: Codable {
	public var bsb_number: String?
	public var fingerprint: String?
	public var last4: String?

	public init(bsb_number: String? = nil, fingerprint: String? = nil, last4: String? = nil) {
		self.bsb_number = bsb_number
		self.fingerprint = fingerprint
		self.last4 = last4
	}
}

public class SourceTypeBancontact: Codable {
	public var bank_code: String?
	public var bank_name: String?
	public var bic: String?
	public var iban_last4: String?
	public var preferred_language: String?
	public var statement_descriptor: String?

	public init(bank_code: String? = nil, bank_name: String? = nil, bic: String? = nil, iban_last4: String? = nil, preferred_language: String? = nil, statement_descriptor: String? = nil) {
		self.bank_code = bank_code
		self.bank_name = bank_name
		self.bic = bic
		self.iban_last4 = iban_last4
		self.preferred_language = preferred_language
		self.statement_descriptor = statement_descriptor
	}
}

public class SourceTypeCard: Codable {
	public var address_line1_check: String?
	public var address_zip_check: String?
	public var brand: String?
	public var country: String?
	public var cvc_check: String?
	public var dynamic_last4: String?
	public var exp_month: Int?
	public var exp_year: Int?
	public var fingerprint: String?
	public var funding: String?
	public var last4: String?
	public var name: String?
	public var three_d_secure: String?
	public var tokenization_method: String?

	public init(address_line1_check: String? = nil, address_zip_check: String? = nil, brand: String? = nil, country: String? = nil, cvc_check: String? = nil, dynamic_last4: String? = nil, exp_month: Int? = nil, exp_year: Int? = nil, fingerprint: String? = nil, funding: String? = nil, last4: String? = nil, name: String? = nil, three_d_secure: String? = nil, tokenization_method: String? = nil) {
		self.address_line1_check = address_line1_check
		self.address_zip_check = address_zip_check
		self.brand = brand
		self.country = country
		self.cvc_check = cvc_check
		self.dynamic_last4 = dynamic_last4
		self.exp_month = exp_month
		self.exp_year = exp_year
		self.fingerprint = fingerprint
		self.funding = funding
		self.last4 = last4
		self.name = name
		self.three_d_secure = three_d_secure
		self.tokenization_method = tokenization_method
	}
}

public class SourceTypeCardPresent: Codable {
	public var application_cryptogram: String?
	public var application_preferred_name: String?
	public var authorization_code: String?
	public var authorization_response_code: String?
	public var brand: String?
	public var country: String?
	public var cvm_type: String?
	public var data_type: String?
	public var dedicated_file_name: String?
	public var emv_auth_data: String?
	public var evidence_customer_signature: String?
	public var evidence_transaction_certificate: String?
	public var exp_month: Int?
	public var exp_year: Int?
	public var fingerprint: String?
	public var funding: String?
	public var last4: String?
	public var pos_device_id: String?
	public var pos_entry_mode: String?
	public var read_method: String?
	public var reader: String?
	public var terminal_verification_results: String?
	public var transaction_status_information: String?

	public init(application_cryptogram: String? = nil, application_preferred_name: String? = nil, authorization_code: String? = nil, authorization_response_code: String? = nil, brand: String? = nil, country: String? = nil, cvm_type: String? = nil, data_type: String? = nil, dedicated_file_name: String? = nil, emv_auth_data: String? = nil, evidence_customer_signature: String? = nil, evidence_transaction_certificate: String? = nil, exp_month: Int? = nil, exp_year: Int? = nil, fingerprint: String? = nil, funding: String? = nil, last4: String? = nil, pos_device_id: String? = nil, pos_entry_mode: String? = nil, read_method: String? = nil, reader: String? = nil, terminal_verification_results: String? = nil, transaction_status_information: String? = nil) {
		self.application_cryptogram = application_cryptogram
		self.application_preferred_name = application_preferred_name
		self.authorization_code = authorization_code
		self.authorization_response_code = authorization_response_code
		self.brand = brand
		self.country = country
		self.cvm_type = cvm_type
		self.data_type = data_type
		self.dedicated_file_name = dedicated_file_name
		self.emv_auth_data = emv_auth_data
		self.evidence_customer_signature = evidence_customer_signature
		self.evidence_transaction_certificate = evidence_transaction_certificate
		self.exp_month = exp_month
		self.exp_year = exp_year
		self.fingerprint = fingerprint
		self.funding = funding
		self.last4 = last4
		self.pos_device_id = pos_device_id
		self.pos_entry_mode = pos_entry_mode
		self.read_method = read_method
		self.reader = reader
		self.terminal_verification_results = terminal_verification_results
		self.transaction_status_information = transaction_status_information
	}
}

public class SourceTypeEps: Codable {
	public var reference: String?
	public var statement_descriptor: String?

	public init(reference: String? = nil, statement_descriptor: String? = nil) {
		self.reference = reference
		self.statement_descriptor = statement_descriptor
	}
}

public class SourceTypeGiropay: Codable {
	public var bank_code: String?
	public var bank_name: String?
	public var bic: String?
	public var statement_descriptor: String?

	public init(bank_code: String? = nil, bank_name: String? = nil, bic: String? = nil, statement_descriptor: String? = nil) {
		self.bank_code = bank_code
		self.bank_name = bank_name
		self.bic = bic
		self.statement_descriptor = statement_descriptor
	}
}

public class SourceTypeIdeal: Codable {
	public var bank: String?
	public var bic: String?
	public var iban_last4: String?
	public var statement_descriptor: String?

	public init(bank: String? = nil, bic: String? = nil, iban_last4: String? = nil, statement_descriptor: String? = nil) {
		self.bank = bank
		self.bic = bic
		self.iban_last4 = iban_last4
		self.statement_descriptor = statement_descriptor
	}
}

public class SourceTypeKlarna: Codable {
	public var background_image_url: String?
	public var client_token: String?
	public var first_name: String?
	public var last_name: String?
	public var locale: String?
	public var logo_url: String?
	public var page_title: String?
	public var pay_later_asset_urls_descriptive: String?
	public var pay_later_asset_urls_standard: String?
	public var pay_later_name: String?
	public var pay_later_redirect_url: String?
	public var pay_now_asset_urls_descriptive: String?
	public var pay_now_asset_urls_standard: String?
	public var pay_now_name: String?
	public var pay_now_redirect_url: String?
	public var pay_over_time_asset_urls_descriptive: String?
	public var pay_over_time_asset_urls_standard: String?
	public var pay_over_time_name: String?
	public var pay_over_time_redirect_url: String?
	public var payment_method_categories: String?
	public var purchase_country: String?
	public var purchase_type: String?
	public var redirect_url: String?
	public var shipping_delay: Int?
	public var shipping_first_name: String?
	public var shipping_last_name: String?

	public init(background_image_url: String? = nil, client_token: String? = nil, first_name: String? = nil, last_name: String? = nil, locale: String? = nil, logo_url: String? = nil, page_title: String? = nil, pay_later_asset_urls_descriptive: String? = nil, pay_later_asset_urls_standard: String? = nil, pay_later_name: String? = nil, pay_later_redirect_url: String? = nil, pay_now_asset_urls_descriptive: String? = nil, pay_now_asset_urls_standard: String? = nil, pay_now_name: String? = nil, pay_now_redirect_url: String? = nil, pay_over_time_asset_urls_descriptive: String? = nil, pay_over_time_asset_urls_standard: String? = nil, pay_over_time_name: String? = nil, pay_over_time_redirect_url: String? = nil, payment_method_categories: String? = nil, purchase_country: String? = nil, purchase_type: String? = nil, redirect_url: String? = nil, shipping_delay: Int? = nil, shipping_first_name: String? = nil, shipping_last_name: String? = nil) {
		self.background_image_url = background_image_url
		self.client_token = client_token
		self.first_name = first_name
		self.last_name = last_name
		self.locale = locale
		self.logo_url = logo_url
		self.page_title = page_title
		self.pay_later_asset_urls_descriptive = pay_later_asset_urls_descriptive
		self.pay_later_asset_urls_standard = pay_later_asset_urls_standard
		self.pay_later_name = pay_later_name
		self.pay_later_redirect_url = pay_later_redirect_url
		self.pay_now_asset_urls_descriptive = pay_now_asset_urls_descriptive
		self.pay_now_asset_urls_standard = pay_now_asset_urls_standard
		self.pay_now_name = pay_now_name
		self.pay_now_redirect_url = pay_now_redirect_url
		self.pay_over_time_asset_urls_descriptive = pay_over_time_asset_urls_descriptive
		self.pay_over_time_asset_urls_standard = pay_over_time_asset_urls_standard
		self.pay_over_time_name = pay_over_time_name
		self.pay_over_time_redirect_url = pay_over_time_redirect_url
		self.payment_method_categories = payment_method_categories
		self.purchase_country = purchase_country
		self.purchase_type = purchase_type
		self.redirect_url = redirect_url
		self.shipping_delay = shipping_delay
		self.shipping_first_name = shipping_first_name
		self.shipping_last_name = shipping_last_name
	}
}

public class SourceTypeMultibanco: Codable {
	public var entity: String?
	public var reference: String?
	public var refund_account_holder_address_city: String?
	public var refund_account_holder_address_country: String?
	public var refund_account_holder_address_line1: String?
	public var refund_account_holder_address_line2: String?
	public var refund_account_holder_address_postal_code: String?
	public var refund_account_holder_address_state: String?
	public var refund_account_holder_name: String?
	public var refund_iban: String?

	public init(entity: String? = nil, reference: String? = nil, refund_account_holder_address_city: String? = nil, refund_account_holder_address_country: String? = nil, refund_account_holder_address_line1: String? = nil, refund_account_holder_address_line2: String? = nil, refund_account_holder_address_postal_code: String? = nil, refund_account_holder_address_state: String? = nil, refund_account_holder_name: String? = nil, refund_iban: String? = nil) {
		self.entity = entity
		self.reference = reference
		self.refund_account_holder_address_city = refund_account_holder_address_city
		self.refund_account_holder_address_country = refund_account_holder_address_country
		self.refund_account_holder_address_line1 = refund_account_holder_address_line1
		self.refund_account_holder_address_line2 = refund_account_holder_address_line2
		self.refund_account_holder_address_postal_code = refund_account_holder_address_postal_code
		self.refund_account_holder_address_state = refund_account_holder_address_state
		self.refund_account_holder_name = refund_account_holder_name
		self.refund_iban = refund_iban
	}
}

public class SourceTypeP24: Codable {
	public var reference: String?

	public init(reference: String? = nil) {
		self.reference = reference
	}
}

public class SourceTypeSepaDebit: Codable {
	public var bank_code: String?
	public var branch_code: String?
	public var country: String?
	public var fingerprint: String?
	public var last4: String?
	public var mandate_reference: String?
	public var mandate_url: String?

	public init(bank_code: String? = nil, branch_code: String? = nil, country: String? = nil, fingerprint: String? = nil, last4: String? = nil, mandate_reference: String? = nil, mandate_url: String? = nil) {
		self.bank_code = bank_code
		self.branch_code = branch_code
		self.country = country
		self.fingerprint = fingerprint
		self.last4 = last4
		self.mandate_reference = mandate_reference
		self.mandate_url = mandate_url
	}
}

public class SourceTypeSofort: Codable {
	public var bank_code: String?
	public var bank_name: String?
	public var bic: String?
	public var country: String?
	public var iban_last4: String?
	public var preferred_language: String?
	public var statement_descriptor: String?

	public init(bank_code: String? = nil, bank_name: String? = nil, bic: String? = nil, country: String? = nil, iban_last4: String? = nil, preferred_language: String? = nil, statement_descriptor: String? = nil) {
		self.bank_code = bank_code
		self.bank_name = bank_name
		self.bic = bic
		self.country = country
		self.iban_last4 = iban_last4
		self.preferred_language = preferred_language
		self.statement_descriptor = statement_descriptor
	}
}

public class SourceTypeThreeDSecure: Codable {
	public var address_line1_check: String?
	public var address_zip_check: String?
	public var authenticated: Bool?
	public var brand: String?
	public var card: String?
	public var country: String?
	public var customer: String?
	public var cvc_check: String?
	public var dynamic_last4: String?
	public var exp_month: Int?
	public var exp_year: Int?
	public var fingerprint: String?
	public var funding: String?
	public var last4: String?
	public var name: String?
	public var three_d_secure: String?
	public var tokenization_method: String?

	public init(address_line1_check: String? = nil, address_zip_check: String? = nil, authenticated: Bool? = nil, brand: String? = nil, card: String? = nil, country: String? = nil, customer: String? = nil, cvc_check: String? = nil, dynamic_last4: String? = nil, exp_month: Int? = nil, exp_year: Int? = nil, fingerprint: String? = nil, funding: String? = nil, last4: String? = nil, name: String? = nil, three_d_secure: String? = nil, tokenization_method: String? = nil) {
		self.address_line1_check = address_line1_check
		self.address_zip_check = address_zip_check
		self.authenticated = authenticated
		self.brand = brand
		self.card = card
		self.country = country
		self.customer = customer
		self.cvc_check = cvc_check
		self.dynamic_last4 = dynamic_last4
		self.exp_month = exp_month
		self.exp_year = exp_year
		self.fingerprint = fingerprint
		self.funding = funding
		self.last4 = last4
		self.name = name
		self.three_d_secure = three_d_secure
		self.tokenization_method = tokenization_method
	}
}

public class SourceTypeWechat: Codable {
	public var prepay_id: String?
	public var qr_code_url: String?
	public var statement_descriptor: String?

	public init(prepay_id: String? = nil, qr_code_url: String? = nil, statement_descriptor: String? = nil) {
		self.prepay_id = prepay_id
		self.qr_code_url = qr_code_url
		self.statement_descriptor = statement_descriptor
	}
}

public class StatusTransitions: Codable {
	/// The time that the order was canceled.
	public var canceled: Timestamp?
	/// The time that the order was fulfilled.
	public var fulfiled: Timestamp?
	/// The time that the order was paid.
	public var paid: Timestamp?
	/// The time that the order was returned.
	public var returned: Timestamp?

	public init(canceled: Timestamp? = nil, fulfiled: Timestamp? = nil, paid: Timestamp? = nil, returned: Timestamp? = nil) {
		self.canceled = canceled
		self.fulfiled = fulfiled
		self.paid = paid
		self.returned = returned
	}
}

/// Subscriptions allow you to charge a customer on a recurring basis.  Related guide: [Creating Subscriptions](https://stripe.com/docs/billing/subscriptions/creating).
public class Subscription: Codable {
	/// A non-negative decimal between 0 and 100, with at most two decimal places. This represents the percentage of the subscription invoice subtotal that will be transferred to the application owner's Stripe account.
	public var application_fee_percent: StringNumber?
	/// Determines the date of the first full invoice, and, for plans with `month` or `year` intervals, the day of the month for subsequent invoices.
	public var billing_cycle_anchor: Timestamp
	/// Define thresholds at which an invoice will be sent, and the subscription advanced to a new billing period
	public var billing_thresholds: SubscriptionBillingThresholds?
	/// A date in the future at which the subscription will automatically get canceled
	public var cancel_at: Timestamp?
	/// If the subscription has been canceled with the `at_period_end` flag set to `true`, `cancel_at_period_end` on the subscription will be true. You can use this attribute to determine whether a subscription that has a status of active is scheduled to be canceled at the end of the current period.
	public var cancel_at_period_end: Bool
	/// If the subscription has been canceled, the date of that cancellation. If the subscription was canceled with `cancel_at_period_end`, `canceled_at` will reflect the time of the most recent update request, not the end of the subscription period when the subscription is automatically moved to a canceled state.
	public var canceled_at: Timestamp?
	/// Either `charge_automatically`, or `send_invoice`. When charging automatically, Stripe will attempt to pay this subscription at the end of the cycle using the default source attached to the customer. When sending an invoice, Stripe will email your customer an invoice with payment instructions.
	public var collection_method: CollectionMethodValues?
	/// Time at which the object was created. Measured in seconds since the Unix epoch.
	public var created: Timestamp
	/// End of the current period that the subscription has been invoiced for. At the end of this period, a new invoice will be created.
	public var current_period_end: Timestamp
	/// Start of the current period that the subscription has been invoiced for.
	public var current_period_start: Timestamp
	/// ID of the customer who owns the subscription.
	public var customer: String
	/// Number of days a customer has to pay invoices generated by this subscription. This value will be `null` for subscriptions where `collection_method=charge_automatically`.
	public var days_until_due: Int?
	/// ID of the default payment method for the subscription. It must belong to the customer associated with the subscription. This takes precedence over `default_source`. If neither are set, invoices will use the customer's [invoice_settings.default_payment_method](https://stripe.com/docs/api/customers/object#customer_object-invoice_settings-default_payment_method) or [default_source](https://stripe.com/docs/api/customers/object#customer_object-default_source).
	public var default_payment_method: String?
	/// ID of the default payment source for the subscription. It must belong to the customer associated with the subscription and be in a chargeable state. If `default_payment_method` is also set, `default_payment_method` will take precedence. If neither are set, invoices will use the customer's [invoice_settings.default_payment_method](https://stripe.com/docs/api/customers/object#customer_object-invoice_settings-default_payment_method) or [default_source](https://stripe.com/docs/api/customers/object#customer_object-default_source).
	public var default_source: String?
	/// The tax rates that will apply to any subscription item that does not have `tax_rates` set. Invoices created will have their `default_tax_rates` populated from the subscription.
	public var default_tax_rates: [TaxRate]??
	/// Describes the current discount applied to this subscription, if there is one. When billing, a discount applied to a subscription overrides a discount applied on a customer-wide basis.
	public var discount: Discount?
	/// If the subscription has ended, the date the subscription ended.
	public var ended_at: Timestamp?
	/// Unique identifier for the object.
	public var id: String
	/// List of subscription items, each with an attached price.
	public var items: SubscriptionItemList
	/// The most recent invoice this subscription has generated.
	public var latest_invoice: String?
	/// Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
	public var livemode: Bool
	/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
	public var metadata: String
	/// Specifies the approximate timestamp on which any pending invoice items will be billed according to the schedule provided at `pending_invoice_item_interval`.
	public var next_pending_invoice_item_invoice: Timestamp?
	/// String representing the object's type. Objects of the same type share the same value.
	public var object: ObjectValues
	/// If specified, payment collection for this subscription will be paused.
	public var pause_collection: SubscriptionsResourcePauseCollection?
	/// Specifies an interval for how often to bill for any pending invoice items. It is analogous to calling [Create an invoice](https://stripe.com/docs/api#create_invoice) for the given subscription at the specified interval.
	public var pending_invoice_item_interval: SubscriptionPendingInvoiceItemInterval?
	/// You can use this [SetupIntent](https://stripe.com/docs/api/setup_intents) to collect user authentication when creating a subscription without immediate payment or updating a subscription's payment method, allowing you to optimize for off-session payments. Learn more in the [SCA Migration Guide](https://stripe.com/docs/billing/migration/strong-customer-authentication#scenario-2).
	public var pending_setup_intent: String?
	/// If specified, [pending updates](https://stripe.com/docs/billing/subscriptions/pending-updates) that will be applied to the subscription once the `latest_invoice` has been paid.
	public var pending_update: SubscriptionsResourcePendingUpdate?
	/// The schedule attached to the subscription
	public var schedule: String?
	/// Date when the subscription was first created. The date might differ from the `created` date due to backdating.
	public var start_date: Timestamp
	/// Possible values are `incomplete`, `incomplete_expired`, `trialing`, `active`, `past_due`, `canceled`, or `unpaid`.   For `collection_method=charge_automatically` a subscription moves into `incomplete` if the initial payment attempt fails. A subscription in this state can only have metadata and default_source updated. Once the first invoice is paid, the subscription moves into an `active` state. If the first invoice is not paid within 23 hours, the subscription transitions to `incomplete_expired`. This is a terminal state, the open invoice will be voided and no further invoices will be generated.   A subscription that is currently in a trial period is `trialing` and moves to `active` when the trial period is over.   If subscription `collection_method=charge_automatically` it becomes `past_due` when payment to renew it fails and `canceled` or `unpaid` (depending on your subscriptions settings) when Stripe has exhausted all payment retry attempts.   If subscription `collection_method=send_invoice` it becomes `past_due` when its invoice is not paid by the due date, and `canceled` or `unpaid` if it is still not paid by an additional deadline after that. Note that when a subscription has a status of `unpaid`, no subsequent invoices will be attempted (invoices will be created, but then immediately automatically closed). After receiving updated payment information from a customer, you may choose to reopen and pay their closed invoices.
	public var status: StatusValues
	/// The account (if any) the subscription's payments will be attributed to for tax reporting, and where funds from each payment will be transferred to for each of the subscription's invoices.
	public var transfer_data: SubscriptionTransferData?
	/// If the subscription has a trial, the end of that trial.
	public var trial_end: Timestamp?
	/// If the subscription has a trial, the beginning of that trial.
	public var trial_start: Timestamp?

	/// Subscriptions allow you to charge a customer on a recurring basis.  Related guide: [Creating Subscriptions](https://stripe.com/docs/billing/subscriptions/creating).
	/// - Parameters:
	///   - application_fee_percent: A non-negative decimal between 0 and 100, with at most two decimal places. This represents the percentage of the subscription invoice subtotal that will be transferred to the application owner's Stripe account.
	///   - billing_cycle_anchor: Determines the date of the first full invoice, and, for plans with `month` or `year` intervals, the day of the month for subsequent invoices.
	///   - billing_thresholds: Define thresholds at which an invoice will be sent, and the subscription advanced to a new billing period
	///   - cancel_at: A date in the future at which the subscription will automatically get canceled
	///   - cancel_at_period_end: If the subscription has been canceled with the `at_period_end` flag set to `true`, `cancel_at_period_end` on the subscription will be true. You can use this attribute to determine whether a subscription that has a status of active is scheduled to be canceled at the end of the current period.
	///   - canceled_at: If the subscription has been canceled, the date of that cancellation. If the subscription was canceled with `cancel_at_period_end`, `canceled_at` will reflect the time of the most recent update request, not the end of the subscription period when the subscription is automatically moved to a canceled state.
	///   - collection_method: Either `charge_automatically`, or `send_invoice`. When charging automatically, Stripe will attempt to pay this subscription at the end of the cycle using the default source attached to the customer. When sending an invoice, Stripe will email your customer an invoice with payment instructions.
	///   - created: Time at which the object was created. Measured in seconds since the Unix epoch.
	///   - current_period_end: End of the current period that the subscription has been invoiced for. At the end of this period, a new invoice will be created.
	///   - current_period_start: Start of the current period that the subscription has been invoiced for.
	///   - customer: ID of the customer who owns the subscription.
	///   - days_until_due: Number of days a customer has to pay invoices generated by this subscription. This value will be `null` for subscriptions where `collection_method=charge_automatically`.
	///   - default_payment_method: ID of the default payment method for the subscription. It must belong to the customer associated with the subscription. This takes precedence over `default_source`. If neither are set, invoices will use the customer's [invoice_settings.default_payment_method](https://stripe.com/docs/api/customers/object#customer_object-invoice_settings-default_payment_method) or [default_source](https://stripe.com/docs/api/customers/object#customer_object-default_source).
	///   - default_source: ID of the default payment source for the subscription. It must belong to the customer associated with the subscription and be in a chargeable state. If `default_payment_method` is also set, `default_payment_method` will take precedence. If neither are set, invoices will use the customer's [invoice_settings.default_payment_method](https://stripe.com/docs/api/customers/object#customer_object-invoice_settings-default_payment_method) or [default_source](https://stripe.com/docs/api/customers/object#customer_object-default_source).
	///   - default_tax_rates: The tax rates that will apply to any subscription item that does not have `tax_rates` set. Invoices created will have their `default_tax_rates` populated from the subscription.
	///   - discount: Describes the current discount applied to this subscription, if there is one. When billing, a discount applied to a subscription overrides a discount applied on a customer-wide basis.
	///   - ended_at: If the subscription has ended, the date the subscription ended.
	///   - id: Unique identifier for the object.
	///   - items: List of subscription items, each with an attached price.
	///   - latest_invoice: The most recent invoice this subscription has generated.
	///   - livemode: Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
	///   - metadata: Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
	///   - next_pending_invoice_item_invoice: Specifies the approximate timestamp on which any pending invoice items will be billed according to the schedule provided at `pending_invoice_item_interval`.
	///   - object: String representing the object's type. Objects of the same type share the same value.
	///   - pause_collection: If specified, payment collection for this subscription will be paused.
	///   - pending_invoice_item_interval: Specifies an interval for how often to bill for any pending invoice items. It is analogous to calling [Create an invoice](https://stripe.com/docs/api#create_invoice) for the given subscription at the specified interval.
	///   - pending_setup_intent: You can use this [SetupIntent](https://stripe.com/docs/api/setup_intents) to collect user authentication when creating a subscription without immediate payment or updating a subscription's payment method, allowing you to optimize for off-session payments. Learn more in the [SCA Migration Guide](https://stripe.com/docs/billing/migration/strong-customer-authentication#scenario-2).
	///   - pending_update: If specified, [pending updates](https://stripe.com/docs/billing/subscriptions/pending-updates) that will be applied to the subscription once the `latest_invoice` has been paid.
	///   - schedule: The schedule attached to the subscription
	///   - start_date: Date when the subscription was first created. The date might differ from the `created` date due to backdating.
	///   - status: Possible values are `incomplete`, `incomplete_expired`, `trialing`, `active`, `past_due`, `canceled`, or `unpaid`.   For `collection_method=charge_automatically` a subscription moves into `incomplete` if the initial payment attempt fails. A subscription in this state can only have metadata and default_source updated. Once the first invoice is paid, the subscription moves into an `active` state. If the first invoice is not paid within 23 hours, the subscription transitions to `incomplete_expired`. This is a terminal state, the open invoice will be voided and no further invoices will be generated.   A subscription that is currently in a trial period is `trialing` and moves to `active` when the trial period is over.   If subscription `collection_method=charge_automatically` it becomes `past_due` when payment to renew it fails and `canceled` or `unpaid` (depending on your subscriptions settings) when Stripe has exhausted all payment retry attempts.   If subscription `collection_method=send_invoice` it becomes `past_due` when its invoice is not paid by the due date, and `canceled` or `unpaid` if it is still not paid by an additional deadline after that. Note that when a subscription has a status of `unpaid`, no subsequent invoices will be attempted (invoices will be created, but then immediately automatically closed). After receiving updated payment information from a customer, you may choose to reopen and pay their closed invoices.
	///   - transfer_data: The account (if any) the subscription's payments will be attributed to for tax reporting, and where funds from each payment will be transferred to for each of the subscription's invoices.
	///   - trial_end: If the subscription has a trial, the end of that trial.
	///   - trial_start: If the subscription has a trial, the beginning of that trial.
	public init(billing_cycle_anchor: Timestamp, cancel_at_period_end: Bool, created: Timestamp, current_period_end: Timestamp, current_period_start: Timestamp, customer: String, id: String, items: SubscriptionItemList, livemode: Bool, metadata: String, object: ObjectValues, start_date: Timestamp, status: StatusValues, application_fee_percent: StringNumber? = nil, billing_thresholds: SubscriptionBillingThresholds? = nil, cancel_at: Timestamp? = nil, canceled_at: Timestamp? = nil, collection_method: CollectionMethodValues? = nil, days_until_due: Int? = nil, default_payment_method: String? = nil, default_source: String? = nil, default_tax_rates: [TaxRate]?? = nil, discount: Discount? = nil, ended_at: Timestamp? = nil, latest_invoice: String? = nil, next_pending_invoice_item_invoice: Timestamp? = nil, pause_collection: SubscriptionsResourcePauseCollection? = nil, pending_invoice_item_interval: SubscriptionPendingInvoiceItemInterval? = nil, pending_setup_intent: String? = nil, pending_update: SubscriptionsResourcePendingUpdate? = nil, schedule: String? = nil, transfer_data: SubscriptionTransferData? = nil, trial_end: Timestamp? = nil, trial_start: Timestamp? = nil) {
		self.billing_cycle_anchor = billing_cycle_anchor
		self.cancel_at_period_end = cancel_at_period_end
		self.created = created
		self.current_period_end = current_period_end
		self.current_period_start = current_period_start
		self.customer = customer
		self.id = id
		self.items = items
		self.livemode = livemode
		self.metadata = metadata
		self.object = object
		self.start_date = start_date
		self.status = status
		self.application_fee_percent = application_fee_percent
		self.billing_thresholds = billing_thresholds
		self.cancel_at = cancel_at
		self.canceled_at = canceled_at
		self.collection_method = collection_method
		self.days_until_due = days_until_due
		self.default_payment_method = default_payment_method
		self.default_source = default_source
		self.default_tax_rates = default_tax_rates
		self.discount = discount
		self.ended_at = ended_at
		self.latest_invoice = latest_invoice
		self.next_pending_invoice_item_invoice = next_pending_invoice_item_invoice
		self.pause_collection = pause_collection
		self.pending_invoice_item_interval = pending_invoice_item_interval
		self.pending_setup_intent = pending_setup_intent
		self.pending_update = pending_update
		self.schedule = schedule
		self.transfer_data = transfer_data
		self.trial_end = trial_end
		self.trial_start = trial_start
	}


	/// List of subscription items, each with an attached price.
	public class SubscriptionItemList: Codable {
		/// Details about each object.
		public var data: [SubscriptionItem]
		/// True if this list has another page of items after this one that can be fetched.
		public var has_more: Bool
		/// String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
		public var object: ObjectValues
		/// The URL where this list can be accessed.
		public var url: String

		/// List of subscription items, each with an attached price.
		/// - Parameters:
		///   - data: Details about each object.
		///   - has_more: True if this list has another page of items after this one that can be fetched.
		///   - object: String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
		///   - url: The URL where this list can be accessed.
		public init(data: [SubscriptionItem], has_more: Bool, object: ObjectValues, url: String) {
			self.data = data
			self.has_more = has_more
			self.object = object
			self.url = url
		}

		public enum ObjectValues: String, Codable {
			case list = "list"
		}
	}


	public enum StatusValues: String, Codable {
		case active = "active"
		case canceled = "canceled"
		case incomplete = "incomplete"
		case incompleteExpired = "incomplete_expired"
		case pastDue = "past_due"
		case trialing = "trialing"
		case unpaid = "unpaid"
	}

	public enum CollectionMethodValues: String, Codable {
		case chargeAutomatically = "charge_automatically"
		case sendInvoice = "send_invoice"
	}

	public enum ObjectValues: String, Codable {
		case subscription = "subscription"
	}
}

public class SubscriptionBillingThresholds: Codable {
	/// Monetary threshold that triggers the subscription to create an invoice
	public var amount_gte: Int?
	/// Indicates if the `billing_cycle_anchor` should be reset when a threshold is reached. If true, `billing_cycle_anchor` will be updated to the date/time the threshold was last reached; otherwise, the value will remain unchanged. This value may not be `true` if the subscription contains items with plans that have `aggregate_usage=last_ever`.
	public var reset_billing_cycle_anchor: Bool?

	public init(amount_gte: Int? = nil, reset_billing_cycle_anchor: Bool? = nil) {
		self.amount_gte = amount_gte
		self.reset_billing_cycle_anchor = reset_billing_cycle_anchor
	}
}

/// Subscription items allow you to create customer subscriptions with more than one plan, making it easy to represent complex billing relationships.
public class SubscriptionItem: Codable {
	/// Define thresholds at which an invoice will be sent, and the related subscription advanced to a new billing period
	public var billing_thresholds: SubscriptionItemBillingThresholds?
	/// Time at which the object was created. Measured in seconds since the Unix epoch.
	public var created: Int
	/// Unique identifier for the object.
	public var id: String
	/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
	public var metadata: String
	/// String representing the object's type. Objects of the same type share the same value.
	public var object: ObjectValues
	public var price: Price
	/// The [quantity](https://stripe.com/docs/subscriptions/quantities) of the plan to which the customer should be subscribed.
	public var quantity: Int?
	/// The `subscription` this `subscription_item` belongs to.
	public var subscription: String
	/// The tax rates which apply to this `subscription_item`. When set, the `default_tax_rates` on the subscription do not apply to this `subscription_item`.
	public var tax_rates: [TaxRate]??

	/// Subscription items allow you to create customer subscriptions with more than one plan, making it easy to represent complex billing relationships.
	/// - Parameters:
	///   - billing_thresholds: Define thresholds at which an invoice will be sent, and the related subscription advanced to a new billing period
	///   - created: Time at which the object was created. Measured in seconds since the Unix epoch.
	///   - id: Unique identifier for the object.
	///   - metadata: Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
	///   - object: String representing the object's type. Objects of the same type share the same value.
	///   - price: 
	///   - quantity: The [quantity](https://stripe.com/docs/subscriptions/quantities) of the plan to which the customer should be subscribed.
	///   - subscription: The `subscription` this `subscription_item` belongs to.
	///   - tax_rates: The tax rates which apply to this `subscription_item`. When set, the `default_tax_rates` on the subscription do not apply to this `subscription_item`.
	public init(created: Int, id: String, metadata: String, object: ObjectValues, price: Price, subscription: String, billing_thresholds: SubscriptionItemBillingThresholds? = nil, quantity: Int? = nil, tax_rates: [TaxRate]?? = nil) {
		self.created = created
		self.id = id
		self.metadata = metadata
		self.object = object
		self.price = price
		self.subscription = subscription
		self.billing_thresholds = billing_thresholds
		self.quantity = quantity
		self.tax_rates = tax_rates
	}

	public enum ObjectValues: String, Codable {
		case subscriptionItem = "subscription_item"
	}
}

public class SubscriptionItemBillingThresholds: Codable {
	/// Usage threshold that triggers the subscription to create an invoice
	public var usage_gte: Int?

	public init(usage_gte: Int? = nil) {
		self.usage_gte = usage_gte
	}
}

public class SubscriptionPendingInvoiceItemInterval: Codable {
	/// Specifies invoicing frequency. Either `day`, `week`, `month` or `year`.
	public var interval: IntervalValues
	/// The number of intervals between invoices. For example, `interval=month` and `interval_count=3` bills every 3 months. Maximum of one year interval allowed (1 year, 12 months, or 52 weeks).
	public var interval_count: Int

	public init(interval: IntervalValues, interval_count: Int) {
		self.interval = interval
		self.interval_count = interval_count
	}

	public enum IntervalValues: String, Codable {
		case day = "day"
		case month = "month"
		case week = "week"
		case year = "year"
	}
}

/// A subscription schedule allows you to create and manage the lifecycle of a subscription by predefining expected changes.  Related guide: [Subscription Schedules](https://stripe.com/docs/billing/subscriptions/subscription-schedules).
public class SubscriptionSchedule: Codable {
	/// Time at which the subscription schedule was canceled. Measured in seconds since the Unix epoch.
	public var canceled_at: Timestamp?
	/// Time at which the subscription schedule was completed. Measured in seconds since the Unix epoch.
	public var completed_at: Timestamp?
	/// Time at which the object was created. Measured in seconds since the Unix epoch.
	public var created: Timestamp
	/// Object representing the start and end dates for the current phase of the subscription schedule, if it is `active`.
	public var current_phase: SubscriptionScheduleCurrentPhase?
	/// ID of the customer who owns the subscription schedule.
	public var customer: String
	public var default_settings: SubscriptionSchedulesResourceDefaultSettings
	/// Behavior of the subscription schedule and underlying subscription when it ends. Possible values are `release` and `cancel`.
	public var end_behavior: EndBehaviorValues
	/// Unique identifier for the object.
	public var id: String
	/// Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
	public var livemode: Bool
	/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
	public var metadata: String?
	/// String representing the object's type. Objects of the same type share the same value.
	public var object: ObjectValues
	/// Configuration for the subscription schedule's phases.
	public var phases: [SubscriptionSchedulePhaseConfiguration]
	/// Time at which the subscription schedule was released. Measured in seconds since the Unix epoch.
	public var released_at: Timestamp?
	/// ID of the subscription once managed by the subscription schedule (if it is released).
	public var released_subscription: String?
	/// The present status of the subscription schedule. Possible values are `not_started`, `active`, `completed`, `released`, and `canceled`. You can read more about the different states in our [behavior guide](https://stripe.com/docs/billing/subscriptions/subscription-schedules).
	public var status: StatusValues
	/// ID of the subscription managed by the subscription schedule.
	public var subscription: String?

	/// A subscription schedule allows you to create and manage the lifecycle of a subscription by predefining expected changes.  Related guide: [Subscription Schedules](https://stripe.com/docs/billing/subscriptions/subscription-schedules).
	/// - Parameters:
	///   - canceled_at: Time at which the subscription schedule was canceled. Measured in seconds since the Unix epoch.
	///   - completed_at: Time at which the subscription schedule was completed. Measured in seconds since the Unix epoch.
	///   - created: Time at which the object was created. Measured in seconds since the Unix epoch.
	///   - current_phase: Object representing the start and end dates for the current phase of the subscription schedule, if it is `active`.
	///   - customer: ID of the customer who owns the subscription schedule.
	///   - default_settings: 
	///   - end_behavior: Behavior of the subscription schedule and underlying subscription when it ends. Possible values are `release` and `cancel`.
	///   - id: Unique identifier for the object.
	///   - livemode: Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
	///   - metadata: Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
	///   - object: String representing the object's type. Objects of the same type share the same value.
	///   - phases: Configuration for the subscription schedule's phases.
	///   - released_at: Time at which the subscription schedule was released. Measured in seconds since the Unix epoch.
	///   - released_subscription: ID of the subscription once managed by the subscription schedule (if it is released).
	///   - status: The present status of the subscription schedule. Possible values are `not_started`, `active`, `completed`, `released`, and `canceled`. You can read more about the different states in our [behavior guide](https://stripe.com/docs/billing/subscriptions/subscription-schedules).
	///   - subscription: ID of the subscription managed by the subscription schedule.
	public init(created: Timestamp, customer: String, default_settings: SubscriptionSchedulesResourceDefaultSettings, end_behavior: EndBehaviorValues, id: String, livemode: Bool, object: ObjectValues, phases: [SubscriptionSchedulePhaseConfiguration], status: StatusValues, canceled_at: Timestamp? = nil, completed_at: Timestamp? = nil, current_phase: SubscriptionScheduleCurrentPhase? = nil, metadata: String? = nil, released_at: Timestamp? = nil, released_subscription: String? = nil, subscription: String? = nil) {
		self.created = created
		self.customer = customer
		self.default_settings = default_settings
		self.end_behavior = end_behavior
		self.id = id
		self.livemode = livemode
		self.object = object
		self.phases = phases
		self.status = status
		self.canceled_at = canceled_at
		self.completed_at = completed_at
		self.current_phase = current_phase
		self.metadata = metadata
		self.released_at = released_at
		self.released_subscription = released_subscription
		self.subscription = subscription
	}

	public enum ObjectValues: String, Codable {
		case subscriptionSchedule = "subscription_schedule"
	}

	public enum StatusValues: String, Codable {
		case active = "active"
		case canceled = "canceled"
		case completed = "completed"
		case notStarted = "not_started"
		case released = "released"
	}

	public enum EndBehaviorValues: String, Codable {
		case cancel = "cancel"
		case none = "none"
		case release = "release"
		case renew = "renew"
	}
}

/// An Add Invoice Item describes the prices and quantities that will be added as pending invoice items when entering a phase.
public class SubscriptionScheduleAddInvoiceItem: Codable {
	/// ID of the price used to generate the invoice item.
	public var price: String
	/// The quantity of the invoice item.
	public var quantity: Int?
	/// The tax rates which apply to the item. When set, the `default_tax_rates` do not apply to this item.
	public var tax_rates: [TaxRate]??

	/// An Add Invoice Item describes the prices and quantities that will be added as pending invoice items when entering a phase.
	/// - Parameters:
	///   - price: ID of the price used to generate the invoice item.
	///   - quantity: The quantity of the invoice item.
	///   - tax_rates: The tax rates which apply to the item. When set, the `default_tax_rates` do not apply to this item.
	public init(price: String, quantity: Int? = nil, tax_rates: [TaxRate]?? = nil) {
		self.price = price
		self.quantity = quantity
		self.tax_rates = tax_rates
	}
}

/// A phase item describes the price and quantity of a phase.
public class SubscriptionScheduleConfigurationItem: Codable {
	/// Define thresholds at which an invoice will be sent, and the related subscription advanced to a new billing period
	public var billing_thresholds: SubscriptionItemBillingThresholds?
	/// ID of the price to which the customer should be subscribed.
	public var price: String
	/// Quantity of the plan to which the customer should be subscribed.
	public var quantity: Int?
	/// The tax rates which apply to this `phase_item`. When set, the `default_tax_rates` on the phase do not apply to this `phase_item`.
	public var tax_rates: [TaxRate]??

	/// A phase item describes the price and quantity of a phase.
	/// - Parameters:
	///   - billing_thresholds: Define thresholds at which an invoice will be sent, and the related subscription advanced to a new billing period
	///   - price: ID of the price to which the customer should be subscribed.
	///   - quantity: Quantity of the plan to which the customer should be subscribed.
	///   - tax_rates: The tax rates which apply to this `phase_item`. When set, the `default_tax_rates` on the phase do not apply to this `phase_item`.
	public init(price: String, billing_thresholds: SubscriptionItemBillingThresholds? = nil, quantity: Int? = nil, tax_rates: [TaxRate]?? = nil) {
		self.price = price
		self.billing_thresholds = billing_thresholds
		self.quantity = quantity
		self.tax_rates = tax_rates
	}
}

public class SubscriptionScheduleCurrentPhase: Codable {
	/// The end of this phase of the subscription schedule.
	public var end_date: Timestamp
	/// The start of this phase of the subscription schedule.
	public var start_date: Timestamp

	public init(end_date: Timestamp, start_date: Timestamp) {
		self.end_date = end_date
		self.start_date = start_date
	}
}

/// A phase describes the plans, coupon, and trialing status of a subscription for a predefined time period.
public class SubscriptionSchedulePhaseConfiguration: Codable {
	/// A list of prices and quantities that will generate invoice items appended to the first invoice for this phase.
	public var add_invoice_items: [SubscriptionScheduleAddInvoiceItem]
	/// A non-negative decimal between 0 and 100, with at most two decimal places. This represents the percentage of the subscription invoice subtotal that will be transferred to the application owner's Stripe account during this phase of the schedule.
	public var application_fee_percent: StringNumber?
	/// Possible values are `phase_start` or `automatic`. If `phase_start` then billing cycle anchor of the subscription is set to the start of the phase when entering the phase. If `automatic` then the billing cycle anchor is automatically modified as needed when entering the phase. For more information, see the billing cycle [documentation](https://stripe.com/docs/billing/subscriptions/billing-cycle).
	public var billing_cycle_anchor: BillingCycleAnchorValues?
	/// Define thresholds at which an invoice will be sent, and the subscription advanced to a new billing period
	public var billing_thresholds: SubscriptionBillingThresholds?
	/// Either `charge_automatically`, or `send_invoice`. When charging automatically, Stripe will attempt to pay the underlying subscription at the end of each billing cycle using the default source attached to the customer. When sending an invoice, Stripe will email your customer an invoice with payment instructions.
	public var collection_method: CollectionMethodValues?
	/// ID of the coupon to use during this phase of the subscription schedule.
	public var coupon: String?
	/// ID of the default payment method for the subscription schedule. It must belong to the customer associated with the subscription schedule. If not set, invoices will use the default payment method in the customer's invoice settings.
	public var default_payment_method: String?
	/// The default tax rates to apply to the subscription during this phase of the subscription schedule.
	public var default_tax_rates: [TaxRate]??
	/// The end of this phase of the subscription schedule.
	public var end_date: Timestamp
	/// The invoice settings applicable during this phase.
	public var invoice_settings: InvoiceSettingSubscriptionScheduleSetting?
	/// Subscription items to configure the subscription to during this phase of the subscription schedule.
	public var items: [SubscriptionScheduleConfigurationItem]
	/// If the subscription schedule will prorate when transitioning to this phase. Possible values are `create_prorations` and `none`.
	public var proration_behavior: ProrationBehaviorValues
	/// The start of this phase of the subscription schedule.
	public var start_date: Timestamp
	/// The account (if any) the associated subscription's payments will be attributed to for tax reporting, and where funds from each payment will be transferred to for each of the subscription's invoices.
	public var transfer_data: SubscriptionTransferData?
	/// When the trial ends within the phase.
	public var trial_end: Timestamp?

	/// A phase describes the plans, coupon, and trialing status of a subscription for a predefined time period.
	/// - Parameters:
	///   - add_invoice_items: A list of prices and quantities that will generate invoice items appended to the first invoice for this phase.
	///   - application_fee_percent: A non-negative decimal between 0 and 100, with at most two decimal places. This represents the percentage of the subscription invoice subtotal that will be transferred to the application owner's Stripe account during this phase of the schedule.
	///   - billing_cycle_anchor: Possible values are `phase_start` or `automatic`. If `phase_start` then billing cycle anchor of the subscription is set to the start of the phase when entering the phase. If `automatic` then the billing cycle anchor is automatically modified as needed when entering the phase. For more information, see the billing cycle [documentation](https://stripe.com/docs/billing/subscriptions/billing-cycle).
	///   - billing_thresholds: Define thresholds at which an invoice will be sent, and the subscription advanced to a new billing period
	///   - collection_method: Either `charge_automatically`, or `send_invoice`. When charging automatically, Stripe will attempt to pay the underlying subscription at the end of each billing cycle using the default source attached to the customer. When sending an invoice, Stripe will email your customer an invoice with payment instructions.
	///   - coupon: ID of the coupon to use during this phase of the subscription schedule.
	///   - default_payment_method: ID of the default payment method for the subscription schedule. It must belong to the customer associated with the subscription schedule. If not set, invoices will use the default payment method in the customer's invoice settings.
	///   - default_tax_rates: The default tax rates to apply to the subscription during this phase of the subscription schedule.
	///   - end_date: The end of this phase of the subscription schedule.
	///   - invoice_settings: The invoice settings applicable during this phase.
	///   - items: Subscription items to configure the subscription to during this phase of the subscription schedule.
	///   - proration_behavior: If the subscription schedule will prorate when transitioning to this phase. Possible values are `create_prorations` and `none`.
	///   - start_date: The start of this phase of the subscription schedule.
	///   - transfer_data: The account (if any) the associated subscription's payments will be attributed to for tax reporting, and where funds from each payment will be transferred to for each of the subscription's invoices.
	///   - trial_end: When the trial ends within the phase.
	public init(add_invoice_items: [SubscriptionScheduleAddInvoiceItem], end_date: Timestamp, items: [SubscriptionScheduleConfigurationItem], proration_behavior: ProrationBehaviorValues, start_date: Timestamp, application_fee_percent: StringNumber? = nil, billing_cycle_anchor: BillingCycleAnchorValues? = nil, billing_thresholds: SubscriptionBillingThresholds? = nil, collection_method: CollectionMethodValues? = nil, coupon: String? = nil, default_payment_method: String? = nil, default_tax_rates: [TaxRate]?? = nil, invoice_settings: InvoiceSettingSubscriptionScheduleSetting? = nil, transfer_data: SubscriptionTransferData? = nil, trial_end: Timestamp? = nil) {
		self.add_invoice_items = add_invoice_items
		self.end_date = end_date
		self.items = items
		self.proration_behavior = proration_behavior
		self.start_date = start_date
		self.application_fee_percent = application_fee_percent
		self.billing_cycle_anchor = billing_cycle_anchor
		self.billing_thresholds = billing_thresholds
		self.collection_method = collection_method
		self.coupon = coupon
		self.default_payment_method = default_payment_method
		self.default_tax_rates = default_tax_rates
		self.invoice_settings = invoice_settings
		self.transfer_data = transfer_data
		self.trial_end = trial_end
	}

	public enum ProrationBehaviorValues: String, Codable {
		case alwaysInvoice = "always_invoice"
		case createProrations = "create_prorations"
		case none = "none"
	}

	public enum BillingCycleAnchorValues: String, Codable {
		case automatic = "automatic"
		case phaseStart = "phase_start"
	}

	public enum CollectionMethodValues: String, Codable {
		case chargeAutomatically = "charge_automatically"
		case sendInvoice = "send_invoice"
	}
}

public class SubscriptionSchedulesResourceDefaultSettings: Codable {
	/// A non-negative decimal between 0 and 100, with at most two decimal places. This represents the percentage of the subscription invoice subtotal that will be transferred to the application owner's Stripe account during this phase of the schedule.
	public var application_fee_percent: StringNumber?
	/// Possible values are `phase_start` or `automatic`. If `phase_start` then billing cycle anchor of the subscription is set to the start of the phase when entering the phase. If `automatic` then the billing cycle anchor is automatically modified as needed when entering the phase. For more information, see the billing cycle [documentation](https://stripe.com/docs/billing/subscriptions/billing-cycle).
	public var billing_cycle_anchor: BillingCycleAnchorValues
	/// Define thresholds at which an invoice will be sent, and the subscription advanced to a new billing period
	public var billing_thresholds: SubscriptionBillingThresholds?
	/// Either `charge_automatically`, or `send_invoice`. When charging automatically, Stripe will attempt to pay the underlying subscription at the end of each billing cycle using the default source attached to the customer. When sending an invoice, Stripe will email your customer an invoice with payment instructions.
	public var collection_method: CollectionMethodValues?
	/// ID of the default payment method for the subscription schedule. If not set, invoices will use the default payment method in the customer's invoice settings.
	public var default_payment_method: String?
	/// The subscription schedule's default invoice settings.
	public var invoice_settings: InvoiceSettingSubscriptionScheduleSetting?
	/// The account (if any) the associated subscription's payments will be attributed to for tax reporting, and where funds from each payment will be transferred to for each of the subscription's invoices.
	public var transfer_data: SubscriptionTransferData?

	public init(billing_cycle_anchor: BillingCycleAnchorValues, application_fee_percent: StringNumber? = nil, billing_thresholds: SubscriptionBillingThresholds? = nil, collection_method: CollectionMethodValues? = nil, default_payment_method: String? = nil, invoice_settings: InvoiceSettingSubscriptionScheduleSetting? = nil, transfer_data: SubscriptionTransferData? = nil) {
		self.billing_cycle_anchor = billing_cycle_anchor
		self.application_fee_percent = application_fee_percent
		self.billing_thresholds = billing_thresholds
		self.collection_method = collection_method
		self.default_payment_method = default_payment_method
		self.invoice_settings = invoice_settings
		self.transfer_data = transfer_data
	}

	public enum BillingCycleAnchorValues: String, Codable {
		case automatic = "automatic"
		case phaseStart = "phase_start"
	}

	public enum CollectionMethodValues: String, Codable {
		case chargeAutomatically = "charge_automatically"
		case sendInvoice = "send_invoice"
	}
}

public class SubscriptionTransferData: Codable {
	/// A non-negative decimal between 0 and 100, with at most two decimal places. This represents the percentage of the subscription invoice subtotal that will be transferred to the destination account. By default, the entire amount is transferred to the destination.
	public var amount_percent: StringNumber?
	/// The account where funds from the payment will be transferred to upon payment success.
	public var destination: String

	public init(destination: String, amount_percent: StringNumber? = nil) {
		self.destination = destination
		self.amount_percent = amount_percent
	}
}

/// The Pause Collection settings determine how we will pause collection for this subscription and for how long the subscription should be paused.
public class SubscriptionsResourcePauseCollection: Codable {
	/// The payment collection behavior for this subscription while paused. One of `keep_as_draft`, `mark_uncollectible`, or `void`.
	public var behavior: BehaviorValues
	/// The time after which the subscription will resume collecting payments.
	public var resumes_at: Timestamp?

	/// The Pause Collection settings determine how we will pause collection for this subscription and for how long the subscription should be paused.
	/// - Parameters:
	///   - behavior: The payment collection behavior for this subscription while paused. One of `keep_as_draft`, `mark_uncollectible`, or `void`.
	///   - resumes_at: The time after which the subscription will resume collecting payments.
	public init(behavior: BehaviorValues, resumes_at: Timestamp? = nil) {
		self.behavior = behavior
		self.resumes_at = resumes_at
	}

	public enum BehaviorValues: String, Codable {
		case keepAsDraft = "keep_as_draft"
		case markUncollectible = "mark_uncollectible"
		case void = "void"
	}
}

/// Pending Updates store the changes pending from a previous update that will be applied to the Subscription upon successful payment.
public class SubscriptionsResourcePendingUpdate: Codable {
	/// If the update is applied, determines the date of the first full invoice, and, for plans with `month` or `year` intervals, the day of the month for subsequent invoices.
	public var billing_cycle_anchor: Timestamp?
	/// The point after which the changes reflected by this update will be discarded and no longer applied.
	public var expires_at: Timestamp
	/// List of subscription items, each with an attached plan, that will be set if the update is applied.
	public var subscription_items: [SubscriptionItem]??
	/// Unix timestamp representing the end of the trial period the customer will get before being charged for the first time, if the update is applied.
	public var trial_end: Timestamp?
	/// Indicates if a plan's `trial_period_days` should be applied to the subscription. Setting `trial_end` per subscription is preferred, and this defaults to `false`. Setting this flag to `true` together with `trial_end` is not allowed.
	public var trial_from_plan: Bool?

	/// Pending Updates store the changes pending from a previous update that will be applied to the Subscription upon successful payment.
	/// - Parameters:
	///   - billing_cycle_anchor: If the update is applied, determines the date of the first full invoice, and, for plans with `month` or `year` intervals, the day of the month for subsequent invoices.
	///   - expires_at: The point after which the changes reflected by this update will be discarded and no longer applied.
	///   - subscription_items: List of subscription items, each with an attached plan, that will be set if the update is applied.
	///   - trial_end: Unix timestamp representing the end of the trial period the customer will get before being charged for the first time, if the update is applied.
	///   - trial_from_plan: Indicates if a plan's `trial_period_days` should be applied to the subscription. Setting `trial_end` per subscription is preferred, and this defaults to `false`. Setting this flag to `true` together with `trial_end` is not allowed.
	public init(expires_at: Timestamp, billing_cycle_anchor: Timestamp? = nil, subscription_items: [SubscriptionItem]?? = nil, trial_end: Timestamp? = nil, trial_from_plan: Bool? = nil) {
		self.expires_at = expires_at
		self.billing_cycle_anchor = billing_cycle_anchor
		self.subscription_items = subscription_items
		self.trial_end = trial_end
		self.trial_from_plan = trial_from_plan
	}
}

public class TaxDeductedAtSource: Codable {
	/// Unique identifier for the object.
	public var id: String
	/// String representing the object's type. Objects of the same type share the same value.
	public var object: ObjectValues
	/// The end of the invoicing period. This TDS applies to Stripe fees collected during this invoicing period.
	public var period_end: Timestamp
	/// The start of the invoicing period. This TDS applies to Stripe fees collected during this invoicing period.
	public var period_start: Timestamp
	/// The TAN that was supplied to Stripe when TDS was assessed
	public var tax_deduction_account_number: String

	public init(id: String, object: ObjectValues, period_end: Timestamp, period_start: Timestamp, tax_deduction_account_number: String) {
		self.id = id
		self.object = object
		self.period_end = period_end
		self.period_start = period_start
		self.tax_deduction_account_number = tax_deduction_account_number
	}

	public enum ObjectValues: String, Codable {
		case taxDeductedAtSource = "tax_deducted_at_source"
	}
}

/// You can add one or multiple tax IDs to a [customer](https://stripe.com/docs/api/customers). A customer's tax IDs are displayed on invoices and credit notes issued for the customer.  Related guide: [Customer Tax Identification Numbers](https://stripe.com/docs/billing/taxes/tax-ids).
public class TaxId: Codable {
	/// Two-letter ISO code representing the country of the tax ID.
	public var country: String?
	/// Time at which the object was created. Measured in seconds since the Unix epoch.
	public var created: Timestamp
	/// ID of the customer.
	public var customer: String?
	/// Unique identifier for the object.
	public var id: String
	/// Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
	public var livemode: Bool
	/// String representing the object's type. Objects of the same type share the same value.
	public var object: ObjectValues
	/// Type of the tax ID, one of `ae_trn`, `au_abn`, `br_cnpj`, `br_cpf`, `ca_bn`, `ca_qst`, `ch_vat`, `cl_tin`, `es_cif`, `eu_vat`, `hk_br`, `id_npwp`, `in_gst`, `jp_cn`, `jp_rn`, `kr_brn`, `li_uid`, `mx_rfc`, `my_frp`, `my_itn`, `my_sst`, `no_vat`, `nz_gst`, `ru_inn`, `ru_kpp`, `sa_vat`, `sg_gst`, `sg_uen`, `th_vat`, `tw_vat`, `us_ein`, or `za_vat`. Note that some legacy tax IDs have type `unknown`
	public var type: TypeValues
	/// Value of the tax ID.
	public var value: String
	/// Tax ID verification information.
	public var verification: TaxIdVerification?

	/// You can add one or multiple tax IDs to a [customer](https://stripe.com/docs/api/customers). A customer's tax IDs are displayed on invoices and credit notes issued for the customer.  Related guide: [Customer Tax Identification Numbers](https://stripe.com/docs/billing/taxes/tax-ids).
	/// - Parameters:
	///   - country: Two-letter ISO code representing the country of the tax ID.
	///   - created: Time at which the object was created. Measured in seconds since the Unix epoch.
	///   - customer: ID of the customer.
	///   - id: Unique identifier for the object.
	///   - livemode: Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
	///   - object: String representing the object's type. Objects of the same type share the same value.
	///   - type: Type of the tax ID, one of `ae_trn`, `au_abn`, `br_cnpj`, `br_cpf`, `ca_bn`, `ca_qst`, `ch_vat`, `cl_tin`, `es_cif`, `eu_vat`, `hk_br`, `id_npwp`, `in_gst`, `jp_cn`, `jp_rn`, `kr_brn`, `li_uid`, `mx_rfc`, `my_frp`, `my_itn`, `my_sst`, `no_vat`, `nz_gst`, `ru_inn`, `ru_kpp`, `sa_vat`, `sg_gst`, `sg_uen`, `th_vat`, `tw_vat`, `us_ein`, or `za_vat`. Note that some legacy tax IDs have type `unknown`
	///   - value: Value of the tax ID.
	///   - verification: Tax ID verification information.
	public init(created: Timestamp, id: String, livemode: Bool, object: ObjectValues, type: TypeValues, value: String, country: String? = nil, customer: String? = nil, verification: TaxIdVerification? = nil) {
		self.created = created
		self.id = id
		self.livemode = livemode
		self.object = object
		self.type = type
		self.value = value
		self.country = country
		self.customer = customer
		self.verification = verification
	}

	public enum ObjectValues: String, Codable {
		case taxId = "tax_id"
	}

	public enum TypeValues: String, Codable {
		case aeTrn = "ae_trn"
		case auAbn = "au_abn"
		case brCnpj = "br_cnpj"
		case brCpf = "br_cpf"
		case caBn = "ca_bn"
		case caQst = "ca_qst"
		case chVat = "ch_vat"
		case clTin = "cl_tin"
		case esCif = "es_cif"
		case euVat = "eu_vat"
		case hkBr = "hk_br"
		case idNpwp = "id_npwp"
		case inGst = "in_gst"
		case jpCn = "jp_cn"
		case jpRn = "jp_rn"
		case krBrn = "kr_brn"
		case liUid = "li_uid"
		case mxRfc = "mx_rfc"
		case myFrp = "my_frp"
		case myItn = "my_itn"
		case mySst = "my_sst"
		case noVat = "no_vat"
		case nzGst = "nz_gst"
		case ruInn = "ru_inn"
		case ruKpp = "ru_kpp"
		case saVat = "sa_vat"
		case sgGst = "sg_gst"
		case sgUen = "sg_uen"
		case thVat = "th_vat"
		case twVat = "tw_vat"
		case unknown = "unknown"
		case usEin = "us_ein"
		case zaVat = "za_vat"
	}
}

public class TaxIdVerification: Codable {
	/// Verification status, one of `pending`, `verified`, `unverified`, or `unavailable`.
	public var status: StatusValues
	/// Verified address.
	public var verified_address: String?
	/// Verified name.
	public var verified_name: String?

	public init(status: StatusValues, verified_address: String? = nil, verified_name: String? = nil) {
		self.status = status
		self.verified_address = verified_address
		self.verified_name = verified_name
	}

	public enum StatusValues: String, Codable {
		case pending = "pending"
		case unavailable = "unavailable"
		case unverified = "unverified"
		case verified = "verified"
	}
}

/// Tax rates can be applied to [invoices](https://stripe.com/docs/billing/invoices/tax-rates), [subscriptions](https://stripe.com/docs/billing/subscriptions/taxes) and [Checkout Sessions](https://stripe.com/docs/payments/checkout/set-up-a-subscription#tax-rates) to collect tax.  Related guide: [Tax Rates](https://stripe.com/docs/billing/taxes/tax-rates).
public class TaxRate: Codable {
	/// Defaults to `true`. When set to `false`, this tax rate cannot be used with new applications or Checkout Sessions, but will still work for subscriptions and invoices that already have it set.
	public var active: Bool
	/// Two-letter country code ([ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)).
	public var country: String?
	/// Time at which the object was created. Measured in seconds since the Unix epoch.
	public var created: Timestamp
	/// An arbitrary string attached to the tax rate for your internal use only. It will not be visible to your customers.
	public var description: String?
	/// The display name of the tax rates as it will appear to your customer on their receipt email, PDF, and the hosted invoice page.
	public var display_name: String
	/// Unique identifier for the object.
	public var id: String
	/// This specifies if the tax rate is inclusive or exclusive.
	public var inclusive: Bool
	/// The jurisdiction for the tax rate. You can use this label field for tax reporting purposes. It also appears on your customer’s invoice.
	public var jurisdiction: String?
	/// Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
	public var livemode: Bool
	/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
	public var metadata: String?
	/// String representing the object's type. Objects of the same type share the same value.
	public var object: ObjectValues
	/// This represents the tax rate percent out of 100.
	public var percentage: StringNumber
	/// [ISO 3166-2 subdivision code](https://en.wikipedia.org/wiki/ISO_3166-2:US), without country prefix. For example, "NY" for New York, United States.
	public var state: String?

	/// Tax rates can be applied to [invoices](https://stripe.com/docs/billing/invoices/tax-rates), [subscriptions](https://stripe.com/docs/billing/subscriptions/taxes) and [Checkout Sessions](https://stripe.com/docs/payments/checkout/set-up-a-subscription#tax-rates) to collect tax.  Related guide: [Tax Rates](https://stripe.com/docs/billing/taxes/tax-rates).
	/// - Parameters:
	///   - active: Defaults to `true`. When set to `false`, this tax rate cannot be used with new applications or Checkout Sessions, but will still work for subscriptions and invoices that already have it set.
	///   - country: Two-letter country code ([ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)).
	///   - created: Time at which the object was created. Measured in seconds since the Unix epoch.
	///   - description: An arbitrary string attached to the tax rate for your internal use only. It will not be visible to your customers.
	///   - display_name: The display name of the tax rates as it will appear to your customer on their receipt email, PDF, and the hosted invoice page.
	///   - id: Unique identifier for the object.
	///   - inclusive: This specifies if the tax rate is inclusive or exclusive.
	///   - jurisdiction: The jurisdiction for the tax rate. You can use this label field for tax reporting purposes. It also appears on your customer’s invoice.
	///   - livemode: Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
	///   - metadata: Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
	///   - object: String representing the object's type. Objects of the same type share the same value.
	///   - percentage: This represents the tax rate percent out of 100.
	///   - state: [ISO 3166-2 subdivision code](https://en.wikipedia.org/wiki/ISO_3166-2:US), without country prefix. For example, "NY" for New York, United States.
	public init(active: Bool, created: Timestamp, display_name: String, id: String, inclusive: Bool, livemode: Bool, object: ObjectValues, percentage: StringNumber, country: String? = nil, description: String? = nil, jurisdiction: String? = nil, metadata: String? = nil, state: String? = nil) {
		self.active = active
		self.created = created
		self.display_name = display_name
		self.id = id
		self.inclusive = inclusive
		self.livemode = livemode
		self.object = object
		self.percentage = percentage
		self.country = country
		self.description = description
		self.jurisdiction = jurisdiction
		self.metadata = metadata
		self.state = state
	}

	public enum ObjectValues: String, Codable {
		case taxRate = "tax_rate"
	}
}

/// A Connection Token is used by the Stripe Terminal SDK to connect to a reader.  Related guide: [Fleet Management](https://stripe.com/docs/terminal/readers/fleet-management#create).
public class TerminalConnectionToken: Codable {
	/// The id of the location that this connection token is scoped to.
	public var location: String?
	/// String representing the object's type. Objects of the same type share the same value.
	public var object: ObjectValues
	/// Your application should pass this token to the Stripe Terminal SDK.
	public var secret: String

	/// A Connection Token is used by the Stripe Terminal SDK to connect to a reader.  Related guide: [Fleet Management](https://stripe.com/docs/terminal/readers/fleet-management#create).
	/// - Parameters:
	///   - location: The id of the location that this connection token is scoped to.
	///   - object: String representing the object's type. Objects of the same type share the same value.
	///   - secret: Your application should pass this token to the Stripe Terminal SDK.
	public init(object: ObjectValues, secret: String, location: String? = nil) {
		self.object = object
		self.secret = secret
		self.location = location
	}

	public enum ObjectValues: String, Codable {
		case terminalConnectionToken = "terminal.connection_token"
	}
}

/// A Location represents a grouping of readers.  Related guide: [Fleet Management](https://stripe.com/docs/terminal/readers/fleet-management#create).
public class TerminalLocation: Codable {
	public var address: Address
	/// The display name of the location.
	public var display_name: String
	/// Unique identifier for the object.
	public var id: String
	/// Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
	public var livemode: Bool
	/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
	public var metadata: String
	/// String representing the object's type. Objects of the same type share the same value.
	public var object: ObjectValues

	/// A Location represents a grouping of readers.  Related guide: [Fleet Management](https://stripe.com/docs/terminal/readers/fleet-management#create).
	/// - Parameters:
	///   - address: 
	///   - display_name: The display name of the location.
	///   - id: Unique identifier for the object.
	///   - livemode: Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
	///   - metadata: Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
	///   - object: String representing the object's type. Objects of the same type share the same value.
	public init(address: Address, display_name: String, id: String, livemode: Bool, metadata: String, object: ObjectValues) {
		self.address = address
		self.display_name = display_name
		self.id = id
		self.livemode = livemode
		self.metadata = metadata
		self.object = object
	}

	public enum ObjectValues: String, Codable {
		case terminalLocation = "terminal.location"
	}
}

/// A Reader represents a physical device for accepting payment details.  Related guide: [Connecting to a Reader](https://stripe.com/docs/terminal/readers/connecting).
public class TerminalReader: Codable {
	/// The current software version of the reader.
	public var device_sw_version: String?
	/// Type of reader, one of `bbpos_chipper2x` or `verifone_P400`.
	public var device_type: DeviceTypeValues
	/// Unique identifier for the object.
	public var id: String
	/// The local IP address of the reader.
	public var ip_address: String?
	/// Custom label given to the reader for easier identification.
	public var label: String
	/// Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
	public var livemode: Bool
	/// The location identifier of the reader.
	public var location: String?
	/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
	public var metadata: String
	/// String representing the object's type. Objects of the same type share the same value.
	public var object: ObjectValues
	/// Serial number of the reader.
	public var serial_number: String
	/// The networking status of the reader.
	public var status: String?

	/// A Reader represents a physical device for accepting payment details.  Related guide: [Connecting to a Reader](https://stripe.com/docs/terminal/readers/connecting).
	/// - Parameters:
	///   - device_sw_version: The current software version of the reader.
	///   - device_type: Type of reader, one of `bbpos_chipper2x` or `verifone_P400`.
	///   - id: Unique identifier for the object.
	///   - ip_address: The local IP address of the reader.
	///   - label: Custom label given to the reader for easier identification.
	///   - livemode: Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
	///   - location: The location identifier of the reader.
	///   - metadata: Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
	///   - object: String representing the object's type. Objects of the same type share the same value.
	///   - serial_number: Serial number of the reader.
	///   - status: The networking status of the reader.
	public init(device_type: DeviceTypeValues, id: String, label: String, livemode: Bool, metadata: String, object: ObjectValues, serial_number: String, device_sw_version: String? = nil, ip_address: String? = nil, location: String? = nil, status: String? = nil) {
		self.device_type = device_type
		self.id = id
		self.label = label
		self.livemode = livemode
		self.metadata = metadata
		self.object = object
		self.serial_number = serial_number
		self.device_sw_version = device_sw_version
		self.ip_address = ip_address
		self.location = location
		self.status = status
	}

	public enum ObjectValues: String, Codable {
		case terminalReader = "terminal.reader"
	}

	public enum DeviceTypeValues: String, Codable {
		case bbposChipper2X = "bbpos_chipper2x"
		case verifoneP400 = "verifone_P400"
	}
}

/// Cardholder authentication via 3D Secure is initiated by creating a `3D Secure` object. Once the object has been created, you can use it to authenticate the cardholder and create a charge.
public class ThreeDSecure: Codable {
	/// Amount of the charge that you will create when authentication completes.
	public var amount: Int
	/// True if the cardholder went through the authentication flow and their bank indicated that authentication succeeded.
	public var authenticated: Bool
	public var card: Card
	/// Time at which the object was created. Measured in seconds since the Unix epoch.
	public var created: Timestamp
	/// Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
	public var currency: String
	/// Unique identifier for the object.
	public var id: String
	/// Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
	public var livemode: Bool
	/// String representing the object's type. Objects of the same type share the same value.
	public var object: ObjectValues
	/// If present, this is the URL that you should send the cardholder to for authentication. If you are going to use Stripe.js to display the authentication page in an iframe, you should use the value "_callback".
	public var redirect_url: String?
	/// Possible values are `redirect_pending`, `succeeded`, or `failed`. When the cardholder can be authenticated, the object starts with status `redirect_pending`. When liability will be shifted to the cardholder's bank (either because the cardholder was successfully authenticated, or because the bank has not implemented 3D Secure, the object wlil be in status `succeeded`. `failed` indicates that authentication was attempted unsuccessfully.
	public var status: String

	/// Cardholder authentication via 3D Secure is initiated by creating a `3D Secure` object. Once the object has been created, you can use it to authenticate the cardholder and create a charge.
	/// - Parameters:
	///   - amount: Amount of the charge that you will create when authentication completes.
	///   - authenticated: True if the cardholder went through the authentication flow and their bank indicated that authentication succeeded.
	///   - card: 
	///   - created: Time at which the object was created. Measured in seconds since the Unix epoch.
	///   - currency: Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
	///   - id: Unique identifier for the object.
	///   - livemode: Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
	///   - object: String representing the object's type. Objects of the same type share the same value.
	///   - redirect_url: If present, this is the URL that you should send the cardholder to for authentication. If you are going to use Stripe.js to display the authentication page in an iframe, you should use the value "_callback".
	///   - status: Possible values are `redirect_pending`, `succeeded`, or `failed`. When the cardholder can be authenticated, the object starts with status `redirect_pending`. When liability will be shifted to the cardholder's bank (either because the cardholder was successfully authenticated, or because the bank has not implemented 3D Secure, the object wlil be in status `succeeded`. `failed` indicates that authentication was attempted unsuccessfully.
	public init(amount: Int, authenticated: Bool, card: Card, created: Timestamp, currency: String, id: String, livemode: Bool, object: ObjectValues, status: String, redirect_url: String? = nil) {
		self.amount = amount
		self.authenticated = authenticated
		self.card = card
		self.created = created
		self.currency = currency
		self.id = id
		self.livemode = livemode
		self.object = object
		self.status = status
		self.redirect_url = redirect_url
	}

	public enum ObjectValues: String, Codable {
		case threeDSecure = "three_d_secure"
	}
}

public class ThreeDSecureDetails: Codable {
	/// For authenticated transactions: how the customer was authenticated by the issuing bank.
	public var authentication_flow: AuthenticationFlowValues?
	/// Indicates the outcome of 3D Secure authentication.
	public var result: ResultValues
	/// Additional information about why 3D Secure succeeded or failed based on the `result`.
	public var result_reason: ResultReasonValues?
	/// The version of 3D Secure that was used.
	public var version: VersionValues

	public init(result: ResultValues, version: VersionValues, authentication_flow: AuthenticationFlowValues? = nil, result_reason: ResultReasonValues? = nil) {
		self.result = result
		self.version = version
		self.authentication_flow = authentication_flow
		self.result_reason = result_reason
	}

	public enum AuthenticationFlowValues: String, Codable {
		case challenge = "challenge"
		case frictionless = "frictionless"
	}

	public enum ResultValues: String, Codable {
		case attemptAcknowledged = "attempt_acknowledged"
		case authenticated = "authenticated"
		case failed = "failed"
		case notSupported = "not_supported"
		case processingError = "processing_error"
	}

	public enum VersionValues: String, Codable {
		case option102 = "1.0.2"
		case option210 = "2.1.0"
		case option220 = "2.2.0"
	}

	public enum ResultReasonValues: String, Codable {
		case abandoned = "abandoned"
		case bypassed = "bypassed"
		case canceled = "canceled"
		case cardNotEnrolled = "card_not_enrolled"
		case networkNotSupported = "network_not_supported"
		case protocolError = "protocol_error"
		case rejected = "rejected"
	}
}

public class ThreeDSecureUsage: Codable {
	/// Whether 3D Secure is supported on this card.
	public var supported: Bool

	public init(supported: Bool) {
		self.supported = supported
	}
}

/// Tokenization is the process Stripe uses to collect sensitive card or bank account details, or personally identifiable information (PII), directly from your customers in a secure manner. A token representing this information is returned to your server to use. You should use our [recommended payments integrations](https://stripe.com/docs/payments) to perform this process client-side. This ensures that no sensitive card data touches your server, and allows your integration to operate in a PCI-compliant way.  If you cannot use client-side tokenization, you can also create tokens using the API with either your publishable or secret API key. Keep in mind that if your integration uses this method, you are responsible for any PCI compliance that may be required, and you must keep your secret API key safe. Unlike with client-side tokenization, your customer's information is not sent directly to Stripe, so we cannot determine how it is handled or stored.  Tokens cannot be stored or used more than once. To store card or bank account information for later use, you can create [Customer](https://stripe.com/docs/api#customers) objects or [Custom accounts](https://stripe.com/docs/api#external_accounts). Note that [Radar](https://stripe.com/docs/radar), our integrated solution for automatic fraud protection, supports only integrations that use client-side tokenization.  Related guide: [Accept a payment](https://stripe.com/docs/payments/accept-a-payment-charges#web-create-token)
public class Token: Codable {
	public var bank_account: BankAccount?
	public var card: Card?
	/// IP address of the client that generated the token.
	public var client_ip: String?
	/// Time at which the object was created. Measured in seconds since the Unix epoch.
	public var created: Timestamp
	/// Unique identifier for the object.
	public var id: String
	/// Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
	public var livemode: Bool
	/// String representing the object's type. Objects of the same type share the same value.
	public var object: ObjectValues
	/// Type of the token: `account`, `bank_account`, `card`, or `pii`.
	public var type: String
	/// Whether this token has already been used (tokens can be used only once).
	public var used: Bool

	/// Tokenization is the process Stripe uses to collect sensitive card or bank account details, or personally identifiable information (PII), directly from your customers in a secure manner. A token representing this information is returned to your server to use. You should use our [recommended payments integrations](https://stripe.com/docs/payments) to perform this process client-side. This ensures that no sensitive card data touches your server, and allows your integration to operate in a PCI-compliant way.  If you cannot use client-side tokenization, you can also create tokens using the API with either your publishable or secret API key. Keep in mind that if your integration uses this method, you are responsible for any PCI compliance that may be required, and you must keep your secret API key safe. Unlike with client-side tokenization, your customer's information is not sent directly to Stripe, so we cannot determine how it is handled or stored.  Tokens cannot be stored or used more than once. To store card or bank account information for later use, you can create [Customer](https://stripe.com/docs/api#customers) objects or [Custom accounts](https://stripe.com/docs/api#external_accounts). Note that [Radar](https://stripe.com/docs/radar), our integrated solution for automatic fraud protection, supports only integrations that use client-side tokenization.  Related guide: [Accept a payment](https://stripe.com/docs/payments/accept-a-payment-charges#web-create-token)
	/// - Parameters:
	///   - client_ip: IP address of the client that generated the token.
	///   - created: Time at which the object was created. Measured in seconds since the Unix epoch.
	///   - id: Unique identifier for the object.
	///   - livemode: Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
	///   - object: String representing the object's type. Objects of the same type share the same value.
	///   - type: Type of the token: `account`, `bank_account`, `card`, or `pii`.
	///   - used: Whether this token has already been used (tokens can be used only once).
	public init(created: Timestamp, id: String, livemode: Bool, object: ObjectValues, type: String, used: Bool, bank_account: BankAccount? = nil, card: Card? = nil, client_ip: String? = nil) {
		self.created = created
		self.id = id
		self.livemode = livemode
		self.object = object
		self.type = type
		self.used = used
		self.bank_account = bank_account
		self.card = card
		self.client_ip = client_ip
	}

	public enum ObjectValues: String, Codable {
		case token = "token"
	}
}

/// To top up your Stripe balance, you create a top-up object. You can retrieve individual top-ups, as well as list all top-ups. Top-ups are identified by a unique, random ID.  Related guide: [Topping Up your Platform Account](https://stripe.com/docs/connect/top-ups).
public class Topup: Codable {
	/// Amount transferred.
	public var amount: Int
	/// ID of the balance transaction that describes the impact of this top-up on your account balance. May not be specified depending on status of top-up.
	public var balance_transaction: String?
	/// Time at which the object was created. Measured in seconds since the Unix epoch.
	public var created: Timestamp
	/// Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
	public var currency: String
	/// An arbitrary string attached to the object. Often useful for displaying to users.
	public var description: String?
	/// Date the funds are expected to arrive in your Stripe account for payouts. This factors in delays like weekends or bank holidays. May not be specified depending on status of top-up.
	public var expected_availability_date: Int?
	/// Error code explaining reason for top-up failure if available (see [the errors section](https://stripe.com/docs/api#errors) for a list of codes).
	public var failure_code: String?
	/// Message to user further explaining reason for top-up failure if available.
	public var failure_message: String?
	/// Unique identifier for the object.
	public var id: String
	/// Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
	public var livemode: Bool
	/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
	public var metadata: String
	/// String representing the object's type. Objects of the same type share the same value.
	public var object: ObjectValues
	public var source: Source
	/// Extra information about a top-up. This will appear on your source's bank statement. It must contain at least one letter.
	public var statement_descriptor: String?
	/// The status of the top-up is either `canceled`, `failed`, `pending`, `reversed`, or `succeeded`.
	public var status: StatusValues
	/// A string that identifies this top-up as part of a group.
	public var transfer_group: String?

	/// To top up your Stripe balance, you create a top-up object. You can retrieve individual top-ups, as well as list all top-ups. Top-ups are identified by a unique, random ID.  Related guide: [Topping Up your Platform Account](https://stripe.com/docs/connect/top-ups).
	/// - Parameters:
	///   - amount: Amount transferred.
	///   - balance_transaction: ID of the balance transaction that describes the impact of this top-up on your account balance. May not be specified depending on status of top-up.
	///   - created: Time at which the object was created. Measured in seconds since the Unix epoch.
	///   - currency: Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
	///   - description: An arbitrary string attached to the object. Often useful for displaying to users.
	///   - expected_availability_date: Date the funds are expected to arrive in your Stripe account for payouts. This factors in delays like weekends or bank holidays. May not be specified depending on status of top-up.
	///   - failure_code: Error code explaining reason for top-up failure if available (see [the errors section](https://stripe.com/docs/api#errors) for a list of codes).
	///   - failure_message: Message to user further explaining reason for top-up failure if available.
	///   - id: Unique identifier for the object.
	///   - livemode: Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
	///   - metadata: Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
	///   - object: String representing the object's type. Objects of the same type share the same value.
	///   - source: 
	///   - statement_descriptor: Extra information about a top-up. This will appear on your source's bank statement. It must contain at least one letter.
	///   - status: The status of the top-up is either `canceled`, `failed`, `pending`, `reversed`, or `succeeded`.
	///   - transfer_group: A string that identifies this top-up as part of a group.
	public init(amount: Int, created: Timestamp, currency: String, id: String, livemode: Bool, metadata: String, object: ObjectValues, source: Source, status: StatusValues, balance_transaction: String? = nil, description: String? = nil, expected_availability_date: Int? = nil, failure_code: String? = nil, failure_message: String? = nil, statement_descriptor: String? = nil, transfer_group: String? = nil) {
		self.amount = amount
		self.created = created
		self.currency = currency
		self.id = id
		self.livemode = livemode
		self.metadata = metadata
		self.object = object
		self.source = source
		self.status = status
		self.balance_transaction = balance_transaction
		self.description = description
		self.expected_availability_date = expected_availability_date
		self.failure_code = failure_code
		self.failure_message = failure_message
		self.statement_descriptor = statement_descriptor
		self.transfer_group = transfer_group
	}

	public enum StatusValues: String, Codable {
		case canceled = "canceled"
		case failed = "failed"
		case pending = "pending"
		case reversed = "reversed"
		case succeeded = "succeeded"
	}

	public enum ObjectValues: String, Codable {
		case topup = "topup"
	}
}

/// A `Transfer` object is created when you move funds between Stripe accounts as part of Connect.  Before April 6, 2017, transfers also represented movement of funds from a Stripe account to a card or bank account. This behavior has since been split out into a [Payout](https://stripe.com/docs/api#payout_object) object, with corresponding payout endpoints. For more information, read about the [transfer/payout split](https://stripe.com/docs/transfer-payout-split).  Related guide: [Creating Separate Charges and Transfers](https://stripe.com/docs/connect/charges-transfers).
public class Transfer: Codable {
	/// Amount in %s to be transferred.
	public var amount: Int
	/// Amount in %s reversed (can be less than the amount attribute on the transfer if a partial reversal was issued).
	public var amount_reversed: Int
	/// Balance transaction that describes the impact of this transfer on your account balance.
	public var balance_transaction: String?
	/// Time that this record of the transfer was first created.
	public var created: Timestamp
	/// Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
	public var currency: String
	/// An arbitrary string attached to the object. Often useful for displaying to users.
	public var description: String?
	/// ID of the Stripe account the transfer was sent to.
	public var destination: String?
	/// If the destination is a Stripe account, this will be the ID of the payment that the destination account received for the transfer.
	public var destination_payment: String?
	/// Unique identifier for the object.
	public var id: String
	/// Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
	public var livemode: Bool
	/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
	public var metadata: String
	/// String representing the object's type. Objects of the same type share the same value.
	public var object: ObjectValues
	/// A list of reversals that have been applied to the transfer.
	public var reversals: TransferReversalList
	/// Whether the transfer has been fully reversed. If the transfer is only partially reversed, this attribute will still be false.
	public var reversed: Bool
	/// ID of the charge or payment that was used to fund the transfer. If null, the transfer was funded from the available balance.
	public var source_transaction: String?
	/// The source balance this transfer came from. One of `card`, `fpx`, or `bank_account`.
	public var source_type: String?
	/// A string that identifies this transaction as part of a group. See the [Connect documentation](https://stripe.com/docs/connect/charges-transfers#transfer-options) for details.
	public var transfer_group: String?

	/// A `Transfer` object is created when you move funds between Stripe accounts as part of Connect.  Before April 6, 2017, transfers also represented movement of funds from a Stripe account to a card or bank account. This behavior has since been split out into a [Payout](https://stripe.com/docs/api#payout_object) object, with corresponding payout endpoints. For more information, read about the [transfer/payout split](https://stripe.com/docs/transfer-payout-split).  Related guide: [Creating Separate Charges and Transfers](https://stripe.com/docs/connect/charges-transfers).
	/// - Parameters:
	///   - amount: Amount in %s to be transferred.
	///   - amount_reversed: Amount in %s reversed (can be less than the amount attribute on the transfer if a partial reversal was issued).
	///   - balance_transaction: Balance transaction that describes the impact of this transfer on your account balance.
	///   - created: Time that this record of the transfer was first created.
	///   - currency: Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
	///   - description: An arbitrary string attached to the object. Often useful for displaying to users.
	///   - destination: ID of the Stripe account the transfer was sent to.
	///   - destination_payment: If the destination is a Stripe account, this will be the ID of the payment that the destination account received for the transfer.
	///   - id: Unique identifier for the object.
	///   - livemode: Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
	///   - metadata: Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
	///   - object: String representing the object's type. Objects of the same type share the same value.
	///   - reversals: A list of reversals that have been applied to the transfer.
	///   - reversed: Whether the transfer has been fully reversed. If the transfer is only partially reversed, this attribute will still be false.
	///   - source_transaction: ID of the charge or payment that was used to fund the transfer. If null, the transfer was funded from the available balance.
	///   - source_type: The source balance this transfer came from. One of `card`, `fpx`, or `bank_account`.
	///   - transfer_group: A string that identifies this transaction as part of a group. See the [Connect documentation](https://stripe.com/docs/connect/charges-transfers#transfer-options) for details.
	public init(amount: Int, amount_reversed: Int, created: Timestamp, currency: String, id: String, livemode: Bool, metadata: String, object: ObjectValues, reversals: TransferReversalList, reversed: Bool, balance_transaction: String? = nil, description: String? = nil, destination: String? = nil, destination_payment: String? = nil, source_transaction: String? = nil, source_type: String? = nil, transfer_group: String? = nil) {
		self.amount = amount
		self.amount_reversed = amount_reversed
		self.created = created
		self.currency = currency
		self.id = id
		self.livemode = livemode
		self.metadata = metadata
		self.object = object
		self.reversals = reversals
		self.reversed = reversed
		self.balance_transaction = balance_transaction
		self.description = description
		self.destination = destination
		self.destination_payment = destination_payment
		self.source_transaction = source_transaction
		self.source_type = source_type
		self.transfer_group = transfer_group
	}


	/// A list of reversals that have been applied to the transfer.
	public class TransferReversalList: Codable {
		/// Details about each object.
		public var data: [TransferReversal]
		/// True if this list has another page of items after this one that can be fetched.
		public var has_more: Bool
		/// String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
		public var object: ObjectValues
		/// The URL where this list can be accessed.
		public var url: String

		/// A list of reversals that have been applied to the transfer.
		/// - Parameters:
		///   - data: Details about each object.
		///   - has_more: True if this list has another page of items after this one that can be fetched.
		///   - object: String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
		///   - url: The URL where this list can be accessed.
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


	public enum ObjectValues: String, Codable {
		case transfer = "transfer"
	}
}

public class TransferData: Codable {
	/// Amount intended to be collected by this PaymentIntent. A positive integer representing how much to charge in the [smallest currency unit](https://stripe.com/docs/currencies#zero-decimal) (e.g., 100 cents to charge $1.00 or 100 to charge ¥100, a zero-decimal currency). The minimum amount is $0.50 US or [equivalent in charge currency](https://stripe.com/docs/currencies#minimum-and-maximum-charge-amounts). The amount value supports up to eight digits (e.g., a value of 99999999 for a USD charge of $999,999.99).
	public var amount: Int?
	/// The account (if any) the payment will be attributed to for tax reporting, and where funds from the payment will be transferred to upon payment success.
	public var destination: String

	public init(destination: String, amount: Int? = nil) {
		self.destination = destination
		self.amount = amount
	}
}

/// [Stripe Connect](https://stripe.com/docs/connect) platforms can reverse transfers made to a connected account, either entirely or partially, and can also specify whether to refund any related application fees. Transfer reversals add to the platform's balance and subtract from the destination account's balance.  Reversing a transfer that was made for a [destination charge](/docs/connect/destination-charges) is allowed only up to the amount of the charge. It is possible to reverse a [transfer_group](https://stripe.com/docs/connect/charges-transfers#transfer-options) transfer only if the destination account has enough balance to cover the reversal.  Related guide: [Reversing Transfers](https://stripe.com/docs/connect/charges-transfers#reversing-transfers).
public class TransferReversal: Codable {
	/// Amount, in %s.
	public var amount: Int
	/// Balance transaction that describes the impact on your account balance.
	public var balance_transaction: String?
	/// Time at which the object was created. Measured in seconds since the Unix epoch.
	public var created: Timestamp
	/// Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
	public var currency: String
	/// Linked payment refund for the transfer reversal.
	public var destination_payment_refund: String?
	/// Unique identifier for the object.
	public var id: String
	/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
	public var metadata: String?
	/// String representing the object's type. Objects of the same type share the same value.
	public var object: ObjectValues
	/// ID of the refund responsible for the transfer reversal.
	public var source_refund: String?
	/// ID of the transfer that was reversed.
	public var transfer: String

	/// [Stripe Connect](https://stripe.com/docs/connect) platforms can reverse transfers made to a connected account, either entirely or partially, and can also specify whether to refund any related application fees. Transfer reversals add to the platform's balance and subtract from the destination account's balance.  Reversing a transfer that was made for a [destination charge](/docs/connect/destination-charges) is allowed only up to the amount of the charge. It is possible to reverse a [transfer_group](https://stripe.com/docs/connect/charges-transfers#transfer-options) transfer only if the destination account has enough balance to cover the reversal.  Related guide: [Reversing Transfers](https://stripe.com/docs/connect/charges-transfers#reversing-transfers).
	/// - Parameters:
	///   - amount: Amount, in %s.
	///   - balance_transaction: Balance transaction that describes the impact on your account balance.
	///   - created: Time at which the object was created. Measured in seconds since the Unix epoch.
	///   - currency: Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
	///   - destination_payment_refund: Linked payment refund for the transfer reversal.
	///   - id: Unique identifier for the object.
	///   - metadata: Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
	///   - object: String representing the object's type. Objects of the same type share the same value.
	///   - source_refund: ID of the refund responsible for the transfer reversal.
	///   - transfer: ID of the transfer that was reversed.
	public init(amount: Int, created: Timestamp, currency: String, id: String, object: ObjectValues, transfer: String, balance_transaction: String? = nil, destination_payment_refund: String? = nil, metadata: String? = nil, source_refund: String? = nil) {
		self.amount = amount
		self.created = created
		self.currency = currency
		self.id = id
		self.object = object
		self.transfer = transfer
		self.balance_transaction = balance_transaction
		self.destination_payment_refund = destination_payment_refund
		self.metadata = metadata
		self.source_refund = source_refund
	}

	public enum ObjectValues: String, Codable {
		case transferReversal = "transfer_reversal"
	}
}

public class TransferSchedule: Codable {
	/// The number of days charges for the account will be held before being paid out.
	public var delay_days: Int
	/// How frequently funds will be paid out. One of `manual` (payouts only created via API call), `daily`, `weekly`, or `monthly`.
	public var interval: String
	/// The day of the month funds will be paid out. Only shown if `interval` is monthly. Payouts scheduled between the 29th and 31st of the month are sent on the last day of shorter months.
	public var monthly_anchor: Int?
	/// The day of the week funds will be paid out, of the style 'monday', 'tuesday', etc. Only shown if `interval` is weekly.
	public var weekly_anchor: String?

	public init(delay_days: Int, interval: String, monthly_anchor: Int? = nil, weekly_anchor: String? = nil) {
		self.delay_days = delay_days
		self.interval = interval
		self.monthly_anchor = monthly_anchor
		self.weekly_anchor = weekly_anchor
	}
}

public class TransformQuantity: Codable {
	/// Divide usage by this number.
	public var divide_by: Int
	/// After division, either round the result `up` or `down`.
	public var round: RoundValues

	public init(divide_by: Int, round: RoundValues) {
		self.divide_by = divide_by
		self.round = round
	}

	public enum RoundValues: String, Codable {
		case down = "down"
		case up = "up"
	}
}

public class TransformUsage: Codable {
	/// Divide usage by this number.
	public var divide_by: Int
	/// After division, either round the result `up` or `down`.
	public var round: RoundValues

	public init(divide_by: Int, round: RoundValues) {
		self.divide_by = divide_by
		self.round = round
	}

	public enum RoundValues: String, Codable {
		case down = "down"
		case up = "up"
	}
}

/// Usage records allow you to report customer usage and metrics to Stripe for metered billing of subscription prices.  Related guide: [Metered Billing](https://stripe.com/docs/billing/subscriptions/metered-billing).
public class UsageRecord: Codable {
	/// Unique identifier for the object.
	public var id: String
	/// Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
	public var livemode: Bool
	/// String representing the object's type. Objects of the same type share the same value.
	public var object: ObjectValues
	/// The usage quantity for the specified date.
	public var quantity: Int
	/// The ID of the subscription item this usage record contains data for.
	public var subscription_item: String
	/// The timestamp when this usage occurred.
	public var timestamp: Timestamp

	/// Usage records allow you to report customer usage and metrics to Stripe for metered billing of subscription prices.  Related guide: [Metered Billing](https://stripe.com/docs/billing/subscriptions/metered-billing).
	/// - Parameters:
	///   - id: Unique identifier for the object.
	///   - livemode: Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
	///   - object: String representing the object's type. Objects of the same type share the same value.
	///   - quantity: The usage quantity for the specified date.
	///   - subscription_item: The ID of the subscription item this usage record contains data for.
	///   - timestamp: The timestamp when this usage occurred.
	public init(id: String, livemode: Bool, object: ObjectValues, quantity: Int, subscription_item: String, timestamp: Timestamp) {
		self.id = id
		self.livemode = livemode
		self.object = object
		self.quantity = quantity
		self.subscription_item = subscription_item
		self.timestamp = timestamp
	}

	public enum ObjectValues: String, Codable {
		case usageRecord = "usage_record"
	}
}

public class UsageRecordSummary: Codable {
	/// Unique identifier for the object.
	public var id: String
	/// The invoice in which this usage period has been billed for.
	public var invoice: String?
	/// Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
	public var livemode: Bool
	/// String representing the object's type. Objects of the same type share the same value.
	public var object: ObjectValues
	public var period: Period
	/// The ID of the subscription item this summary is describing.
	public var subscription_item: String
	/// The total usage within this usage period.
	public var total_usage: Int

	public init(id: String, livemode: Bool, object: ObjectValues, period: Period, subscription_item: String, total_usage: Int, invoice: String? = nil) {
		self.id = id
		self.livemode = livemode
		self.object = object
		self.period = period
		self.subscription_item = subscription_item
		self.total_usage = total_usage
		self.invoice = invoice
	}

	public enum ObjectValues: String, Codable {
		case usageRecordSummary = "usage_record_summary"
	}
}

/// You can configure [webhook endpoints](https://stripe.com/docs/webhooks/) via the API to be notified about events that happen in your Stripe account or connected accounts.  Most users configure webhooks from [the dashboard](https://dashboard.stripe.com/webhooks), which provides a user interface for registering and testing your webhook endpoints.  Related guide: [Setting up Webhooks](https://stripe.com/docs/webhooks/configure).
public class WebhookEndpoint: Codable {
	/// The API version events are rendered as for this webhook endpoint.
	public var api_version: String?
	/// The ID of the associated Connect application.
	public var application: String?
	/// Time at which the object was created. Measured in seconds since the Unix epoch.
	public var created: Timestamp
	/// An optional description of what the webhook is used for.
	public var description: String?
	/// The list of events to enable for this endpoint. `['*']` indicates that all events are enabled, except those that require explicit selection.
	public var enabled_events: [String]
	/// Unique identifier for the object.
	public var id: String
	/// Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
	public var livemode: Bool
	/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
	public var metadata: String
	/// String representing the object's type. Objects of the same type share the same value.
	public var object: ObjectValues
	/// The endpoint's secret, used to generate [webhook signatures](https://stripe.com/docs/webhooks/signatures). Only returned at creation.
	public var secret: String?
	/// The status of the webhook. It can be `enabled` or `disabled`.
	public var status: String
	/// The URL of the webhook endpoint.
	public var url: String

	/// You can configure [webhook endpoints](https://stripe.com/docs/webhooks/) via the API to be notified about events that happen in your Stripe account or connected accounts.  Most users configure webhooks from [the dashboard](https://dashboard.stripe.com/webhooks), which provides a user interface for registering and testing your webhook endpoints.  Related guide: [Setting up Webhooks](https://stripe.com/docs/webhooks/configure).
	/// - Parameters:
	///   - api_version: The API version events are rendered as for this webhook endpoint.
	///   - application: The ID of the associated Connect application.
	///   - created: Time at which the object was created. Measured in seconds since the Unix epoch.
	///   - description: An optional description of what the webhook is used for.
	///   - enabled_events: The list of events to enable for this endpoint. `['*']` indicates that all events are enabled, except those that require explicit selection.
	///   - id: Unique identifier for the object.
	///   - livemode: Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
	///   - metadata: Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
	///   - object: String representing the object's type. Objects of the same type share the same value.
	///   - secret: The endpoint's secret, used to generate [webhook signatures](https://stripe.com/docs/webhooks/signatures). Only returned at creation.
	///   - status: The status of the webhook. It can be `enabled` or `disabled`.
	///   - url: The URL of the webhook endpoint.
	public init(created: Timestamp, enabled_events: [String], id: String, livemode: Bool, metadata: String, object: ObjectValues, status: String, url: String, api_version: String? = nil, application: String? = nil, description: String? = nil, secret: String? = nil) {
		self.created = created
		self.enabled_events = enabled_events
		self.id = id
		self.livemode = livemode
		self.metadata = metadata
		self.object = object
		self.status = status
		self.url = url
		self.api_version = api_version
		self.application = application
		self.description = description
		self.secret = secret
	}

	public enum ObjectValues: String, Codable {
		case webhookEndpoint = "webhook_endpoint"
	}
}

