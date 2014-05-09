CKEDITOR.editorConfig = function( config )
{
	config.contentsCss = '/assets/mail.css.scss';
	config.extraPlugins = 'htmlbuttons';
	config.height = '400px';
	config.htmlbuttons = [
		{
			name: 'EMAIL',
			icon: 'mail.png',
			html: 'container.html',
			title: 'EMAIL'
		},
		{
			name: 'EMAILBTN',
			icon: 'mail.png',
			html: 'button.html',
			title: 'Email button'
		}
	];
	// It's magic but allow table style class
	config.allowedContent = true;
};


/* backup
config.toolbar_Full =
	[
		{ name: 'document', items : [ 'Sourcedialog','-','NewPage','DocProps','Preview','Print','-','Templates' ] },
		{ name: 'clipboard', items : [ 'Cut','Copy','Paste','PasteText','PasteFromWord','-','Undo','Redo' ] },
		{ name: 'editing', items : [ 'Find','Replace','-','SelectAll','-','SpellChecker', 'Scayt' ] },
		{ name: 'forms', items : [ 'Form', 'Checkbox', 'Radio', 'TextField', 'Textarea', 'Select', 'Button', 'ImageButton' ] },
		'/',
		{ name: 'basicstyles', items : [ 'Bold','Italic','Underline','Strike','Subscript','Superscript','-','RemoveFormat' ] },
		{ name: 'paragraph', items : [ 'NumberedList','BulletedList','-','Outdent','Indent','-','Blockquote','CreateDiv',
		'-','JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock','-','BidiLtr','BidiRtl' ] },
		{ name: 'links', items : [ 'Link','Unlink','Anchor' ] },
		{ name: 'insert', items : [ 'Image','Table','HorizontalRule','Smiley','SpecialChar','PageBreak','Iframe', 'MediaEmbed' ] },
		'/',
		{ name: 'styles', items : [ 'Styles','Format','Font','FontSize' ] },
		{ name: 'colors', items : [ 'TextColor','BGColor' ] },
		{ name: 'tools', items : [ 'Maximize', 'ShowBlocks','-','About' ] }
	];
	*/