pipeline {
  agent any
  stages {
    stage('clone') {
      steps {
        git 'https://github.com/peetasan/guinea-pig'
      }
    }
    stage('build') {
      steps {
        sh 'pip install -r requirements.txt'
        sh 'docker build .'
      }
    }
  }
}