variable "database_type" {
  description = "The type of database to deploy (mysql or mongodb)"
  type        = string
}

# Database setup (MySQL or MongoDB)
resource "docker_container" "database" {
  count = var.database_type == "mysql" ? 1 : 0
  image = "mysql:latest"
  name  = "mysql_database"
  ports {
    internal = 3306
    external = 3306
  }
  env {
    MYSQL_ROOT_PASSWORD = var.mysql_root_password
  }
}

resource "docker_container" "mongodb" {
  count = var.database_type == "mongodb" ? 1 : 0
  image = "mongo:latest"
  name  = "mongodb_database"
  ports {
    internal = 27017
    external = 27017
  }
}