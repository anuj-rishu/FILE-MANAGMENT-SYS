# Retrieve the choice as a string
$choice = Get-Content -Path "choice.txt" -Raw

# Validate if $choice is a number between 1 and 8
if ($choice -match '^[1-8]$') {
    $choice = [int]$choice  # Convert the choice to an integer for numerical comparison

    switch ($choice) {
        1 {
            Write-Host "Listing files in: $(Get-Content -Path "source.txt" -Raw)"
            Get-ChildItem -Path (Get-Content -Path "source.txt" -Raw)
        }
        
        2 {
            Write-Host "Creating directory at: $(Get-Content -Path "source.txt" -Raw)"
            mkdir -Path (Get-Content -Path "source.txt" -Raw) -Force
        }
        
        
        3 { Remove-Item -Path (Get-Content -Path "source.txt" -Raw) }
        4 {
            $source = Get-Content -Path "source.txt" -Raw
            $newName = Read-Host "Enter the new name for $source"
            Rename-Item -Path $source -NewName $newName
        }
        5 {
            Copy-Item -Path (Get-Content -Path "source.txt" -Raw) -Destination (Get-Content -Path "destination.txt" -Raw)
        }
        6 {
            Move-Item -Path (Get-Content -Path "source.txt" -Raw) -Destination (Get-Content -Path "destination.txt" -Raw)
        }
        7 {
            Write-Host "Changing location to: $(Get-Content -Path "source.txt" -Raw)"
            Set-Location -Path (Get-Content -Path "source.txt" -Raw)
        }
        
        8 { exit }
    }
}
else {
    Write-Host "Invalid choice"
}
