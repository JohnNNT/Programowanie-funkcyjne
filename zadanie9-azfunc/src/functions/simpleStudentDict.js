const { app } = require('@azure/functions')
const {
    Worker,
    isMainThread,
    parentPort,
    workerData 
} = require('node:worker_threads');

async function handleHourCount(timeSpansForStudent) {
    const thread = new Worker('./workerScripts/createDuration.js', {
        workerData: timeSpansForStudent
    });

    thread.once('message', (timeSpan) => {
        return Promise.resolve(timeSpan)
    })
}

async function sumHourCount(timeDurations) {
    const thread = new Worker(`${__dirname}/workerScripts/createDuration.js`, {
        workerData: {
            timeDurations
        }
    });

    thread.once('message', (timeSpan) => resolve(timeSpan))

    thread.once('error', (err) => rejects(err))
}

app.http('simpleStudentDict', {
    methods: ['POST'],
    route: 'countHours',
    authLevel: 'anonymous',
    handler: async (request, context) => {
        context.log(__dirname)

        const awaitHead = Promise.resolve(new Headers()).then(function (newHead)  {newHead.set("Content-Type", "application/json"); return newHead;})
        const awaitDict = request.json().then(
            (hoursUngrouped) => Object.groupBy(hoursUngrouped, ({id}) => id.toString())
        ).then(
            (hoursGrouped) => {
                const workerArray = Object.keys(hoursGrouped).map( (key) => Promise.resolve(handleHourCount(hoursGrouped[key])));

                Promise.all(workerArray).then((results) => {
                    const value = Object.keys(hoursGrouped).map((e, i) => [e, results[i]]);
                    context.log(value);
                    return value;   
                }).then((resultZipped) => 
                    resultZipped.reduce((map, obj) => {
                        map[obj.key] = obj.val;
                        return map;
                    }, {})
                );
            }
        ).then(
            (hoursCounted) => {
                const finalTime = Object.keys(hoursCounted).map((key) => sumHourCount(hoursCounted[key]));
                
                Promise.all(finalTime).then((results) => {
                    Object.keys(hoursCounted).map((e, i) => [e, results[i]]);   
                }).then((resultZipped) => 
                    resultZipped.reduce((map, obj) => {
                        map[obj.key] = obj.val;
                        return map;
                    }, {})
                );
            }
        );
        const [head, hoursDict] = await Promise.all([awaitHead, awaitDict])

        return {
            headers: head,
            body: JSON.stringify({result: hoursDict})
        };
    }
});
