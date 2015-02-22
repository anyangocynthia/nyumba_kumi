$(function() {
	$('#toggle_articles').change(function(e) {
	    if (this.checked) {
	      $('.articles_table').checkboxes('check');
	      e.preventDefault();
	    }
	    else {
	      $('.articles_table').checkboxes('uncheck');
	      e.preventDefault();
	    }
	});

	$('#delete-articles').click(function(){
	  if ($(".articles_table input:checked").length < 1)
	  {
	    alert("You have not selected any articles to be deleted.");
	    return false;
	  }
	  else
	  {
	    articles_array = []
	    $(".articles_table input:checked").each(function(){
	      articles_array.push($(this).attr('value'))
	    });
	    $('#delete_articles').val(articles_array);
	    // contact_num = ("#articles_table input:checked").length;
	    $('#delete_modal #lbl-msg').html('You are about to delete '+String(articles_array.length)+' articles');
	    $('#delete_modal')
	    .modal('setting', {
	      onApprove: function(){
	        $(this).find('form').submit();
	      }
	    })
	    .modal('show');
	  }
	});
})