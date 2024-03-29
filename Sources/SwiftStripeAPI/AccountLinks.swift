
/// Creates an AccountLink object that includes a single-use Stripe URL that the platform can redirect their user to in order to take them through the Connect Onboarding flow.
public struct PostAccountLinks: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = AccountLink
	public typealias paramType = AnyCodable
	public static func endpoint(for inputs: AnyCodable) throws -> String {
		return "/v1/account_links"
	}

	public final class FormInput: Codable {
		/// The identifier of the account to create an account link for.
		public var account: String
		/// Which information the platform needs to collect from the user. One of `currently_due` or `eventually_due`. Default is `currently_due`.
		public var collect: CollectValues?
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?
		/// The URL the user will be redirected to if the account link is expired, has been previously-visited, or is otherwise invalid. The URL you specify should attempt to generate a new account link with the same parameters used to create the original account link, then redirect the user to the new account link's URL so they can continue with Connect Onboarding. If a new account link cannot be generated or the redirect fails you should display a useful error to the user.
		public var refresh_url: String?
		/// The URL that the user will be redirected to upon leaving or completing the linked flow.
		public var return_url: String?
		/// The type of account link the user is requesting. Possible values are `account_onboarding` or `account_update`.
		public var type: TypeValues

		public init(account: String, type: TypeValues, collect: CollectValues? = nil, expand: [String]? = nil, refresh_url: String? = nil, return_url: String? = nil) {
			self.account = account
			self.type = type
			self.collect = collect
			self.expand = expand
			self.refresh_url = refresh_url
			self.return_url = return_url
		}

		public enum CollectValues: String, Codable {
			case currentlyDue = "currently_due"
			case eventuallyDue = "eventually_due"
		}

		public enum TypeValues: String, Codable {
			case accountOnboarding = "account_onboarding"
			case accountUpdate = "account_update"
		}
	}

}
