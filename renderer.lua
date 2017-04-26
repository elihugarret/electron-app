local ipc = window:require"electron".ipcRenderer
local asyncMsgBtn = window.document:getElementById"async-msg"
    
asyncMsgBtn:addEventListener("click", function ()
    ipc:send("asynchronous-message", "ping")
end)

ipc:on("asynchronous-reply", function (event, arg)
    local message = "Asynchronous message reply: " .. arg
    window.document:getElementById"async-reply".innerHTML = message
end)

local requ = window.document:getElementById"requ"

function request ()
    local xhttp = window.XMLHttpRequest.new()
    xhttp.onreadystatechange = function ()
        if xhttp.readyState == 4 and xhttp.status == 200 then
            window.document:getElementById"response".innerHTML = xhttp.responseText
        end
    end
    xhttp:open("GET", "http://ateneaweb.tech/php_gen.php?test=hola", true)
    xhttp:send()
end

requ:addEventListener("click", request)
