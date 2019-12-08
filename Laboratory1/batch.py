from cassandra.cluster import Cluster
from cassandra.query import SimpleStatement
from cassandra import ConsistencyLevel

cluster = Cluster()
session = cluster.connect("startit")

query = SimpleStatement("""BEGIN BATCH
    INSERT INTO resource (resource_name, rating, resource_content) VALUES ('one more external resource, proposed by students', 0, 'maybe this is useful content');
    INSERT INTO resource (resource_name, rating, resource_content) VALUES ('another one external resource 2', 0, 'Im resource_content for the second lab!');
APPLY BATCH;""", consistency_level=ConsistencyLevel.ONE)
session.execute(query)
