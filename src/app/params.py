import aws_paramstore_py as paramstore


def handler(event, context):
    """
    https://docs.aws.amazon.com/ja_jp/lambda/latest/dg/python-programming-model-handler-types.html
    :param dict or list or str or int or float or NoneType event: AWS Lambda はこのパラメーターを使用してイベントデータをハンドラーに渡します。
    このパラメータは通常、Python の dict タイプです。また、list、str、int、float、または NoneType タイプを使用できます。
    :param LambdaContext context: AWS Lambda はこのパラメーターを使用してランタイム情報をハンドラーに提供します。
    このパラメータは LambdaContext タイプになります。
    :return: オプションで、ハンドラーは値を返すことができます。Lambda 関数の呼び出しに使用した呼び出しタイプに応じて、
    戻り値は次のようになります。
    RequestResponse 呼び出しタイプ (同期実行) を使用する場合、AWS Lambda は Python 関数呼び出しの結果を、
    Lambda 関数を呼び出したクライアントに返します (呼び出しリクエストに対する HTTP レスポンスでは、JSON にシリアル化されます)。
    たとえば、AWS Lambda コンソールは RequestResponse 呼び出しタイプを使用するため、コンソールを使用して関数を呼び出すと、
    コンソールに戻り値が表示されます。ハンドラが NONE を返した場合、AWS Lambda は null を返します。
    Event 呼び出しタイプ (非同期実行) を使用すると、値は破棄されます。
    """
    return {
        'parameters': paramstore.get()
    }
