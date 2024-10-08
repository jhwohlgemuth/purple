#requires -modules Prelude

$Referenced = @(
    'ApplicationCategory'
    'ApplicationSubCategory'
    'Artifact'
    'DevelopmentStatus'
    'Keyword'
    'License'
    'OperatingSystem'
    'RuntimePlatform'
    'TargetProduct'
)
$Parameters = @{
    'all-errors' = $True
    'spec' = 'draft2020'
    'c' = 'ajv-formats'
    's' = '"./schemas/Metadata.json"'
    'r' = "`"./schemas/`{$($Referenced -join ',')`}.json`""
    'd' = '"metadata.json"'
}
$Command = "./node_modules/.bin/ajv validate $($Parameters | ConvertTo-ParameterString)"
Invoke-Expression $Command