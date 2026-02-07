const {workerData, parentPort} = require('node:worker_threads')

const result = workerData.timeDurations.reduce((previousValue, currentElement) => previousValue+currentElement);

parentPort.postMessage(result);