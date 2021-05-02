-- tome-target-myself/init.lua
-- For ToME version 1.7.2

long_name = "Target Myself"
short_name = "target-myself" -- Determines the name of your addon's file.
for_module = "tome"
version = {1,7,2}
addon_version = {0,1,2}
-- should load after modest-auto-accept(99)
weight = 100 -- The lower this value, the sooner your addon will load compared to other addons.
author = {'hukumitu.youhei@gmail.com'}
homepage = 'https://hkmtyh.com'
description = [[Make targetable talents always target myself.
To enable, right click talent's icon.

This Addon driven by applying Spatial Tether myself over and over again.

Github: https://github.com/h-youhei/tome-target-myself

Weight: 100

SuperLoad:
- mod/class/Player.lua:getTarget()]] -- the [[ ]] things are like quote marks that can span multiple lines
tags = {'target', 'self', 'myself'} -- tags MUST immediately follow description

overload = false
superload = true
data = false
hooks = true
