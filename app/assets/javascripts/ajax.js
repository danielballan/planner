$(function () {
  $('#manage-labels').live('click', function () {
    $.getScript(this.href);
    return false;
  });
})
