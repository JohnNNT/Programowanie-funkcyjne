const {workerData, parentPort} = require('node:worker_threads')

function getTimeSpan(timePoints){
    const startPoint = timePoints.begin.split(":");
    const endPoint = timePoints.end.split(":");

    return ((parseInt(endPoint[0]) - parseInt(startPoint[0]))*60) + parseInt(endPoint[1]) - parseInt(startPoint[1]);
}

const result = workerData.map(getTimeSpan);

parentPort.postMessage(result);