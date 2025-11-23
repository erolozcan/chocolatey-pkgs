$ErrorActionPreference = 'Stop'

$packageName = 'nexus-oss'

# Stop and uninstall the Nexus service if it exists
if (gcm nexus -ea 0) {
    Write-Host "Stopping and uninstalling Nexus service..."
    try {
        0 | nexus stop
        0 | nexus uninstall
        Write-Host "Nexus service uninstalled successfully"
    }
    catch {
        Write-Warning "Failed to uninstall Nexus service: $_"
    }
}
else {
    Write-Host "Nexus command not found in PATH, service may have been manually removed"
}

# Note: This does not remove the installation directory as it may contain user data
# Users should manually remove the installation directory if desired
Write-Host "Note: Installation directory not removed. Remove manually if no longer needed."
