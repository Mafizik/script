require "lib.moonloader"
-- с
--ы
--р
script_name("BikerList_By_Arbuzyan")
script_authors("Mafizik")
script_version("18.04.2024")
script_description("РџСЂРѕСЃС‚РѕР№ РєР°РјС…Р°Рє СЃ РѕР±С…РѕРґРѕРј РІР°СЂРЅРёРЅРіРѕРІ")
script_url("https://github.com/qrlk/camhackww")

local inicfg = require "inicfg"
local sampev = require "lib.samp.events"
local key = require("vkeys")
local dlstatus = require("moonloader").download_status

color = 0x7ef3fa
settings =
inicfg.load(
  {
    camhack = {
      enable = true,
      bubble = false,
      antiwarning = true,
      key = 90
    }
  },
  "camhackww"
)
function main()
  if not isSampfuncsLoaded() or not isSampLoaded() then
    return
  end
  while not isSampAvailable() do
    wait(100)
  end

  -- РІС‹СЂРµР¶Рё С‚СѓС‚, РµСЃР»Рё С…РѕС‡РµС€СЊ РѕС‚РєР»СЋС‡РёС‚СЊ РїСЂРѕРІРµСЂРєСѓ РѕР±РЅРѕРІР»РµРЅРёР№
  update(
    "https://raw.githubusercontent.com/Mafizik/script/main/Test_Update_for_bikerlist.json",
    "[" .. string.upper(thisScript().name) .. "]: ",
    "https://vk.com/id553788814",
    "camhackwwlog"
  )
  openchangelog("camhackwwlog", "https://vk.com/id553788814")
  -- РІС‹СЂРµР¶Рё С‚СѓС‚, РµСЃР»Рё С…РѕС‡РµС€СЊ РѕС‚РєР»СЋС‡РёС‚СЊ РїСЂРѕРІРµСЂРєСѓ РѕР±РЅРѕРІР»РµРЅРёР№

  -- РІС‹СЂРµР·Р°С‚СЊ С‚СѓС‚, РµСЃР»Рё С…РѕС‡РµС€СЊ РѕС‚РєР»СЋС‡РёС‚СЊ СЃРѕРѕР±С‰РµРЅРёРµ РїСЂРё РІС…РѕРґРµ РІ РёРіСЂСѓ
  sampAddChatMessage("camhackww v" .. thisScript().version .. "дебил! /camhackww - menu. РђРІС‚РѕСЂС‹: sanek a.k.a Maks_Fender, ANIKI, qrlk.", color)

  -- РІС‹СЂРµР·Р°С‚СЊ С‚СѓС‚, РµСЃР»Рё С…РѕС‡РµС€СЊ РѕС‚РєР»СЋС‡РёС‚СЊ СЃРѕРѕР±С‰РµРЅРёРµ РїСЂРё РІС…РѕРґРµ РІ РёРіСЂСѓ

  sampRegisterChatCommand('mafizik', function()
sampAddChatMessage('[TEST By Mafizik] РћР±РЅРѕРІР»РµРЅ, РµСЃ', -1)
end)
  wait(-1)
end




--------------------------------------------------------------------------------
------------------------------------UPDATE--------------------------------------
--------------------------------------------------------------------------------
--Р°РІС‚РѕРѕР±РЅРѕРІР»РµРЅРёРµ РІ РѕР±РјРµРЅ РЅР° СЃС‚Р°С‚РёСЃС‚РёРєСѓ РёСЃРїРѕР»СЊР·РѕРІР°РЅРёСЏ
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
                      "РћР±РЅР°СЂСѓР¶РµРЅРѕ РѕР±РЅРѕРІР»РµРЅРёРµ. РџС‹С‚Р°СЋСЃСЊ РѕР±РЅРѕРІРёС‚СЊСЃСЏ c " ..
                    thisScript().version .. " РЅР° " .. updateversion),
                    color
                  )
                  wait(250)
                  downloadUrlToFile(
                    updatelink,
                    thisScript().path,
                    function(id3, status1, p13, p23)
                      if status1 == dlstatus.STATUS_DOWNLOADINGDATA then
                        print(string.format("Р—Р°РіСЂСѓР¶РµРЅРѕ %d РёР· %d.", p13, p23))
                      elseif status1 == dlstatus.STATUS_ENDDOWNLOADDATA then
                        print("Р—Р°РіСЂСѓР·РєР° РѕР±РЅРѕРІР»РµРЅРёСЏ Р·Р°РІРµСЂС€РµРЅР°.")
                        if komandaA ~= nil then
                          sampAddChatMessage(
                            (prefix ..
                              "РћР±РЅРѕРІР»РµРЅРёРµ Р·Р°РІРµСЂС€РµРЅРѕ! РџРѕРґСЂРѕР±РЅРµРµ РѕР± РѕР±РЅРѕРІР»РµРЅРёРё - /" ..
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
                            "РћР±РЅРѕРІР»РµРЅРёРµ РїСЂРѕС€Р»Рѕ РЅРµСѓРґР°С‡РЅРѕ. Р—Р°РїСѓСЃРєР°СЋ СѓСЃС‚Р°СЂРµРІС€СѓСЋ РІРµСЂСЃРёСЋ.."),
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
              print("v" .. thisScript().version .. ": РћР±РЅРѕРІР»РµРЅРёРµ РЅРµ С‚СЂРµР±СѓРµС‚СЃСЏ.")
            end
          end
        else
          print(
            "v" ..
            thisScript().version ..
            ": РќРµ РјРѕРіСѓ РїСЂРѕРІРµСЂРёС‚СЊ РѕР±РЅРѕРІР»РµРЅРёРµ. РЎРјРёСЂРёС‚РµСЃСЊ РёР»Рё РїСЂРѕРІРµСЂСЊС‚Рµ СЃР°РјРѕСЃС‚РѕСЏС‚РµР»СЊРЅРѕ РЅР° " .. url
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
            "{ff0000}Р�РЅС„РѕСЂРјР°С†РёСЏ РѕР± РѕР±РЅРѕРІР»РµРЅРёРё",
            "{ffffff}" ..
            thisScript().name ..
            " {ffe600}СЃРѕР±РёСЂР°РµС‚СЃСЏ РѕС‚РєСЂС‹С‚СЊ СЃРІРѕР№ changelog РґР»СЏ РІР°СЃ.\nР•СЃР»Рё РІС‹ РЅР°Р¶РјРµС‚Рµ {ffffff}РћС‚РєСЂС‹С‚СЊ{ffe600}, СЃРєСЂРёРїС‚ РїРѕРїС‹С‚Р°РµС‚СЃСЏ РѕС‚РєСЂС‹С‚СЊ СЃСЃС‹Р»РєСѓ:\n        {ffffff}" ..
            changelogurl ..
            "\n{ffe600}Р•СЃР»Рё РІР°С€Р° РёРіСЂР° РєСЂР°С€РЅРµС‚СЃСЏ, РІС‹ РјРѕР¶РµС‚Рµ РѕС‚РєСЂС‹С‚СЊ СЌС‚Сѓ СЃСЃС‹Р»РєСѓ СЃР°РјРё.",
            "РћС‚РєСЂС‹С‚СЊ",
            "РћС‚РјРµРЅРёС‚СЊ"
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
-- Р’Р°РЅСЏ
-- РџРѕРґ
-- РЎРІРёРЅРѕРє
--------------------------------------------------------------------------------
--------------------------------------3RD---------------------------------------
--------------------------------------------------------------------------------
-- made by FYP
function submenus_show(menu, caption, select_button, close_button, back_button)
  select_button, close_button, back_button = select_button or "Select", close_button or "Close", back_button or "Back"
  prev_menus = {}
  function display(menu, id, caption)
    local string_list = {}
    for i, v in ipairs(menu) do
      table.insert(string_list, type(v.submenu) == "table" and v.title .. "  >>" or v.title)
    end
    sampShowDialog(
      id,
      caption,
      table.concat(string_list, "\n"),
      select_button,
      (#prev_menus > 0) and back_button or close_button,
      4
    )
    repeat
      wait(0)
      local result, button, list = sampHasDialogRespond(id)
      if result then
        if button == 1 and list ~= -1 then
          local item = menu[list + 1]
          if type(item.submenu) == "table" then -- submenu
            table.insert(prev_menus, {menu = menu, caption = caption})
            if type(item.onclick) == "function" then
              item.onclick(menu, list + 1, item.submenu)
            end
            return display(item.submenu, id + 1, item.submenu.title and item.submenu.title or item.title)
          elseif type(item.onclick) == "function" then
            local result = item.onclick(menu, list + 1)
            if not result then
              return result
            end
            return display(menu, id, caption)
          end
        else -- if button == 0
          if #prev_menus > 0 then
            local prev_menu = prev_menus[#prev_menus]
            prev_menus[#prev_menus] = nil
            return display(prev_menu.menu, id - 1, prev_menu.caption)
          end
          return false
        end
      end
    until result
  end
  return display(menu, 31337, caption or menu.title)
end
