local Socket = require "socket"
local msg_define = require "network.msg_define"
local Packer = require "network.packer"

local M = {}

M.__index = M

function M.new()
    local o = {}
	setmetatable(o, M)
	return o
end

function M:connect(ip, port)
   self.ip = ip
   self.port = port
   local sock = socket.tcp()
   local n,e = sock:connect(ip, port)
   self.sock = sock
end

function M:send(proto_name, msg)
   print("send msg", proto_name)

   local proto_id = msg_define.name_2_id(proto_name)
   local packet = Packer.pack(proto_id, msg)
   self.sock:send(packet)
end

function M:recv()

end

function M:close()

end

return M
