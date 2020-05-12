# Synapse Load Solution - Sample data components
The files in this folder can be used to use a sample dataset with the solution.  

## File List 
1. 03-InsertRecordsToMetadataLoadSampleData.sql - updated version of insert script to load the ParquetStudent file 
2. ParquetStudent - this is a sample parquet file to load from ADLS Gen 2 storage 
3. 04-CreateStagingTableSynapse.sql - Script to run on Synapse to build the staging table destination 
4. 05-CreateTargetTableSynapse.sql - Script to run on Synapse to build the final target table 
