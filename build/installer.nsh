!macro customInstall
  ; 设置控制面板中的应用图标
  WriteRegStr SHCTX "Software\Microsoft\Windows\CurrentVersion\Uninstall\${UNINSTALL_APP_KEY}" "DisplayIcon" "$INSTDIR\${APP_EXECUTABLE_FILENAME},0"
!macroend

!macro customUnInstall
  ; 清理注册表
!macroend
