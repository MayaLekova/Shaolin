validators =
    'contains': (string, values) =>
      $.map values, (elem, indx)=>
        elem in values
    'does_not_contain': (string, values) =>
      false


$(document).on 'click', '.back-button', ->
  history.go(-1)
  return true

$(document).on 'click', '.submit-button', ->
  $this = $(this)

  #Add validation calls here

  $this.closest('form').submit()
  return true
