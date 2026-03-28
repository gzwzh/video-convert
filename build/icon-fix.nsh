; 图标修复脚本 - 简化版本，避免与默认行为冲突

!macro customInstall
  ; 设置控制面板中的应用图标
  WriteRegStr SHCTX "Software\Microsoft\Windows\CurrentVersion\Uninstall\${UNINSTALL_APP_KEY}" "DisplayIcon" "$INSTDIR\app.ico,0"
  
  ; 刷新图标缓存
  System::Call 'shell32.dll::SHChangeNotify(l, l, p, p) v (0x08000000, 0, 0, 0)'
!macroend

!macro customUnInstall
  ; 清理桌面快捷方式
  Delete "$DESKTOP\视频格式助手.lnk"
  
  ; 清理开始菜单
  RMDir /r "$SMPROGRAMS\视频格式助手"
  
  ; 清理注册表
  DeleteRegKey SHCTX "Software\Classes\Applications\视频格式助手.exe"
  
  ; 刷新图标缓存
  System::Call 'shell32.dll::SHChangeNotify(l, l, p, p) v (0x08000000, 0, 0, 0)'
!macroend

; 支持静默安装的命令行参数
!macro customInit
  ; 检查命令行参数
  ${GetParameters} $R0
  ${GetOptions} $R0 "/S" $R1
  ${IfNot} ${Errors}
    ; 静默安装模式
    SetSilent silent
  ${EndIf}
  
  ${GetOptions} $R0 "/SILENT" $R1
  ${IfNot} ${Errors}
    ; 静默安装模式
    SetSilent silent
  ${EndIf}
  
  ${GetOptions} $R0 "/VERYSILENT" $R1
  ${IfNot} ${Errors}
    ; 完全静默安装模式
    SetSilent silent
  ${EndIf}
!macroend