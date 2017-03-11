// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs

//= require bootstrap-sprockets

//= require components
//= require_tree .

//= require select2
//= require materialize-sprockets


$(document).ready(function() {

	 $('.carousel').carousel();


	$("select#simple-example").select2({
		  width: '100%',
		  placeholder: "Search Keywords",
		  ajax: {
		    url: "http://tryify.shop/api/v1/tags",
		    dataType: 'json',
		    delay: 250,
		    data: function (params) {
		      return {
		        key: params.term
		      };
		    },
		    processResults: function (data, params) {
		      // parse the results into the format expected by Select2
		      // since we are using custom formatting functions we do not need to
		      // alter the remote JSON data, except to indicate that infinite
		      // scrolling can be used
		      params.page = params.page || 1;

		      return {
		        results: data.tags,
		      };
		    },
		    cache: true
		  },
		  escapeMarkup: function (markup) { return markup; }, // let our custom formatter work
		  minimumInputLength: 1,
		  templateResult: formatKey, // omitted for brevity, see the source of this page
		  templateSelection: formatKeySelection // omitted for brevity, see the source of this page

		});




		function formatKey (key) {
			return key.name
		}


		function formatKeySelection (key) {
			console.log(key);

			if (key.name == "Add new tag") {
				return key.id;
			}else {
				return key.name;
			}

		}


})
