var wrapper = $('<div/>').css({height:0,width:0,'overflow':'hidden'});
var fileInput = $(':file').wrap(wrapper);

fileInput.change(function(){
    $this = $(this);
    $('#file-input').text($this.val());
})

$('#file-input').click(function(){
    fileInput.click();
}).show();