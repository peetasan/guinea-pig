pipeline {
  agent {
    dockerfile {
      reuseNode true
    }
  }
  environment {
    SHA = sh(returnStdout: true, script: 'git rev-parse HEAD')
  }
  options {
        skipStagesAfterUnstable()
  }
  stages {
    stage('Clone') {
      steps {
        git 'https://github.com/peetasan/guinea-pig'
      }
    }
    stage('Build') {
      steps {
        sh 'pip install --user -r requirements.txt'
      }
    }
    stage('Publish') {
      agent {
        docker { 
          image 'docker.flcn.io/base/python:2.7'
          registryCredentialsId 'artifactory'
        }
      }
      steps {
        sh "docker push docker.flcn.io/test/guinea-pig:${SHA}"
      }
    }
  }
}
