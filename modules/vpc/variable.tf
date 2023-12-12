variable "vpc-id" {
  description = "VPC ID"
  type        = string
}
################### Subnet ###################
variable "pub-sub1-id" {
  description = "Public Subnet1 ID"
  type        = string
}
variable "pub-sub2-id" {
  description = "Public Subnet2 ID"
  type        = string
}

variable "pri-sub1-id" {
  description = "Private Subnet1 ID"
  type        = string
}
variable "pri-sub2-id" {
  description = "Private Subnet2 ID"
  type        = string
}
###################################################

################## Route Table ###################
variable "pub-rt-id" {
  description = "Public Route Table ID"
  type        = string
}
variable "pri-rt-id" {
  description = "Private Route Table ID"
  type        = string
}
###################################################

variable "igw-id" {
  description = "Internet Gateway ID"
  type        = string
}
variable "ngw-id" {
  description = "Nat Gateway ID"
  type        = string
}
variable "eip-id" {
  description = "Elastic ID"
  type        = string
}