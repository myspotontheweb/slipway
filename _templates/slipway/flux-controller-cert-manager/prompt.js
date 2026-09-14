module.exports = [
  {
    type: 'input',
    name: 'certManagerChartVersion',
    message: 'What is the version of the cert-manager chart?',
    default: 'v1.21.2'
  },
  {
    type: 'input',
    name: 'trustManagerChartVersion',
    message: 'What is the version of the trust-manager chart?',
    default: 'v0.25.0'
  }  
];