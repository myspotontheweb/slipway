// _templates/generator/action/prompt.js
module.exports = [
  {
    type: 'input',
    name: 'chartVersion',
    message: 'What is the version of the chart?',
    default: '0.29.0'
  },
  {
    type: 'input',
    name: 'barmanChartVersion',
    message: 'What is the version of the Barman chart?',
    default: '0.7.1'
  }
];