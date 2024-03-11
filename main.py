from pyspark import SparkContext
from operator import add
 
if __name__ == "__main__":
	sc = SparkContext(appName="HelloWorld")
	data = sc.parallelize(list("Hello World"))
	counts = data.map(lambda x: (x, 1)).reduceByKey(add).sortBy(lambda x: x[1], ascending=False).collect()
	for (word, count) in counts:
		print("{}: {}".format(word, count))
	sc.stop()

