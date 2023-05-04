function testCmdlol() 
end
function sendDiscordLogMessage(message)
    sendOptions = {
        queueName = "clara",
        connectionAttempts = 3,
        connectTimeout = 5000,
        formFields = {
            content="**"..message.."**"
        },
    }
    fetchRemote ("webhookURLDiscord", sendOptions, testCmdlol)
    end
    function showtime ()
        local time = getRealTime()
        local hours = time.hour
        local minutes = time.minute
        local seconds = time.second
    
        local monthday = time.monthday
        local month = time.month
        local year = time.year


    
        local formattedTime = string.format("%04d/%02d/%02d %02d:%02d:%02d", year + 1900, month + 1, monthday, hours, minutes, seconds)
        return formattedTime
end
addEvent("sendMessageDiscord", true)
addEventHandler("sendMessageDiscord", root, sendDiscordLogMessage)

function sendMessageToAll(message, r, g, b)
    outputChatBox(message, root, r, g, b)
end
addEvent("sendMessage", true)
addEventHandler("sendMessage", root, sendMessageToAll)

karizkarizma = dbConnect( "sqlite", "doneApplied.db" )
karizmaS =	dbQuery ( karizkarizma , "CREATE TABLE IF NOT EXISTS `karizma_Data` ( `serial` INT, `data` INT )" ); 
local karizmaR, karizmaM, karizmaL = dbPoll ( karizmaS, -1 )

function quitPlayer ( quitType )
    local Serial = getPlayerSerial(source)
    local karizmaDb = dbQuery(karizkarizma, "SELECT `data` FROM `karizma_Data` WHERE `serial`=?",Serial)
    local karizmaR, karizmaM, karizmaL = dbPoll ( karizmaDb, -1 )
    if ( #karizmaR > 0) then
        local up = dbQuery(karizkarizma,"UPDATE `karizma_Data` SET `data`=? WHERE `serial`=?",getElementData(source,"Done"),Serial)
        dbFree (up)
    elseif (#karizmaR == 0) then
        local insert = dbQuery (karizkarizma,"INSERT INTO `karizma_Data` (`data`,`serial`) VALUES (?,?)",getElementData(source,"Done"),Serial)
        dbFree (insert)
    end
end
addEventHandler ( "onPlayerQuit", root, quitPlayer )

function DnData()
    local Serial = getPlayerSerial(source)
    local selectData = dbQuery ( karizkarizma,"SELECT `data` FROM `karizma_Data` WHERE `serial`=?",Serial)
    local karizmaR, karizmaM, karizmaL = dbPoll ( selectData, -1 )
    for i,v in pairs ( karizmaR ) do
        if v.data then
            setElementData(source,"Done",v.data)
        end
    end
end
addEventHandler ( "onPlayerJoin", root, DnData )


-----------------------------------------------------

karizmaaC = dbConnect( "sqlite", "appStatus.db" )
karizmaaS =	dbQuery ( karizmaaC , "CREATE TABLE IF NOT EXISTS `karizmaa_Data` ( `serial` INT, `data` INT )" ); 
local karizmaaR, karizmaaM, karizmaaL = dbPoll ( karizmaaS, -1 )

function quitPlayert ( quitType )
    local Serial = getPlayerSerial(source)
    local karizmaaDb = dbQuery(karizmaaC, "SELECT `data` FROM `karizmaa_Data` WHERE `serial`=?",Serial)
    local karizmaaR, karizmaaM, karizmaaL = dbPoll ( karizmaaDb, -1 )
    if ( #karizmaaR > 0) then
        local up = dbQuery(karizmaaC,"UPDATE `karizmaa_Data` SET `data`=? WHERE `serial`=?",getElementData(source,"status_apply"),Serial)
        dbFree (up)
    elseif (#karizmaaR == 0) then
        local insert = dbQuery (karizmaaC,"INSERT INTO `karizmaa_Data` (`data`,`serial`) VALUES (?,?)",getElementData(source,"status_apply"),Serial)
        dbFree (insert)
    end
end
addEventHandler ( "onPlayerQuit", root, quitPlayert )

function DnDataa()
    local Serial = getPlayerSerial(source)
    local selectData = dbQuery ( karizmaaC,"SELECT `data` FROM `karizmaa_Data` WHERE `serial`=?",Serial)
    local karizmaaR, karizmaaM, karizmaaL = dbPoll ( selectData, -1 )
    for i,v in pairs ( karizmaaR ) do
        if v.data then
            setElementData(source,"status_apply",v.data)
        end
    end
end
addEventHandler ( "onPlayerJoin", root, DnDataa )

function DnDatawa()
    local Serial = getPlayerSerial(source)
    local selectData = dbQuery ( karizmaaC,"SELECT `data` FROM `karizmaa_Data` WHERE `serial`=?",Serial)
    local karizmaaR, karizmaaM, karizmaaL = dbPoll ( selectData, -1 )
    for i,v in pairs ( karizmaaR ) do
        if v.data then
            setElementData(resourceRoot,"status_apply",0)
        end
    end
end
addEventHandler ( "onResourceStart", root, DnDatawa )