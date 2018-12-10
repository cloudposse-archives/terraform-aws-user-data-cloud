
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| flavor | Flavor depends of OS and init system | string | `debian-systemd` | no |
| name | Name  (e.g. `app` or `cluster`) | string | - | yes |
| namespace | Namespace (e.g. `cp` or `cloudposse`) | string | - | yes |
| region | AWS region to manage instances in | string | - | yes |
| stage | Stage (e.g. `prod`, `dev`, `staging`) | string | - | yes |

## Outputs

| Name | Description |
|------|-------------|
| policy_arn | User data iam policy that should be executed on startup |
| user_data | User data script that should be executed on startup |

