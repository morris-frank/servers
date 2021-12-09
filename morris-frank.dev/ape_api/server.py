from sanic import Sanic
from sanic.response import json, text

app = Sanic(__name__)

@app.get("/")
async def resp(request):
	return text(f"filename: test.png")

if __name__ == "__main__":
	app.run()
