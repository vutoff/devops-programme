variable "app_name" {
  description = "The name of the Python application"
  type        = string

  validation {
    condition     = can(regex("python", var.app_name))
    error_message = "The app_name must contain the word 'python'."
  }
}

variable "container_image" {
  description = "The container image for the Python application"
  type        = string
}

variable "container_port" {
  description = "The port the container listens on"
  type        = number
  default     = 5000
}
