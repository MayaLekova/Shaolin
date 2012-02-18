# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).on 'click', '.submit-code', ->
  $this = $(this)
  code = $this.closest('.task-container').find('.code-text-area').val()
  task_id = $this.closest('.task-container').attr('data-id')

  $container = $this.closest('.task-container')
  $failure_paragraph = $container.find('.failure_feedback')
  $success_paragraph = $container.find('.success_feedback')
  $hint_paragraph = $container.find('.hint')
  $.ajax(
    type: 'POST',
    url: $this.find('a').attr("href"),
    data: {
            id: task_id,
            code: code
          },
    dataType: 'json',
    success: (data, textStatus, jqXHR)->
      $failure_paragraph.hide()
      $success_paragraph.hide()
      $hint_paragraph.hide()
      if not data.compileStatus
        $failure_paragraph.show().text("There was an error running your code")
        return false
      if data.message is 'Correct'
        $success_paragraph.show()
        $container.attr('data-done', true)
      else
        $failure_paragraph.show().text("Expected was: #{data.expected}\nYour code produced: #{data.output}")
        $hint_paragraph.show().text(data.hint)
  )
  return false


$(document).on 'click', '#claim-points', ->
    $this = $(this)
    alert 'Soon, my child...'
