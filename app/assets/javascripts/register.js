$(function(){

    $("input[name='btn-register']").click(createUser);
});

function createUser(){

    var frm = $("#form-create-user").serialize();

    $.ajax({
        url: '/create-user',
        data: frm,
        type: 'post',
        dataType: 'json',
        success: function(result){

            if(result.message != undefined){

                if(result.message=='done') {
                    $("#form-create-user").find("input[type='text'], input[type='email'], input[type='password']").val('');

                    $("#form-create-user").find(".message").html("You are registered successfully");
                }
                else if(result.message=='duplicate')
                    $("#form-create-user").find(".message").html("Email already taken");
            }
        }
    });
}