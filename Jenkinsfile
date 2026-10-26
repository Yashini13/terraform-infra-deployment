pipeline {
    agent any

    environment {
        ARM_CLIENT_ID       = credentials('ARM_CLIENT_ID')
        ARM_CLIENT_SECRET   = credentials('ARM_CLIENT_SECRET')
        ARM_TENANT_ID       = credentials('ARM_TENANT_ID')
        ARM_SUBSCRIPTION_ID = credentials('ARM_SUBSCRIPTION_ID')
        GITHUB_TOKEN        = credentials('GITHUB-TOKENS-INFRA')
    }

    stages {
        stage('Checkout SCM') {
            steps {
                // Fixed syntax: Injecting the token securely into the URL via env variable
                git url: "https://${env.GITHUB_TOKEN}@github.com/yashinipardeshi/terraform-infra-deploy.git",
                    branch: 'main'
            }
        }

        stage('Terraform Init') {
            steps {
                sh 'rm -rf .terraform'
                sh 'terraform init'
            }
        }

        stage('Terraform Plan') {
            steps {
                sh 'terraform plan -out=tfplan'
            }
        }

        stage('Approval') {
            steps {
                script {
                    // Capture input decision to handle potential abort choices
                    def userInput = input(
                        message: 'Review the Terraform Plan above. Do you want to Apply?',
                        ok: 'Yes, Apply!',
                        submitter: 'Yashini Pardeshi',
                        parameters: [
                            choice(
                                name: 'ACTION',
                                choices: ['Apply', 'Abort'],
                                description: 'Choose Apply to proceed or Abort to cancel'
                            )
                        ]
                    )
                    
                    if (userInput == 'Abort') {
                        error('Pipeline aborted by user choice.')
                    }
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                sh 'terraform apply -auto-approve tfplan'
            }
        }
    }
}
