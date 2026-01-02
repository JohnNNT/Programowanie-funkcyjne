import { Router, v } from "@oak/acorn";

function isPrine(toCheck: {Number: number } | undefined) : boolean{
  if (toCheck === undefined)
    return false;
  return (toCheck.Number%2) == 0;
}

// disable in release builds
const router = new Router({
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
router.listen({ port: 3000 });