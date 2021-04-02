local Dialog = require "engine.ui.Dialog"

class:bindHook('UseTalents:generate', function(self, data)
	local Entity = require 'engine.Entity'
	local target = data.actor:getTalentTarget(data.talent)
	if data.talent.requires_target and target and target.talent then
		data.actor.addon = data.actor.addon or {}
		data.actor.addon.target_myself = data.actor.addon.target_myself or {}
		local target_myself = data.actor.addon.target_myself
		if target_myself[data.talent.id] then
			data.menu[#data.menu+1] = {
				name = _t'#YELLOW#Disable target myself',
				what = 'disable_target_myself',
			}
		else
			data.menu[#data.menu+1] = {
				name = _t'Target myself',
				what = 'target_myself',
			}
		end
	end
end)
class:bindHook('UseTalents:use', function(self, data)
	local target_myself = data.actor.addon.target_myself
	local target = data.actor:getTalentTarget(data.talent)
	local t = data.talent
	if data.what == 'target_myself' then
		if target.nowarning then
			target_myself[t.id] = true
			-- Dialog:simplePopup(_t"Target myself enabled", ("%s will target myself automatically."):tformat(t.name:capitalize()))
		else
			Dialog:yesnoLongPopup(_t"Target myself", ("%s will target myself automatically.\nAre you sure?"):tformat(t.name:capitalize()), 500, function(ret)
				if ret then
					target_myself[t.id] = true
				end
			end)
		end
	elseif data.what == 'disable_target_myself' then
		target_myself[t.id] = nil
		-- Dialog:simplePopup(_t"Target myself disabled", ("%s will not target myself automatically anymore."):tformat(t.name:capitalize()))
	end
end)
