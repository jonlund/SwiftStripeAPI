
/// Returns a list of Report Runs, with the most recent appearing first.
public struct GetReportingReportRuns: StripeAPIEndpoint {
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
		return "/v1/reporting/report_runs?\(query)"
	}
	public static var method: HTTPMethod { return .GET }

	public final class Output: Codable {
		public var data: [ReportingReportRun]
		/// True if this list has another page of items after this one that can be fetched.
		public var has_more: Bool
		/// String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
		public var object: ObjectValues
		/// The URL where this list can be accessed.
		public var url: String

		public init(data: [ReportingReportRun], has_more: Bool, object: ObjectValues, url: String) {
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

/// Creates a new object and begin running the report. (Certain report types require a <a href="https://stripe.com/docs/keys#test-live-modes">live-mode API key</a>.)
public struct PostReportingReportRuns: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = ReportingReportRun
	public typealias paramType = AnyCodable
	public static func endpoint(for inputs: AnyCodable) throws -> String {
		return "/v1/reporting/report_runs"
	}

	public final class FormInput: Codable {
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?
		/// Parameters specifying how the report should be run. Different Report Types have different required and optional parameters, listed in the [API Access to Reports](https://stripe.com/docs/reporting/statements/api) documentation.
		public var parameters: RunParameterSpecs?
		/// The ID of the [report type](https://stripe.com/docs/reporting/statements/api#report-types) to run, such as `"balance.summary.1"`.
		public var report_type: String

		public init(report_type: String, expand: [String]? = nil, parameters: RunParameterSpecs? = nil) {
			self.report_type = report_type
			self.expand = expand
			self.parameters = parameters
		}


		/// Parameters specifying how the report should be run. Different Report Types have different required and optional parameters, listed in the [API Access to Reports](https://stripe.com/docs/reporting/statements/api) documentation.
		public final class RunParameterSpecs: Codable {
			public var columns: [String]?
			public var connected_account: String?
			public var currency: String?
			public var interval_end: Timestamp?
			public var interval_start: Timestamp?
			public var payout: String?
			public var reporting_category: ReportingCategoryValues?
			public var timezone: TimezoneValues?

			/// Parameters specifying how the report should be run. Different Report Types have different required and optional parameters, listed in the [API Access to Reports](https://stripe.com/docs/reporting/statements/api) documentation.
			/// - Parameters:
			public init(columns: [String]? = nil, connected_account: String? = nil, currency: String? = nil, interval_end: Timestamp? = nil, interval_start: Timestamp? = nil, payout: String? = nil, reporting_category: ReportingCategoryValues? = nil, timezone: TimezoneValues? = nil) {
				self.columns = columns
				self.connected_account = connected_account
				self.currency = currency
				self.interval_end = interval_end
				self.interval_start = interval_start
				self.payout = payout
				self.reporting_category = reporting_category
				self.timezone = timezone
			}

			public enum ReportingCategoryValues: String, Codable {
				case advance = "advance"
				case advanceFunding = "advance_funding"
				case anticipationRepayment = "anticipation_repayment"
				case charge = "charge"
				case chargeFailure = "charge_failure"
				case connectCollectionTransfer = "connect_collection_transfer"
				case connectReservedFunds = "connect_reserved_funds"
				case contribution = "contribution"
				case dispute = "dispute"
				case disputeReversal = "dispute_reversal"
				case fee = "fee"
				case financingPaydown = "financing_paydown"
				case financingPaydownReversal = "financing_paydown_reversal"
				case financingPayout = "financing_payout"
				case financingPayoutReversal = "financing_payout_reversal"
				case issuingAuthorizationHold = "issuing_authorization_hold"
				case issuingAuthorizationRelease = "issuing_authorization_release"
				case issuingDispute = "issuing_dispute"
				case issuingTransaction = "issuing_transaction"
				case networkCost = "network_cost"
				case otherAdjustment = "other_adjustment"
				case partialCaptureReversal = "partial_capture_reversal"
				case payout = "payout"
				case payoutReversal = "payout_reversal"
				case platformEarning = "platform_earning"
				case platformEarningRefund = "platform_earning_refund"
				case refund = "refund"
				case refundFailure = "refund_failure"
				case riskReservedFunds = "risk_reserved_funds"
				case tax = "tax"
				case topup = "topup"
				case topupReversal = "topup_reversal"
				case transfer = "transfer"
				case transferReversal = "transfer_reversal"
			}

			public enum TimezoneValues: String, Codable {
				case optionAfricaAbidjan = "Africa/Abidjan"
				case optionAfricaAccra = "Africa/Accra"
				case optionAfricaAddisAbaba = "Africa/Addis_Ababa"
				case optionAfricaAlgiers = "Africa/Algiers"
				case optionAfricaAsmara = "Africa/Asmara"
				case optionAfricaAsmera = "Africa/Asmera"
				case optionAfricaBamako = "Africa/Bamako"
				case optionAfricaBangui = "Africa/Bangui"
				case optionAfricaBanjul = "Africa/Banjul"
				case optionAfricaBissau = "Africa/Bissau"
				case optionAfricaBlantyre = "Africa/Blantyre"
				case optionAfricaBrazzaville = "Africa/Brazzaville"
				case optionAfricaBujumbura = "Africa/Bujumbura"
				case optionAfricaCairo = "Africa/Cairo"
				case optionAfricaCasablanca = "Africa/Casablanca"
				case optionAfricaCeuta = "Africa/Ceuta"
				case optionAfricaConakry = "Africa/Conakry"
				case optionAfricaDakar = "Africa/Dakar"
				case optionAfricaDarEsSalaam = "Africa/Dar_es_Salaam"
				case optionAfricaDjibouti = "Africa/Djibouti"
				case optionAfricaDouala = "Africa/Douala"
				case optionAfricaElAaiun = "Africa/El_Aaiun"
				case optionAfricaFreetown = "Africa/Freetown"
				case optionAfricaGaborone = "Africa/Gaborone"
				case optionAfricaHarare = "Africa/Harare"
				case optionAfricaJohannesburg = "Africa/Johannesburg"
				case optionAfricaJuba = "Africa/Juba"
				case optionAfricaKampala = "Africa/Kampala"
				case optionAfricaKhartoum = "Africa/Khartoum"
				case optionAfricaKigali = "Africa/Kigali"
				case optionAfricaKinshasa = "Africa/Kinshasa"
				case optionAfricaLagos = "Africa/Lagos"
				case optionAfricaLibreville = "Africa/Libreville"
				case optionAfricaLome = "Africa/Lome"
				case optionAfricaLuanda = "Africa/Luanda"
				case optionAfricaLubumbashi = "Africa/Lubumbashi"
				case optionAfricaLusaka = "Africa/Lusaka"
				case optionAfricaMalabo = "Africa/Malabo"
				case optionAfricaMaputo = "Africa/Maputo"
				case optionAfricaMaseru = "Africa/Maseru"
				case optionAfricaMbabane = "Africa/Mbabane"
				case optionAfricaMogadishu = "Africa/Mogadishu"
				case optionAfricaMonrovia = "Africa/Monrovia"
				case optionAfricaNairobi = "Africa/Nairobi"
				case optionAfricaNdjamena = "Africa/Ndjamena"
				case optionAfricaNiamey = "Africa/Niamey"
				case optionAfricaNouakchott = "Africa/Nouakchott"
				case optionAfricaOuagadougou = "Africa/Ouagadougou"
				case optionAfricaPortoMinusNovo = "Africa/Porto-Novo"
				case optionAfricaSaoTome = "Africa/Sao_Tome"
				case optionAfricaTimbuktu = "Africa/Timbuktu"
				case optionAfricaTripoli = "Africa/Tripoli"
				case optionAfricaTunis = "Africa/Tunis"
				case optionAfricaWindhoek = "Africa/Windhoek"
				case optionAmericaAdak = "America/Adak"
				case optionAmericaAnchorage = "America/Anchorage"
				case optionAmericaAnguilla = "America/Anguilla"
				case optionAmericaAntigua = "America/Antigua"
				case optionAmericaAraguaina = "America/Araguaina"
				case optionAmericaArgentinaBuenosAires = "America/Argentina/Buenos_Aires"
				case optionAmericaArgentinaCatamarca = "America/Argentina/Catamarca"
				case optionAmericaArgentinaComodrivadavia = "America/Argentina/ComodRivadavia"
				case optionAmericaArgentinaCordoba = "America/Argentina/Cordoba"
				case optionAmericaArgentinaJujuy = "America/Argentina/Jujuy"
				case optionAmericaArgentinaLaRioja = "America/Argentina/La_Rioja"
				case optionAmericaArgentinaMendoza = "America/Argentina/Mendoza"
				case optionAmericaArgentinaRioGallegos = "America/Argentina/Rio_Gallegos"
				case optionAmericaArgentinaSalta = "America/Argentina/Salta"
				case optionAmericaArgentinaSanJuan = "America/Argentina/San_Juan"
				case optionAmericaArgentinaSanLuis = "America/Argentina/San_Luis"
				case optionAmericaArgentinaTucuman = "America/Argentina/Tucuman"
				case optionAmericaArgentinaUshuaia = "America/Argentina/Ushuaia"
				case optionAmericaAruba = "America/Aruba"
				case optionAmericaAsuncion = "America/Asuncion"
				case optionAmericaAtikokan = "America/Atikokan"
				case optionAmericaAtka = "America/Atka"
				case optionAmericaBahia = "America/Bahia"
				case optionAmericaBahiaBanderas = "America/Bahia_Banderas"
				case optionAmericaBarbados = "America/Barbados"
				case optionAmericaBelem = "America/Belem"
				case optionAmericaBelize = "America/Belize"
				case optionAmericaBlancMinusSablon = "America/Blanc-Sablon"
				case optionAmericaBoaVista = "America/Boa_Vista"
				case optionAmericaBogota = "America/Bogota"
				case optionAmericaBoise = "America/Boise"
				case optionAmericaBuenosAires = "America/Buenos_Aires"
				case optionAmericaCambridgeBay = "America/Cambridge_Bay"
				case optionAmericaCampoGrande = "America/Campo_Grande"
				case optionAmericaCancun = "America/Cancun"
				case optionAmericaCaracas = "America/Caracas"
				case optionAmericaCatamarca = "America/Catamarca"
				case optionAmericaCayenne = "America/Cayenne"
				case optionAmericaCayman = "America/Cayman"
				case optionAmericaChicago = "America/Chicago"
				case optionAmericaChihuahua = "America/Chihuahua"
				case optionAmericaCoralHarbour = "America/Coral_Harbour"
				case optionAmericaCordoba = "America/Cordoba"
				case optionAmericaCostaRica = "America/Costa_Rica"
				case optionAmericaCreston = "America/Creston"
				case optionAmericaCuiaba = "America/Cuiaba"
				case optionAmericaCuracao = "America/Curacao"
				case optionAmericaDanmarkshavn = "America/Danmarkshavn"
				case optionAmericaDawson = "America/Dawson"
				case optionAmericaDawsonCreek = "America/Dawson_Creek"
				case optionAmericaDenver = "America/Denver"
				case optionAmericaDetroit = "America/Detroit"
				case optionAmericaDominica = "America/Dominica"
				case optionAmericaEdmonton = "America/Edmonton"
				case optionAmericaEirunepe = "America/Eirunepe"
				case optionAmericaElSalvador = "America/El_Salvador"
				case optionAmericaEnsenada = "America/Ensenada"
				case optionAmericaFortNelson = "America/Fort_Nelson"
				case optionAmericaFortWayne = "America/Fort_Wayne"
				case optionAmericaFortaleza = "America/Fortaleza"
				case optionAmericaGlaceBay = "America/Glace_Bay"
				case optionAmericaGodthab = "America/Godthab"
				case optionAmericaGooseBay = "America/Goose_Bay"
				case optionAmericaGrandTurk = "America/Grand_Turk"
				case optionAmericaGrenada = "America/Grenada"
				case optionAmericaGuadeloupe = "America/Guadeloupe"
				case optionAmericaGuatemala = "America/Guatemala"
				case optionAmericaGuayaquil = "America/Guayaquil"
				case optionAmericaGuyana = "America/Guyana"
				case optionAmericaHalifax = "America/Halifax"
				case optionAmericaHavana = "America/Havana"
				case optionAmericaHermosillo = "America/Hermosillo"
				case optionAmericaIndianaIndianapolis = "America/Indiana/Indianapolis"
				case optionAmericaIndianaKnox = "America/Indiana/Knox"
				case optionAmericaIndianaMarengo = "America/Indiana/Marengo"
				case optionAmericaIndianaPetersburg = "America/Indiana/Petersburg"
				case optionAmericaIndianaTellCity = "America/Indiana/Tell_City"
				case optionAmericaIndianaVevay = "America/Indiana/Vevay"
				case optionAmericaIndianaVincennes = "America/Indiana/Vincennes"
				case optionAmericaIndianaWinamac = "America/Indiana/Winamac"
				case optionAmericaIndianapolis = "America/Indianapolis"
				case optionAmericaInuvik = "America/Inuvik"
				case optionAmericaIqaluit = "America/Iqaluit"
				case optionAmericaJamaica = "America/Jamaica"
				case optionAmericaJujuy = "America/Jujuy"
				case optionAmericaJuneau = "America/Juneau"
				case optionAmericaKentuckyLouisville = "America/Kentucky/Louisville"
				case optionAmericaKentuckyMonticello = "America/Kentucky/Monticello"
				case optionAmericaKnoxIn = "America/Knox_IN"
				case optionAmericaKralendijk = "America/Kralendijk"
				case optionAmericaLaPaz = "America/La_Paz"
				case optionAmericaLima = "America/Lima"
				case optionAmericaLosAngeles = "America/Los_Angeles"
				case optionAmericaLouisville = "America/Louisville"
				case optionAmericaLowerPrinces = "America/Lower_Princes"
				case optionAmericaMaceio = "America/Maceio"
				case optionAmericaManagua = "America/Managua"
				case optionAmericaManaus = "America/Manaus"
				case optionAmericaMarigot = "America/Marigot"
				case optionAmericaMartinique = "America/Martinique"
				case optionAmericaMatamoros = "America/Matamoros"
				case optionAmericaMazatlan = "America/Mazatlan"
				case optionAmericaMendoza = "America/Mendoza"
				case optionAmericaMenominee = "America/Menominee"
				case optionAmericaMerida = "America/Merida"
				case optionAmericaMetlakatla = "America/Metlakatla"
				case optionAmericaMexicoCity = "America/Mexico_City"
				case optionAmericaMiquelon = "America/Miquelon"
				case optionAmericaMoncton = "America/Moncton"
				case optionAmericaMonterrey = "America/Monterrey"
				case optionAmericaMontevideo = "America/Montevideo"
				case optionAmericaMontreal = "America/Montreal"
				case optionAmericaMontserrat = "America/Montserrat"
				case optionAmericaNassau = "America/Nassau"
				case optionAmericaNewYork = "America/New_York"
				case optionAmericaNipigon = "America/Nipigon"
				case optionAmericaNome = "America/Nome"
				case optionAmericaNoronha = "America/Noronha"
				case optionAmericaNorthDakotaBeulah = "America/North_Dakota/Beulah"
				case optionAmericaNorthDakotaCenter = "America/North_Dakota/Center"
				case optionAmericaNorthDakotaNewSalem = "America/North_Dakota/New_Salem"
				case optionAmericaOjinaga = "America/Ojinaga"
				case optionAmericaPanama = "America/Panama"
				case optionAmericaPangnirtung = "America/Pangnirtung"
				case optionAmericaParamaribo = "America/Paramaribo"
				case optionAmericaPhoenix = "America/Phoenix"
				case optionAmericaPortMinusAuMinusPrince = "America/Port-au-Prince"
				case optionAmericaPortOfSpain = "America/Port_of_Spain"
				case optionAmericaPortoAcre = "America/Porto_Acre"
				case optionAmericaPortoVelho = "America/Porto_Velho"
				case optionAmericaPuertoRico = "America/Puerto_Rico"
				case optionAmericaPuntaArenas = "America/Punta_Arenas"
				case optionAmericaRainyRiver = "America/Rainy_River"
				case optionAmericaRankinInlet = "America/Rankin_Inlet"
				case optionAmericaRecife = "America/Recife"
				case optionAmericaRegina = "America/Regina"
				case optionAmericaResolute = "America/Resolute"
				case optionAmericaRioBranco = "America/Rio_Branco"
				case optionAmericaRosario = "America/Rosario"
				case optionAmericaSantaIsabel = "America/Santa_Isabel"
				case optionAmericaSantarem = "America/Santarem"
				case optionAmericaSantiago = "America/Santiago"
				case optionAmericaSantoDomingo = "America/Santo_Domingo"
				case optionAmericaSaoPaulo = "America/Sao_Paulo"
				case optionAmericaScoresbysund = "America/Scoresbysund"
				case optionAmericaShiprock = "America/Shiprock"
				case optionAmericaSitka = "America/Sitka"
				case optionAmericaStBarthelemy = "America/St_Barthelemy"
				case optionAmericaStJohns = "America/St_Johns"
				case optionAmericaStKitts = "America/St_Kitts"
				case optionAmericaStLucia = "America/St_Lucia"
				case optionAmericaStThomas = "America/St_Thomas"
				case optionAmericaStVincent = "America/St_Vincent"
				case optionAmericaSwiftCurrent = "America/Swift_Current"
				case optionAmericaTegucigalpa = "America/Tegucigalpa"
				case optionAmericaThule = "America/Thule"
				case optionAmericaThunderBay = "America/Thunder_Bay"
				case optionAmericaTijuana = "America/Tijuana"
				case optionAmericaToronto = "America/Toronto"
				case optionAmericaTortola = "America/Tortola"
				case optionAmericaVancouver = "America/Vancouver"
				case optionAmericaVirgin = "America/Virgin"
				case optionAmericaWhitehorse = "America/Whitehorse"
				case optionAmericaWinnipeg = "America/Winnipeg"
				case optionAmericaYakutat = "America/Yakutat"
				case optionAmericaYellowknife = "America/Yellowknife"
				case optionAntarcticaCasey = "Antarctica/Casey"
				case optionAntarcticaDavis = "Antarctica/Davis"
				case optionAntarcticaDumontdurville = "Antarctica/DumontDUrville"
				case optionAntarcticaMacquarie = "Antarctica/Macquarie"
				case optionAntarcticaMawson = "Antarctica/Mawson"
				case optionAntarcticaMcmurdo = "Antarctica/McMurdo"
				case optionAntarcticaPalmer = "Antarctica/Palmer"
				case optionAntarcticaRothera = "Antarctica/Rothera"
				case optionAntarcticaSouthPole = "Antarctica/South_Pole"
				case optionAntarcticaSyowa = "Antarctica/Syowa"
				case optionAntarcticaTroll = "Antarctica/Troll"
				case optionAntarcticaVostok = "Antarctica/Vostok"
				case optionArcticLongyearbyen = "Arctic/Longyearbyen"
				case optionAsiaAden = "Asia/Aden"
				case optionAsiaAlmaty = "Asia/Almaty"
				case optionAsiaAmman = "Asia/Amman"
				case optionAsiaAnadyr = "Asia/Anadyr"
				case optionAsiaAqtau = "Asia/Aqtau"
				case optionAsiaAqtobe = "Asia/Aqtobe"
				case optionAsiaAshgabat = "Asia/Ashgabat"
				case optionAsiaAshkhabad = "Asia/Ashkhabad"
				case optionAsiaAtyrau = "Asia/Atyrau"
				case optionAsiaBaghdad = "Asia/Baghdad"
				case optionAsiaBahrain = "Asia/Bahrain"
				case optionAsiaBaku = "Asia/Baku"
				case optionAsiaBangkok = "Asia/Bangkok"
				case optionAsiaBarnaul = "Asia/Barnaul"
				case optionAsiaBeirut = "Asia/Beirut"
				case optionAsiaBishkek = "Asia/Bishkek"
				case optionAsiaBrunei = "Asia/Brunei"
				case optionAsiaCalcutta = "Asia/Calcutta"
				case optionAsiaChita = "Asia/Chita"
				case optionAsiaChoibalsan = "Asia/Choibalsan"
				case optionAsiaChongqing = "Asia/Chongqing"
				case optionAsiaChungking = "Asia/Chungking"
				case optionAsiaColombo = "Asia/Colombo"
				case optionAsiaDacca = "Asia/Dacca"
				case optionAsiaDamascus = "Asia/Damascus"
				case optionAsiaDhaka = "Asia/Dhaka"
				case optionAsiaDili = "Asia/Dili"
				case optionAsiaDubai = "Asia/Dubai"
				case optionAsiaDushanbe = "Asia/Dushanbe"
				case optionAsiaFamagusta = "Asia/Famagusta"
				case optionAsiaGaza = "Asia/Gaza"
				case optionAsiaHarbin = "Asia/Harbin"
				case optionAsiaHebron = "Asia/Hebron"
				case optionAsiaHoChiMinh = "Asia/Ho_Chi_Minh"
				case optionAsiaHongKong = "Asia/Hong_Kong"
				case optionAsiaHovd = "Asia/Hovd"
				case optionAsiaIrkutsk = "Asia/Irkutsk"
				case optionAsiaIstanbul = "Asia/Istanbul"
				case optionAsiaJakarta = "Asia/Jakarta"
				case optionAsiaJayapura = "Asia/Jayapura"
				case optionAsiaJerusalem = "Asia/Jerusalem"
				case optionAsiaKabul = "Asia/Kabul"
				case optionAsiaKamchatka = "Asia/Kamchatka"
				case optionAsiaKarachi = "Asia/Karachi"
				case optionAsiaKashgar = "Asia/Kashgar"
				case optionAsiaKathmandu = "Asia/Kathmandu"
				case optionAsiaKatmandu = "Asia/Katmandu"
				case optionAsiaKhandyga = "Asia/Khandyga"
				case optionAsiaKolkata = "Asia/Kolkata"
				case optionAsiaKrasnoyarsk = "Asia/Krasnoyarsk"
				case optionAsiaKualaLumpur = "Asia/Kuala_Lumpur"
				case optionAsiaKuching = "Asia/Kuching"
				case optionAsiaKuwait = "Asia/Kuwait"
				case optionAsiaMacao = "Asia/Macao"
				case optionAsiaMacau = "Asia/Macau"
				case optionAsiaMagadan = "Asia/Magadan"
				case optionAsiaMakassar = "Asia/Makassar"
				case optionAsiaManila = "Asia/Manila"
				case optionAsiaMuscat = "Asia/Muscat"
				case optionAsiaNicosia = "Asia/Nicosia"
				case optionAsiaNovokuznetsk = "Asia/Novokuznetsk"
				case optionAsiaNovosibirsk = "Asia/Novosibirsk"
				case optionAsiaOmsk = "Asia/Omsk"
				case optionAsiaOral = "Asia/Oral"
				case optionAsiaPhnomPenh = "Asia/Phnom_Penh"
				case optionAsiaPontianak = "Asia/Pontianak"
				case optionAsiaPyongyang = "Asia/Pyongyang"
				case optionAsiaQatar = "Asia/Qatar"
				case optionAsiaQostanay = "Asia/Qostanay"
				case optionAsiaQyzylorda = "Asia/Qyzylorda"
				case optionAsiaRangoon = "Asia/Rangoon"
				case optionAsiaRiyadh = "Asia/Riyadh"
				case optionAsiaSaigon = "Asia/Saigon"
				case optionAsiaSakhalin = "Asia/Sakhalin"
				case optionAsiaSamarkand = "Asia/Samarkand"
				case optionAsiaSeoul = "Asia/Seoul"
				case optionAsiaShanghai = "Asia/Shanghai"
				case optionAsiaSingapore = "Asia/Singapore"
				case optionAsiaSrednekolymsk = "Asia/Srednekolymsk"
				case optionAsiaTaipei = "Asia/Taipei"
				case optionAsiaTashkent = "Asia/Tashkent"
				case optionAsiaTbilisi = "Asia/Tbilisi"
				case optionAsiaTehran = "Asia/Tehran"
				case optionAsiaTelAviv = "Asia/Tel_Aviv"
				case optionAsiaThimbu = "Asia/Thimbu"
				case optionAsiaThimphu = "Asia/Thimphu"
				case optionAsiaTokyo = "Asia/Tokyo"
				case optionAsiaTomsk = "Asia/Tomsk"
				case optionAsiaUjungPandang = "Asia/Ujung_Pandang"
				case optionAsiaUlaanbaatar = "Asia/Ulaanbaatar"
				case optionAsiaUlanBator = "Asia/Ulan_Bator"
				case optionAsiaUrumqi = "Asia/Urumqi"
				case optionAsiaUstMinusNera = "Asia/Ust-Nera"
				case optionAsiaVientiane = "Asia/Vientiane"
				case optionAsiaVladivostok = "Asia/Vladivostok"
				case optionAsiaYakutsk = "Asia/Yakutsk"
				case optionAsiaYangon = "Asia/Yangon"
				case optionAsiaYekaterinburg = "Asia/Yekaterinburg"
				case optionAsiaYerevan = "Asia/Yerevan"
				case optionAtlanticAzores = "Atlantic/Azores"
				case optionAtlanticBermuda = "Atlantic/Bermuda"
				case optionAtlanticCanary = "Atlantic/Canary"
				case optionAtlanticCapeVerde = "Atlantic/Cape_Verde"
				case optionAtlanticFaeroe = "Atlantic/Faeroe"
				case optionAtlanticFaroe = "Atlantic/Faroe"
				case optionAtlanticJanMayen = "Atlantic/Jan_Mayen"
				case optionAtlanticMadeira = "Atlantic/Madeira"
				case optionAtlanticReykjavik = "Atlantic/Reykjavik"
				case optionAtlanticSouthGeorgia = "Atlantic/South_Georgia"
				case optionAtlanticStHelena = "Atlantic/St_Helena"
				case optionAtlanticStanley = "Atlantic/Stanley"
				case optionAustraliaAct = "Australia/ACT"
				case optionAustraliaAdelaide = "Australia/Adelaide"
				case optionAustraliaBrisbane = "Australia/Brisbane"
				case optionAustraliaBrokenHill = "Australia/Broken_Hill"
				case optionAustraliaCanberra = "Australia/Canberra"
				case optionAustraliaCurrie = "Australia/Currie"
				case optionAustraliaDarwin = "Australia/Darwin"
				case optionAustraliaEucla = "Australia/Eucla"
				case optionAustraliaHobart = "Australia/Hobart"
				case optionAustraliaLhi = "Australia/LHI"
				case optionAustraliaLindeman = "Australia/Lindeman"
				case optionAustraliaLordHowe = "Australia/Lord_Howe"
				case optionAustraliaMelbourne = "Australia/Melbourne"
				case optionAustraliaNsw = "Australia/NSW"
				case optionAustraliaNorth = "Australia/North"
				case optionAustraliaPerth = "Australia/Perth"
				case optionAustraliaQueensland = "Australia/Queensland"
				case optionAustraliaSouth = "Australia/South"
				case optionAustraliaSydney = "Australia/Sydney"
				case optionAustraliaTasmania = "Australia/Tasmania"
				case optionAustraliaVictoria = "Australia/Victoria"
				case optionAustraliaWest = "Australia/West"
				case optionAustraliaYancowinna = "Australia/Yancowinna"
				case optionBrazilAcre = "Brazil/Acre"
				case optionBrazilDenoronha = "Brazil/DeNoronha"
				case optionBrazilEast = "Brazil/East"
				case optionBrazilWest = "Brazil/West"
				case optionCET = "CET"
				case optionCST6CDT = "CST6CDT"
				case optionCanadaAtlantic = "Canada/Atlantic"
				case optionCanadaCentral = "Canada/Central"
				case optionCanadaEastern = "Canada/Eastern"
				case optionCanadaMountain = "Canada/Mountain"
				case optionCanadaNewfoundland = "Canada/Newfoundland"
				case optionCanadaPacific = "Canada/Pacific"
				case optionCanadaSaskatchewan = "Canada/Saskatchewan"
				case optionCanadaYukon = "Canada/Yukon"
				case optionChileContinental = "Chile/Continental"
				case optionChileEasterisland = "Chile/EasterIsland"
				case optionCuba = "Cuba"
				case optionEET = "EET"
				case optionEST = "EST"
				case optionEST5EDT = "EST5EDT"
				case optionEgypt = "Egypt"
				case optionEire = "Eire"
				case optionEtcGmt = "Etc/GMT"
				case optionEtcGmtPlus0 = "Etc/GMT+0"
				case optionEtcGmtPlus1 = "Etc/GMT+1"
				case optionEtcGmtPlus10 = "Etc/GMT+10"
				case optionEtcGmtPlus11 = "Etc/GMT+11"
				case optionEtcGmtPlus12 = "Etc/GMT+12"
				case optionEtcGmtPlus2 = "Etc/GMT+2"
				case optionEtcGmtPlus3 = "Etc/GMT+3"
				case optionEtcGmtPlus4 = "Etc/GMT+4"
				case optionEtcGmtPlus5 = "Etc/GMT+5"
				case optionEtcGmtPlus6 = "Etc/GMT+6"
				case optionEtcGmtPlus7 = "Etc/GMT+7"
				case optionEtcGmtPlus8 = "Etc/GMT+8"
				case optionEtcGmtPlus9 = "Etc/GMT+9"
				case optionEtcGmtMinus0 = "Etc/GMT-0"
				case optionEtcGmtMinus1 = "Etc/GMT-1"
				case optionEtcGmtMinus10 = "Etc/GMT-10"
				case optionEtcGmtMinus11 = "Etc/GMT-11"
				case optionEtcGmtMinus12 = "Etc/GMT-12"
				case optionEtcGmtMinus13 = "Etc/GMT-13"
				case optionEtcGmtMinus14 = "Etc/GMT-14"
				case optionEtcGmtMinus2 = "Etc/GMT-2"
				case optionEtcGmtMinus3 = "Etc/GMT-3"
				case optionEtcGmtMinus4 = "Etc/GMT-4"
				case optionEtcGmtMinus5 = "Etc/GMT-5"
				case optionEtcGmtMinus6 = "Etc/GMT-6"
				case optionEtcGmtMinus7 = "Etc/GMT-7"
				case optionEtcGmtMinus8 = "Etc/GMT-8"
				case optionEtcGmtMinus9 = "Etc/GMT-9"
				case optionEtcGmt0 = "Etc/GMT0"
				case optionEtcGreenwich = "Etc/Greenwich"
				case optionEtcUct = "Etc/UCT"
				case optionEtcUtc = "Etc/UTC"
				case optionEtcUniversal = "Etc/Universal"
				case optionEtcZulu = "Etc/Zulu"
				case optionEuropeAmsterdam = "Europe/Amsterdam"
				case optionEuropeAndorra = "Europe/Andorra"
				case optionEuropeAstrakhan = "Europe/Astrakhan"
				case optionEuropeAthens = "Europe/Athens"
				case optionEuropeBelfast = "Europe/Belfast"
				case optionEuropeBelgrade = "Europe/Belgrade"
				case optionEuropeBerlin = "Europe/Berlin"
				case optionEuropeBratislava = "Europe/Bratislava"
				case optionEuropeBrussels = "Europe/Brussels"
				case optionEuropeBucharest = "Europe/Bucharest"
				case optionEuropeBudapest = "Europe/Budapest"
				case optionEuropeBusingen = "Europe/Busingen"
				case optionEuropeChisinau = "Europe/Chisinau"
				case optionEuropeCopenhagen = "Europe/Copenhagen"
				case optionEuropeDublin = "Europe/Dublin"
				case optionEuropeGibraltar = "Europe/Gibraltar"
				case optionEuropeGuernsey = "Europe/Guernsey"
				case optionEuropeHelsinki = "Europe/Helsinki"
				case optionEuropeIsleOfMan = "Europe/Isle_of_Man"
				case optionEuropeIstanbul = "Europe/Istanbul"
				case optionEuropeJersey = "Europe/Jersey"
				case optionEuropeKaliningrad = "Europe/Kaliningrad"
				case optionEuropeKiev = "Europe/Kiev"
				case optionEuropeKirov = "Europe/Kirov"
				case optionEuropeLisbon = "Europe/Lisbon"
				case optionEuropeLjubljana = "Europe/Ljubljana"
				case optionEuropeLondon = "Europe/London"
				case optionEuropeLuxembourg = "Europe/Luxembourg"
				case optionEuropeMadrid = "Europe/Madrid"
				case optionEuropeMalta = "Europe/Malta"
				case optionEuropeMariehamn = "Europe/Mariehamn"
				case optionEuropeMinsk = "Europe/Minsk"
				case optionEuropeMonaco = "Europe/Monaco"
				case optionEuropeMoscow = "Europe/Moscow"
				case optionEuropeNicosia = "Europe/Nicosia"
				case optionEuropeOslo = "Europe/Oslo"
				case optionEuropeParis = "Europe/Paris"
				case optionEuropePodgorica = "Europe/Podgorica"
				case optionEuropePrague = "Europe/Prague"
				case optionEuropeRiga = "Europe/Riga"
				case optionEuropeRome = "Europe/Rome"
				case optionEuropeSamara = "Europe/Samara"
				case optionEuropeSanMarino = "Europe/San_Marino"
				case optionEuropeSarajevo = "Europe/Sarajevo"
				case optionEuropeSaratov = "Europe/Saratov"
				case optionEuropeSimferopol = "Europe/Simferopol"
				case optionEuropeSkopje = "Europe/Skopje"
				case optionEuropeSofia = "Europe/Sofia"
				case optionEuropeStockholm = "Europe/Stockholm"
				case optionEuropeTallinn = "Europe/Tallinn"
				case optionEuropeTirane = "Europe/Tirane"
				case optionEuropeTiraspol = "Europe/Tiraspol"
				case optionEuropeUlyanovsk = "Europe/Ulyanovsk"
				case optionEuropeUzhgorod = "Europe/Uzhgorod"
				case optionEuropeVaduz = "Europe/Vaduz"
				case optionEuropeVatican = "Europe/Vatican"
				case optionEuropeVienna = "Europe/Vienna"
				case optionEuropeVilnius = "Europe/Vilnius"
				case optionEuropeVolgograd = "Europe/Volgograd"
				case optionEuropeWarsaw = "Europe/Warsaw"
				case optionEuropeZagreb = "Europe/Zagreb"
				case optionEuropeZaporozhye = "Europe/Zaporozhye"
				case optionEuropeZurich = "Europe/Zurich"
				case optionFactory = "Factory"
				case optionGB = "GB"
				case optionGBMinusEire = "GB-Eire"
				case optionGMT = "GMT"
				case optionGMTPlus0 = "GMT+0"
				case optionGMTMinus0 = "GMT-0"
				case optionGMT0 = "GMT0"
				case optionGreenwich = "Greenwich"
				case optionHST = "HST"
				case optionHongkong = "Hongkong"
				case optionIceland = "Iceland"
				case optionIndianAntananarivo = "Indian/Antananarivo"
				case optionIndianChagos = "Indian/Chagos"
				case optionIndianChristmas = "Indian/Christmas"
				case optionIndianCocos = "Indian/Cocos"
				case optionIndianComoro = "Indian/Comoro"
				case optionIndianKerguelen = "Indian/Kerguelen"
				case optionIndianMahe = "Indian/Mahe"
				case optionIndianMaldives = "Indian/Maldives"
				case optionIndianMauritius = "Indian/Mauritius"
				case optionIndianMayotte = "Indian/Mayotte"
				case optionIndianReunion = "Indian/Reunion"
				case optionIran = "Iran"
				case optionIsrael = "Israel"
				case optionJamaica = "Jamaica"
				case optionJapan = "Japan"
				case optionKwajalein = "Kwajalein"
				case optionLibya = "Libya"
				case optionMET = "MET"
				case optionMST = "MST"
				case optionMST7MDT = "MST7MDT"
				case optionMexicoBajanorte = "Mexico/BajaNorte"
				case optionMexicoBajasur = "Mexico/BajaSur"
				case optionMexicoGeneral = "Mexico/General"
				case optionNZ = "NZ"
				case optionNZMinusChat = "NZ-CHAT"
				case optionNavajo = "Navajo"
				case optionPRC = "PRC"
				case optionPST8PDT = "PST8PDT"
				case optionPacificApia = "Pacific/Apia"
				case optionPacificAuckland = "Pacific/Auckland"
				case optionPacificBougainville = "Pacific/Bougainville"
				case optionPacificChatham = "Pacific/Chatham"
				case optionPacificChuuk = "Pacific/Chuuk"
				case optionPacificEaster = "Pacific/Easter"
				case optionPacificEfate = "Pacific/Efate"
				case optionPacificEnderbury = "Pacific/Enderbury"
				case optionPacificFakaofo = "Pacific/Fakaofo"
				case optionPacificFiji = "Pacific/Fiji"
				case optionPacificFunafuti = "Pacific/Funafuti"
				case optionPacificGalapagos = "Pacific/Galapagos"
				case optionPacificGambier = "Pacific/Gambier"
				case optionPacificGuadalcanal = "Pacific/Guadalcanal"
				case optionPacificGuam = "Pacific/Guam"
				case optionPacificHonolulu = "Pacific/Honolulu"
				case optionPacificJohnston = "Pacific/Johnston"
				case optionPacificKiritimati = "Pacific/Kiritimati"
				case optionPacificKosrae = "Pacific/Kosrae"
				case optionPacificKwajalein = "Pacific/Kwajalein"
				case optionPacificMajuro = "Pacific/Majuro"
				case optionPacificMarquesas = "Pacific/Marquesas"
				case optionPacificMidway = "Pacific/Midway"
				case optionPacificNauru = "Pacific/Nauru"
				case optionPacificNiue = "Pacific/Niue"
				case optionPacificNorfolk = "Pacific/Norfolk"
				case optionPacificNoumea = "Pacific/Noumea"
				case optionPacificPagoPago = "Pacific/Pago_Pago"
				case optionPacificPalau = "Pacific/Palau"
				case optionPacificPitcairn = "Pacific/Pitcairn"
				case optionPacificPohnpei = "Pacific/Pohnpei"
				case optionPacificPonape = "Pacific/Ponape"
				case optionPacificPortMoresby = "Pacific/Port_Moresby"
				case optionPacificRarotonga = "Pacific/Rarotonga"
				case optionPacificSaipan = "Pacific/Saipan"
				case optionPacificSamoa = "Pacific/Samoa"
				case optionPacificTahiti = "Pacific/Tahiti"
				case optionPacificTarawa = "Pacific/Tarawa"
				case optionPacificTongatapu = "Pacific/Tongatapu"
				case optionPacificTruk = "Pacific/Truk"
				case optionPacificWake = "Pacific/Wake"
				case optionPacificWallis = "Pacific/Wallis"
				case optionPacificYap = "Pacific/Yap"
				case optionPoland = "Poland"
				case optionPortugal = "Portugal"
				case optionROC = "ROC"
				case optionROK = "ROK"
				case optionSingapore = "Singapore"
				case optionTurkey = "Turkey"
				case optionUCT = "UCT"
				case optionUSAlaska = "US/Alaska"
				case optionUSAleutian = "US/Aleutian"
				case optionUSArizona = "US/Arizona"
				case optionUSCentral = "US/Central"
				case optionUSEastMinusIndiana = "US/East-Indiana"
				case optionUSEastern = "US/Eastern"
				case optionUSHawaii = "US/Hawaii"
				case optionUSIndianaMinusStarke = "US/Indiana-Starke"
				case optionUSMichigan = "US/Michigan"
				case optionUSMountain = "US/Mountain"
				case optionUSPacific = "US/Pacific"
				case optionUSPacificMinusNew = "US/Pacific-New"
				case optionUSSamoa = "US/Samoa"
				case optionUTC = "UTC"
				case optionUniversal = "Universal"
				case optionWMinusSu = "W-SU"
				case optionWET = "WET"
				case optionZulu = "Zulu"
			}
		}

	}

}

/// Retrieves the details of an existing Report Run.
public struct GetReportingReportRunsReportRun: StripeAPIEndpoint {
	public typealias inputType = AnyCodable
	public typealias outputType = ReportingReportRun
	public typealias paramType = Params
	
	public struct Params {
		let report_run: String

		/// Initialize the request parameters
		/// - Parameter report_run: 
		public init(report_run: String) {
			self.report_run = report_run
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/reporting/report_runs/\(inputs.report_run)"
	}
	public static var method: HTTPMethod { return .GET }

}

/// Returns a full list of Report Types.
public struct GetReportingReportTypes: StripeAPIEndpoint {
	public typealias inputType = AnyCodable
	public typealias outputType = FinancialReportingFinanceReportTypeList
	public typealias paramType = AnyCodable
	public static func endpoint(for inputs: AnyCodable) throws -> String {
		return "/v1/reporting/report_types"
	}
	public static var method: HTTPMethod { return .GET }

	public final class FinancialReportingFinanceReportTypeList: Codable {
		public var data: [ReportingReportType]
		/// True if this list has another page of items after this one that can be fetched.
		public var has_more: Bool
		/// String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
		public var object: ObjectValues
		/// The URL where this list can be accessed.
		public var url: String

		public init(data: [ReportingReportType], has_more: Bool, object: ObjectValues, url: String) {
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

/// Retrieves the details of a Report Type. (Certain report types require a <a href="https://stripe.com/docs/keys#test-live-modes">live-mode API key</a>.)
public struct GetReportingReportTypesReportType: StripeAPIEndpoint {
	public typealias inputType = AnyCodable
	public typealias outputType = ReportingReportType
	public typealias paramType = Params
	
	public struct Params {
		let report_type: String

		/// Initialize the request parameters
		/// - Parameter report_type: 
		public init(report_type: String) {
			self.report_type = report_type
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/reporting/report_types/\(inputs.report_type)"
	}
	public static var method: HTTPMethod { return .GET }

}
