module "python_app" {
  source = "./modules/python-app"

  app_name        = "python-app"
  container_image = "miroslavgaydazhiev/mick-proj:0.1"
}

module "python_app_2" {
  source = "./modules/python-app"

  app_name        = "python-app2"
  container_image = "miroslavgaydazhiev/mick-proj:0.1"
  container_port  = 6000
}
