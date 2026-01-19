import { Router, v } from "@oak/acorn";

function isPrine(toCheck: {Number: number } | undefined) : boolean{
  if (toCheck === undefined || toCheck.Number < 2)
    return false;
  

  for (let i : number = 2; i <= Math.sqrt(toCheck.Number); i++) {
    if (toCheck.Number%i == 0)
      return false;
  }

  return true;
}

function sortObject(list: {List: number[]} | undefined) : number[]{
  if(list === undefined)
    return [];

  return list.List.sort();
}

const router = new Router({
  // disable logging in realease builds
  //
  logger: {
    console: {level: "DEBUG"},
  },
});

router.get("/", () => ({ hello: "world" }));
router.post("/isPrime", (ctx) => (ctx.body().then(isPrine, () => false).then((resultBool) => ({result: resultBool}))), {
  schema: {
    body: v.object({
      Number: v.number()
    })
  }
});
router.post("/sortList", (ctx) => (ctx.body().then(sortObject, () => []).then((resultArray) => ({result: resultArray}))));
router.listen({ port: 3000 });