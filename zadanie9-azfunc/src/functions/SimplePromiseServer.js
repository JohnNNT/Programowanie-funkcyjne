const { app } = require('@azure/functions')

app.http('SimplePromiseServer', {
    methods: ['POST'],
    route: 'sortList',
    authLevel: 'anonymous',
    handler: async (request, context) => {
        const awaitHead = Promise.resolve(new Headers()).then(function (newHead)  {newHead.set("Content-Type", "application/json"); return newHead;})
        const awaitList = request.json().then((request) => request.List.sort())
        const [head, sortedList] = await Promise.all([awaitHead, awaitList])

        return {
            headers: head,
            body: JSON.stringify({result: sortedList})
        };
    }
});
