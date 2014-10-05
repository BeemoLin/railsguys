$(function() {
  $("#post_start_date").datepicker({dateFormat: 'yy-mm-dd'});
});

function new_comment()
{
  var form = document.getElementById("new_comment");
  if (form.style.display==='none')
  {
    form.style.display = '';
  }
  else
  {
    form.style.display = 'none';
  }
}
