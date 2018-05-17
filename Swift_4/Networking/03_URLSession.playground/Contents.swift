import Foundation
//: ## URLSession Challenge
//: __Instruction:__ Do the TODOs.
//:
//: Now we'll look more closely at `URLSessionConfiguration`.
//: ### Session Configurations & Sessions
//: The quickest way to get a session is to use the shared singleton session object:
let sharedSession = URLSession.shared
//: The shared singleton session object uses the __default configuration__,
//: for example, its `allowsCellularAccess` property has the default value `true`:
sharedSession.configuration.allowsCellularAccess
//: You cannot change this value in the session:
sharedSession.configuration.allowsCellularAccess = false
// check the value of allowsCellularAccess:
sharedSession.configuration.allowsCellularAccess
//: TODO: To create a session that doesn't allow cellular access,
//: first create a configuration object:
let configSession = URLSessionConfiguration.default
// check the value of allowsCellularAccess:
configSession.allowsCellularAccess
configSession.waitsForConnectivity


//: TODO: Then change its `allowsCellularAccess` property to `false`:
configSession.allowsCellularAccess = false
// check the value of allowsCellularAccess:
configSession.allowsCellularAccess

//: TODO: Set `waitsForConnectivity` to `true`, for this non-background configuration:
configSession.waitsForConnectivity = true
//: TODO: Set `multipathServiceType` to `.handover`, and update `allowsCellularAccess` to match:
configSession.multipathServiceType = .handover
configSession.allowsCellularAccess = true
//: TODO: Now create a session with this configuration:
let urlSession = URLSession(configuration: configSession)
// check the session's values of the configuration properties you set:
urlSession.configuration.allowsCellularAccess
urlSession.configuration.multipathServiceType
urlSession.configuration.waitsForConnectivity


//: You can also create a session with the default configuration, if you don't need to change any properties:
let defaultSession = URLSession(configuration: .default)
//: And the value of `allowsCellularAccess` is the default value `true`:
defaultSession.configuration.allowsCellularAccess
//: ### Customize the Cache
//: The disk capacity of the default configuration is 10 million bytes:
URLSessionConfiguration.default.urlCache?.diskCapacity
//: TODO: Look at the memory capacity of the cache:
URLSessionConfiguration.default.urlCache?.memoryCapacity
//: TODO: Create a new ephemeral configuration, and check the disk and memory capacity of its cache:
let configSessionEphemeral = URLSessionConfiguration.ephemeral
configSessionEphemeral.urlCache?.diskCapacity
configSessionEphemeral.urlCache?.memoryCapacity


//: An ephemeral configuration has no persistent storage for cache, cookies or credentials,
//: but there might be a situation where you want a persistent cache, 
//: and are happy with not persisting cookies or credentials.
//:
//: TODO: Create a URLCache object with `memoryCapacity` 512000 and `diskCapacity` 10000000, and
//: assign it to the configuration's `urlCache` property:
let cacheUrl = URLCache(memoryCapacity: 521000, diskCapacity: 10000000, diskPath: nil)
cacheUrl.diskCapacity
cacheUrl.memoryCapacity
configSessionEphemeral.urlCache = cacheUrl

// check the value of diskCapacity:
configSessionEphemeral.urlCache?.diskCapacity

