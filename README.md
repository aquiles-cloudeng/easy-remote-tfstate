# easy-remote-tfstate

An easy way to implement remote tfstate with AWS

## How to use

1. Use the terraform.tf as your default terraform file.

2. Change the values in the module call (line 28).

3. Run terraform apply.

4. Uncomment from line 19 to line 25 in terraform.tf file and change the bucket and dynamo db name with the output provided in step 3.

5. Run terraform apply again.

6. Done! Now you have your tfstate in the AWS cloud.
