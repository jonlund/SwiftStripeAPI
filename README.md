# SwiftStripeAPI

Swift Stripe API is simply Stripe's methods and data structures converted to a format that can be used in Swift projects. It is generated from Stripe's OpenAPI 3.0 specification at https://github.com/stripe/openapi

This project is in Swift Package format and is NOT intended to be usable as-is. This is intentional and there is a good reason for this! Here's why...

I use this BOTH from iOS and Vapor 4 on linux. Linux does not have access to iOS API's such as URLRequest, and similarly I don't include Vapor libraries in my iOS client.

The Solution:

I use protocol extensions on StripeAPIEndpoint to provide easy type-safe asynchronous usage. After a little refining of those I will be happy to share those as well. I'm not sure though if they should be just code snippets or in their own Swift Packages. I'm posting this publicly to see if there is any interest so let me know if you're interested and any comments you might have.

- Jon
