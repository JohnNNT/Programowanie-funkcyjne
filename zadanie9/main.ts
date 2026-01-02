Deno.serve((_req) => {
  const pathname = new URL(_req.url).pathname;

  switch (pathname) {
    case "/isPrime":
      return new Response("TODO: Add this endpoint")
    default:
      return new Response(JSON.stringify({message: "Endpoint not found"}), {
        status: 404,
        headers: {
          "content-type": "application/json; charset=utf-8"
        }
      })
  }
});