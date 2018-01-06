import unittest

import index
from .bootstrap import Bootstrap


class TestIndex(unittest.TestCase):
    def test_handler(self):
        index.handler(Bootstrap.event, Bootstrap.context)
