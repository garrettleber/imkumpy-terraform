cloudflare_zone_id = "233ad89f213f9c3ff539150f0721c612"
external_domain    = "imkumpy.com"
external_ip        = "206.225.75.22"

internal_domain = "imkumpy.in"

ssh_keys = [
  "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCmh8Pn/HwXN+nqLZSsFdVH4FeXNyyTPstZak7iv45qbo32XQ2F4dKBBNy83Y4woDbzi5HqPU+s5mUA9t2DBx7UvJseGcXSSdtm/xkXZwVTxUCd8OlNd3NVm4mlIwXRRUztT3bLqfqHP7XV4uQqSHtBzTIlj4EWsIpfSn8Y6bneFGMI04NqePGmS7Cx6ahO2FqtESy1YTb1Ahwsxd8cgCs4/nVbzXtbCd3AUvvs9htsVMyORNMgQd44+KkXseFyQ3cvDVog07ThepTh2VcN8ei6pKrNRen/Qx+Oomn8gKz9Eu7JJWinQCjJeSrPxrFXJWjEnyFcEubAc/2YBx/9TT8tBUGKLLfmc+teVQyhb8JrAGPd7WDL2XCmjgCEZEa4MijrQsZg1vLUZRu6Yde/N0lhHIDD8SZ2h6aUh9cTQAJr8Va5uhDiiTB4HojSUEv9meCCvnoO8mXZoQ5URTfL8Qwy/zJr1M60S/hte8gqdNowPhWbpz7ziSgWm6/0QUugsjs= garrett@Garretts-MBP"
]

mailexchanger = {
  "mx" = {
    disk_location = "local-lvm"
    disk_size     = "10G"
    id            = 100
    ip            = "192.168.0.91"
    tags          = "mailexchanger"
  }
}
dkim_record = "v=DKIM1; h=sha256; k=rsa; p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA4ruZf4QT/sMsNDNh20ZkOq5tiYJWIoGfOCWqUpiTmrd5Atq3Rb4y/qnn4KKcXwmrDNfUMnt1lJfQ0Ui43miDstrrieKulU6El+rQg8FKCVUdPLSXWObmW+NaabNIomAtc2d2sq7lLc71mhj3gmWpCmLKdiJD+elMjkB9oqO1uCmjHug2RoiBrksurnyYGUvObH2Sq0U+bIB9UQGbRmjveT+UGXSli14oGbSQWDOQcWBBSWNQlrf+mdvwJEFytWFKWL8NNmkqOoShyRmTeVFQCpGsPDYWnc2g4agzASMjkAHdGA8QzoH3ITpZ1uJ2XcYM/QvQKLNPl1D1xNwAU6Hp8QIDAQAB;"
