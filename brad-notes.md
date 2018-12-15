## get serializers working
- json data at all intended controller actions (these are your api endpoints)

## get jquery and javascript working
- Rails asset pipeline
- confirm that you have (document ready) working
- verify in Chrome console
- verify in DOM (replace something on the DOM using JavaScript / jQuery to validate JS / jQuery are working)

## create a request to get JSON
- index of  JSON objects format, from Rails
- research $.ajax request
- research javascript fetch request
- these return a Promise, which recieves a callback function that handles the response data you got back from your request

## turn that response into a JavaScript Model Object
- research JS Object Model and class constructor
- similar to a Ruby class with attr_accessors for attributes
- instance of class accepts an object `{key: 'value'}` pairs, which match the constructor in your JS class

```javascript 
class Dog {
 constructor(obj){
  this.name = obj.name
  this.breed = obj.breed
  this.age = obj.age
 }
}
```

## custom functions on prototype of JS class
- a function that makes Dog speak:
```javascript
Dog.prototype.speak = function(){
  console.log(`My name is ${this.name}. I am a ${this.breed} and I am ${this.age} years old.`)
}
```


- a function that creates Dog html to append to DOM
```javascript 
Dog.prototype.dogHTML = function(){
  return (`
    <div>
      <p>Name: ${this.name}</p>
      <p>Name: ${this.age}</p>
      <p>Name: ${this.breed}</p>
			<button class='dog-details'>More Info</button>
    `)
  })
}
```

## use class and custom functions to process the JSON data you get from your ajax or fetch requests
- the data coming back from ajax request is JSON
- you can't put JSON directly on the DOM
- class and custom functions organzie your code for dealing with that JSON data
	- to turn it into a Javascript Object 
	- to create pre-planned html for appending to DOM
	- to do creative things with your data, on the Javascript side

## use a css selector to 'listen' for click of button
- this button has a class:
```javascript
<button class='dog-details'>More Info</button>
```
- listen to that class of button, for click
- on click, fire another ajax or fetch request to get the dog details 
	- (your show route in your dog controller)
- just like with index, process the response JSON data
- append it to the DOM

## use the above techniques
- to render index, 
- and click on one of the items to show a `has_many` relationship 
- with JSON data from Rails