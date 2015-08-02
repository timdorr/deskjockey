# Desk Jockey - Custom Zendesk Widget

A custom feedback and support widget for Zendesk.

[My company](http://salesloft.com) is a two product company and we use a ticket field to separate out our incoming
tickets to separate support groups for each one. Because Zendesk's own "Feedback Tab" widget doesn't support passing
custom fields, a more flexible solution was needed. This widget serves that purpose for us.

Right now it's a fairly basic, with only a simple iframe widget that goes through some standard server-rendered pages.
In the future, it will load things more dynamically and have a much prettier exterior.

## Requirements

- jQuery 1.6 or higher in the app containing the widget

## Installation

First, set up and run this Rails project somewhere. It does not need a database or anything else special.

Then, include the tag to load the javascript and give it a link to click (you can style this link to your liking):
```html
<script id="zdWidgetScript" type="text/javascript" src="http://myzdwidgetapp.herokuapp.com/widget.js"></script>
<div id="zdOpenWidget"><img src="/images/support.png"></div>
```
There is some required CSS so the widget modal can be shown. This is formatted as SCSS:
```scss
#zdWidgetOverlay {
  display: none;
  position: fixed;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
  padding: 30px 0;
  background-color: rgba(0, 0, 0, 0.5);
  opacity: 0;
  outline: 0;
  z-index: 1060;
  overflow-x: hidden;
  overflow-y: auto;
  @include transition(opacity, 0.3s);

  &.in {
    display: block;
    opacity: 1;
  }
}

#zdWidgetContainer {
  position: relative;
  width: 600px;
  height: 400px;
  margin: 0 auto;
  padding: 15px;
  background-color: white;
  box-shadow: 0 5px 15px rgba(0,0,0,0.25);
  border-radius: 5px;

  iframe {
    width: 100%;
    height: 100%;
    border: 0;
  }
}
```
Then you can call this JS to initialize the widget:
```js
if (typeof window.zdWidget !== "undefined") {
  zdWidget.init({
    name:     "<%= current_user.name %>",
    email:    "<%= current_user.email %>",
    category: 1234567890,
    fields:   {
      1234567890: "some value"
    }
    chat: true,
    chat_tags: 'Admin,SalesLoft',
    chat_department: 'Support'
  });
```
These are the fields taken in:
- `name` - The requester's name.
- `email` - The requester's email address.
- `category` - (optional) The ID of the help center category to limit your searches to.
- `fields` - (optional) A object of custom fields to set on the ticket. The key is the ID of the field, and the value is the value.
- `chat` - (Defaults to false) Flag turning on Zopim Live Chat.
- `chat_tags` - (optional) String of comma seperated tags to add to current chat session.
- `chat_department` - (optional) Default department to direct the visitors current session.
