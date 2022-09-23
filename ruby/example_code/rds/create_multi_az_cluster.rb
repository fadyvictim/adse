# Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
# SPDX-License-Identifier: Apache-2.0

# snippet-start:[rds.ruby.createDatabaseSnapshot]

require 'aws-sdk-rds'  # v2: require 'aws-sdk'

# Create an Amazon Relational Database Service (Amazon RDS) mutli-AZ cluster
#
# @param rds_resource [Aws::RDS::Resource]: The resource containing SDK logic
# @param cluster_name [String] Unique identifier for the cluster
# @return
def create_multi_az_cluster(rds_resource, params = {})
  resp = rds_resource.create_db_cluster({
                                    availability_zones: [
                                      "us-east-1a",
                                    ],
                                    backup_retention_period: 1,
                                    db_cluster_identifier: params["db_cluster_identifier"],
                                    db_cluster_parameter_group_name: params["db_cluster_parameter_group_name"],
                                    database_name: params["database_name"],
                                    engine: params["engine"],
                                    engine_version: params["engine_version"], # 5.6.10a
                                    master_user_password: "mypassword",
                                    master_username: "myuser",
                                    port: 3306,
                                    storage_encrypted: true
                                  })

  resp.to_h outputs the following:
                          {
                            db_cluster: {
                            },
                          }
end

if __FILE__ == $0
  rds_resource = Aws::RDS::Resource.new
  params = {
    db_cluster_identifier: '',
    db_cluster_parameter_group_name: '',
    database_name: '',
    engine: '',
    engine_version: ''
  }
  create_multi_az_cluster(rds_resource, params)
end
