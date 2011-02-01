function signsLeft(textarea, limit, snippet){
    var text = $("#" + textarea).val()
    var length = 100 - text.length

    if (length <= 0) {
        $("#" + textarea).val(text.substr(0,100))
        $("#" + snippet).addClass("formError")
        length = 0
    }
    else
    {
        $("#" + snippet).removeClass("formError")
    }

    $("#" + snippet + " p").html(length)
}
