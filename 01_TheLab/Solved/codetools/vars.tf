variable "timeout" {
  type        = number
  description = "The amout of time a codebuild will take to time out"
  default     = 60
}

variable "repos" {
  type        = list(map(string))
  description = "The repos to perform this action to"
}

variable "role" {
  type        = string
  description = "The role that the Codebuild task should execute"
}
