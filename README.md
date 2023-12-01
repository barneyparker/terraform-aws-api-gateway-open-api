# Terraform AWS API Gateway Open API

This module creates an API Gateway REST API from an Open API (Swagger) specification.  AWS provides a number of extensions to the Open API specification, and this module contains a number of submodules to simplify creating an OpenAPI document that implements the AWS extensions.

## Primary Submodules

- [API Gateway](modules/api-gateway/README.md)
- [OpenAPI](modules/openapi/README.md)
- [Route](modules/route/README.md)

## Integration Submodules

- [Mock](modules/mock/README.md)
- [S3 Specific File](modules/s3-specific-file/README.md)
- [S3 Any File](modules/s3-any-file/README.md)