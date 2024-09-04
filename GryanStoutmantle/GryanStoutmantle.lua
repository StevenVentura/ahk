--Author: Soccerbilly aka Gangsthurh aka Usslibertyla
--Date Created: 6/13/17
--purpose: addon template





GryanStoutmantle = CreateFrame("Frame");

--GryanStoutmantle:SetScript("OnEvent",function(self,event,...) self[event](self,event,...);end)
GryanStoutmantle:SetScript("OnUpdate", function(self, elapsed) GryanStoutmantleOnUpdate(self, elapsed) end)
GryanStoutmantle:RegisterEvent("VARIABLES_LOADED");
GryanStoutmantle:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED");
GryanStoutmantle:RegisterEvent("ADDON_LOADED")  -- Fires when any addon is loaded

GryanStoutmantle:SetScript("OnEvent", function(self, event, ...)
    if event == "ADDON_LOADED" then
		
		---------gryan zone
		-- (1)
		f = CreateFrame("Frame", "YourFrameName", UIParent, "BackdropTemplate")

		f:SetSize(80,80)
		f:SetPoint("CENTER")

		-- (2)
		f:SetBackdrop({
			bgFile = "Interface\\ChatFrame\\ChatFrameBackground",
			edgeFile = "Interface\\ChatFrame\\ChatFrameBackground",
			edgeSize = 1,
		})
		f:SetBackdropColor(0, 0, 0, .5)
		f:SetBackdropBorderColor(0, 0, 0)

		-- (3)
		f:EnableMouse(true)
		f:SetMovable(true)
		f:RegisterForDrag("LeftButton")
		f:SetScript("OnDragStart", f.StartMoving)
		f:SetScript("OnDragStop", f.StopMovingOrSizing)
		f:SetScript("OnHide", f.StopMovingOrSizing)

		-- (4)
		local close = CreateFrame("Button", "YourCloseButtonName", f, "UIPanelCloseButton")
		close:SetPoint("TOPRIGHT", f, "TOPRIGHT")
		close:SetScript("OnClick", function()
			f:Hide()
		end)

		-- (5)
		gryanText = f:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
		gryanText:SetPoint("CENTER")
		gryanText:SetText("Hello World!")
		----------------------------------------------end gryan zone


    end
	self:UnregisterEvent("ADDON_LOADED")
end)


SLASH_GS1 = '/gs';
SlashCmdList["GS"]=slashGryanStoutmantle;

GryanStoutmantle_enabled = false;

function slashGryanStoutmantle(msg,editbox)
f:Show()
GryanStoutmantle_enabled = not GryanStoutmantle_enabled;
command, rest = msg:match("^(%S*)%s*(.-)$");
end--end function
--local function taken from http://stackoverflow.com/questions/1426954/split-string-in-lua by user973713 on 11/26/15
function GryanStoutmantleSplitString(inputstr, sep)
        if sep == nil then
                sep = "%s"
        end
        local t={} ; local i=1
        for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
                t[i] = str
                i = i + 1
        end
        return t
end
function tablelength(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end

afktimerlol = 0;
lagLess = 0;
gryanTimer = 0;
GryanStoutmantleTimeDelayThing = 0.50;

function GryanStoutmantleOnUpdate(self, elapsed)
lagLess = lagLess + elapsed;
afktimerlol = afktimerlol + elapsed;
-- SetRedBox();
if (lagLess > GryanStoutmantleTimeDelayThing) then 
lagLess = 0;
return end

--do stuff here

gryanTimer = gryanTimer + elapsed/2;
gryanText:SetText(math.floor(gryanTimer/60) .. ":" .. math.floor(gryanTimer%60));

end--end function GryanStoutmantleOnUpdate




function GnomeMessageFilter(ChatFrameSelf, event, msg, author, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9)
  -- Use Lua's gmatch function to iterate over all "words" in the message.
    -- If a word is a single letter, increment a counter.
    local count = 0
    for word in msg:gmatch("%S+") do
        if #word == 1 then  -- # is the length operator in Lua, so this checks if the word is a single character.
            count = count + 1
        end
    end

    
    -- If there are at least 8 single-letter words in the message, block it.
    if count >= 8 then
		--print("filtered cancer from " .. author);
        return true;
    else
        return false, msg, author, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9
    end
  
end


local numKillsToday = 0

--this is called after the variables are loaded
function GryanStoutmantleInit()

ChatFrame_AddMessageEventFilter("CHAT_MSG_CHANNEL", GnomeMessageFilter);
ChatFrame_AddMessageEventFilter("CHAT_MSG_GUILD", GnomeMessageFilter);
ChatFrame_AddMessageEventFilter("CHAT_MSG_PARTY", GnomeMessageFilter);
ChatFrame_AddMessageEventFilter("CHAT_MSG_RAID", GnomeMessageFilter);
ChatFrame_AddMessageEventFilter("CHAT_MSG_SAY", GnomeMessageFilter);
ChatFrame_AddMessageEventFilter("CHAT_MSG_WHISPER", GnomeMessageFilter);
ChatFrame_AddMessageEventFilter("CHAT_MSG_YELL", GnomeMessageFilter);

GryanStoutmantle:SetScript("OnEvent", function(self, event, ...)
    -- Extract the combat log details
    local timestamp, subEvent, hideCaster, sourceGUID, sourceName, sourceFlags, 
          sourceRaidFlags, destGUID, destName, destFlags, destRaidFlags = CombatLogGetCurrentEventInfo()
    
    -- Check if the event is a killing blow or unit death
    if subEvent == "UNIT_DIED" or subEvent == "PARTY_KILL" then
        -- Check if the NPC that died is Gryan Stoutmantle
        if destName == "Gryan Stoutmantle" then
			gryanTimer = 0
            print("Gryan Stoutmantle has been killed!")
            -- You can add additional logic here, such as triggering an event or updating a variable
        end
    end
end)


--[[
--TESTING CODE -- TEST
WorldFrameMaxWidth = UIParent:GetWidth();--WorldFrame:GetWidth();
WorldFrameMaxHeight = UIParent:GetHeight();--WorldFrame:GetHeight();
local numrows, numcols = 5,5; 
for r=0,numrows do
for c=0,numcols do
local f = CreateFrame("Frame","dankTestFrame" .. (r*10 + c),UIParent);
local width, height = WorldFrameMaxWidth/numrows, WorldFrameMaxHeight/numcols;
f:SetSize(width,width);
f:SetPoint("TOPLEFT",width*c,-height*r);
local model = CreateFrame("PlayerModel","stevenoob" .. (r*10 + c),f);
f.portrait = model;
model:SetUnit("player");
model:SetCustomRace(math.random(0,12));
if (math.random() < 0.1) then
model:SetCreature(822);--bear
end
model:SetAnimation(126);--https://us.battle.net/forums/en/wow/topic/8569600188
model:SetAllPoints();
f:Show();
end--end for
end--end for
--]]

end--end function GryanStoutmantleInit