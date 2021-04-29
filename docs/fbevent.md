# `fbevent.cfc` Reference

#### `eventName( required string event_name )`

Set the `event_name`, which must be a Facebook pixel Standard Event or Custom Event name. This field is used to deduplicate events sent by both Facebook Pixel and Conversions API. `event_id` is also used in deduplication.

#### `name( required string event_name )`

Convenience method for setting `event_name`.

#### `eventTime( required any event_time )`

Set the `event_time`, which is a Unix timestamp in seconds indicating when the actual event occurred. The specified time may be earlier than the time you send the event to Facebook. This is to enable batch processing and server performance optimization. The parameter `event_time` can be passed in as a datetime (which will be automatically converted to a unix timestamp (or you can pass in the unix timestamp yourself. The datetime can be up to 7 days before you send an event to Facebook. If any `event_time` in data is greater than 7 days in the past, FB will return an error for the entire request and process no events.

#### `time( required any event_time )`

Convenience method for setting `event_time`.

#### `actionSource( required string action_source )`

Set the `action_source`, which is required. The parameter `action_source` allows the possible values: `email`, `website`, `phone_call`, `chat`, `physical_store`, `system_generated`, `other`.

#### `source( required string action_source )`

Convenience method for setting `action_source`.

#### `userData( required struct user_data )`

Set all `user_data`. Use with care - will override any user data values set individually. The parameter `user_data` should be a map that contains customer information data.

#### `customData( required struct custom_data )`

Set all `custom_data`. Use with care - will override any custom data values set individually. The parameter `custom_data` should be map that contains customer information data.

#### `eventSourceUrl( required string event_source_url )`

Set the `event_source_url`. Required for website events shared using the Conversions API. The parameter `event_source_url` is the browser URL where the event happened. The URL must begin with http:// or https:// and should match the verified domain.

#### `url( required any event_source_url )`

Convenience method for setting `event_source_url`.

#### `optout( boolean opt_out=true )`

Set the `opt_out` property, which is a flag that indicates FB should not use this event for ads delivery optimization. If set to true, FB will only use the event for attribution.

#### `eventId( required string event_id )`

Set the `event_id`. This is not required and can be any unique string chosen by the advertiser. `event_id` is used to deduplicate events sent by both Facebook Pixel and Conversions API. `event_name` is also used in deduplication. For deduplication, the `eventID` from a browser event must match the `event_id` in the corresponding server event.

#### `id( required any event_id )`

Convenience method for setting `event_id`.

#### `dataProcessingOptions( required array data_processing_options )`

Set the `data_processing_options`. Processing options you would like to enable for a specific event. Current accepted value is `LDU` for Limited Data Use. An empty array can be sent to explicitly specify that this event shouldn't be processed with the Limited Data Use restrictions.

#### `dataProcessingOptionsCountry( required numeric data_processing_options_country )`

Set the `data_processing_options_country`. Required if you set the `LDU` data processing option. Current accepted values are 1, for the United States of America, or 0, to request that FB geolocate that event.

#### `dataProcessingOptionsState( required numeric data_processing_options_state )`

Set the `data_processing_options_state`. Required in some cases - read the docs. Current accepted values are 1000, for California, or 0, to request that FB geolocate that event.

#### `userEmail( required string em )`

Set the `user_data.em` property. Automatically hashed.

#### `email( required string em )`

Convenience method for setting `user_data.em`.

#### `userPhone( required string ph )`

Set the `user_data.ph` property. Automatically hashed. The parameter `ph` is a phone number. Include only digits with country code, area code, and number. Remove symbols, letters, and any leading zeros. In addition, always include the country code as part of the customer phone number, even if all of the data is from the same country, as the country code is used for matching.

#### `phone( required string ph )`

Convenience method for setting `user_data.ph`.

#### `userGender( required string gen )`

Set the `user_data.ge` property. Automatically hashed.

#### `gender( required string gen )`

Convenience method for setting `user_data.gen`.

#### `userDateOfBirth( required string db )`

Set the `user_data.db` property. Automatically hashed. The parameter `db` A date of birth given as year, month, and day. Example: `19971226` for December 26, 1997.

#### `dateOfBirth( required string db )`

Convenience method for setting `user_data.db`.

#### `userLastName( required string ln )`

Set the `user_data.ln` property. Automatically hashed.

#### `lastName( required string ln )`

Convenience method for setting `user_data.ln`.

#### `userFirstName( required string fn )`

Set the `user_data.fn` property. Automatically hashed.

#### `firstName( required string fn )`

Convenience method for setting `user_data.fn`.

#### `userCity( required string ct )`

Set the `user_data.ct` property. Automatically hashed.

#### `city( required string ct )`

Convenience method for setting `user_data.ct`.

#### `userState( required string st )`

Set the `user_data.st` property. Automatically hashed. The parameter `st` is the two letter state code.

#### `state( required string st )`

Convenience method for setting `user_data.st`.

#### `userZip( required string zp )`

Set the `user_data.zp` property. Automatically hashed. The parameter `zp` is a five-digit zip code in the United States. For other locations, follow each country's standards.

#### `zip( required string zp )`

Convenience method for setting `user_data.zp`.

#### `userCountry( required string country )`

Set the `user_data.country` property. Automatically hashed. The parameter `country` is the two letter country code.

#### `country( required string country )`

Convenience method for setting `user_data.country`.

#### `userExternalId( required string external_id )`

Set the `user_data.external_id` property. Automatically hashed. The parameter `external_id` is any unique ID from the advertiser, such as loyalty membership IDs, user IDs, and external cookie IDs.

#### `externalId( required string external_id )`

Convenience method for setting `user_data.external_id`.

#### `clientIpAddress( required string client_ip_address )`

Set the `user_data.client_ip_address` property. Not hashed. The parameter `client_ip_address` is the IP address of the browser corresponding to the event.

#### `clientUserAgent( required string client_user_agent )`

Set the `user_data.client_user_agent` property. Not hashed. The parameter `client_user_agent` is the user agent for the browser corresponding to the event.

#### `fbc( required string fbc )`

Set the `user_data.fbc` property. Not hashed. The parameter `fbc` is the Facebook click ID value stored in the _fbc browser cookie under your domain.

#### `fbp( required string fbp )`

Set the `user_data.fbp` property. Not hashed. The parameter `fbp` is the Facebook browser ID value stored in the _fbp browser cookie under your domain.

#### `subscriptionId( required string subscription_id )`

Set the `user_data.subscription_id` property. Not hashed. The parameter `subscription_id` is the subscription ID for the user in this transaction.

#### `leadId( required string lead_id )`

Set the `user_data.lead_id` property. Not hashed. The parameter `lead_id` is the ID associated with a lead generated by Facebook's Lead Ads.

#### `fbLoginId( required string fb_login_id )`

Set the `user_data.fb_login_id` property. Not hashed. The parameter `fb_login_id` is the ID issued by Facebook when a person first logs into an instance of an app.

#### `value( required numeric value )`

Set the `custom_data.value` property. The parameter `value` is a numeric value associated with this event. This could be a monetary value or a value in some other metric.

#### `currency( required string currency )`

Set the `custom_data.currency` property. The parameter `currency` is the currency for the value specified, if applicable. Currency must be a valid ISO 4217 three digit currency code.

#### `contentName( required string content_name )`

Set the `custom_data.content_name` property. The parameter `content_name` is the name of the page or product associated with the event.

#### `contentCategory( required string content_category )`

Set the `custom_data.content_category` property. The parameter `content_category` is the category of the content associated with the event.

#### `contentIds( required array content_ids )`

Set the `custom_data.content_ids` property. If any values were set, this overrides them. The parameter `content_ids` is an array that contains the content IDs associated with the event, such as product SKUs for items in an AddToCart event.

#### `addContentId( required string content_id )`

Add individual content_ids to the `custom_data.content_ids` array.

#### `contents( required array contents )`

Set the `custom_data.contents` property. If any values were set, this overrides them. The parameter `contents` is an array that contains JSON objects that contain the product IDs associated with the event plus information about the products. `id`, `quantity`, and `item_price` are available fields.

#### `addContent( required struct content )`

Add individual content items to the `custom_data.contents` array.

#### `contentType( required string content_type )`

Set the `custom_data.content_type` property. The parameter `content_type` should be set to `product` or `product_group`. See the documentation for more information.

#### `orderId( required string order_id )`

Set the `custom_data.order_id` property. The parameter `order_id` is the order ID for this transaction as a String.

#### `predictedLtv( required string predicted_ltv )`

Set the `custom_data.predicted_ltv` property. The parameter `predicted_ltv` is the predicted lifetime value of a conversion event.

#### `predictedLifetimeValue( required string predicted_ltv )`

Convenience method for setting `custom_data.predicted_ltv`.

#### `numItems( required string num_items )`

Set the `custom_data.num_items` property. Should be used only with `InitiateCheckout` events. The parameter `num_items` is the number of items that a user tries to buy during checkout.

#### `searchString( required string search_string )`

Set the `custom_data.search_string` property. Should be used only with `Search` events. The parameter `search_string` is a search query made by a user.

#### `status( required string status )`

Set the `custom_data.status` property. Should be used only with `CompleteRegistration` events. The parameter `status` is the status of the registration event.

#### `deliveryCategory( required string delivery_category )`

Set the `custom_data.delivery_category` property. The parameter `delivery_category` is the type of delivery for a purchase event. Supported values are `in_store`, `curbside`, or `home_delivery`.

#### `build()`

Assembles the JSON to send to the API. Generally, you shouldn't need to call this directly.

