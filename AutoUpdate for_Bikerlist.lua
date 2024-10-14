require "lib.moonloader"
script_name("BikerList_By_Arbuzyan")
script_authors("Mafizik")
script_version("18.04.2024")
script_description("Р СџРЎР‚Р С•РЎРѓРЎвЂљР С•Р в„– Р С”Р В°Р С�РЎвЂ¦Р В°Р С” РЎРѓ Р С•Р В±РЎвЂ¦Р С•Р Т‘Р С•Р С� Р Р†Р В°РЎР‚Р Р…Р С‘Р Р…Р С–Р С•Р Р†")
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
  --пїЅпїЅпїЅпїЅпїЅпїЅ пїЅпїЅпїЅ, пїЅпїЅпїЅпїЅ пїЅпїЅпїЅпїЅпїЅпїЅ пїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅ пїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅ пїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅ
  -- пїЅпїЅпїЅпїЅпїЅ
  update(
    "https://raw.githubusercontent.com/Mafizik/script/main/Test_Update_for_bikerlist.json",
    "[" .. string.upper(thisScript().name) .. "]: ",
    "https://vk.com/id553788814",
    "camhackwwlog"
  )
  openchangelog("camhackwwlog", "http://qrlk.me/sampvk")
  -- пїЅпїЅпїЅпїЅпїЅпїЅ пїЅпїЅпїЅ, пїЅпїЅпїЅпїЅ пїЅпїЅпїЅпїЅпїЅпїЅ пїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅ пїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅ пїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅ

  -- пїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅ пїЅпїЅпїЅ, пїЅпїЅпїЅпїЅ пїЅпїЅпїЅпїЅпїЅпїЅ пїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅ пїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅ пїЅпїЅпїЅ пїЅпїЅпїЅпїЅпїЅ пїЅ пїЅпїЅпїЅпїЅ
  sampAddChatMessage("camhackww v" .. thisScript().version .. " пїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅ! /camhackww - menu. пїЅпїЅпїЅпїЅпїЅпїЅ: sanek a.k.a Maks_Fender, ANIKI, qrlk.", color)

  -- пїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅ пїЅпїЅпїЅ, пїЅпїЅпїЅпїЅ пїЅпїЅпїЅпїЅпїЅпїЅ пїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅ пїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅ пїЅпїЅпїЅ пїЅпїЅпїЅпїЅпїЅ пїЅ пїЅпїЅпїЅпїЅ

  sampRegisterChatCommand('mafizik', function()
sampAddChatMessage('[TEST By Mafizik] пїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅ ........ ', -1)
  end)
  wait(-1)
end
--пїЅпїЅпїЅпїЅ пїЅпїЅпїЅпїЅпїЅпїЅ пїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅ пїЅпїЅпїЅпїЅпїЅпїЅ пїЅпїЅпїЅпїЅпїЅпїЅпїЅ



--------------------------------------------------------------------------------
------------------------------------UPDATE--------------------------------------
--------------------------------------------------------------------------------
--пїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅ пїЅ пїЅпїЅпїЅпїЅпїЅ пїЅпїЅ пїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅ пїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅ
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
                      "пїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅ пїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅ. пїЅпїЅпїЅпїЅпїЅпїЅпїЅ пїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅ c " ..
                    thisScript().version .. " пїЅпїЅ " .. updateversion),
                    color
                  )
                  wait(250)
                  downloadUrlToFile(
                    updatelink,
                    thisScript().path,
                    function(id3, status1, p13, p23)
                      if status1 == dlstatus.STATUS_DOWNLOADINGDATA then
                        print(string.format("пїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅ %d пїЅпїЅ %d.", p13, p23))
                      elseif status1 == dlstatus.STATUS_ENDDOWNLOADDATA then
                        print("пїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅ пїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅ пїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅ.")
                        if komandaA ~= nil then
                          sampAddChatMessage(
                            (prefix ..
                              "пїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅ пїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅ! пїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅ пїЅпїЅ пїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅ - /" ..
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
                            "пїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅ пїЅпїЅпїЅпїЅпїЅпїЅ пїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅ. пїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅ пїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅ пїЅпїЅпїЅпїЅпїЅпїЅ.."),
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
              print("v" .. thisScript().version .. ": пїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅ пїЅпїЅ пїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅ.")
            end
          end
        else
          print(
            "v" ..
            thisScript().version ..
            ": пїЅпїЅ пїЅпїЅпїЅпїЅ пїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅ пїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅ. пїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅ пїЅпїЅпїЅ пїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅ пїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅ пїЅпїЅ " .. url
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
            "{ff0000}пїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅ пїЅпїЅ пїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅ",
            "{ffffff}" ..
            thisScript().name ..
            " {ffe600}пїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅ пїЅпїЅпїЅпїЅпїЅпїЅпїЅ пїЅпїЅпїЅпїЅ changelog пїЅпїЅпїЅ пїЅпїЅпїЅ.\nпїЅпїЅпїЅпїЅ пїЅпїЅ пїЅпїЅпїЅпїЅпїЅпїЅпїЅ {ffffff}пїЅпїЅпїЅпїЅпїЅпїЅпїЅ{ffe600}, пїЅпїЅпїЅпїЅпїЅпїЅ пїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅ пїЅпїЅпїЅпїЅпїЅпїЅпїЅ пїЅпїЅпїЅпїЅпїЅпїЅ:\n        {ffffff}" ..
            changelogurl ..
            "\n{ffe600}пїЅпїЅпїЅпїЅ пїЅпїЅпїЅпїЅ пїЅпїЅпїЅпїЅ пїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅ, пїЅпїЅ пїЅпїЅпїЅпїЅпїЅпїЅ пїЅпїЅпїЅпїЅпїЅпїЅпїЅ пїЅпїЅпїЅ пїЅпїЅпїЅпїЅпїЅпїЅ пїЅпїЅпїЅпїЅ.",
            "пїЅпїЅпїЅпїЅпїЅпїЅпїЅ",
            "пїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅ"
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


