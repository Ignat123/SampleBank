function validateSimpleStep(validationId, step) {
    if ($("#" + validationId).val() > 0) {
        navigateAndToggle(step);
    }
    else{
        toggleElement('#step-errors-' + step, true);
    }
}

function navigateAndToggle(step) {
    toggleElement('#step-errors-' + step, false);
    navigate('#step' + (step + 1));
}

function validateFifthStep() {
    if ($("#provision-type").val().length > 0 || $("#other-provision-type").val() != "")
        navigateAndToggle(5);
    else{
        toggleElement('#step-errors-5', true);
    }
}

function validateSixthStep() {
    var validateErrorsCount = 0;
    $("#errors_list").empty();

    if ($("#organization-name").val() == ""){
        validateErrorsCount++;
        $("#errors_list").append("<li>Укажите наименование организации, в которой работает клиент.</li>");
    }
    if ($("#customers-address").val() == ""){
        validateErrorsCount++;
        $("#errors_list").append("<li>Укажите адрес проживания клиента.</li>");
    }
    if ($("#main-activity-type").val() == 0 && $("#alt-main-activity").val() == ""){
        validateErrorsCount++;
        $("#errors_list").append("<li>Вид деятельности клиента.</li>");
    }
    if ($("#customers-firstname").val() == ""){
        validateErrorsCount++;
        $("#errors_list").append("<li>Укажите имя клиента.</li>");
    }
    if ($("#customers-lastname").val() == ""){
        validateErrorsCount++;
        $("#errors_list").append("<li>Укажите фамилию клиента.</li>");
    }
    if ($("#customers-patronymic").val() == ""){
        validateErrorsCount++;
        $("#errors_list").append("<li>Укажите отчество клиента.</li>");
    }
    if ($("#customers-phone").val() == ""){
        validateErrorsCount++;
        $("#errors_list").append("<li>Укажите номер телефона клиента.</li>");
    }
    if (validateErrorsCount == 0)
        $("#online-credit-form").submit();
    else{
        toggleElement('#step-errors-6', true);
    }

}