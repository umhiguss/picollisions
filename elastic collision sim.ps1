try {
    while ($true) {
        $sMass = 1
        $power = Read-Host "Enter Exponent"
        $bMass = [math]::Pow(100, [int]$power)
        $sVelocity = 0
        $bVelocity = -1
        $stv = $sVelocity
        $sconst1 = ($sMass - $bMass) / ($sMass + $bMass)
        $sconst2 = (2 * $bMass) / ($sMass + $bMass)
        $bconst1 = (2 * $sMass) / ($sMass + $bMass)
        $bconst2 = ($bMass - $sMass) / ($sMass + $bMass)
        $collisions = 0
        Measure-Command {
        while (-not (($bVelocity -gt 0) -and (($sVelocity -gt 0) -and ($sVelocity -lt $bVelocity)))) {
            if ($sVelocity -lt 0) {
                $sVelocity = $sVelocity * -1
                $stv = $sVelocity
            }
            else {
                $sVelocity = ($sconst1 * $stv) + ($sconst2 * $bVelocity)
                $bVelocity = ($bconst1 * $stv) + ($bconst2 * $bVelocity)
                $stv = $sVelocity
            }
            $collisions++
        }
        }
        Write-Host "Collisions: $collisions"
    }
}
catch {

    Read-Host "press enter to quit"
}