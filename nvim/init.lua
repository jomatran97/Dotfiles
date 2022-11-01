require('joma.base')
require('joma.highlights')
require('joma.maps')
require('joma.plugins')

local has = vim.fn.has
local is_mac = has "macunix"
local is_win = has "win32"

if is_mac then
  require('joma.macos')
end
