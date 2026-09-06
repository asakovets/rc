function env { Get-ChildItem Env: }
function q { exit }

Set-Alias -Name which -Value get-command
Set-Alias -Name o     -Value Start-Process

# $env:PATH = "$env:PATH:~/.local/bin/"
$Env:PATH += ";$HOME/.local/bin/"

mise activate pwsh | Out-String | Invoke-Expression


function prompt {
    $p = $executionContext.SessionState.Path.CurrentLocation
    $osc7 = ""
    if ($p.Provider.Name -eq "FileSystem") {
        $ansi_escape = [char]27
        $provider_path = $p.ProviderPath -Replace "\\", "/"
        $osc7 = "$ansi_escape]7;file://${env:COMPUTERNAME}/${provider_path}${ansi_escape}\"
    }
    "${osc7}PS $p$('>' * ($nestedPromptLevel + 1)) ";
}

# $uutilsAliases = @(
#   'ls','cat','cp','mv','rm','pwd','sleep','tee','mkdir','rmdir','date','echo','uptime'
# )
# foreach ($name in $uutilsAliases) {
#   Remove-Alias -Name $name -Force -ErrorAction SilentlyContinue
# }
#
# function ls { & ls.exe --color=auto @args }
