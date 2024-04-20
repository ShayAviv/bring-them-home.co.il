# Define ANSI-like color escape sequences for PowerShell
$InfoColor = [ConsoleColor]::Cyan
$ErrorColor = [ConsoleColor]::Red

function Write-Info {
    param([string]$Message)
    Write-Host "[INFO] $Message" -ForegroundColor $InfoColor
}

function Write-Error {
    param([string]$Message)
    Write-Host "[ERROR] $Message" -ForegroundColor $ErrorColor
}

# Function to check if a command exists
function CommandExists {
    param([string]$Command)
    return (Get-Command $Command -ErrorAction SilentlyContinue) -ne $null
}

# Install npm if not already installed
if (-not (CommandExists "npm")) {
    Write-Info "Installing npm..."
    winget install Node.js
}

# Install Hugo if not already installed
if (-not (CommandExists "hugo")) {
    Write-Info "Installing Hugo..."
    winget install Hugo
}

# Install Node.js using NVM if Node.js version 20.5.0 is not installed
$desiredNodeVersion = "20.5.0"
if (-not (CommandExists "node" -and (node -v) -eq "v$desiredNodeVersion")) {
    Write-Info "Installing Node.js version $desiredNodeVersion using NVM..."
    $env:NVM_HOME = "$env:USERPROFILE\.nvm"
    $env:NVM_SYMLINK = "$env:USERPROFILE\AppData\Roaming\nvm"
    $nvmUrl = "https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.ps1"
    Invoke-WebRequest -Uri $nvmUrl -OutFile "$env:TEMP\nvm-install.ps1"
    & "$env:TEMP\nvm-install.ps1" | Invoke-Expression
    nvm install $desiredNodeVersion
    nvm use $desiredNodeVersion
}

# Install npm dependencies for the project
Write-Info "Installing npm dependencies..."
npm install

# Provide instructions
Write-Info "Run 'hugo server' to view the website."