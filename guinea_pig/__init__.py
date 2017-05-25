from flask import Flask
from config import Config

app = Flask(__name__)
app.config.from_object(Config())

import guinea_pig.views
import guinea_pig.models