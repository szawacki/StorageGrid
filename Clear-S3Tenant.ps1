function Clear-S3Tenant {
    <#
        .SYNOPSIS
            Clear S3 tenant.

        .DESCRIPTION
            Removes all objects from a S3 Tenant. As S3 tenants cannot be removed before all buckets are deleted, 
            this script deletes all buckets and their content of an S3 tenant.

        .PARAMETER AccessKey
            S3 access key.

        .PARAMETER SecretKey
            S3 secret key.

        .PARAMETER Url
            Endpoint url.

        .EXAMPLE 
            Clear-S3Tenant -AccessKey '82we82i90jij90' -SecretKey '30k03ok0okwosk20' -Url 'https://myS3endpoint.com'
    #>

    Param(
        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()] 
        [string]$AccessKey,

        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()] 
        [string]$SecretKey,
        
        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()] 
        [string]$Url
    )

    Get-S3Bucket -AccessKey $AccessKey -SecretKey $SecretKey -EndpointUrl $Url | 
    ForEach-Object {Remove-S3Bucket -BucketName $_.BucketName -DeleteBucketContent -Force}
}

$accessKey = ''
$secretKey = ''
$url = ''

Clear-S3Tenant -AccessKey $accessKey -SecretKey $secretKey -Url $url
