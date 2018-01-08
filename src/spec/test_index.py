import unittest

import index
from lambda_context_mock import LambdaContext

class TestIndex(unittest.TestCase):
    def test_handler(self):
        event = {}
        context = LambdaContext()
        index.handler(event, context)
