local global = require("core.global")

local function bind_option(options)
    for k, v in pairs(options) do
        if v == true then
            vim.cmd("set " .. k)
        elseif v == false then
            vim.cmd("set no" .. k)
        else
            vim.cmd("set " .. k .. "=" .. v)
        end
    end
end

local function load_options()
    local global_local = {
        shell = "/bin/zsh",
        termguicolors = true,
        mouse = "a",
        errorbells = true,
        visualbell = true,
        hidden = true,
        fileformats = "unix,mac,dos",
        magic = true,
        virtualedit = "block",
        -- 语法高亮
        encoding = "utf-8",
        fileencoding = "utf-8",
        viewoptions = "folds,cursor,curdir,slash,unix",
        sessionoptions = "curdir,help,tabpages,winsize",
        clipboard = "unnamedplus",
        -- 搜索忽略文件
        wildignorecase = true,
        wildignore = ".git,.hg,.svn,*.pyc,*.o,*.out,*.jpg,*.jpeg,*.png,*.gif,*.zip,**/tmp/**,*.DS_Store,**/node_modules/**,**/bower_modules/**",
        backup = false,
        writebackup = false,
        swapfile = false,
        undodir = global.cache_dir .. "undo/",
        -- directory = global.cache_dir .. "swap/",
        -- backupdir = global.cache_dir .. "backup/",
        -- viewdir = global.cache_dir .. "view/",
        -- spellfile = global.cache_dir .. "spell/en.uft-8.add",
        history = 2000,
        shada = "!,'300,<50,@100,s10,h",
        backupskip = "/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*,/private/var/*,.vault.vim",
        smarttab = true,
        shiftround = true,
        timeout = true,
        ttimeout = true,
        timeoutlen = 500,
        ttimeoutlen = 0,
        updatetime = 100,
        redrawtime = 1500,
        ignorecase = true,
        smartcase = true,
        infercase = true,
        incsearch = true,
        hlsearch = true,
        wrapscan = true,
        complete = ".,w,b,k",
        inccommand = "nosplit",
        grepformat = "%f:%l:%c:%m",
        grepprg = "rg --hidden --vimgrep --smart-case --",
        breakat = [[\ \    ;:,!?]],
        startofline = false,
        whichwrap = "h,l,<,>,[,],~",
        splitbelow = true,
        splitright = true,
        switchbuf = "useopen",
        backspace = "indent,eol,start",
        diffopt = "filler,iwhite,internal,algorithm:patience",
        completeopt = "menuone,noselect",
        jumpoptions = "stack",
        showmode = false,
        shortmess = "aoOTIcF",
        scrolloff = 2,
        sidescrolloff = 5,
        foldlevelstart = 99,
        -- 显示标尺
        ruler = true,
        -- 开启光亮光标行
        cursorline = true,
        -- 开启高亮光标列
        cursorcolumn = true,
        -- 显示空格和tab
        list = true,
        listchars = "tab:>-·,nbsp:+,trail:·,extends:→,precedes:←",
        -- 总是显示标签栏
        showtabline = 2,
        winwidth = 30,
        winminwidth = 10,
        pumheight = 15,
        helpheight = 12,
        previewheight = 12,
        showcmd = true,
        cmdheight = 2,
        cmdwinheight = 5,
        equalalways = false,
        laststatus = 2,
        display = "lastline",
        showbreak = "↳  ",
        pumblend = 10,
        winblend = 10,
        autoread = true,
        -- 自动保存文件
        autowrite = true,
        autowriteall = true,
        -- 命令行模式自动补全
        wildmenu = true,
        -- 开启文件类型侦测
        lazyredraw = true,
    }

    local bw_local = {
        undofile = true,
        synmaxcol = 2500,
        formatoptions = "1jcroql",
        textwidth = 80,
        -- 自动对齐
        autoindent = true,
        smartindent = true,
        -- tab
        expandtab = true,
        tabstop = 4,
        shiftwidth = 4,
        softtabstop = 4,
        breakindentopt = "shift:2,min:20",
        wrap = false,
        linebreak = true,
        -- 显示行号
        number = true,
        -- 显示相对行号
        relativenumber = true,
        -- 代码折叠
        foldenable = true,
        foldmethod = "syntax",
        signcolumn = "yes",
        conceallevel = 0,
        concealcursor = "niv",
    }

    if global.is_mac then
        vim.g.clipboard = {
            name = "macOS-clipboard",
            copy = { ["+"] = "pbcopy", ["*"] = "pbcopy" },
            paste = { ["+"] = "pbpaste", ["*"] = "pbpaste" },
            cache_enabled = 0,
        }
        -- vim.g.python_host_prog = "/usr/bin/python"
    end
    for name, value in pairs(global_local) do
        vim.o[name] = value
    end
    -- vim.g.python3_host_prog = "/home/yang/Applications/miniconda3/envs/nvimpy38/bin/python"
    vim.g.python3_host_prog = "/usr/bin/python3"
    bind_option(bw_local)
end

load_options()
