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
        sh 'pip install --user -r requirements.txt'
        sh 'docker build .'
      }
    }
  }
}
