import os
import sys
os.chdir(os.path.dirname(__file__))
new_path = os.path.join(os.path.dirname(__file__), 'utilery')
sys.path.append(new_path)
sys.path.append(os.path.realpath('./utilery/'))

from utilery.views import app

application = app
