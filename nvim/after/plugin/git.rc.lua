local status, git = pcall(require, "git")
if (not status) then return end

git.setup({
  keymaps = {
    -- Open blame window
    blame = "<Leader>gb",
    diff = "<Leader>gd",
    revert = "<Leader>gr",
  }
})
