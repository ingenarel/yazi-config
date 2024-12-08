-- this fiile is a custom version of: https://github.com/saumyajyoti/omp.yazi.git
-- ORIGINAL LICENSE:
-- MIT License
--
-- Copyright (c) 2024 Saumyajyoti Mukherjee
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in all
-- copies or substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
-- SOFTWARE.

local save = ya.sync(function(st, cwd, output)
	if cx.active.current.cwd == Url(cwd) then
		st.output = output
		ya.render()
	end
end)

return {
	setup = function(st)
		Header:children_remove(1, Header.LEFT)
		Header:children_add(function() return ui.Line.parse(st.output or "") end, 1000, Header.LEFT)

		ps.sub("cd", function()
			local cwd = cx.active.current.cwd
			if st.cwd ~= cwd then
				st.cwd = cwd
				ya.manager_emit("plugin", { st._id, args = ya.quote(tostring(cwd), true) })
			end
		end)
	end,

	entry = function(_, args)
		local output = Command("oh-my-posh")
			:args({
				"print",
				"primary",
				"--no-status",
				"--no-exit-code",
			})
			:cwd(args[1])
			:output()
		if output then
			save(args[1], output.stdout:gsub("^%s+", ""))
		end
	end,
}
