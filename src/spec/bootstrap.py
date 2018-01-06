import os
import sys
import unittest


class Bootstrap:
    event = None
    context = None


def handler(event, context):
    this_dir = os.path.dirname(__file__)
    sys.path.append(this_dir + '/../app')
    Bootstrap.event = event
    Bootstrap.context = context
    unittest.main(module=None, argv=sys.argv[:1])

# TODO: コレジャナイ感。本当にやりたいことはたぶん、docker-lambdaとかの内部でテスト対象を叩きまくるみたいなことじゃないか・・・？
