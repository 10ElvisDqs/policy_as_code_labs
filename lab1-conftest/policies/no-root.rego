package main

deny contains msg if {
  input.kind == "Deployment"
  not input.spec.template.spec.securityContext.runAsNonRoot
  msg := "Containers in Deployment must set securityContext.runAsNonRoot = true"
}
