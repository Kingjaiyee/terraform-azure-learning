variable "name" {
    description = "name of the resource"
    type       = string
    

}

variable "location" {
    description = "location of the resource"
    type       = string
    default   = "eastus"

}

variable "tags" {
    description = "tags of the resource"
    type       = map(string)
    default   = {}
}