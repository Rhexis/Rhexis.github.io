# Stream Schemas
Situation: You have a dataframe readStream
~~~python
destination_path = "my-aws-destination-bucket/example_destination"
source_path = "my-aws-source-bucket/example_source"

meta_data_handle = "meta_data"
data_handle = "data"

df_readstream = spark.readStream.format("cloudFiles") \
    .option("cloudFiles.format", "json")
    .option("cloudFiles.inferColumnTypes", "true")
    .option("cloudFiles.schemaLocation", f"s3://{destination_path}/{meta_data_handle}")
    .option("cloudFiles.schemaEvolutionMode", "addNewColumns")
    .load(f"s3://{source_path}/{data_handle}/*")
~~~

**Question:** I want the schema, what can I do?

**Answer:**
~~~python
# Gets the schema as a StructType()
print(df_readstream.schema)

# Also gets the schema as a StructType() but using the underlying java methods
print(df_readstream._jdf.schema())

# Gets the schema as the DDL formatted string, this is useful for Creating tables!
print(df_readstream._jdf.schema().toDDL())
~~~