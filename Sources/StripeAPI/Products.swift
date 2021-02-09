
/// Returns a list of your products. The products are returned sorted by creation date, with the most recently created products appearing first.
public struct GetProducts: StripeAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = Output
	public typealias paramType = Params
	public struct Params {
		let active: Bool
		let ending_before: String
		let limit: Int
		let shippable: Bool
		let starting_after: String
		let url: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/products?active=\(inputs.active.urlEncoded))&ending_before=\(inputs.ending_before.urlEncoded))&limit=\(inputs.limit.urlEncoded))&shippable=\(inputs.shippable.urlEncoded))&starting_after=\(inputs.starting_after.urlEncoded))&url=\(inputs.url.urlEncoded))"
	}
	public static var method: HTTPMethod { return .GET }

	public final class Output: Codable {
		public var data: [Product]
		/// True if this list has another page of items after this one that can be fetched.
		public var has_more: Bool
		/// String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
		public var object: ObjectValues
		/// The URL where this list can be accessed.
		public var url: String

		public init(data: [Product], has_more: Bool, object: ObjectValues, url: String) {
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

/// Creates a new product object.
public struct PostProducts: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = Product
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v1/products"
	}

	public final class FormInput: Codable {
		/// Whether the product is currently available for purchase. Defaults to `true`.
		public var active: Bool?
		/// A list of up to 5 alphanumeric attributes. Should only be set if type=`good`.
		public var attributes: [String]?
		/// A short one-line description of the product, meant to be displayable to the customer. May only be set if type=`good`.
		public var caption: String?
		/// An array of Connect application names or identifiers that should not be able to order the SKUs for this product. May only be set if type=`good`.
		public var deactivate_on: [String]?
		/// The product's description, meant to be displayable to the customer. Use this field to optionally store a long form explanation of the product being sold for your own rendering purposes.
		public var description: String?
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?
		/// An identifier will be randomly generated by Stripe. You can optionally override this ID, but the ID must be unique across all products in your Stripe account.
		public var id: String?
		/// A list of up to 8 URLs of images for this product, meant to be displayable to the customer.
		public var images: [String]?
		/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
		public var metadata: String?
		/// The product's name, meant to be displayable to the customer. Whenever this product is sold via a subscription, name will show up on associated invoice line item descriptions.
		public var name: String
		/// The dimensions of this product for shipping purposes. A SKU associated with this product can override this value by having its own `package_dimensions`. May only be set if type=`good`.
		public var package_dimensions: PackageDimensionsSpecs?
		/// Whether this product is shipped (i.e., physical goods). Defaults to `true`. May only be set if type=`good`.
		public var shippable: Bool?
		/// An arbitrary string to be displayed on your customer's credit card or bank statement. While most banks display this information consistently, some may display it incorrectly or not at all.  This may be up to 22 characters. The statement description may not include `<`, `>`, `\`, `"`, `'` characters, and will appear on your customer's statement in capital letters. Non-ASCII characters are automatically stripped.  It must contain at least one letter.
		public var statement_descriptor: String?
		/// A label that represents units of this product in Stripe and on customers’ receipts and invoices. When set, this will be included in associated invoice line item descriptions.
		public var unit_label: String?
		/// A URL of a publicly-accessible webpage for this product. May only be set if type=`good`.
		public var url: String?

		public init(name: String, active: Bool? = nil, attributes: [String]? = nil, caption: String? = nil, deactivate_on: [String]? = nil, description: String? = nil, expand: [String]? = nil, id: String? = nil, images: [String]? = nil, metadata: String? = nil, package_dimensions: PackageDimensionsSpecs? = nil, shippable: Bool? = nil, statement_descriptor: String? = nil, unit_label: String? = nil, url: String? = nil) {
			self.name = name
			self.active = active
			self.attributes = attributes
			self.caption = caption
			self.deactivate_on = deactivate_on
			self.description = description
			self.expand = expand
			self.id = id
			self.images = images
			self.metadata = metadata
			self.package_dimensions = package_dimensions
			self.shippable = shippable
			self.statement_descriptor = statement_descriptor
			self.unit_label = unit_label
			self.url = url
		}


		/// The dimensions of this product for shipping purposes. A SKU associated with this product can override this value by having its own `package_dimensions`. May only be set if type=`good`.
		public final class PackageDimensionsSpecs: Codable {
			public var height: StringNumber
			public var length: StringNumber
			public var weight: StringNumber
			public var width: StringNumber

			/// The dimensions of this product for shipping purposes. A SKU associated with this product can override this value by having its own `package_dimensions`. May only be set if type=`good`.
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

/// Retrieves the details of an existing product. Supply the unique product ID from either a product creation request or the product list, and Stripe will return the corresponding product information.
public struct GetProductsId: StripeAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = Product
	public typealias paramType = Params
	public struct Params {
		let id: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/products/\(inputs.id)"
	}
	public static var method: HTTPMethod { return .GET }

}

/// Updates the specific product by setting the values of the parameters passed. Any parameters not provided will be left unchanged.
public struct PostProductsId: StripeAPIEndpoint {
	public typealias inputType = FormInput
	public typealias outputType = Product
	public typealias paramType = Params
	public struct Params {
		let id: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/products/\(inputs.id)"
	}

	public final class FormInput: Codable {
		/// Whether the product is available for purchase.
		public var active: Bool?
		/// A list of up to 5 alphanumeric attributes that each SKU can provide values for (e.g., `["color", "size"]`). If a value for `attributes` is specified, the list specified will replace the existing attributes list on this product. Any attributes not present after the update will be deleted from the SKUs for this product.
		public var attributes: MESSED_UP?
		/// A short one-line description of the product, meant to be displayable to the customer. May only be set if `type=good`.
		public var caption: String?
		/// An array of Connect application names or identifiers that should not be able to order the SKUs for this product. May only be set if `type=good`.
		public var deactivate_on: [String]?
		/// The product's description, meant to be displayable to the customer. Use this field to optionally store a long form explanation of the product being sold for your own rendering purposes.
		public var description: String?
		/// Specifies which fields in the response should be expanded.
		public var expand: [String]?
		/// A list of up to 8 URLs of images for this product, meant to be displayable to the customer.
		public var images: MESSED_UP?
		/// Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
		public var metadata: MESSED_UP?
		/// The product's name, meant to be displayable to the customer. Whenever this product is sold via a subscription, name will show up on associated invoice line item descriptions.
		public var name: String?
		/// The dimensions of this product for shipping purposes. A SKU associated with this product can override this value by having its own `package_dimensions`. May only be set if `type=good`.
		public var package_dimensions: MESSED_UP?
		/// Whether this product is shipped (i.e., physical goods). Defaults to `true`. May only be set if `type=good`.
		public var shippable: Bool?
		/// An arbitrary string to be displayed on your customer's credit card or bank statement. While most banks display this information consistently, some may display it incorrectly or not at all.  This may be up to 22 characters. The statement description may not include `<`, `>`, `\`, `"`, `'` characters, and will appear on your customer's statement in capital letters. Non-ASCII characters are automatically stripped.  It must contain at least one letter. May only be set if `type=service`.
		public var statement_descriptor: String?
		/// A label that represents units of this product in Stripe and on customers’ receipts and invoices. When set, this will be included in associated invoice line item descriptions. May only be set if `type=service`.
		public var unit_label: String?
		/// A URL of a publicly-accessible webpage for this product. May only be set if `type=good`.
		public var url: String?

		public init(active: Bool? = nil, attributes: MESSED_UP? = nil, caption: String? = nil, deactivate_on: [String]? = nil, description: String? = nil, expand: [String]? = nil, images: MESSED_UP? = nil, metadata: MESSED_UP? = nil, name: String? = nil, package_dimensions: MESSED_UP? = nil, shippable: Bool? = nil, statement_descriptor: String? = nil, unit_label: String? = nil, url: String? = nil) {
			self.active = active
			self.attributes = attributes
			self.caption = caption
			self.deactivate_on = deactivate_on
			self.description = description
			self.expand = expand
			self.images = images
			self.metadata = metadata
			self.name = name
			self.package_dimensions = package_dimensions
			self.shippable = shippable
			self.statement_descriptor = statement_descriptor
			self.unit_label = unit_label
			self.url = url
		}
	}

}

/// Delete a product. Deleting a product is only possible if it has no prices associated with it. Additionally, deleting a product with <code>type=good</code> is only possible if it has no SKUs associated with it.
public struct DeleteProductsId: StripeAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = DeletedProduct
	public typealias paramType = Params
	public struct Params {
		let id: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/products/\(inputs.id)"
	}
	public static var method: HTTPMethod { return .DELETE }

}
