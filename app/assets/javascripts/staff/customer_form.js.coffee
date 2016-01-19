$(document).on 'page:change', ->
  $('form.edit_form').on 'click', '#enable-password-field', ->
    $('#enable-password-field').hide()
    $('#disable-password-field').show()
    $('#form_customer_password').removeAttr('disabled')
    $('label[for=form_customer_password]').addClass('required')
  $('form.edit_form').on 'click', '#disable-password-field', ->
    $('#disable-password-field').hide()
    $('#enable-password-field').show()
    $('#form_customer_password').attr('disabled', 'disabled')
    $('label[for=form_customer_password]').removeClass('required')
  toggle_home_address_fields()
  toggle_work_address_fields()
  $('input#form_inputs_home_address').on 'click', ->
    toggle_home_address_fields()
  $('input#form_inputs_work_address').on 'click', ->
    toggle_work_address_fields()

  $("#customer_interests").find(".deletable_flag").each ->
    t = $(this)
    if t.val() == 'false'
      checkbox = t.siblings('input:checkbox')
      checkbox.on 'change', ->
        $('#other_interest').toggle()

      if checkbox.attr("checked")
        $('#other_interest').show()
      else
        $('#other_interest').hide()
      $("#customer_interests").append(t.parent().clone(true))
      t.parent().remove();

toggle_home_address_fields = ->
  checked = $('input#form_inputs_home_address').prop('checked')
  $('fieldset#home-address-fields input').prop('disabled', !checked)
  $('fieldset#home-address-fields select').prop('disabled', !checked)
  $('fieldset#home-address-fields').toggle(checked)

toggle_work_address_fields = ->
  checked = $('input#form_inputs_work_address').prop('checked')
  $('fieldset#work-address-fields input').prop('disabled', !checked)
  $('fieldset#work-address-fields select').prop('disabled', !checked)
  $('fieldset#work-address-fields').toggle(checked)
