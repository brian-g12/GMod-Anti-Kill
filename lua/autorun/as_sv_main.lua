if SERVER then
	AddCSLuaFile("config.lua")
	include("config.lua")

	util.AddNetworkString("ch_Mg")

	local function noSuicide(ply)
		if ply:IsPlayer() then
			net.Start("ch_Mg")
			net.Send(ply)
			return false
		end
	end
	hook.Add("CanPlayerSuicide","abort_suicide", noSuicide)

else

	net.Receive("ch_Mg", function()
		chat.AddText(Color(prefix_col),"[Server]: ",Color(body_text_col)),ChatPrinted)
		chat.PlaySound()
	end)

end