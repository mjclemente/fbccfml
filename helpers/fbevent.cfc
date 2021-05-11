/**
* FBC CFML
* Copyright 2021  Matthew J. Clemente, John Berquist
* Licensed under MIT (https://mit-license.org)
*/
component accessors="true" {

  property name="event_name" default="";
  property name="event_time" default="";
  property name="action_source" default="";
  property name="user_data" default="";
  property name="custom_data" default="";
  property name="event_source_url" default="";
  property name="opt_out" default="";
  property name="event_id" default="";
  property name="data_processing_options" default="";
  property name="data_processing_options_country" default="";
  property name="data_processing_options_state" default="";

  /**
  * @hint setters will be called on all arguments passed in
  */
  public any function init() {

    variables.utcBaseDate = dateAdd( "l", createDate( 1970,1,1 ).getTime() * -1, createDate( 1970,1,1 ) );

    setEvent_time( getUTCTimestamp( now() ) );
    setUser_data( {} );
    setCustom_data( {} );
    setData_processing_options([]);
    clientIpAddress( getRemoteIp() );
    clientUserAgent( cgi.HTTP_USER_AGENT );
    fbc( cookie?._fbc ?: '' );
    fbp( cookie?._fbp ?: '' );

    return this;
  }

  /**
  * @hint Set the `event_name`, which must be a Facebook pixel Standard Event or Custom Event name. This field is used to deduplicate events sent by both Facebook Pixel and Conversions API. `event_id` is also used in deduplication.
  */
  public any function eventName( required string event_name ) {
    setEvent_name( event_name );
    return this;
  }

  /**
  * @hint Convenience method for setting `event_name`
  */
  public any function name( required string event_name ){
    return eventName( event_name );
  }

  /**
  * @hint Set the `event_time`, which is a Unix timestamp in seconds indicating when the actual event occurred. The specified time may be earlier than the time you send the event to Facebook. This is to enable batch processing and server performance optimization.
  * @event_time can be passed in as a datetime (which will be automatically converted to a unix timestamp (or you can pass in the unix timestamp yourself. The datetime can be up to 7 days before you send an event to Facebook. If any `event_time` in data is greater than 7 days in the past, FB will return an error for the entire request and process no events.
  */
  public any function eventTime( required any event_time ) {
    if( isValid('integer', event_time ) ){
      setEvent_time( event_time );
    } else {
      setEvent_time( getUTCTimestamp( event_time ) );
    }
    return this;
  }

  /**
  * @hint Convenience method for setting `event_time`
  */
  public any function time( required any event_time ) {
    return eventTime( event_time );
  }

  /**
  * @hint Set the `action_source`, which is required.
  * @action_source allows the possible values: `email`, `website`, `phone_call`, `chat`, `physical_store`, `system_generated`, `other`
  */
  public any function actionSource( required string action_source ) {
    setAction_source( action_source );
    return this;
  }

  /**
  * @hint Convenience method for setting `action_source`
  */
  public any function source( required string action_source ){
    return actionSource( action_source );
  }

  /**
  * @hint Set all `user_data`. Use with care - will override any user data values set individually.
  * @user_data should be a map that contains customer information data.
  */
  public any function userData( required struct user_data ) {
    setUser_data( user_data );
    return this;
  }

  /**
  * @hint Set all `custom_data`. Use with care - will override any custom data values set individually.
  * @custom_data should be map that contains customer information data.
  */
  public any function customData( required struct custom_data ) {
    setCustom_data( custom_data );
    return this;
  }

  /**
  * @hint Set the `event_source_url`. Required for website events shared using the Conversions API.
  * @event_source_url is the browser URL where the event happened. The URL must begin with http:// or https:// and should match the verified domain.
  */
  public any function eventSourceUrl( required string event_source_url ){
    setEvent_source_url( event_source_url );
    return this;
  }

  /**
  * @hint Convenience method for setting `event_source_url`
  */
  public any function url( required any event_source_url ) {
    return eventSourceUrl( event_source_url );
  }

  /**
  * @hint Set the `opt_out` property, which is a flag that indicates FB should not use this event for ads delivery optimization. If set to true, FB will only use the event for attribution.
  */
  public any function optout( boolean opt_out = true ) {
    setOpt_out( opt_out ? 1 : 0 );
    return this;
  }

  /**
  * @hint Set the `event_id`. This is not required and can be any unique string chosen by the advertiser. `event_id` is used to deduplicate events sent by both Facebook Pixel and Conversions API. `event_name` is also used in deduplication. For deduplication, the `eventID` from a browser event must match the `event_id` in the corresponding server event.
  */
  public any function eventId( required string event_id ) {
    setEvent_id( event_id );
    return this;
  }

  /**
  * @hint Convenience method for setting `event_id`
  */
  public any function id( required any event_id ) {
    return eventId( event_id );
  }

  /**
  * @hint Set the `data_processing_options`. Processing options you would like to enable for a specific event. Current accepted value is `LDU` for Limited Data Use. An empty array can be sent to explicitly specify that this event shouldn't be processed with the Limited Data Use restrictions.
  */
  public any function dataProcessingOptions( required array data_processing_options ) {
    setData_processing_options( data_processing_options );
    return this;
  }

  /**
  * @hint Set the `data_processing_options_country`. Required if you set the `LDU` data processing option. Current accepted values are 1, for the United States of America, or 0, to request that FB geolocate that event.
  */
  public any function dataProcessingOptionsCountry( required numeric data_processing_options_country ) {
    setData_processing_options_country( data_processing_options_country );
    return this;
  }

  /**
  * @hint Set the `data_processing_options_state`. Required in some cases - read the docs. Current accepted values are 1000, for California, or 0, to request that FB geolocate that event.
  */
  public any function dataProcessingOptionsState( required numeric data_processing_options_state ) {
    setData_processing_options_state( data_processing_options_state );
    return this;
  }

  /**
  * @hint Set the `user_data.em` property. Automatically hashed.
  */
  public any function userEmail( required string em ){
    variables['user_data']['em'] = hashFunction(em);
    return this;
  }

  /**
  * @hint Convenience method for setting `user_data.em`
  */
  public any function email( required string em ){
    return userEmail( em );
  }

  /**
  * @hint Set the `user_data.ph` property. Automatically hashed.
  * @ph is a phone number. Include only digits with country code, area code, and number. Remove symbols, letters, and any leading zeros. In addition, always include the country code as part of the customer phone number, even if all of the data is from the same country, as the country code is used for matching.
  */
  public any function userPhone( required string ph ){
    variables['user_data']['ph'] = hashFunction(ph);
    return this;
  }

  /**
  * @hint Convenience method for setting `user_data.ph`
  */
  public any function phone( required string ph ){
    return userPhone( ph );
  }

  /**
  * @hint Set the `user_data.ge` property. Automatically hashed.
  * @ge is the user gender, in lowercase. Either f or m.
  */
  public any function userGender( required string gen ){
    variables['user_data']['ge'] = hashFunction(gen);
    return this;
  }

  /**
  * @hint Convenience method for setting `user_data.gen`
  */
  public any function gender( required string gen ){
    return userGender( gen );
  }

  /**
  * @hint Set the `user_data.db` property. Automatically hashed.
  * @db A date of birth given as year, month, and day. Example: `19971226` for December 26, 1997.
  */
  public any function userDateOfBirth( required string db ){
    variables['user_data']['db'] = hashFunction(db);
    return this;
  }

  /**
  * @hint Convenience method for setting `user_data.db`
  */
  public any function dateOfBirth( required string db ){
    return userDateOfBirth( db );
  }

  /**
  * @hint Set the `user_data.ln` property. Automatically hashed.
  */
  public any function userLastName( required string ln ){
    variables['user_data']['ln'] = hashFunction(ln);
    return this;
  }

  /**
  * @hint Convenience method for setting `user_data.ln`
  */
  public any function lastName( required string ln ){
    return userLastName( ln );
  }

  /**
  * @hint Set the `user_data.fn` property. Automatically hashed.
  */
  public any function userFirstName( required string fn ){
    variables['user_data']['fn'] = hashFunction(fn);
    return this;
  }

  /**
  * @hint Convenience method for setting `user_data.fn`
  */
  public any function firstName( required string fn ){
    return userFirstName( fn );
  }

  /**
  * @hint Set the `user_data.ct` property. Automatically hashed.
  */
  public any function userCity( required string ct ){
    variables['user_data']['ct'] = hashFunction(ct.rereplacenocase('[^a-z]',''));
    return this;
  }

  /**
  * @hint Convenience method for setting `user_data.ct`
  */
  public any function city( required string ct ){
    return userCity( ct );
  }

  /**
  * @hint Set the `user_data.st` property. Automatically hashed.
  * @st is the two letter state code
  */
  public any function userState( required string st ){
    variables['user_data']['st'] = hashFunction(st);
    return this;
  }

  /**
  * @hint Convenience method for setting `user_data.st`
  */
  public any function state( required string st ){
    return userState( st );
  }

  /**
  * @hint Set the `user_data.zp` property. Automatically hashed.
  * @zp is a five-digit zip code in the United States. For other locations, follow each country's standards.
  */
  public any function userZip( required string zp ){
    variables['user_data']['zp'] = hashFunction(zp);
    return this;
  }

  /**
  * @hint Convenience method for setting `user_data.zp`
  */
  public any function zip( required string zp ){
    return userZip( zp );
  }

  /**
  * @hint Set the `user_data.country` property. Automatically hashed.
  * @country is the two letter country code
  */
  public any function userCountry( required string country ){
    variables['user_data']['country'] = hashFunction(country);
    return this;
  }

  /**
  * @hint Convenience method for setting `user_data.country`
  */
  public any function country( required string country ){
    return userCountry( country );
  }

  /**
  * @hint Set the `user_data.external_id` property. Automatically hashed.
  * @external_id is any unique ID from the advertiser, such as loyalty membership IDs, user IDs, and external cookie IDs.
  */
  public any function userExternalId( required string external_id ){
    variables['user_data']['external_id'] = hashFunction(external_id);
    return this;
  }

  /**
  * @hint Convenience method for setting `user_data.external_id`
  */
  public any function externalId( required string external_id ){
    return userExternalId( external_id );
  }

  /**
  * @hint Set the `user_data.client_ip_address` property. Not hashed.
  * @client_ip_address is the IP address of the browser corresponding to the event.
  */
  public any function clientIpAddress( required string client_ip_address ){
    variables['user_data']['client_ip_address'] = client_ip_address;
    return this;
  }

  /**
  * @hint Set the `user_data.client_user_agent` property. Not hashed.
  * @client_user_agent is the user agent for the browser corresponding to the event.
  */
  public any function clientUserAgent( required string client_user_agent ){
    variables['user_data']['client_user_agent'] = client_user_agent;
    return this;
  }

  /**
  * @hint Set the `user_data.fbc` property. Not hashed.
  * @fbc is the Facebook click ID value stored in the _fbc browser cookie under your domain.
  */
  public any function fbc( required string fbc ){
    variables['user_data']['fbc'] = fbc;
    return this;
  }

  /**
  * @hint Set the `user_data.fbp` property. Not hashed.
  * @fbp is the Facebook browser ID value stored in the _fbp browser cookie under your domain
  */
  public any function fbp( required string fbp ){
    variables['user_data']['fbp'] = fbp;
    return this;
  }

  /**
  * @hint Set the `user_data.subscription_id` property. Not hashed.
  * @subscription_id is the subscription ID for the user in this transaction.
  */
  public any function subscriptionId( required string subscription_id ){
    variables['user_data']['subscription_id'] = subscription_id;
    return this;
  }

  /**
  * @hint Set the `user_data.lead_id` property. Not hashed.
  * @lead_id is the ID associated with a lead generated by Facebook's Lead Ads.
  */
  public any function leadId( required string lead_id ){
    variables['user_data']['lead_id'] = lead_id;
    return this;
  }

  /**
  * @hint Set the `user_data.fb_login_id` property. Not hashed.
  * @fb_login_id is the ID issued by Facebook when a person first logs into an instance of an app.
  */
  public any function fbLoginId( required string fb_login_id ){
    variables['user_data']['fb_login_id'] = fb_login_id;
    return this;
  }

  /**
  * @hint Set the `custom_data.value` property.
  * @value is a numeric value associated with this event. This could be a monetary value or a value in some other metric.
  */
  public any function value( required numeric value ){
    variables['custom_data']['value'] = value;
    return this;
  }

  /**
  * @hint Set the `custom_data.currency` property.
  * @currency is the currency for the value specified, if applicable. Currency must be a valid ISO 4217 three digit currency code.
  */
  public any function currency( required string currency ){
    variables['custom_data']['currency'] = currency;
    return this;
  }

  /**
  * @hint Set the `custom_data.content_name` property.
  * @content_name is the name of the page or product associated with the event.
  */
  public any function contentName( required string content_name ){
    variables['custom_data']['content_name'] = content_name;
    return this;
  }

  /**
  * @hint Set the `custom_data.content_category` property.
  * @content_category is the category of the content associated with the event.
  */
  public any function contentCategory( required string content_category ){
    variables['custom_data']['content_category'] = content_category;
    return this;
  }

  /**
  * @hint Set the `custom_data.content_ids` property. If any values were set, this overrides them.
  * @content_ids is an array that contains the content IDs associated with the event, such as product SKUs for items in an AddToCart event
  */
  public any function contentIds( required array content_ids ){
    variables['custom_data']['content_ids'] = content_ids;
    return this;
  }

  /**
  * @hint Add individual content_ids to the `custom_data.content_ids` array
  */
  public any function addContentId( required string content_id ){
    if( variables.custom_data.keyExists('content_ids') ){
      variables.custom_data.content_ids.append( content_id );
    } else {
      variables['custom_data']['content_ids'] = [content_id];
    }
    return this;
  }

  /**
  * @hint Set the `custom_data.contents` property. If any values were set, this overrides them.
  * @contents is an array that contains JSON objects that contain the product IDs associated with the event plus information about the products. `id`, `quantity`, and `item_price` are available fields.
  */
  public any function contents( required array contents ){
    variables['custom_data']['contents'] = contents;
    return this;
  }

  /**
  * @hint Add individual content items to the `custom_data.contents` array
  */
  public any function addContent( required struct content ){
    if( variables.custom_data.keyExists('contents') ){
      variables.custom_data.contents.append( content );
    } else {
      variables['custom_data']['contents'] = [content];
    }
    return this;
  }

  /**
  * @hint Set the `custom_data.content_type` property.
  * @content_type should be set to `product` or `product_group`. See the documentation for more information.
  */
  public any function contentType( required string content_type ){
    variables['custom_data']['content_type'] = content_type;
    return this;
  }

  /**
  * @hint Set the `custom_data.order_id` property.
  * @order_id is the order ID for this transaction as a String.
  */
  public any function orderId( required string order_id ){
    variables['custom_data']['order_id'] = order_id;
    return this;
  }

  /**
  * @hint Set the `custom_data.predicted_ltv` property.
  * @predicted_ltv is the predicted lifetime value of a conversion event.
  */
  public any function predictedLtv( required string predicted_ltv ){
    variables['custom_data']['predicted_ltv'] = predicted_ltv;
    return this;
  }

  /**
  * @hint Convenience method for setting `custom_data.predicted_ltv`
  */
  public any function predictedLifetimeValue( required string predicted_ltv ){
    return predictedLtv( predicted_ltv );
  }

  /**
  * @hint Set the `custom_data.num_items` property. Should be used only with `InitiateCheckout` events.
  * @num_items is the number of items that a user tries to buy during checkout.
  */
  public any function numItems( required string num_items ){
    variables['custom_data']['num_items'] = num_items;
    return this;
  }

  /**
  * @hint Set the `custom_data.search_string` property. Should be used only with `Search` events.
  * @search_string is a search query made by a user
  */
  public any function searchString( required string search_string ){
    variables['custom_data']['search_string'] = search_string;
    return this;
  }

  /**
  * @hint Set the `custom_data.status` property. Should be used only with `CompleteRegistration` events.
  * @status is the status of the registration event.
  */
  public any function status( required string status ){
    variables['custom_data']['status'] = status;
    return this;
  }

  /**
  * @hint Set the `custom_data.delivery_category` property.
  * @delivery_category is the type of delivery for a purchase event. Supported values are `in_store`, `curbside`, or `home_delivery`
  */
  public any function deliveryCategory( required string delivery_category ){
    variables['custom_data']['delivery_category'] = delivery_category;
    return this;
  }


  /**
  * @hint Assembles the JSON to send to the API. Generally, you shouldn't need to call this directly.
  */
  public string function build() {

    var body = '';
    var properties = getPropertyValues();
    var count = properties.len();

    properties.each(
      function( property, index ) {

        var value = serializeJSON( property.value );
        body &= '"#property.key#": ' & value & '#index NEQ count ? "," : ""#';
      }
    );

    return '{' & body & '}';
  }

  private numeric function getUTCTimestamp( required date dateToConvert ) {
    return dateDiff( "s", variables.utcBaseDate, dateToConvert );
  }

  private date function parseUTCTimestamp( required numeric utcTimestamp ) {
    return dateAdd( "s", utcTimestamp, variables.utcBaseDate );
  }

  /**
  * @hint converts the array of properties to an array of their keys/values, while filtering those that have not been set
  */
  private array function getPropertyValues() {

    var propertyValues = getProperties().map(
      function( item, index ) {
        return {
          "key" : item.name,
          "value" : getPropertyValue( item.name )
        };
      }
    );

    return propertyValues.filter(
      function( item, index ) {
        return hasValue( item.value );
      }
    );
  }

  private array function getProperties() {

    var metaData = getMetaData( this );
    var properties = [];

    for( var prop in metaData.properties ) {
      properties.append( prop );
    }

    return properties;
  }

  private any function getPropertyValue( string key ){
    var method = this["get#key#"];
    var value = method();
    return value;
  }

  private boolean function hasValue( any value ) {
    if ( isNull( value ) ) return false;
    if ( isSimpleValue( value ) ) return len( value );
    if ( isStruct( value ) ) return !value.isEmpty();
    if ( isArray( value ) ) return value.len();

    return false;
  }

  private boolean function isAlreadyHashed(input){
    return refind('^[A-Fa-f0-9]{64}$',input);
  }


  private string function hashFunction(input){
    if( isNull(input) || isAlreadyHashed(input) ){
      return input;
    }

    return hash(lcase(trim(input)), 'SHA-256');
  }

  private string function getRemoteIp(){
    if( len(cgi.http_x_real_ip) ){
      return trim(listFirst( cgi.http_x_real_ip ) );
    }
		if( len( cgi.http_x_forwarded_for ) ) {
			return trim( listFirst( cgi.http_x_forwarded_for ) );
		}
    if( len( cgi.http_x_cluster_client_ip)  ) {
			return trim( listFirst( cgi.http_x_cluster_client_ip ) );
		}
		return cgi.remote_addr;
	}
}
