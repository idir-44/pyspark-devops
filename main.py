from pyspark import SparkContext
from operator import add
 
from fastapi import FastAPI

app = FastAPI()


@app.get("/")
def read_root():
	sc = SparkContext(appName="HelloWorld")
	rdd = sc.parallelize(["Hello", "World"])
	result = rdd.reduce(add)
	return result