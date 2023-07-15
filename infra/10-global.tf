resource "aws_rds_global_cluster" "global" {
  global_cluster_identifier = "skills-db-global"
  engine                    = "aurora-mysql"
}
