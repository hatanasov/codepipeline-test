# Module: iam-assumable-roles

## Overview

This module can be used for creation an IAM Role in AWS account.<br>
The role principal can be either "Service" or another "AWS" identity like user,<br>
role, aws accounts and etc.

## Use Cases

  * Create role for different principals, according to [AWS documentation](https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_elements_principal.html), except<br>
  of the "Federated" one.<br>
  * The role can be assumed with MFA or without MFA:<br>
  <br>
  > "mfa_enable_check = true"<br>
  <br>
  * Permission policy can be provided either through json file or policy ARN<br>
  <br>
  >
  > permission_policy_arn = "arn:aws:iam::aws:policy/xxx"<br>
  > or<br>
  > iam_policy_name = "Permission_Policy_Name"<br>
  > permission_policy_doc = file("policy_document.json")<br>
  >

## Usage Example



```


```
