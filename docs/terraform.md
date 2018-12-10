
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| flavor | Flavor depends of OS and init system | string | `debian-systemd` | no |
| name |  | string | - | yes |
| namespace |  | string | - | yes |
| region | AWS region to manage instances in | string | - | yes |
| stage |  | string | - | yes |

## Outputs

| Name | Description |
|------|-------------|
| policy_arn | User data iam policy that should be executed on startup |
| user_data | User data script that should be executed on startup |

