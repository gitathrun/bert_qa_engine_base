import os
import shutil
import ktrain
from ktrain import text

QA_MODEL = 'twmkn9/bert-base-uncased-squad2'

INDEX_DIR_PATH = os.path.join("/tmp", "index_dir")
docs = ['Hello world.']

# make sure INDEX_DIR_PATH not exist
if os.path.exists(INDEX_DIR_PATH):
    shutil.rmtree(INDEX_DIR_PATH)
else:
    pass

# setup index
text.SimpleQA.initialize_index(INDEX_DIR_PATH)
text.SimpleQA.index_from_list(docs, INDEX_DIR_PATH, commit_every=len(docs))

# download models
qa = text.SimpleQA(INDEX_DIR_PATH)