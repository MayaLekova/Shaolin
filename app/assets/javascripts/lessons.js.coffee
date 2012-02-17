# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).on 'click', '.submit-code', ->
  $this = $(this)
  code = $this.closest('.task-container').find('.code-text-area').val()
  task_id = $this.closest('.task-container').attr('data-id')

  $failure_paragraph = $this.closest('.task-container').find('.failure_feedback')
  $success_paragraph = $this.closest('.task-container').find('.success_feedback')
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
      if not data.compileStatus
        $failure_paragraph.show().text("There was an error running your code")
        return false
      if data.message is 'Correct'
        $success_paragraph.show()
      else
        $failure_paragraph.show().text("Expected was: #{data.expectation}\nYour code produced: #{data.output}")
  )
  return false
