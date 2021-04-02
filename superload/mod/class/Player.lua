local _M = loadPrevious(...)

local super_getTarget = _M.getTarget
function _M:getTarget(typ)
	local target_myself = game.player.addon.target_myself or {}
	if typ and typ.talent and target_myself[typ.talent.id] then
		return game.player.x, game.player.y, game.player
	else
		return super_getTarget(self, typ)
	end
end

return _M
