# How to test endpoints with decorators

Say we have an the following endpoint in
"genenetwork2/wqflask/wqflask/metadata_edits.py": that interpolates 2
strings:

```
@metadata_edit.route("/<a>/addition/<b>", methods=("POST",))
@edit_admins_access_required
@login_required
def addition(a, b):
    return a + b
```


To test it, see:

```
import unittest
import mock
import imp
import wqflask

class TestMetadataEdits(unittest.TestCase):
    def setUp(self):
        def kill_patches():
            mock.patch.stopall()
            imp.reload(wqflask.metadata_edits)
        self.addCleanup(kill_patches)
        mock.patch('wqflask.decorators.login_required',
                   lambda x: x).start()
        mock.patch('wqflask.decorators.edit_admins_access_required',
                   lambda x: x).start()
        imp.reload(wqflask.metadata_edits)
        imp.reload(wqflask)
        self.app = wqflask.app.test_client()

    def test_addition(self):
        resp = self.app.post("/datasets/3/addition/2")
        self.assertEqual(resp.data, b'32')

```

For an in-depth explanation, read this [post](https://newbedev.com/can-i-patch-a-python-decorator-before-it-wraps-a-function "Can I patch a Python decorator before it wraps a function?")
