
/// Retrieves the list of your subscription schedules.
public struct GetSubscriptionSchedules: StripeAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = Output
	public typealias paramType = Params
	
	public struct Params {
		let customer: String?
		let ending_before: String?
		let limit: Int?
		let scheduled: Bool?
		let starting_after: String?

		/// Initialize the request parameters
		/// - Parameter customer: Only return subscription schedules for the given customer.
		/// - Parameter ending_before: A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list.
		/// - Parameter limit: A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10.
		/// - Parameter scheduled: Only return subscription schedules that have not started yet.
		/// - Parameter starting_after: A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list.
		public init(customer: String? = nil, ending_before: String? = nil, limit: Int? = nil, scheduled: Bool? = nil, starting_after: String? = nil) {
			self.customer = customer
			self.ending_before = ending_before
			self.limit = limit
			self.scheduled = scheduled
			self.starting_after = starting_after
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		var params = [String]()
		if let a = inputs.customer?.urlEncoded { params.append("customer=\(a)") }
		if let a = inputs.ending_before?.urlEncoded { params.append("ending_before=\(a)") }
		if let a = inputs.limit?.urlEncoded { params.append("limit=\(a)") }
		if let a = inputs.scheduled?.urlEncoded { params.append("scheduled=\(a)") }
		if let a = inputs.starting_after?.urlEncoded { params.append("starting_after=\(a)") }
		let query = params.joined(separator: "&")
		return "/v1/subscription_schedules?\(query)"
	}
	public static var method: HTTPMethod { return .GET }

	public final class Output: Codable {
		public var data: [SubscriptionSchedule]
		/// True if this list has another page of items after this one that can be fetched.
		public var has_more: Bool
		/// String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
		public var object: ObjectValues
		/// The URL where this list can be accessed.
		public var url: String

		public init(data: [SubscriptionSchedule], has_more: Bool, object: ObjectValues, url: String) {
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

/// Creates a new subscription schedule object. Each customer can have up to 500 active or scheduled subscriptions.
public struct PostSubscriptionSchedules: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = SubscriptionSchedule
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v1/subscription_schedules"
	}

	public final class FormInput: Codable {
		/// The identifier of the customer to create the subscription schedule for.
		public var customer: String?
		/// Object representing the subscription schedule's default settings.
		public var default_settings: DefaultSettingsParams?
		/// Configures how the subscription schedule behaves when it ends. Possible values are `release` or `cancel` with the default being `release`. `release` will end the subscription schedule and keep the underlying subscription running.`cancel` will end the subscription schedule and cancel the underlying subscription.
		public var end_behavior: EndBehaviorValues?
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?
		/// Migrate an existing subscription to be managed by a subscription schedule. If this parameter is set, a subscription schedule will be created using the subscription's item(s), set to auto-renew using the subscription's interval. When using this parameter, other parameters (such as phase values) cannot be set. To create a subscription schedule with other modifications, we recommend making two separate API calls.
		public var from_subscription: String?
		/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
		public var metadata: AnyCodable?
		/// List representing phases of the subscription schedule. Each phase can be customized to have different durations, plans, and coupons. If there are multiple phases, the `end_date` of one phase will always equal the `start_date` of the next phase.
		public var phases: AnyCodable?
		/// When the subscription schedule starts. We recommend using `now` so that it starts the subscription immediately. You can also use a Unix timestamp to backdate the subscription so that it starts on a past date, or set a future date for the subscription to start on.
		public var start_date: Int?

		public init(customer: String? = nil, default_settings: DefaultSettingsParams? = nil, end_behavior: EndBehaviorValues? = nil, expand: [String]? = nil, from_subscription: String? = nil, metadata: AnyCodable? = nil, phases: AnyCodable? = nil, start_date: Int? = nil) {
			self.customer = customer
			self.default_settings = default_settings
			self.end_behavior = end_behavior
			self.expand = expand
			self.from_subscription = from_subscription
			self.metadata = metadata
			self.phases = phases
			self.start_date = start_date
		}


		/// Object representing the subscription schedule's default settings.
		public final class DefaultSettingsParams: Codable {
			public var application_fee_percent: StringNumber?
			public var billing_cycle_anchor: BillingCycleAnchorValues?
			public var billing_thresholds: AnyCodable?
			public var collection_method: CollectionMethodValues?
			public var default_payment_method: String?
			public var invoice_settings: SubscriptionSchedulesParam?
			public var transfer_data: AnyCodable?

			/// Object representing the subscription schedule's default settings.
			/// - Parameters:
			public init(application_fee_percent: StringNumber? = nil, billing_cycle_anchor: BillingCycleAnchorValues? = nil, billing_thresholds: AnyCodable? = nil, collection_method: CollectionMethodValues? = nil, default_payment_method: String? = nil, invoice_settings: SubscriptionSchedulesParam? = nil, transfer_data: AnyCodable? = nil) {
				self.application_fee_percent = application_fee_percent
				self.billing_cycle_anchor = billing_cycle_anchor
				self.billing_thresholds = billing_thresholds
				self.collection_method = collection_method
				self.default_payment_method = default_payment_method
				self.invoice_settings = invoice_settings
				self.transfer_data = transfer_data
			}


			public final class SubscriptionSchedulesParam: Codable {
				public var days_until_due: Int?

				public init(days_until_due: Int? = nil) {
					self.days_until_due = days_until_due
				}
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


		public enum EndBehaviorValues: String, Codable {
			case cancel = "cancel"
			case none = "none"
			case release = "release"
			case renew = "renew"
		}
	}

}

/// Retrieves the details of an existing subscription schedule. You only need to supply the unique subscription schedule identifier that was returned upon subscription schedule creation.
public struct GetSubscriptionSchedulesSchedule: StripeAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = SubscriptionSchedule
	public typealias paramType = Params
	
	public struct Params {
		let schedule: String

		/// Initialize the request parameters
		/// - Parameter schedule: 
		public init(schedule: String) {
			self.schedule = schedule
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/subscription_schedules/\(inputs.schedule)"
	}
	public static var method: HTTPMethod { return .GET }

}

/// Updates an existing subscription schedule.
public struct PostSubscriptionSchedulesSchedule: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = SubscriptionSchedule
	public typealias paramType = Params
	
	public struct Params {
		let schedule: String

		/// Initialize the request parameters
		/// - Parameter schedule: 
		public init(schedule: String) {
			self.schedule = schedule
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/subscription_schedules/\(inputs.schedule)"
	}

	public final class FormInput: Codable {
		/// Object representing the subscription schedule's default settings.
		public var default_settings: DefaultSettingsParams?
		/// Configures how the subscription schedule behaves when it ends. Possible values are `release` or `cancel` with the default being `release`. `release` will end the subscription schedule and keep the underlying subscription running.`cancel` will end the subscription schedule and cancel the underlying subscription.
		public var end_behavior: EndBehaviorValues?
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?
		/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
		public var metadata: AnyCodable?
		/// List representing phases of the subscription schedule. Each phase can be customized to have different durations, plans, and coupons. If there are multiple phases, the `end_date` of one phase will always equal the `start_date` of the next phase. Note that past phases can be omitted.
		public var phases: AnyCodable?
		/// If the update changes the current phase, indicates if the changes should be prorated. Possible values are `create_prorations` or `none`, and the default value is `create_prorations`.
		public var proration_behavior: ProrationBehaviorValues?

		public init(default_settings: DefaultSettingsParams? = nil, end_behavior: EndBehaviorValues? = nil, expand: [String]? = nil, metadata: AnyCodable? = nil, phases: AnyCodable? = nil, proration_behavior: ProrationBehaviorValues? = nil) {
			self.default_settings = default_settings
			self.end_behavior = end_behavior
			self.expand = expand
			self.metadata = metadata
			self.phases = phases
			self.proration_behavior = proration_behavior
		}


		/// Object representing the subscription schedule's default settings.
		public final class DefaultSettingsParams: Codable {
			public var application_fee_percent: StringNumber?
			public var billing_cycle_anchor: BillingCycleAnchorValues?
			public var billing_thresholds: AnyCodable?
			public var collection_method: CollectionMethodValues?
			public var default_payment_method: String?
			public var invoice_settings: SubscriptionSchedulesParam?
			public var transfer_data: AnyCodable?

			/// Object representing the subscription schedule's default settings.
			/// - Parameters:
			public init(application_fee_percent: StringNumber? = nil, billing_cycle_anchor: BillingCycleAnchorValues? = nil, billing_thresholds: AnyCodable? = nil, collection_method: CollectionMethodValues? = nil, default_payment_method: String? = nil, invoice_settings: SubscriptionSchedulesParam? = nil, transfer_data: AnyCodable? = nil) {
				self.application_fee_percent = application_fee_percent
				self.billing_cycle_anchor = billing_cycle_anchor
				self.billing_thresholds = billing_thresholds
				self.collection_method = collection_method
				self.default_payment_method = default_payment_method
				self.invoice_settings = invoice_settings
				self.transfer_data = transfer_data
			}


			public final class SubscriptionSchedulesParam: Codable {
				public var days_until_due: Int?

				public init(days_until_due: Int? = nil) {
					self.days_until_due = days_until_due
				}
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


		public enum EndBehaviorValues: String, Codable {
			case cancel = "cancel"
			case none = "none"
			case release = "release"
			case renew = "renew"
		}

		public enum ProrationBehaviorValues: String, Codable {
			case alwaysInvoice = "always_invoice"
			case createProrations = "create_prorations"
			case none = "none"
		}
	}

}

/// Cancels a subscription schedule and its associated subscription immediately (if the subscription schedule has an active subscription). A subscription schedule can only be canceled if its status is <code>not_started</code> or <code>active</code>.
public struct PostSubscriptionSchedulesScheduleCancel: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = SubscriptionSchedule
	public typealias paramType = Params
	
	public struct Params {
		let schedule: String

		/// Initialize the request parameters
		/// - Parameter schedule: 
		public init(schedule: String) {
			self.schedule = schedule
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/subscription_schedules/\(inputs.schedule)/cancel"
	}

	public final class FormInput: Codable {
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?
		/// If the subscription schedule is `active`, indicates if a final invoice will be generated that contains any un-invoiced metered usage and new/pending proration invoice items. Defaults to `true`.
		public var invoice_now: Bool?
		/// If the subscription schedule is `active`, indicates if the cancellation should be prorated. Defaults to `true`.
		public var prorate: Bool?

		public init(expand: [String]? = nil, invoice_now: Bool? = nil, prorate: Bool? = nil) {
			self.expand = expand
			self.invoice_now = invoice_now
			self.prorate = prorate
		}
	}

}

/// Releases the subscription schedule immediately, which will stop scheduling of its phases, but leave any existing subscription in place. A schedule can only be released if its status is <code>not_started</code> or <code>active</code>. If the subscription schedule is currently associated with a subscription, releasing it will remove its <code>subscription</code> property and set the subscription’s ID to the <code>released_subscription</code> property.
public struct PostSubscriptionSchedulesScheduleRelease: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = SubscriptionSchedule
	public typealias paramType = Params
	
	public struct Params {
		let schedule: String

		/// Initialize the request parameters
		/// - Parameter schedule: 
		public init(schedule: String) {
			self.schedule = schedule
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/subscription_schedules/\(inputs.schedule)/release"
	}

	public final class FormInput: Codable {
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?
		/// Keep any cancellation on the subscription that the schedule has set
		public var preserve_cancel_date: Bool?

		public init(expand: [String]? = nil, preserve_cancel_date: Bool? = nil) {
			self.expand = expand
			self.preserve_cancel_date = preserve_cancel_date
		}
	}

}
