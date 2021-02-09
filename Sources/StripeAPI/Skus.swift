
/// Returns a list of your SKUs. The SKUs are returned sorted by creation date, with the most recently created SKUs appearing first.
public struct GetSkus: StripeAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = Output
	public typealias paramType = Params
	public struct Params {
		let active: Bool
		let ending_before: String
		let in_stock: Bool
		let limit: Int
		let product: String
		let starting_after: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/skus?active=\(inputs.active.urlEncoded))&ending_before=\(inputs.ending_before.urlEncoded))&in_stock=\(inputs.in_stock.urlEncoded))&limit=\(inputs.limit.urlEncoded))&product=\(inputs.product.urlEncoded))&starting_after=\(inputs.starting_after.urlEncoded))"
	}
	public static var method: HTTPMethod { return .GET }

	public class Output: Codable {
		public var data: [Sku]
		/// True if this list has another page of items after this one that can be fetched.
		public var has_more: Bool
		/// String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
		public var object: ObjectValues
		/// The URL where this list can be accessed.
		public var url: String

		public init(data: [Sku], has_more: Bool, object: ObjectValues, url: String) {
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

/// Creates a new SKU associated with a product.
public struct PostSkus: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = Sku
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v1/skus"
	}

	public class FormInput: Codable {
		/// Whether the SKU is available for purchase. Default to `true`.
		public var active: Bool?
		/// A dictionary of attributes and values for the attributes defined by the product. If, for example, a product's attributes are `["size", "gender"]`, a valid SKU has the following dictionary of attributes: `{"size": "Medium", "gender": "Unisex"}`.
		public var attributes: String?
		/// Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
		public var currency: String
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?
		/// The identifier for the SKU. Must be unique. If not provided, an identifier will be randomly generated.
		public var id: String?
		/// The URL of an image for this SKU, meant to be displayable to the customer.
		public var image: String?
		/// Description of the SKU's inventory.
		public var inventory: InventoryCreateSpecs
		/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
		public var metadata: String?
		/// The dimensions of this SKU for shipping purposes.
		public var package_dimensions: PackageDimensionsSpecs?
		/// The cost of the item as a nonnegative integer in the smallest currency unit (that is, 100 cents to charge $1.00, or 100 to charge ¥100, Japanese Yen being a zero-decimal currency).
		public var price: Int
		/// The ID of the product this SKU is associated with. Must be a product with type `good`.
		public var product: String

		public init(currency: String, inventory: InventoryCreateSpecs, price: Int, product: String, active: Bool? = nil, attributes: String? = nil, expand: [String]? = nil, id: String? = nil, image: String? = nil, metadata: String? = nil, package_dimensions: PackageDimensionsSpecs? = nil) {
			self.currency = currency
			self.inventory = inventory
			self.price = price
			self.product = product
			self.active = active
			self.attributes = attributes
			self.expand = expand
			self.id = id
			self.image = image
			self.metadata = metadata
			self.package_dimensions = package_dimensions
		}


		/// Description of the SKU's inventory.
		public class InventoryCreateSpecs: Codable {
			public var quantity: Int?
			public var type: TypeValues
			public var value: ValueValues?

			/// Description of the SKU's inventory.
			/// - Parameters:
			///   - type: 
			public init(type: TypeValues, quantity: Int? = nil, value: ValueValues? = nil) {
				self.type = type
				self.quantity = quantity
				self.value = value
			}

			public enum TypeValues: String, Codable {
				case bucket = "bucket"
				case finite = "finite"
				case infinite = "infinite"
			}

			public enum ValueValues: String, Codable {
				case inStock = "in_stock"
				case limited = "limited"
				case outOfStock = "out_of_stock"
			}
		}



		/// The dimensions of this SKU for shipping purposes.
		public class PackageDimensionsSpecs: Codable {
			public var height: StringNumber
			public var length: StringNumber
			public var weight: StringNumber
			public var width: StringNumber

			/// The dimensions of this SKU for shipping purposes.
			/// - Parameters:
			///   - height: 
			///   - length: 
			///   - weight: 
			///   - width: 
			public init(height: StringNumber, length: StringNumber, weight: StringNumber, width: StringNumber) {
				self.height = height
				self.length = length
				self.weight = weight
				self.width = width
			}
		}

	}

}

/// Retrieves the details of an existing SKU. Supply the unique SKU identifier from either a SKU creation request or from the product, and Stripe will return the corresponding SKU information.
public struct GetSkusId: StripeAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = Sku
	public typealias paramType = Params
	public struct Params {
		let id: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/skus/\(inputs.id)"
	}
	public static var method: HTTPMethod { return .GET }

}

/// Updates the specific SKU by setting the values of the parameters passed. Any parameters not provided will be left unchanged.  Note that a SKU’s <code>attributes</code> are not editable. Instead, you would need to deactivate the existing SKU and create a new one with the new attribute values.
public struct PostSkusId: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = Sku
	public typealias paramType = Params
	public struct Params {
		let id: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/skus/\(inputs.id)"
	}

	public class FormInput: Codable {
		/// Whether this SKU is available for purchase.
		public var active: Bool?
		/// A dictionary of attributes and values for the attributes defined by the product. When specified, `attributes` will partially update the existing attributes dictionary on the product, with the postcondition that a value must be present for each attribute key on the product.
		public var attributes: String?
		/// Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
		public var currency: String?
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?
		/// The URL of an image for this SKU, meant to be displayable to the customer.
		public var image: String?
		/// Description of the SKU's inventory.
		public var inventory: InventoryUpdateSpecs?
		/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
		public var metadata: MESSED_UP?
		/// The dimensions of this SKU for shipping purposes.
		public var package_dimensions: MESSED_UP?
		/// The cost of the item as a positive integer in the smallest currency unit (that is, 100 cents to charge $1.00, or 100 to charge ¥100, Japanese Yen being a zero-decimal currency).
		public var price: Int?
		/// The ID of the product that this SKU should belong to. The product must exist, have the same set of attribute names as the SKU's current product, and be of type `good`.
		public var product: String?

		public init(active: Bool? = nil, attributes: String? = nil, currency: String? = nil, expand: [String]? = nil, image: String? = nil, inventory: InventoryUpdateSpecs? = nil, metadata: MESSED_UP? = nil, package_dimensions: MESSED_UP? = nil, price: Int? = nil, product: String? = nil) {
			self.active = active
			self.attributes = attributes
			self.currency = currency
			self.expand = expand
			self.image = image
			self.inventory = inventory
			self.metadata = metadata
			self.package_dimensions = package_dimensions
			self.price = price
			self.product = product
		}


		/// Description of the SKU's inventory.
		public class InventoryUpdateSpecs: Codable {
			public var quantity: Int?
			public var type: TypeValues?
			public var value: ValueValues?

			/// Description of the SKU's inventory.
			/// - Parameters:
			public init(quantity: Int? = nil, type: TypeValues? = nil, value: ValueValues? = nil) {
				self.quantity = quantity
				self.type = type
				self.value = value
			}

			public enum TypeValues: String, Codable {
				case bucket = "bucket"
				case finite = "finite"
				case infinite = "infinite"
			}

			public enum ValueValues: String, Codable {
				case inStock = "in_stock"
				case limited = "limited"
				case outOfStock = "out_of_stock"
			}
		}

	}

}

/// Delete a SKU. Deleting a SKU is only possible until it has been used in an order.
public struct DeleteSkusId: StripeAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = DeletedSku
	public typealias paramType = Params
	public struct Params {
		let id: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/skus/\(inputs.id)"
	}
	public static var method: HTTPMethod { return .DELETE }

}
