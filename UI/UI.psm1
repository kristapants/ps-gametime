Import-Module $pwd\UI\Utilities.psm1 -Force
Import-Module $pwd\UI\Logic.psm1 -Force
Import-Module $pwd\UI\Game\View.psm1 -Force
Import-Module $pwd\UI\Index\View.psm1 -Force
Import-Module $pwd\UI\Jobs\View.psm1 -Force
Import-Module $pwd\UI\Logs\View.psm1 -Force

function Show-Header {
  $width = $global:containerWidth
  $widthLeft = [System.Math]::Floor($width / 2) - 6
  $widthRight = [System.Math]::Ceiling($width / 2) + 6
  if (!$global:hideHeader) {
    Write-Host "    _____                 _______            "
    Write-Host "   / ___/__  __ _  ___   /_  __(_)_ _  ___   "
    Write-Host "  / (_ / _ ``/  ' \/ -_)   / / / /  ' \/ -_)  "
    Write-Host "  \___/\_,_/_/_/_/\__/   /_/ /_/_/_/_/\__/   "
    Write-Host "                                             "
    if ($global:showQuit) {
      Write-Host "  $(Get-PaddedString "Bal: $(Get-Balance)" -Width $widthLeft)$(Get-PaddedString "[Q]uit" -Right $true -Width $widthRight)"
    }
    else {
      Write-Host "  Bal: $(Get-Balance)"
    }
  }
}

function Show-Footer {
  if (!$global:hideFooter) {
    Show-ControlsFooter
  }
  Write-Host ""
}

function Show-ControlsFooter {
  $canNavX = $global:canChangeMenuPositionX
  $canNavY = $global:canChangeMenuPositionY
  $posX = $global:menuPositionX
  $posY = $global:menuPositionY
  $maxX = $global:maxMenuPositionsX
  $maxY = $global:maxMenuPositionsY
  $invertY = $global:invertY
  $n = '0'
  $e = '0'
  $s = '0'
  $w = '0'

  if ($canNavX) {
    if ($posX -gt 0) {
      $w = '<'
    }
    if ($posX -lt $maxX - 1) {
      $e = '>'
    }
  }
  if ($canNavY) {
    if (!$invertY) {
      if ($posY -gt 0) {
        $n = '^'
      }
      if ($posY -lt $maxY - 1) {
        $s = 'v'
      }
    }
    else {
      if ($posY -gt 0) {
        $s = 'v'
      }
      if ($posY -lt $maxY - 1) {
        $n = '^'
      }
    }
  }
  # $width = $global:containerWidth
  # $widthLeft = [System.Math]::Floor($width / 2) - 6
  # $widthRight = [System.Math]::Ceiling($width / 2) + 6

  Write-Host "  $(Get-PaddedString "   Press [Enter] to select      [$n]")  "
  Write-Host "  $(Get-PaddedString "                             [$w]   [$e]")  "
  if ($global:showEsc) {
    Write-Host "  $(Get-PaddedString "   <- [Esc/Bksp]                [$s]")  "
  }
  else {
    Write-Host "  $(Get-PaddedString "                                [$s]")  "
  }
}