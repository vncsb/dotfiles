pcall(require, "luarocks.loader")
local gears = require("gears")
local lfs = require("lfs")

local WallpaperChanger = {}
local allowed_file_types = { "jpg", "png" }

local function is_file_allowed(file)
	local extension = file:sub(-3)

	for _, type in pairs(allowed_file_types) do
		if extension == type then
			return true
		end
	end
	return false
end

local function getImages(path)
	local images = {}
	for file in lfs.dir(path) do
		if file ~= "." and file ~= ".." then
			if is_file_allowed(file:sub(-3)) then
				table.insert(images, path .. "/" .. file)
			end
		end
	end
	return images
end

function WallpaperChanger.randomize(path)
	gears.timer.start_new(1*60*60, function()
		local ok, images = pcall(getImages, path);
    if not ok then
      return false
    end
		if next(images) == nil then
			return false
		end
		local wallpaper = images[math.random(#images)]
		for s in screen do
			gears.wallpaper.maximized(wallpaper, s)
		end
		return true
	end)
end

return WallpaperChanger
