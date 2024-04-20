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
    winget install Hugo.Hugo.Extended
}

# Launch new PowerShell session to execute npm install and instructions
Get-Process -Id $PID | ForEach-Object {
    $processPath = $_.Path
    Invoke-Command -ScriptBlock {
        param($path)

        # Install npm dependencies for the project
        Write-Info "Installing npm dependencies..."
        npm install

        # Provide instructions
        Write-Info "Run 'hugo server' to view the website."

    } -ArgumentList $processPath -NoNewScope
}