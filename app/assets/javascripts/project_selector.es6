$(() => {

  // Displays the project selector on hover over the caret.
  $('#project-selector .caret').hover(function(){
    $(this).parent().addClass('active')
  }, function(){
    const inter = setInterval(() => {
      if (!$('#project-selector ul').is(':hover')) {
        $(this).parent().removeClass('active')
        clearInterval(inter)
      }
    }, 2000)
  })

})