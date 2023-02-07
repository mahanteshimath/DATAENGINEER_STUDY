# MUTIPLE WAYS TO CONNECT TO SNOWPARK
https://bit.ly/atozaboutdata  WATCH ALL METHODS

1ST WAY--JupyterLab
Prerequisites for Snowpark Python

STEP1:DOWNLOAD AND INSTALL

https://www.anaconda.com/products/distribution

STEP2:CONDA(ANACODA COMMAND PROMPT) OPEN


STEP3:conda create --name sp_env --override-channels -c https://repo.anaconda.com/pkgs/snowflake python=3.8


STEP4:conda activate sp_env

STEP5:
Installing Snowpark python

conda install snowflake-snowpark-python

STEP6:
Installing JupyterLab 

conda install -c conda-forge jupyterlab




STEP7:
OPNE JupyterLab 

jupyter lab

STEP8:
CREATE spconn.json




# import statements
from snowflake.snowpark.session import Session
from snowflake.snowpark.version import VERSION
import json
# Read credentials
with open('spconn.json') as f:
    connection_parameters = json.load(f)    
session = Session.builder.configs(connection_parameters).create()
# verify snowpark version and other attributes
snowpark_version = VERSION
print('Database : {}'.format(session.get_current_database()))
print('Schema : {}'.format(session.get_current_schema()))
print('Warehouse : {}'.format(session.get_current_warehouse()))
print('Role : {}'.format(session.get_current_role()))
print('Snowpark for Python version : {}.{}.{}'.format(snowpark_version[0],snowpark_version[1],snowpark_version[2]))
# define schema for snowpark dataframe
from snowflake.snowpark.types import IntegerType, StringType, StructType, StructField
schema = StructType([StructField("EMP", IntegerType()), StructField("DEPARTMENT", StringType())])
# create a dataframe
df = session.create_dataframe([[100, "DATA ENGINEER"], [101, "DATA VISUALISATION"] , [103, "DATA SCIENTIST"]], schema)
df.show()
# write data to snowflake database
df.write.mode("overwrite").save_as_table("EMPLOYEE")

jupyter lab

EMPLOYEE



# 2ND  WAY CONNECT TO SNOWPARK--GOOGLE COLAB
https://bit.ly/atozaboutdata  WATCH ALL METHODS

https://colab.research.google.com/drive/1_qVjFRPPH1YIPUsUrfdAWSotmMbAkTgT?usp=sharing


# 3RD  WAY CONNECT TO SNOWPARK--HEX
STEP 1 SIGN UP https://app.hex.tech/signup

STEP 2 FOLLOW VIDEO https://bit.ly/atozaboutdata
