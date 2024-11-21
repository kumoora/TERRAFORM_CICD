terraform {
  required_providers {
    snowflake = {
      source  = "chanzuckerberg/snowflake"
      version = "0.25.17"
    }
  }

  backend "remote" {
    organization = "kumarsnowflake"

    workspaces {
      name = "gh-actions-demo"
    }
  }
}

provider "snowflake" {
}

resource "snowflake_database" "demo_db_1_1" {
  name    = "DEMO_DB_1_1"
  comment = "Database for Snowflake Terraform demo"
}

resource "snowflake_schema" "demo_schema" {
  database = snowflake_database.demo_db_1_1.name
  name     = "DEMO_SCHEMA"
  comment  = "Schema for Snowflake Terraform demo"
}

resource "snowflake_schema" "demo_schema_2" {
  database = snowflake_database.demo_db_1_1.name
  name     = "DEMO_SCHEMA_2"
  comment  = "Schema for Snowflake Terraform demo"
}
