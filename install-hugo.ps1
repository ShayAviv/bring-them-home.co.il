# Install hugo && npm dependencies

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

# Check if npm is installed
if (-not (Get-Command npm -ErrorAction SilentlyContinue)) {
    Write-Info "Installing npm..."
    # Download and install npm using Chocolatey (assuming Chocolatey is available)
    Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
    choco install npm -y
}

# Check if hugo is installed
if (-not (Get-Command hugo -ErrorAction SilentlyContinue)) {
    Write-Info "Installing Hugo..."
    # Download and install Hugo using Chocolatey
    choco install hugo -y
}

# Check if node.js version 20.5.0 is installed using nvm
if (-not (node -v | Select-String 'v20.5.0' -Quiet)) {
    Write-Info "Installing Node.js version 20.5.0 using nvm..."
    # Install or update nvm
    $env:NVM_HOME = "$env:USERPROFILE\.nvm"
    $env:NODE_VERSION = "20.5.0"
    iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.ps1'))

    # Install Node.js version 20.5.0 using nvm
    nvm install $env:NODE_VERSION
    nvm use $env:NODE_VERSION
}

# Install npm dependencies for the project
Write-Info "Installing npm dependencies..."
npm install

# Provide instructions
Write-Info "Run 'hugo server' to view the website."