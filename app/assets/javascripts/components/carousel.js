// var carousel = React.createClass({
//   propTypes: {
//     value: React.PropTypes.string
//   },

//   render: function() {
//     return (
// 	  	<a class="carousel-item" href="#one!"><img src="http://lorempixel.com/250/250/nature/1"></a>
// 	    <a class="carousel-item" href="#two!"><img src="http://lorempixel.com/250/250/nature/2"></a>
// 	    <a class="carousel-item" href="#three!"><img src="http://lorempixel.com/250/250/nature/3"></a>
// 	    <a class="carousel-item" href="#four!"><img src="http://lorempixel.com/250/250/nature/4"></a>
// 	    <a class="carousel-item" href="#five!"><img src="http://lorempixel.com/250/250/nature/5"></a>
//     );
//   }
// });		

var React = require('react');
var ReactDOM = require('react-dom');
var Coverflow = require('react-coverflow');

var fn = function () {
  /* do you want */  
}

ReactDOM.render(
  <Coverflow
    width={960}
    height={480}
    displayQuantityOfSide={2}
    navigation={false}
    enableHeading={false}
    >
    <img src='http://lorempixel.com/250/250/nature/1' alt='title or description' data-action={fn} />
    <img src='http://lorempixel.com/250/250/nature/2' alt='title or description' data-action="http://andyyou.github.io/react-coverflow/"/>
    <img src='http://lorempixel.com/250/250/nature/3' alt='title or description' data-action="http://andyyou.github.io/react-coverflow/"/>
  </Coverflow>, 

  document.querySelector('.content')
);


		 	