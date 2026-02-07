const { app } = require('@azure/functions')

async function isPrime(number) {
    if(number.test < 2 || number.test%1 != 0)
        return false;

    for (let i = 2; i < Math.sqrt(number.test); i++) {
        if(number.test%i == 0)
            return false;
    }

    return true;
}

app.http('PrimalityTest', {
    methods: ['POST'],
    //zadanie na 3.0
    route: 'primeTest',
    authLevel: 'anonymous',
    handler: async (request, context) => {
        const awaitHead = Promise.resolve(new Headers()).then(function (newHead)  {newHead.set("Content-Type", "application/json"); return newHead;})
        const awaitAnswer = request.json().then(isPrime);
        const [head, answer] = await Promise.all([awaitHead, awaitAnswer])

        return {
            headers: head,
            body: JSON.stringify({result: answer})
        };
    }
});