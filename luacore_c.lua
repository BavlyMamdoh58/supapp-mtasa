serials = {
    ["Serial"] = true,
    ["Serial"] = true,
    ["Serial"] = true,
}

function open()
    if serials[getPlayerSerial(localPlayer)] then
        if getElementData(resourceRoot, "status_apply") == 1 then
            setElementData(resourceRoot, "status_apply", 0)
            triggerServerEvent("sendMessage", localPlayer, "تم إغلاق تقديم السبورت", 255, 0, 0)
        else
            setElementData(resourceRoot, "status_apply", 1)
            triggerServerEvent("sendMessage", localPlayer, "تم فتح تقديم السبورت", 0, 255, 0)
        end
    end
end
addCommandHandler("supapply", open, false, false)
setElementData(localPlayer, "text", "أسمك الحقيقي")
local dxfont0_karizma = dxCreateFont(":supApp/karizma.ttf", 14)
local screenW, screenH = guiGetScreenSize()
setElementData(resourceRoot, "status_apply", 0)
setElementData(localPlayer, "Done", 0)

setTimer(function()
    if getElementData(resourceRoot, "status_apply") == 1 then
        setElementData(localPlayer, "status_apply", 1)
    elseif getElementData(resourceRoot, "status_apply") == 0 then
        setElementData(localPlayer, "status_apply", 0)
    end
end, 5000, 0)

GUIEditor = {
    edit = {}
}
addEventHandler("onClientResourceStart", resourceRoot,
    function()
        setTimer(function()
            setElementData(localPlayer, "text", getElementData(localPlayer, "text"))
        end, 500, 0)
        editbox = guiCreateEdit(0.41, 0.50, 0.18, 0.03, "أسمك الحقيقي", true)
        guiSetVisible(editbox, false)
        guiSetAlpha(editbox, 0.00)
    end
)

 -- عشان هي متغيره
addEventHandler("onClientRender", root,
function()
    if panel then
        dxDrawImage(screenW * 0.2651, screenH * 0.2694, screenW * 0.4698, screenH * 0.5111, ":supApp/imgs/panel.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(screenW * 0.3927, screenH * 0.2972, screenW * 0.2083, screenH * 0.0463, ":supApp/imgs/top.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawLine(screenW * 0.4516, screenH * 0.3583, screenW * 0.5469, screenH * 0.3583, tocolor(0, 84, 211, 255), 2, false)
        dxDrawText("لوحه تقديم السبورتر - Support Application", screenW * 0.3927, screenH * 0.2972, screenW * 0.6010, screenH * 0.3435, tocolor(255, 255, 255, 255), 1.00, dxfont0_karizma, "center", "center", false, false, false, false, false)
        if getElementData(localPlayer, "Done") == 1 then
            dxDrawImage(screenW * 0.3682, screenH * 0.7157, screenW * 0.2604, screenH * 0.0463, ":supApp/imgs/bar.png", 0, 0, 0, tocolor(66, 66, 66, 255), false)
            dxDrawImageSection(screenW * 0.3682, screenH * 0.7157, screenW * 0.2604, screenH * 0.0463, 0, 0, 500, 50, ":supApp/imgs/bar.png", 0, 0, 0, tocolor(0, 84, 211, 255), false)
            dxDrawText("6/6", screenW * 0.3682, screenH * 0.7157, screenW * 0.6286, screenH * 0.7620, tocolor(255, 255, 255, 255), 1.00, dxfont0_karizma, "center", "center", false, false, false, false, false)
            dxDrawImage(screenW * 0.3911, screenH * 0.4926, screenW * 0.2083, screenH * 0.0463, ":supApp/imgs/top.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawText((getElementData(localPlayer, "Type") or "لقد تم إرسال تقديمك"), screenW * 0.3911, screenH * 0.4926, screenW * 0.5995, screenH * 0.5389, tocolor(255, 255, 255, 255), 1.00, dxfont0_karizma, "center", "center", false, false, false, false, false)    
        elseif getElementData(localPlayer, "a7a") then
            totalASKS = 6
            nowASK = getElementData(localPlayer, "ask") or 0
            asks = totalASKS/nowASK 
            dxDrawImage(screenW * 0.3911, screenH * 0.4926, screenW * 0.2083, screenH * 0.0463, ":supApp/imgs/top.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawText(guiGetText(editbox), screenW * 0.4135, screenH * 0.5019, screenW * 0.5802, screenH * 0.5296, tocolor(255, 255, 255, 255), 1.00, dxfont0_karizma, "left", "center", false, false, false, false, false)    
            dxDrawImage(screenW * 0.3682, screenH * 0.7157, screenW * 0.2604, screenH * 0.0463, ":supApp/imgs/bar.png", 0, 0, 0, tocolor(66, 66, 66, 255), false)
            dxDrawImageSection(screenW * 0.3682, screenH * 0.7157, screenW * 0.2604/asks, screenH * 0.0463, 0, 0, 500/asks, 50, ":supApp/imgs/bar.png", 0, 0, 0, tocolor(0, 84, 211, 255), false)
            dxDrawText(nowASK.."/6", screenW * 0.3682, screenH * 0.7157, screenW * 0.6286, screenH * 0.7620, tocolor(255, 255, 255, 255), 1.00, dxfont0_karizma, "center", "center", false, false, false, false, false)
            dxDrawImage(screenW * 0.4188, screenH * 0.5620, screenW * 0.1562, screenH * 0.0648, ":supApp/imgs/button.png", 0, 0, 0, tocolor(0, 84, 211, (isMouseInPosition(screenW * 0.4188, screenH * 0.5620, screenW * 0.1562, screenH * 0.0648) and 175 or 255)), false)
            dxDrawText("ارسال التقديم للادارة", screenW * 0.4188, screenH * 0.5620, screenW * 0.5750, screenH * 0.6269, tocolor(255, 255, 255, (isMouseInPosition(screenW * 0.4188, screenH * 0.5620, screenW * 0.1562, screenH * 0.0648) and 175 or 255)), 1.00, dxfont0_karizma, "center", "center", false, false, false, false, false)
        elseif getElementData(localPlayer, "Done") ~= 1 then
            totalASKS = 6
            nowASK = getElementData(localPlayer, "ask") or 0
            asks = totalASKS/nowASK 
            dxDrawImage(screenW * 0.3911, screenH * 0.4926, screenW * 0.2083, screenH * 0.0463, ":supApp/imgs/top.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawText(guiGetText(editbox), screenW * 0.4135, screenH * 0.5019, screenW * 0.5802, screenH * 0.5296, tocolor(255, 255, 255, 255), 1.00, dxfont0_karizma, "left", "center", false, false, false, false, false)    
            dxDrawImage(screenW * 0.3682, screenH * 0.7157, screenW * 0.2604, screenH * 0.0463, ":supApp/imgs/bar.png", 0, 0, 0, tocolor(66, 66, 66, 255), false)
            dxDrawImageSection(screenW * 0.3682, screenH * 0.7157, screenW * 0.2604/asks, screenH * 0.0463, 0, 0, 500/asks, 50, ":supApp/imgs/bar.png", 0, 0, 0, tocolor(0, 84, 211, 255), false)
            dxDrawText(nowASK.."/6", screenW * 0.3682, screenH * 0.7157, screenW * 0.6286, screenH * 0.7620, tocolor(255, 255, 255, 255), 1.00, dxfont0_karizma, "center", "center", false, false, false, false, false)
            dxDrawImage(screenW * 0.4188, screenH * 0.5620, screenW * 0.1562, screenH * 0.0648, ":supApp/imgs/button.png", 0, 0, 0, tocolor(0, 84, 211, (isMouseInPosition(screenW * 0.4188, screenH * 0.5620, screenW * 0.1562, screenH * 0.0648) and 175 or 255)), false)
            dxDrawText("السؤال التالي", screenW * 0.4188, screenH * 0.5620, screenW * 0.5750, screenH * 0.6269, tocolor(255, 255, 255, (isMouseInPosition(screenW * 0.4188, screenH * 0.5620, screenW * 0.1562, screenH * 0.0648) and 175 or 255)), 1.00, dxfont0_karizma, "center", "center", false, false, false, false, false)
        end
    end
end
)
bindKey("F9", "down", function()
    if getElementData(resourceRoot, "status_apply") == 1 then
        if panel then
            panel = false
            showCursor(false)
            guiSetVisible(editbox, false)
        else
            panel = true
            showCursor(true)
            guiSetVisible(editbox, true)
        end
    elseif getElementData(resourceRoot, "status_apply") ~= 1 then
        outputChatBox("التقديم مغلق حتى الان", 255, 0, 0)
    end
end)
setElementData(localPlayer, "ask", 0)
addEventHandler("onClientKey", root, function(b, s)
    if b == "mouse1" then
        if s then
            if panel then
                if isMouseInPosition(screenW * 0.4188, screenH * 0.5620, screenW * 0.1562, screenH * 0.0648) then
                    if nowASK == 0 then
                        setElementData(localPlayer, "ask", nowASK+1)
                        setElementData(localPlayer, "namee", guiGetText(editbox))
                        guiSetText(editbox, "عمرك الحقيقي")
                    elseif nowASK == 1 then
                        setElementData(localPlayer, "ask", nowASK+1)
                        setElementData(localPlayer, "agee", guiGetText(editbox)) 
                        guiSetText(editbox, "لماذا تريد الانضمام للإداره")
                    elseif nowASK == 2 then
                        setElementData(localPlayer, "ask", nowASK+1)
                        setElementData(localPlayer, "whyjoin", guiGetText(editbox)) 
                        guiSetText(editbox, "ما اللذي سوف تقدمه للسيرفر")
                    elseif nowASK == 3 then
                        setElementData(localPlayer, "ask", nowASK+1)
                        setElementData(localPlayer, "whatdoyoudo", guiGetText(editbox)) 
                        guiSetText(editbox, "هل يمكنك التواجد لمده 6 ساعات يومياً؟")
                    elseif nowASK == 4 then
                        setElementData(localPlayer, "ask", nowASK+1)
                        setElementData(localPlayer, "6hours", guiGetText(editbox)) 
                        guiSetText(editbox, "ماهي المهام المخصصه للرتبه الخاصه بك")
                    elseif nowASK == 5 then
                        setElementData(localPlayer, "ask", nowASK+1)
                        setElementData(localPlayer, "tasks", guiGetText(editbox)) 
                        guiSetText(editbox, "قم بـ أدخال الديسكورد الخاص بك")
                        setElementData(localPlayer, "a7a", true)
                    elseif nowASK == 6 then
                        setElementData(localPlayer, "discord", guiGetText(editbox))
                        setElementData(localPlayer, "Done", 1)
                        setElementData(localPlayer, "a7a", false)
                        guiSetVisible(editbox, false)
                        setElementData(localPlayer, "Type", "لقد تم إرسال تقديمك")
                        triggerServerEvent("sendMessageDiscord", localPlayer, "- New Application From ||"..getPlayerSerial(localPlayer).."|| ("..getElementData(localPlayer, "account:username")..")\nReal Name : "..getElementData(localPlayer, "namee").."\nReal Age : "..getElementData(localPlayer, "agee").."\nWhy do you want to join our staff ? : "..getElementData(localPlayer, "whyjoin").."\nHow will you help us ? : "..getElementData(localPlayer, "whatdoyoudo").."\nCan you be available for 6 hours per day ? : "..getElementData(localPlayer, "6hours").."\nWhat are the tasks assigned to your rank? : "..getElementData(localPlayer, "tasks").."\nDiscord Username : "..getElementData(localPlayer, "discord").."\n@everyone")
                    end
                end
            end
        end
    end
end)


function isMouseInPosition ( x, y, width, height )
	if ( not isCursorShowing( ) ) then
		return false
	end
	local sx, sy = guiGetScreenSize ( )
	local cx, cy = getCursorPosition ( )
	local cx, cy = ( cx * sx ), ( cy * sy )
	
	return ( ( cx >= x and cx <= x + width ) and ( cy >= y and cy <= y + height ) )
end