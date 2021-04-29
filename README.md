# Facebook Conversions - CFML

A CFML wrapper for the [Facebook Conversions API](https://developers.facebook.com/docs/marketing-api/conversions-api). Record Facebook conversions using their Server-Side API.

*Feel free to use the issue tracker to report bugs or suggest improvements!*

## Acknowledgements

This project borrows heavily from the API frameworks built by [jcberquist](https://github.com/jcberquist). Thanks to John for all the inspiration!

## Table of Contents

- [Quick Start](#quick-start)
- [Setup and Authentication](#setup-and-authentication)
- [Reference Manual](#reference-manual)
- [Reference Manual for `helpers.fbevent`](#reference-manual-for-helpersfbevent)

### Quick Start

The CFC only has one method, used to send events to Facebook. Here's how you use it, along with the helper component for building events:

```cfc
fbc = new path.to.fbccfml.facebookconversions( pixelId = 'xxx', accessToken = 'xxx' );

event = new path.to.fbccfml.helpers.fbevent()
  .name('Lead')
  .source('website')
  .url('https://www.your-website.com')
  .email( 'test@test.com')
  .phone('19999999999')
  .firstName('Jo')
  .lastName('McSign')
  .value(100);

res = facebookconversions.sendEvent( event );
writeDump( var='#res#', abort='true' );
```

### Setup and Authentication

To get started with the Facebook Conversions API, you'll need an [Pixel ID and Access Token](https://developers.facebook.com/docs/marketing-api/conversions-api/get-started).

Once you have these, you can provide them to this wrapper manually when creating the component, as in the Quick Start example above, or via environment variables named `FACEBOOKCONVERSIONS_PIXEL_ID` and `FACEBOOKCONVERSIONS_ACCESS_TOKEN`, which will get picked up automatically. This latter approach is generally preferable, as it keeps hardcoded credentials out of your codebase.

### Reference Manual

There is only one method:

#### `sendEvent( required any event )`

Send an event to Facebook. The parameter `event` expects an instance of the `helpers.fbevent` component, but you can construct and provide the struct/json yourself if you prefer.

### Reference Manual for `helpers.fbevent`

The reference manual for all public methods in `helpers/fbevent.cfc` can be found in the `docs` directory, [in `fbevent.md`](https://github.com/mjclemente/fbccfml/blob/main/docs/fbevent.md).

Unless indicated, all methods are chainable. To better understand how these work, you'll want to read the [documentation regarding Event parameters](https://developers.facebook.com/docs/marketing-api/conversions-api/parameters).

---
