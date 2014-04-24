$.ajaxSetup({
  headers: {
	  'X-Transaction': 'POST Example',
	  'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
	}
});