include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "${path_relative_from_include()}//modules/mx_dns"
}

inputs = {
  dkim_record = "v=DKIM1; h=sha256; k=rsa; p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAyBTtXH9M3hIVTQuzSGqfxJoLLAy1eBV+yNU1Fo8zvPeK/4KV1HdgrzduYI5ltqPEzyDVj6ugSx0NtnB3NCH0TO0DUe8vKB2cIBFIanTb1GgSj2sx06OtqI2FEVeIodv2BMT+3EtRm7kQw1D7Gxag/LZszqZ8lLlM+h2MxIvnL8HGMecgwxnyZp5DqjJaBCceZBD4IPPGsyiSj2ySxuTFi+mUVrPKluVH8T7/v8EeLBKAi+EtpJmmcHRYEgpxGsjoT2FiQ0JT5/9XnpvZ29jYdARrByYxmKEodqWA7+m8dpHywLLsH38Le7hyP21sE9C0ayyYMDEpNN5aYkUsiM06zwIDAQAB;"
}